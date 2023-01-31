﻿using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.Seam;

public class SeamBriefDto : IMapFrom<Entities.ProductInfo.Seam>
{
    public Guid Id { get; set; }

    public int Number { get; set; }

}