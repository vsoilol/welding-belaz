using Belaz.WeldingApp.IdentityApi.Mapping;

namespace Belaz.WeldingApp.IdentityApi.Tests;

public class AutoMapperProfilesTests
{
    [Test]
    public void Map_User_AllFieldsMapped()
    {
        // Arrange
        var configuration = new MapperConfiguration(cfg => cfg.AddProfile<UserProfile>());

        // Act - Assert
        configuration.AssertConfigurationIsValid();
    }
}