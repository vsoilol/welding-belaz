namespace Belaz.WeldingApp.IdentityApi.WebApi.Exceptions
{
    [Serializable]
    internal class LoginFailedException : Exception
    {
        public LoginFailedException(string userName) : base($"You passed incorect password for user: {userName}")
        {
        }
    }
}
