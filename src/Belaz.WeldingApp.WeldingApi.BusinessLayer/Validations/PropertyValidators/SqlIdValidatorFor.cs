using Belaz.WeldingApp.WeldingApi.DataLayer;
using Belaz.WeldingApp.WeldingApi.Domain.Entities;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Production;
using FluentValidation;
using FluentValidation.Validators;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators;

public class SqlIdValidatorFor<T, TEntity> : PropertyValidator<T, Guid>
    where TEntity : Entity
{
    private readonly ApplicationContext _context;

    public SqlIdValidatorFor(ApplicationContext context)
    {
        _context = context;
    }

    public override bool IsValid(ValidationContext<T> context, Guid value)
    {
        var entity = _context.Find<TEntity>(value);
        return entity is not null;
    }

    public override string Name => "SqlIdValidatorFor";

    protected override string GetDefaultMessageTemplate(string errorCode)
        => "'Id' must be a valid.";
}