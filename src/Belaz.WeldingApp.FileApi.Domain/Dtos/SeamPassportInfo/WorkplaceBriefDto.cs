﻿using Belaz.WeldingApp.Common.Entities.Production;
using Belaz.WeldingApp.FileApi.Domain.Mappings;

namespace Belaz.WeldingApp.FileApi.Domain.Dtos.SeamPassportInfo;

public class WorkplaceBriefDto : IMapFrom<Workplace>
{
    public int Number { get; set; }
}