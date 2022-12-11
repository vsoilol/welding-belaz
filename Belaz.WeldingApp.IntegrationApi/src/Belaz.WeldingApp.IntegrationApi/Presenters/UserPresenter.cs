using AutoMapper;
using Belaz.WeldingApp.IntegrationApi.Managers.Interfaces;
using Belaz.WeldingApp.IntegrationApi.Presenters.Interfaces;
using Belaz.WeldingApp.IntegrationApi.Presenters.Models;

namespace Belaz.WeldingApp.IntegrationApi.Presenters
{
    public class UserPresenter : IUserPresenter
    {
        private readonly IUserManager _userManager;
        private readonly IMapper _mapper;

        public UserPresenter(IUserManager userManager, IMapper mapper)
        {
            _userManager = userManager;
            _mapper = mapper;
        }

        public async Task<IReadOnlyCollection<UserContract>> GetUsers()
        {
            var users = await _userManager.GetUsers();

            return _mapper.Map<IReadOnlyCollection<UserContract>>(users);
        }
    }
}
