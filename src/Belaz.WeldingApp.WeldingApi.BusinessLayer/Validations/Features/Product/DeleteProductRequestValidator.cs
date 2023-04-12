using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Product;

public class DeleteProductRequestValidator : AbstractValidator<DeleteProductRequest>
{
    public DeleteProductRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<DeleteProductRequest, Domain.Entities.ProductInfo.Product>(
                    context
                )
            );
    }
}
