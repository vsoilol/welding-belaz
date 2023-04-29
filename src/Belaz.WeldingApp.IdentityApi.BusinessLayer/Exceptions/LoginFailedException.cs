namespace Belaz.WeldingApp.IdentityApi.BusinessLayer.Exceptions;

[Serializable]
public class LoginFailedException : Exception
{
    public LoginFailedException(string message) : base(message)
    {
    }
}
