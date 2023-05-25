using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Workshop;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Workshop;
using FluentValidation;
using FluentValidation.TestHelper;
using NUnit.Framework;

namespace Belaz.WeldingApp.WeldingApi.Tests.Validators.Features.Workshop;

public class CreateWorkshopRequestValidatorTests
{
    private CreateWorkshopRequest _request;
    private IValidator<CreateWorkshopRequest> _validator;

    [Test]
    public void CreateWorkshopRequestValidator_Should_WorkAsExpected_If_RequestIsValid()
    {
        //Arrange
        _request = new CreateWorkshopRequest
        {
            Number = 1,
            Name = "Цех"
        };

        _validator = new CreateWorkshopRequestValidator();
        
        //Act
        var result = _validator.TestValidate(_request);

        //Assert
        result.ShouldNotHaveValidationErrorFor(_ => _);
    }
    
    [Test]
    [TestCase(0)]
    [TestCase(-1)]
    [TestCase(-2)]
    public void CreateWorkshopRequestValidator_Number_Should_ThrowAnError_If_NumberLessThanOne(int number)
    {
        //Arrange
        _request = new CreateWorkshopRequest
        {
            Number = number,
            Name = "Цех"
        };

        _validator = new CreateWorkshopRequestValidator();
        
        //Act
        var result = _validator.TestValidate(_request);

        //Assert
        result.ShouldHaveValidationErrorFor(_ => _.Number);
    }
    
    [Test]
    public void CreateWorkshopRequestValidator_Name_Should_ThrowAnError_If_NameIsEmpty()
    {
        //Arrange
        _request = new CreateWorkshopRequest
        {
            Number = 1,
            Name = ""
        };

        _validator = new CreateWorkshopRequestValidator();
        
        //Act
        var result = _validator.TestValidate(_request);

        //Assert
        result.ShouldHaveValidationErrorFor(_ => _.Name);
    }
}