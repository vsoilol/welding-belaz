using Belaz.WeldingApp.RegistarApi.BusinessLayer.Configs;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Models;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Interfaces;
using MailKit.Net.Smtp;
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

    public void SendEmail(Message message)
    {
        var emailMessage = CreateEmailMessage(message);
        Send(emailMessage);
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

        string link = Environment.GetEnvironmentVariable("REAL_API") ?? "http://weldingcontrol.bru.by:4001";
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

    private void Send(MimeMessage mailMessage)
    {
        using (var client = new SmtpClient())
        {
            try
            {
                client.Connect(_emailConfig.SmtpServer, _emailConfig.Port, true);
                client.AuthenticationMechanisms.Remove("XOAUTH2");
                client.Authenticate(_emailConfig.UserName, _emailConfig.Password);
                client.Send(mailMessage);
            }
            catch
            {
                // ignored
            }
            finally
            {
                client.Disconnect(true);
                client.Dispose();
            }
        }
    }

    private async Task SendAsync(MimeMessage mailMessage)
    {
        using (var client = new SmtpClient())
        {
            try
            {
                await client.ConnectAsync(_emailConfig.SmtpServer, _emailConfig.Port, true);
                client.AuthenticationMechanisms.Remove("XOAUTH2");
                await client.AuthenticateAsync(_emailConfig.UserName, _emailConfig.Password);
                var data = await client.SendAsync(mailMessage);
            }
            catch (Exception exception)
            {
                // ignored
            }
            finally
            {
                await client.DisconnectAsync(true);
                client.Dispose();
            }
        }
    }
}