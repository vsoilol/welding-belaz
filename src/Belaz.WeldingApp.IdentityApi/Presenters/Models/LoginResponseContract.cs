namespace Belaz.WeldingApp.IdentityApi.Presenters.Models
{
    public class LoginResponseContract
    {
        public string Token { get; set; }

        public string UserEmail { get; set; }

        public DateTime Expiration { get; set; }
    }
}
