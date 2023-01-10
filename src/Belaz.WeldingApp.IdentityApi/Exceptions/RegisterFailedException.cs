namespace Belaz.WeldingApp.IdentityApi.Exceptions;

[Serializable]
public class RegisterFailedException : Exception
{
    public RegisterFailedException(string message) : base(message)
    {
    }
}
