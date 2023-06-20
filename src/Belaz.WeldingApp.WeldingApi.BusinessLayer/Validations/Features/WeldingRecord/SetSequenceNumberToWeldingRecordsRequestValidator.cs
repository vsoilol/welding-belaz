using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingRecord;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.WeldingRecord;

public class SetSequenceNumberToWeldingRecordsRequestValidator
    : AbstractValidator<SetSequenceNumberToWeldingRecordsRequest>
{
    public SetSequenceNumberToWeldingRecordsRequestValidator(ApplicationContext context)
    {
        RuleForEach(model => model.WeldingRecordIds)
            .Cascade(CascadeMode.Stop)
            .SetValidator(
                new SqlIdValidatorFor<
                    SetSequenceNumberToWeldingRecordsRequest,
                    Belaz.WeldingApp.Common.Entities.TaskInfo.WeldingRecord
                >(context)
            );

        RuleFor(model => model.SequenceNumber)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(1);
    }
}