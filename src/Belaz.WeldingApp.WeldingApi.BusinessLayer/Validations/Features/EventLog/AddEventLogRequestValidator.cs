using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.EventLog;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.EventLog;

public class AddEventLogRequestValidator : AbstractValidator<AddEventLogRequest>
{
    public AddEventLogRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Information)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();
    }
}