namespace Belaz.WeldingApp.IdentityApi.BusinessLayer.Exceptions;

[Serializable]
public class UserNotFoundException : Exception
{
    public UserNotFoundException(string userName) : base($"User not found by user name/id: {userName}")
    {
    }
}
