using Belaz.WeldingApp.RegistarApi.BusinessLayer.Configs;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Models;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Interfaces;
using MailKit.Net.Smtp;
using MailKit.Security;
using MimeKit;

namespace Belaz.WeldingApp.RegistarApi.BusinessLayer.Services.Implementations;

public class EmailSender : IEmailSender
{
    private readonly EmailConfiguration _emailConfig;
    private readonly ISeamRepository _seamRepository;
    private readonly IWelderRepository _welderRepository;
    private readonly IWeldingEquipmentRepository _weldingEquipmentRepository;
    private readonly IMasterRepository _masterRepository;

    public EmailSender(EmailConfiguration emailConfig, ISeamRepository seamRepository,
        IWelderRepository welderRepository, IWeldingEquipmentRepository weldingEquipmentRepository,
        IMasterRepository masterRepository)
    {
        _emailConfig = emailConfig;
        _seamRepository = seamRepository;
        _welderRepository = welderRepository;
        _weldingEquipmentRepository = weldingEquipmentRepository;
        _masterRepository = masterRepository;
    }
    public async Task SendEmailAsync(Message message)
    {
        var mailMessage = CreateEmailMessage(message);
        await SendAsync(mailMessage);
    }

    public async Task SendDeviationRecordEmailAsync(bool? isEnsuringVoltageAllowance,
        bool? isEnsuringCurrentAllowance,
        Guid masterId, Guid welderId, Guid equipmentId, Guid? seamId)
    {
        var ampereText = isEnsuringCurrentAllowance.HasValue && !isEnsuringCurrentAllowance.Value ? "току" : null;
        var voltageText = isEnsuringVoltageAllowance.HasValue && !isEnsuringVoltageAllowance.Value
            ? "напряжению"
            : null;

        var resultText = !string.IsNullOrEmpty(ampereText) && !string.IsNullOrEmpty(voltageText)
            ? $"{ampereText} и {voltageText}"
            : ampereText ?? voltageText;

        string link = Environment.GetEnvironmentVariable("REAL_API")!;
        var masterEmail = await _masterRepository.GetMasterEmailByIdAsync(masterId);

        if (masterEmail is null)
        {
            return;
        }

        var recordsLink = $"{link}/records";

        var welder = await _welderRepository.GetByIdAsync(welderId);
        var weldingEquipment = await _weldingEquipmentRepository.GetByIdAsync(equipmentId);

        var emailBody = $"Произошёл выход параметров режимов сварки за нормативные пределы по {resultText}" +
                        $"<br>Сварщик: {welder.MiddleName} {welder.FirstName} {welder.LastName}" +
                        $"<br>Оборудование: {weldingEquipment.FactoryNumber} {weldingEquipment.Marking}" +
                        $"<br>Чтобы перейти на вкладку \"Записи\" <a href=\"{recordsLink}\">нажмите здесь</a>";

        if (seamId.HasValue)
        {
            var seam = await _seamRepository.GetSeamByIdAsync(seamId.Value);
            emailBody += $"<br>Номер шва: {seam.Number}";
        }

        var message = new Message(new[] { masterEmail },
            "Предупреждение об отклонениях",
            emailBody);

        await SendEmailAsync(message);
    }

    private MimeMessage CreateEmailMessage(Message message)
    {
        var emailMessage = new MimeMessage();
        emailMessage.From.Add(new MailboxAddress("Welding Monitoring System", _emailConfig.From));
        emailMessage.To.AddRange(message.To);
        emailMessage.Subject = message.Subject;
        emailMessage.Body = new TextPart(MimeKit.Text.TextFormat.Html) { Text = message.Content };
        return emailMessage;
    }

    private async Task SendAsync(MimeMessage mailMessage)
    {
        using (var client = new SmtpClient())
        {
            try
            {
                await ConfigureAndConnectSmtpClient(client);
                await client.SendAsync(mailMessage);
            }
            catch (Exception exception)
            {
                throw;
            }
            finally
            {
                await DisconnectAndDisposeSmtpClient(client);
            }
        }
    }

    private async Task ConfigureAndConnectSmtpClient(SmtpClient client)
    {
        await ConnectSmtpClientWithPort(client);
        await client.AuthenticateAsync(_emailConfig.UserName, _emailConfig.Password);
    }

    private async Task ConnectSmtpClientWithPort(SmtpClient client)
    {
        if (IsSecureProtocolPort(_emailConfig.Port))
        {
            await client.ConnectAsync(_emailConfig.SmtpServer, _emailConfig.Port, true);
            client.AuthenticationMechanisms.Remove("XOAUTH2");
        }
        else
        {
            await client.ConnectAsync(_emailConfig.SmtpServer, _emailConfig.Port, SecureSocketOptions.None);
        }
    }
    
    private async Task DisconnectAndDisposeSmtpClient(SmtpClient client)
    {
        await client.DisconnectAsync(true);
        client.Dispose();
    }

    private bool IsSecureProtocolPort(int port)
    {
        return port is 465 or 587;
    }
}