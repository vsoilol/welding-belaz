﻿using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;

public class CreateProductWithoutTypeRequest : IMapTo<Domain.Entities.ProductInfo.Product>
{
    public string? Name { get; set; }

    public int Number { get; set; }

    /// <summary>
    /// Подлежит ли контролю
    /// </summary>
    public bool IsControlSubject { get; set; }

    public Guid ProductionAreaId { get; set; }

    public Guid? WorkplaceId { get; set; }

    public Guid TechnologicalProcessId { get; set; }

    public IReadOnlyList<Guid>? Seams { get; set; }

    public IReadOnlyList<Guid>? InsideProducts { get; set; }

    public void Mapping(Profile profile)
    {
        profile.CreateMap<CreateProductWithoutTypeRequest, Domain.Entities.ProductInfo.Product>()
            .ForMember(dto => dto.Seams,
                opt => opt.Ignore());
    }
}