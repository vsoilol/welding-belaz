namespace Belaz.WeldingApp.IdentityApi.WebApi.Exceptions
{
    [Serializable]
    public class RegisterFailedException : Exception
    {
        public RegisterFailedException(string userName) : base($"Something went wrong when user ${userName} register")
        {
        }
    }
}
