using System.Reflection;

namespace Belaz.WeldingApp.RegistarApi.Domain.Exceptions;

public class NotSuchValidatorException : Exception
{
    public NotSuchValidatorException(MemberInfo type) : base($"Not such validator for model {type.Name}")
    {
        
    }
}