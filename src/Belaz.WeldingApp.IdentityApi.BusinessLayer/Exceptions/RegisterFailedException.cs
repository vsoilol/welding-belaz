namespace Belaz.WeldingApp.IdentityApi.BusinessLayer.Exceptions;

[Serializable]
public class RegisterFailedException : Exception
{
    public RegisterFailedException(string message) : base(message)
    {
    }
}
