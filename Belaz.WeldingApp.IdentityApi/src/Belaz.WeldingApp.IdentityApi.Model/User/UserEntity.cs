namespace Belaz.WeldingApp.IdentityApi.Model.User
{
    public class UserEntity
    {
        public string UserName { get; set; } = string.Empty;

        public byte[] PasswordHash { get; set; }

        public byte[] PasswordSalt { get; set; }
    }
}
