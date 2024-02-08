using Belaz.WeldingApp.Common.Entities.ProductInfo;
using Belaz.WeldingApp.FileApi.BusinessLayer.Requests;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.FileApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Features;

public class GenerateSeamPassportByProductAccountTaskIdRequestValidator
    : AbstractValidator<GenerateSeamPassportByProductAccountTaskIdRequest>
{
    public GenerateSeamPassportByProductAccountTaskIdRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.ProductAccountTaskId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<GenerateSeamPassportByProductAccountTaskIdRequest,
                    ProductAccountTask>(context)
            );
    }
}