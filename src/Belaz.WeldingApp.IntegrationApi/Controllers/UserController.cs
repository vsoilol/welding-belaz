using Belaz.WeldingApp.IntegrationApi.Contracts.Requests.User;
using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.Identity;
using Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WeldingApp.Common.Attributes;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.IntegrationApi.Controllers
{
    [Route("api/users")]
    [ApiController]
    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    public class UserController : ControllerBase
    {
        private readonly IUserIntegrationApi _userIntegrationApi;

        public UserController(IUserIntegrationApi userIntegrationApi)
        {
            _userIntegrationApi = userIntegrationApi;
        }

        [HttpGet]
        [AuthorizeRoles(Role.Admin, Role.Master)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<IEnumerable<IdentityUserDto>>> Get()
        {
            var users = await _userIntegrationApi.GetUsers();
            return users;
        }

        [HttpGet("{userId}")]
        [AuthorizeRoles(Role.Admin, Role.Master)]
        public async Task<ActionResult<IdentityUserDto>> Get([FromRoute] Guid userId)
        {
            var user = await _userIntegrationApi.GetByIdAsync(userId);
            return user;
        }

        [HttpPost]
        [AuthorizeRoles(Role.Admin)]
        public async Task<ActionResult<IdentityUserDto>> Add([FromBody] CreateUserRequest request)
        {
            var createdUserContract = await _userIntegrationApi.AddAsync(request);
            return createdUserContract;
        }

        [HttpPut("{userId}")]
        [AuthorizeRoles(Role.Admin)]
        public async Task<ActionResult<IdentityUserDto>> Update([FromRoute] Guid userId,
            [FromBody] CreateUserRequest userContract)
        {
            var updatedUser = await _userIntegrationApi.UpdateAsync(userId, userContract);
            return updatedUser;
        }


        [HttpDelete("{userId}")]
        [AuthorizeRoles(Role.Admin)]
        public async Task<ActionResult<Guid>> Delete([FromRoute] Guid userId)
        {
            var deletedUserId = await _userIntegrationApi.DeleteAsync(userId);
            return deletedUserId;
        }
    }
}
