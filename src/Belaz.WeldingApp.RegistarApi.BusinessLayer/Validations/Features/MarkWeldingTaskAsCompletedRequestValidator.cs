using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Requests;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.RegistarApi.DataLayer;
using Belaz.WeldingApp.RegistarApi.Domain.Entities.TaskInfo;
using FluentValidation;

namespace Belaz.WeldingApp.RegistarApi.BusinessLayer.Validations.Features;

public class MarkWeldingTaskAsCompletedRequestValidator
    : AbstractValidator<MarkWeldingTaskAsCompletedRequest>
{
    public MarkWeldingTaskAsCompletedRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.TaskId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<MarkWeldingTaskAsCompletedRequest, WeldingTask>(context)
            );
        ;
    }
}
