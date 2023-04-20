﻿using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.Post;

public class PostBriefDto : IMapFrom<Belaz.WeldingApp.Common.Entities.Production.Post>
{
    public Guid Id { get; set; }

    public string? IdFromSystem { get; set; }

    public int Number { get; set; }

    public string Name { get; set; } = null!;
}
