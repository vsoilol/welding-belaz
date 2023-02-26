using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Common;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Common
{
    public class ProductionAreaIdRequestValidator : AbstractValidator<ProductionAreaIdRequest>
    {
        public ProductionAreaIdRequestValidator(ApplicationContext context)
        {
            RuleFor(model => model.ProductionAreaId)
                .Cascade(CascadeMode.Stop)
                .NotEmpty()
                .SetValidator(
                    new SqlIdValidatorFor<
                        ProductionAreaIdRequest,
                        Domain.Entities.Production.ProductionArea
                    >(context)
                );
        }
    }
}
