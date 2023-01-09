using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Inspector;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Microsoft.AspNetCore.Mvc;
using WeldingApp.Common.Attributes;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Controllers
{
    public class InspectorController : ControllerBase
    {
        private readonly IInspectorManager _inspectorManager;

        public InspectorController(IInspectorManager inspectorManager)
        {
            _inspectorManager = inspectorManager;
        }

        [HttpGet]
        [AuthorizeRoles(Role.Admin, Role.Master, Role.TechUser)]
        [ProducesResponseType(typeof(IEnumerable<InspectorDto>), StatusCodes.Status200OK)]
        public async Task<ActionResult<IEnumerable<InspectorDto>>> GetAllWeldersAsync()
        {
            return await _inspectorManager.GetAllAsync();
        }
    }
}
