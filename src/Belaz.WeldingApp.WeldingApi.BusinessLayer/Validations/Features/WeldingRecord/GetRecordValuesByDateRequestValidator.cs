using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingRecord;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.WeldingRecord;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.WeldingRecord;

public class GetRecordValuesByDateRequestValidator : AbstractValidator<GetRecordValuesByDateRequest>
{
    public GetRecordValuesByDateRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Date)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new DateValidatorFor<GetRecordValuesByDateRequest>());

        RuleFor(model => model.StartTime!)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new TimeValidatorFor<GetRecordValuesByDateRequest>())
            .When(_ => _.StartTime is not null);
        
        RuleFor(model => model.EndTime!)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new TimeValidatorFor<GetRecordValuesByDateRequest>())
            .When(_ => _.EndTime is not null);

        RuleFor(model => model.WelderId)
            .Cascade(CascadeMode.Stop)
            .SetValidator(
                new SqlIdValidatorFor<
                    GetRecordValuesByDateRequest,
                    Belaz.WeldingApp.Common.Entities.Users.Welder
                >(context)
            )
            .When(_ => _.WelderId is not null);

        RuleFor(model => model.EquipmentId)
            .Cascade(CascadeMode.Stop)
            .SetValidator(
                new SqlIdValidatorFor<
                    GetRecordValuesByDateRequest,
                    Belaz.WeldingApp.Common.Entities.WeldingEquipmentInfo.WeldingEquipment
                >(context)
            )
            .When(_ => _.EquipmentId is not null);
        
        
        When(
            _ => _.WelderId is null && _.EquipmentId is null,
            () =>
            {
                RuleFor(model => model.WelderId)
                    .Cascade(CascadeMode.Stop)
                    .NotNull();

                RuleFor(model => model.EquipmentId)
                    .Cascade(CascadeMode.Stop)
                    .NotNull();
            }
        );
    }
}