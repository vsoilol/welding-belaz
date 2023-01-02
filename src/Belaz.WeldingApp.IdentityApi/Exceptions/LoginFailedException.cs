namespace Belaz.WeldingApp.IdentityApi.Exceptions;

[Serializable]
internal class LoginFailedException : Exception
{
    public LoginFailedException(string message) : base(message)
    {
    }
}
