using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;

public class UserIsMasterValidatorFor<T> : AsyncPropertyValidator<T, Guid>
{
    private readonly ApplicationContext _context;

    public UserIsMasterValidatorFor(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(
        ValidationContext<T> context,
        Guid value,
        CancellationToken cancellation
    )
    {
        var master = await _context.Masters.FirstOrDefaultAsync(
            _ => _.UserId == value,
            cancellationToken: cancellation
        );

        return master is not null;
    }

    public override string Name => "UserIsMasterValidatorFor";

    protected override string GetDefaultMessageTemplate(string errorCode) =>
        "This user is not a master";
}
