using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Users;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Common;

public class CreateUserWithEquipmentRequest : CreateUserRequest
{
    public Guid? WeldingEquipmentId { get; set; }
}