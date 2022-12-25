using Belaz.WeldingApp.IdentityApi.Presenters.Models;
using FluentValidation;

namespace Belaz.WeldingApp.IdentityApi.Validators
{
    public class LoginModelContractValidator : AbstractValidator<LoginModelContract>
    {
        public LoginModelContractValidator()
        {
            When(_ => _.UserName != "admin",
                () =>
                {
                    RuleFor(model => model.UserName)
                        .Cascade(CascadeMode.Stop)
                        .NotEmpty()
                        .Matches("^\\S+@\\S+\\.\\S+$")
                        .WithMessage("The UserName field is not a valid e-mail address.");
                });
            RuleFor(model => model.Password).Cascade(CascadeMode.Stop).NotEmpty();
        }
    }
}
