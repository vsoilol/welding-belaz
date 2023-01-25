using System.Reflection;

namespace Belaz.WeldingApp.WeldingApi.Domain.Exceptions;

public class UpdateFailedException : Exception
{
    public UpdateFailedException(MemberInfo type, Guid id) : base($"Error when update {type.Name} with id {id}")
    {
        
    }
}