using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Workplace;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Workplace;

public class DeleteWorkplaceRequestValidator : AbstractValidator<DeleteWorkplaceRequest>
{
    public DeleteWorkplaceRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    DeleteWorkplaceRequest,
                    Belaz.WeldingApp.Common.Entities.Production.Workplace
                >(context)
            );
    }
}
