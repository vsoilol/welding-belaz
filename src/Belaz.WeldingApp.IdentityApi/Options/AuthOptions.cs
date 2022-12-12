namespace Belaz.WeldingApp.IdentityApi.Options
{
    public class AuthOptions
    {
        public string Secret { get; set; }

        public string DefaultPassword { get; set; }

        public TimeSpan TokenLifetime { get; set; }
    }
}
