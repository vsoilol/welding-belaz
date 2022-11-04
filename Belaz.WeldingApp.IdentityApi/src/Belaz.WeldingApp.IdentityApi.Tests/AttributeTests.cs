using System.ComponentModel.DataAnnotations;
using Belaz.WeldingApp.IdentityApi.WebApi.Attributes;

namespace Belaz.WeldingApp.IdentityApi.Tests
{
    public class AttributeTests
    {

        private const string EmailErrorMessage = "The UserName field is not a valid e-mail address.";

        [TestCase("val")]
        [TestCase("2323.com")]
        [TestCase("va@a")]
        public void ValidateEmail_IsNotValid_ReturnsValidationError(string email)
        {
            // Arrange
            var attribute = new CustomEmailAddressAttribute();

            // Act
            var result = attribute.GetValidationResult(email, new ValidationContext(email));

            // Assert
            Assert.IsNotNull(result);
            Assert.That(result.ErrorMessage, Is.EqualTo(EmailErrorMessage));
        }

        [TestCase("val@ru.co")]
        [TestCase("2323@mail.com")]
        [TestCase("va@a.com")]
        [TestCase("admin")]
        public void ValidateEmail_IsValid_ReturnsEmptyObject(string email)
        {
            // Arrange
            var attribute = new CustomEmailAddressAttribute();

            // Act
            var result = attribute.GetValidationResult(email, new ValidationContext(email));

            // Assert
            Assert.IsNull(result);
        }

    }
}
