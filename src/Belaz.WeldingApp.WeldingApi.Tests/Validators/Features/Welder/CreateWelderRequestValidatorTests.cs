using Belaz.WeldingApp.Common.Entities.IdentityUser;
using Belaz.WeldingApp.Common.Entities.Production;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Welder;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Welder;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using Belaz.WeldingApp.WeldingApi.Tests.DataFactories;
using FluentValidation;
using FluentValidation.TestHelper;
using MockQueryable.Moq;
using Moq;
using Moq.EntityFrameworkCore;
using NUnit.Framework;

namespace Belaz.WeldingApp.WeldingApi.Tests.Validators.Features.Welder;

public class CreateWelderRequestValidatorTests
{
    private CreateWelderRequest _request;
    private IValidator<CreateWelderRequest> _validator;
    private Mock<ApplicationContext> _applicationContextMock;

    private readonly List<ProductionArea> _productionAreas = ProductionAreaFactory.GetProductionAreaList();

    private Guid _validProductionAreaId;

    [SetUp]
    public void SetUp()
    {
        _validProductionAreaId = _productionAreas[0].Id;
        _applicationContextMock = new Mock<ApplicationContext>();
    }

    [Test]
    public async Task CreateWelderRequestValidator_Should_WorkAsExpected_If_RequestIsValid()
    {
        //Arrange
        _request = new CreateWelderRequest
        {
            RfidTag = "11:22:33:44",
            FirstName = "FirstName",
            MiddleName = "MiddleName",
            LastName = "LastName",
            ProductionAreaId = _validProductionAreaId,
            Position = "Position",
            ServiceNumber = "123456"
        };
        
        var mockUserData = WelderFactory.GetWelderList().Select(_ => _.UserInfo).BuildMock().BuildMockDbSet();
        _applicationContextMock.Setup(c => c.Set<UserData>()).Returns(mockUserData.Object);
        
        _applicationContextMock
            .Setup(x => x.Users)
            .ReturnsDbSet(WelderFactory.GetWelderList().Select(_ => _.UserInfo));

        _applicationContextMock
            .Setup(x => x.Find<ProductionArea>(_validProductionAreaId))
            .Returns(_productionAreas.Find(e => e.Id == _validProductionAreaId));

        _validator = new CreateWelderRequestValidator(_applicationContextMock.Object);

        //Act
        var result = await _validator.TestValidateAsync(_request);

        //Assert
        result.ShouldNotHaveAnyValidationErrors();
        _applicationContextMock.Verify(
            x => x.Set<UserData>(),
            Times.Once());
        _applicationContextMock.Verify(
            x => x.Find<ProductionArea>(_validProductionAreaId),
            Times.Once());
    }
}