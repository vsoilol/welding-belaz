﻿using System.Reflection;
using AutoMapper;
using Belaz.WeldingApp.FileApi.Domain.Extensions;

namespace Belaz.WeldingApp.FileApi.Domain.Mappings;

public class MappingProfile : Profile
{
    public MappingProfile()
    {
        this.ApplyMappingsFromAssembly(Assembly.GetExecutingAssembly());
    }
}