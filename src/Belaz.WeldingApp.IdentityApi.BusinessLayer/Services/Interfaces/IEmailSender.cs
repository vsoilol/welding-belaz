using Belaz.WeldingApp.IdentityApi.BusinessLayer.Models;

namespace Belaz.WeldingApp.IdentityApi.BusinessLayer.Services.Interfaces;

public interface IEmailSender
{
    void SendEmail(Message message);
    
    Task SendEmailAsync(Message message);
}