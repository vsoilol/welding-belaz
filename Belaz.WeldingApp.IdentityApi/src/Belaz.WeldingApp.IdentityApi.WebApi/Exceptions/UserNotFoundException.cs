namespace Belaz.WeldingApp.IdentityApi.WebApi.Exceptions
{
    [Serializable]
    public class UserNotFoundException : Exception
    {
        public UserNotFoundException(string userName) : base($"User not found by user name/id: {userName}")
        {
        }
    }
}
