﻿using Belaz.WeldingApp.Common.Entities.ProductInfo;

namespace Belaz.WeldingApp.Common.Entities.TechnologicalProcessInfo;

public class TechnologicalInstruction : Entity
{
    public string Number { get; set; } = null!;

    public string Name { get; set; } = null!;

    public List<Seam> Seams { get; set; } = null!;

    public List<WeldPassageInstruction> WeldPassageInstructions { get; set; } = null!;
}
