namespace Belaz.WeldingApp.IdentityApi.WebApi.Managers.Models
{
    public class LoginResponse
    {
        public string Token { get; set; }

        public int UserId { get; set; }

        public string ExpirationDate { get; set; }
    }
}
