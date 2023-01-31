using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Master;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Master;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Master;

public class UpdateMasterRequestValidator : AbstractValidator<UpdateMasterRequest>
{
    public UpdateMasterRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<UpdateMasterRequest,
                Domain.Entities.Users.Master>(context));

        RuleFor(model => model.RfidTag)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();

        RuleFor(model => model.FirstName)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();

        RuleFor(model => model.LastName)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();

        RuleFor(model => model.MiddleName)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();

        RuleFor(model => model.ProductionAreaId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<UpdateMasterRequest,
                Domain.Entities.Production.ProductionArea>(context));

        RuleFor(model => model.WeldingEquipmentId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<UpdateMasterRequest,
                Domain.Entities.WeldingEquipmentInfo.WeldingEquipment>(context))
            .SetAsyncValidator(new IsEquipmentAlreadyAssignValidatorForUpdateMaster(context))
            .When(_ => _.WeldingEquipmentId is not null);
    }
}