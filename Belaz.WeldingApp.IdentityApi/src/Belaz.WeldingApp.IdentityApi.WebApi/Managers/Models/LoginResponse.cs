namespace Belaz.WeldingApp.IdentityApi.WebApi.Managers.Models
{
    public class LoginResponse
    {
        public string Token { get; set; }

        public string UserEmail { get; set; }

        public DateTime Expiration { get; set; }
    }
}
