using Belaz.WeldingApp.IdentityApi.WebApi.Presenters.Mapping;

namespace Belaz.WeldingApp.IdentityApi.Tests
{
    public class AutoMapperProfilesTests
    {
        [Test]
        public void Map_User_AllFieldsMapped()
        {
            // Arrange
            var configuration = new MapperConfiguration(cfg => cfg.AddProfile<UserModelProfile>());

            // Act - Assert
            configuration.AssertConfigurationIsValid();
        }

        [Test]
        public void Map_Login_AllFieldsMapped()
        {
            // Arrange
            var configuration = new MapperConfiguration(cfg => cfg.AddProfile<LoginModelProfile>());

            // Act - Assert
            configuration.AssertConfigurationIsValid();
        }

        [Test]
        public void Map_Register_AllFieldsMapped()
        {
            // Arrange
            var configuration = new MapperConfiguration(cfg => cfg.AddProfile<RegisterModelProfile>());

            // Act - Assert
            configuration.AssertConfigurationIsValid();
        }
    }
}
