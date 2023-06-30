using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WorkingShift;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.WorkingShift;

public class DeleteWorkingShiftRequestValidator : AbstractValidator<DeleteWorkingShiftRequest>
{
    public DeleteWorkingShiftRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    DeleteWorkingShiftRequest,
                    WeldingApp.Common.Entities.CalendarInfo.WorkingShift
                >(context)
            );
    }
}