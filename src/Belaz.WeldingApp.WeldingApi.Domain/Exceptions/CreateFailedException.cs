using System.Reflection;

namespace Belaz.WeldingApp.WeldingApi.Domain.Exceptions;

public class CreateFailedException : Exception
{
    public CreateFailedException(MemberInfo type) : base($"Error when create {type.Name}")
    {
        
    }
}