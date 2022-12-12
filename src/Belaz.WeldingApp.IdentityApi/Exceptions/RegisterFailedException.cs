namespace Belaz.WeldingApp.IdentityApi.Exceptions
{
    [Serializable]
    public class RegisterFailedException : Exception
    {
        public RegisterFailedException(string userName) : base($"Something went wrong when user ${userName} register")
        {
        }
    }
}
