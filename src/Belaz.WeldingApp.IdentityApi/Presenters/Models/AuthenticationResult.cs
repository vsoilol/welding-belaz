namespace Belaz.WeldingApp.IdentityApi.Presenters.Models
{
    public class AuthenticationResult
    {
        public string Token { get; set; }

        public Guid UserId { get; set; }

        public string ExpirationDate { get; set; }

        public bool Success { get; set; }

        public IEnumerable<string> Errors { get; set; }
    }
}
