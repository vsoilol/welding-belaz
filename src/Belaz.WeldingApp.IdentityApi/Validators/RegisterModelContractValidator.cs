using Belaz.WeldingApp.IdentityApi.Contracts.Requests.Identity;
using FluentValidation;

namespace Belaz.WeldingApp.IdentityApi.Validators;

public class RegisterModelContractValidator : AbstractValidator<RegisterModelContract>
{
    public RegisterModelContractValidator()
    {
        RuleFor(model => model.FirstName).Cascade(CascadeMode.Stop).NotEmpty();
        RuleFor(model => model.MiddleName).Cascade(CascadeMode.Stop).NotEmpty();
        RuleFor(model => model.LastName).Cascade(CascadeMode.Stop).NotEmpty();
        When(_ => _.Email != "admin",
            () =>
            {
                RuleFor(model => model.Email)
                    .Cascade(CascadeMode.Stop)
                    .NotEmpty()
                    .Matches("^\\S+@\\S+\\.\\S+$")
                    .WithMessage("The UserName field is not a valid e-mail address.");
            });
        RuleFor(model => model.Role).Cascade(CascadeMode.Stop).NotEmpty();
        RuleFor(model => model.Password).Cascade(CascadeMode.Stop).NotEmpty().MinimumLength(6).MaximumLength(100);
        RuleFor(model => model.ConfirmPassword)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .Equal(model => model.Password);
    }
}
