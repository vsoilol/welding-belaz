using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.WeldingTask;

public class IsTasksByDateExistsValidator<T> : AsyncPropertyValidator<T, string>
{
    private readonly ApplicationContext _context;

    public IsTasksByDateExistsValidator(ApplicationContext context)
    {
        _context = context;
    }
    
    public override async Task<bool> IsValidAsync(ValidationContext<T> context, string value, CancellationToken cancellation)
    {
        var date = value.ToDateTime();

        var isExist = await _context.WeldingTasks
            .AnyAsync(_ => _.WeldingDate.Date == date.Date, cancellationToken: cancellation);

        return isExist;
    }

    public override string Name => "IsTasksByDateExistsValidator";

    protected override string GetDefaultMessageTemplate(string errorCode) =>
        "Tasks for this date not exists";
}