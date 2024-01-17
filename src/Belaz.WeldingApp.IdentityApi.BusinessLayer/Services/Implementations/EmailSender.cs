using Belaz.WeldingApp.IdentityApi.BusinessLayer.Configs;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Models;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Services.Interfaces;
using MailKit.Security;
using MimeKit;
using SmtpClient = MailKit.Net.Smtp.SmtpClient;

namespace Belaz.WeldingApp.IdentityApi.BusinessLayer.Services.Implementations;

public class EmailSender : IEmailSender
{
    private readonly EmailConfiguration _emailConfig;
    
    public EmailSender(EmailConfiguration emailConfig)
    {
        _emailConfig = emailConfig;
    }

    public async Task SendEmailAsync(Message message)
    {
        var mailMessage = CreateEmailMessage(message);
        await SendAsync(mailMessage);
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