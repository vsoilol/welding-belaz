namespace Belaz.WeldingApp.IdentityApi.WebApi.Exceptions
{
    [Serializable]
    public class UserExistsException : Exception
    {
        public UserExistsException(string userName) : base($"User with username: {userName} already exists")
        {
        }
    }
}
