﻿using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Production;

namespace Belaz.WeldingApp.WeldingApi.Contracts.Responses.Inspector
{
    public class InspectorDto
    {
        public Guid Id { get; set; }

        public string RfidTag { get; set; } = null!;

        public string FirstName { get; set; } = null!;

        public string LastName { get; set; } = null!;

        public string MiddleName { get; set; } = null!;

        public ProductionWithNameDto ProductionArea { get; set; } = null!;
    }
}
