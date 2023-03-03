using System.Text.Json.Serialization;
using AutoMapper;
using Belaz.WeldingApp.RegistarApi.Domain.Dtos;
using Belaz.WeldingApp.RegistarApi.Domain.Mappings;

namespace Belaz.WeldingApp.RegistarApi.BusinessLayer.Responses;

public class WeldPassageInstructionResponse : IMapFrom<WeldPassageInstructionDto>
{
    [JsonPropertyName("PasN")]
    public int Number { get; set; }

    [JsonPropertyName("PasT")]
    public string Name { get; set; } = null!;

    /// <summary>
    /// Сварочный ток min
    /// </summary>
    [JsonPropertyName("minI")]
    public double WeldingCurrentMin { get; set; }

    /// <summary>
    /// Сварочный ток max
    /// </summary>
    [JsonPropertyName("maxI")]
    public double WeldingCurrentMax { get; set; }

    /// <summary>
    /// Напряжения на дуге min
    /// </summary>
    [JsonPropertyName("minU")]
    public double ArcVoltageMin { get; set; }

    /// <summary>
    /// Напряжения на дуге max
    /// </summary>
    [JsonPropertyName("maxU")]
    public double ArcVoltageMax { get; set; }

    /// <summary>
    /// Температура предварительного нагрева min
    /// </summary>
    [JsonPropertyName("minT")]
    public double PreheatingTemperatureMin { get; set; }

    /// <summary>
    /// Температура предварительного нагрева max
    /// </summary>
    [JsonPropertyName("maxT")]
    public double PreheatingTemperatureMax { get; set; }

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<WeldPassageInstructionDto, WeldPassageInstructionResponse>()
            .ForMember(
                dto => dto.WeldingCurrentMin,
                opt => opt.MapFrom(x => x.WeldingCurrentMin != null ? x.WeldingCurrentMin : -1)
            )
            .ForMember(
                dto => dto.WeldingCurrentMax,
                opt => opt.MapFrom(x => x.WeldingCurrentMax != null ? x.WeldingCurrentMax : -1)
            )
            .ForMember(
                dto => dto.ArcVoltageMin,
                opt => opt.MapFrom(x => x.ArcVoltageMin != null ? x.ArcVoltageMin : -1)
            )
            .ForMember(
                dto => dto.ArcVoltageMax,
                opt => opt.MapFrom(x => x.ArcVoltageMax != null ? x.ArcVoltageMax : -1)
            )
            .ForMember(
                dto => dto.PreheatingTemperatureMin,
                opt =>
                    opt.MapFrom(
                        x => x.PreheatingTemperatureMin != null ? x.PreheatingTemperatureMin : -1
                    )
            )
            .ForMember(
                dto => dto.PreheatingTemperatureMax,
                opt =>
                    opt.MapFrom(
                        x => x.PreheatingTemperatureMax != null ? x.PreheatingTemperatureMax : -1
                    )
            );
    }
}
