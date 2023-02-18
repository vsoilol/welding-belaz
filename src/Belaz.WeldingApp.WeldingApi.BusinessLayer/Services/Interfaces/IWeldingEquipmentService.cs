using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingEquipment;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingEquipment;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface IWeldingEquipmentService
{
    Task<List<WeldingEquipmentDto>> GetAllAsync();

    Task<List<WeldingEquipmentDowntimeDto>> GetAllWeldingEquipmentDowntimesAsync();

    Task<Result<WeldingEquipmentDto>> CreateAsync(CreateEquipmentRequest request);

    Task<Result<WeldingEquipmentDto>> UpdateAsync(UpdateEquipmentRequest request);

    Task<Result<WeldingEquipmentDowntimeDto>> AddWeldingEquipmentDowntimeAsync(
        CreateWeldingEquipmentDowntimeRequest request);

    Task<Result<WeldingEquipmentDowntimeDto>> UpdateWeldingEquipmentDowntimeAsync(
        UpdateWeldingEquipmentDowntimeRequest request);
    
    Task<Result<Unit>> AssignEquipmentsToWeldersAsync(AssignEquipmentsToWeldersRequest request);
    
    Task<Result<Unit>> AssignEquipmentsToMastersAsync(AssignEquipmentsToMastersRequest request);
}