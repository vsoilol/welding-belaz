using Belaz.WeldingApp.Common.Entities.Production;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Workplace;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Workshop;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Workplace;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using Belaz.WeldingApp.WeldingApi.Tests.DataFactories;
using FluentValidation;
using FluentValidation.TestHelper;
using MockQueryable.Moq;
using Moq;
using Moq.EntityFrameworkCore;
using NUnit.Framework;

namespace Belaz.WeldingApp.WeldingApi.Tests.Validators.Features.Workplace;

public class CreateWorkplaceRequestValidatorTests
{
    private CreateWorkplaceRequest _request;
    private IValidator<CreateWorkplaceRequest> _validator;
    private Mock<ApplicationContext> _applicationContextMock;

    private readonly Guid _validProductionAreaId = ProductionAreaFactory.GetProductionAreaList()[0].Id;
    private readonly Guid _validPostId = PostFactory.GetPostList()[0].Id;

    [SetUp]
    public void SetUp()
    {
        _applicationContextMock = new Mock<ApplicationContext>();
    }

    [Test]
    public void CreateWorkplaceRequestValidator_Should_WorkAsExpected_If_RequestIsValid()
    {
        //Arrange
        _request = new CreateWorkplaceRequest
        {
            Number = 1,
            PostId = _validPostId,
            ProductionAreaId = null
        };

        _applicationContextMock
            .Setup(x => x.Find<Post>(_validPostId))
            .Returns(PostFactory.GetPostList().Find(e => e.Id == _validPostId));

        _validator = new CreateWorkplaceRequestValidator(_applicationContextMock.Object);

        //Act
        var result = _validator.TestValidate(_request);

        //Assert
        result.ShouldNotHaveValidationErrorFor(_ => _);
        _applicationContextMock.Verify(x => x.Find<Post>(_validPostId), Times.Once());
    }
}