using Belaz.WeldingApp.IntegrationApi.Contracts.Requests.User;
using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.Identity;
using Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.IntegrationApi.Controllers
{
    [Route("api/users")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IUserIntegrationApi _userIntegrationApi;

        public UserController(IUserIntegrationApi userIntegrationApi)
        {
            _userIntegrationApi = userIntegrationApi;
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<IEnumerable<IdentityUserDto>>> Get()
        {
            var users = await _userIntegrationApi.GetUsers();
            return users;
        }

        [HttpGet("{userId}")]
        public async Task<ActionResult<IdentityUserDto>> Get([FromRoute] Guid userId)
        {
            var user = await _userIntegrationApi.GetByIdAsync(userId);
            return user;
        }

        [HttpPost]
        public async Task<ActionResult<IdentityUserDto>> Add([FromBody] CreateUserRequest request)
        {
            var createdUserContract = await _userIntegrationApi.AddAsync(request);
            return createdUserContract;
        }

        [HttpPut("{userId}")]
        public async Task<ActionResult<IdentityUserDto>> Update([FromRoute] Guid userId,
            [FromBody] CreateUserRequest userContract)
        {
            var updatedUser = await _userIntegrationApi.UpdateAsync(userId, userContract);
            return updatedUser;
        }


        [HttpDelete("{userId}")]
        public async Task<ActionResult<Guid>> Delete([FromRoute] Guid userId)
        {
            var deletedUserId = await _userIntegrationApi.DeleteAsync(userId);
            return deletedUserId;
        }
    }
}
