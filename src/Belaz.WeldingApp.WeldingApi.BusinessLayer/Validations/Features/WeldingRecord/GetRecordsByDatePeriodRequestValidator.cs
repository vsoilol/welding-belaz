using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingRecord;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.WeldingRecord;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.WeldingRecord;

public class GetRecordsByDatePeriodRequestValidator : AbstractValidator<GetRecordsByDatePeriodRequest>
{
    public GetRecordsByDatePeriodRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.StartDate)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new DateValidatorFor<GetRecordsByDatePeriodRequest>());

        RuleFor(model => model.EndDate)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new DateValidatorFor<GetRecordsByDatePeriodRequest>());

        RuleFor(model => model.SeamNumber)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(1)
            .When(_ => _.SeamNumber is not null);

        RuleFor(model => model)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new IsDatePeriodCorrectValidator());

        RuleFor(model => model.WeldingTaskNumber)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(1)
            .When(_ => _.WeldingTaskNumber is not null);

        RuleFor(model => model.WelderId)
            .Cascade(CascadeMode.Stop)
            .SetValidator(
                new SqlIdValidatorFor<
                    GetRecordsByDatePeriodRequest,
                    Belaz.WeldingApp.Common.Entities.Users.Welder
                >(context)
            )
            .When(_ => _.WelderId is not null);

        RuleFor(model => model.MasterId)
            .Cascade(CascadeMode.Stop)
            .SetValidator(
                new SqlIdValidatorFor<
                    GetRecordsByDatePeriodRequest,
                    Belaz.WeldingApp.Common.Entities.Users.Master
                >(context)
            )
            .When(_ => _.MasterId is not null);

        RuleFor(model => model.EquipmentId)
            .Cascade(CascadeMode.Stop)
            .SetValidator(
                new SqlIdValidatorFor<
                    GetRecordsByDatePeriodRequest,
                    Belaz.WeldingApp.Common.Entities.WeldingEquipmentInfo.WeldingEquipment
                >(context)
            )
            .When(_ => _.EquipmentId is not null);
    }
}