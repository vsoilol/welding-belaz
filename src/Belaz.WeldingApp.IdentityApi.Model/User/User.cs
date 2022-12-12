namespace Belaz.WeldingApp.IdentityApi.Model.User
{
    public class User
    {
        public float Id { get; set; }

        public string FirstName { get; set; } = string.Empty;

        public string LastName { get; set; } = string.Empty;

        public string PatronicName { get; set; } = string.Empty;

        public string UserName { get; set; } = string.Empty;

        public string Email { get; set; }  = string.Empty;
    }
}
