﻿using AutoMapper;
using Belaz.WeldingApp.FileApi.Domain.Entities.ProductInfo;
using Belaz.WeldingApp.FileApi.Domain.Mappings;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.FileApi.Domain.Dtos.SeamPassportInfo;

public class ProductDto : IMapFrom<Product>
{
    public string? Name { get; set; }

    public string Number { get; set; } = null!;

    public ProductType ProductType { get; set; }

    public ProductDto? MainProduct { get; set; }
    
    public void Mapping(Profile profile)
    {
        profile.CreateMap<Product, ProductDto>()
            .MaxDepth(3)
            .ForMember(dto => dto.MainProduct,
                opt => opt
                    .MapFrom(x => x.ProductMain!.MainProduct));
    }
}