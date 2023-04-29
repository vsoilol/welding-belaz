namespace Belaz.WeldingApp.IdentityApi.BusinessLayer.Exceptions;

[Serializable]
public class UserExistsException : Exception
{
    public UserExistsException(string userName) : base($"User with username: {userName} already exists")
    {
    }
}
