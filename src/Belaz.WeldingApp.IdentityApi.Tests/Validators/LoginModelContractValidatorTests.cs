using Belaz.WeldingApp.IdentityApi.Presenters.Models;
using Belaz.WeldingApp.IdentityApi.Validators;
using FluentValidation.TestHelper;

namespace Belaz.WeldingApp.IdentityApi.Tests.Validators;

public class LoginModelContractValidatorTests
{
    private LoginModelContractValidator _validator = new();

    [TestCase("val")]
    [TestCase("2323.com")]
    [TestCase("va@a")]
    public void ValidateEmail_IsNotValid_ReturnsValidationError(string email)
    {
        // Arrange
        var model = new LoginModelContract { UserName = email };

        // Act
        var result = _validator.TestValidate(model);

        // Assert
        result.ShouldHaveValidationErrorFor(person => person.UserName);
        Assert.That(
            result.Errors.FirstOrDefault(_ => _.PropertyName == nameof(model.UserName)).ErrorMessage,
            Is.EqualTo("The UserName field is not a valid e-mail address."));
    }

    [TestCase("val@ru.co")]
    [TestCase("2323@mail.com")]
    [TestCase("va@a.com")]
    [TestCase("admin")]
    public void ValidateEmail_IsValid_ReturnsEmptyObject(string email)
    {
        // Arrange
        var model = new LoginModelContract { UserName = email };

        // Act
        var result = _validator.TestValidate(model);

        // Assert
        result.ShouldNotHaveValidationErrorFor(person => person.UserName);
    }
}