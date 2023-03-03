using Belaz.WeldingApp.WeldingApi.DataLayer;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.ProductAccount;

public class ExistDateValidatorFor<T> : AsyncPropertyValidator<T, string>
{
    private readonly ApplicationContext _context;

    public ExistDateValidatorFor(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(
        ValidationContext<T> context,
        string value,
        CancellationToken cancellation
    )
    {
        var date = value.ToDateTime();

        var isExist = await _context.ProductAccounts.AnyAsync(
            _ => _.DateFromPlan.Date.Equals(date.Date)
        );

        return isExist;
    }

    public override string Name => "ExistDateValidatorFor";

    protected override string GetDefaultMessageTemplate(string errorCode) =>
        "This date is not exist";
}
