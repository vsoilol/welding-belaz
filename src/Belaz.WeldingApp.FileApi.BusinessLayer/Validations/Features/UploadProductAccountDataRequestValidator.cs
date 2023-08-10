using Belaz.WeldingApp.FileApi.BusinessLayer.Requests;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.PropertyValidators;
using FluentValidation;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Features;

public class UploadProductAccountDataRequestValidator : AbstractValidator<UploadProductAccountDataRequest>
{
    public UploadProductAccountDataRequestValidator()
    {
        RuleFor(model => model.Date)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new DateValidatorFor<UploadProductAccountDataRequest>());
    }
}