using Belaz.WeldingApp.RegistarApi.BusinessLayer.Models;

namespace Belaz.WeldingApp.RegistarApi.BusinessLayer.Services.Interfaces;

public interface IEmailSender
{
    Task SendEmailAsync(Message message);

    Task SendDeviationRecordEmailAsync(bool? isEnsuringVoltageAllowance, bool? isEnsuringCurrentAllowance, 
        Guid masterId, Guid welderId, Guid equipmentId, Guid? seamId);
}