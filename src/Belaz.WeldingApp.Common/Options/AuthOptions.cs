namespace Belaz.WeldingApp.Common.Options;

public class AuthOptions
{
    public string Secret { get; set; } = null!;

    public string DefaultPassword { get; set; } = null!;

    public TimeSpan TokenLifetime { get; set; }
}
