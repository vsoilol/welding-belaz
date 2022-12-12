namespace Belaz.WeldingApp.IdentityApi.Presenters.Models
{
    public class AuthSuccessResponse
    {
        public string Token { get; set; }

        public Guid UserId { get; set; }

        public string ExpirationDate { get; set; }
    }
}
