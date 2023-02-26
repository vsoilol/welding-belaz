﻿using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.TechnologicalProcess;

public class UpdateTechnologicalProcessRequest
    : IMapTo<Domain.Entities.TechnologicalProcessInfo.TechnologicalProcess>
{
    public Guid Id { get; set; }

    public string Number { get; set; } = null!;

    public string Name { get; set; } = null!;

    /// <summary>
    /// Ссылка на PDF-файл в PDM-системе
    /// </summary>
    public string PdmSystemFileLink { get; set; } = null!;
}
