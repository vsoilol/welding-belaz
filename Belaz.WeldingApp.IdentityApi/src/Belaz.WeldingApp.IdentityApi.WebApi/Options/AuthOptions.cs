namespace Belaz.WeldingApp.IdentityApi.WebApi.Options
{
    public class AuthOptions
    {
        public string Secret { get; set; }

        public string DefaultPassword { get; set; }

        public TimeSpan TokenLifetime { get; set; }
    }
}
