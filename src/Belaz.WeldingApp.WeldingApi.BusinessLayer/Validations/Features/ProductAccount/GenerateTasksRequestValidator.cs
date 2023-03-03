using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.ProductAccount;

public class GenerateTasksRequestValidator : AbstractValidator<GenerateTasksRequest>
{
    public GenerateTasksRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Date)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new DateValidatorFor<GenerateTasksRequest>());

        RuleFor(model => model.ProductionAreaId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    GenerateTasksRequest,
                    Domain.Entities.Production.ProductionArea
                >(context)
            );

        RuleFor(model => model.UserId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetAsyncValidator(new UserIsMasterValidatorFor<GenerateTasksRequest>(context));
    }
}
