using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingRecord;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.WeldingRecord;

public class DeleteWeldingRecordRequestValidator : AbstractValidator<DeleteWeldingRecordRequest>
{
    public DeleteWeldingRecordRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .SetValidator(
                new SqlIdValidatorFor<
                    DeleteWeldingRecordRequest,
                    Belaz.WeldingApp.Common.Entities.TaskInfo.WeldingRecord
                >(context)
            );
    }
}
