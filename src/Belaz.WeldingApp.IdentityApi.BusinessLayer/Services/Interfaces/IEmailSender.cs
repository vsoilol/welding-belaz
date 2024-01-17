using Belaz.WeldingApp.IdentityApi.BusinessLayer.Models;

namespace Belaz.WeldingApp.IdentityApi.BusinessLayer.Services.Interfaces;

public interface IEmailSender
{
    Task SendEmailAsync(Message message);
}