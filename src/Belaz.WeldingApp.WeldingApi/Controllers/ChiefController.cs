using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Chief;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Microsoft.AspNetCore.Mvc;
using WeldingApp.Common.Attributes;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Controllers
{
    public class ChiefController : ControllerBase
    {
        private readonly IChiefManager _chiefManager;

        public ChiefController(IChiefManager chiefManager)
        {
            _chiefManager = chiefManager;
        }

        [HttpGet]
        [AuthorizeRoles(Role.Admin, Role.Master, Role.TechUser)]
        [ProducesResponseType(typeof(IEnumerable<ChiefDto>), StatusCodes.Status200OK)]
        public async Task<ActionResult<IEnumerable<ChiefDto>>> GetAllWeldersAsync()
        {
            return await _chiefManager.GetAllAsync();
        }
    }
}
