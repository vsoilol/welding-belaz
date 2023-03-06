using AutoMapper;
using Belaz.WeldingApp.FileApi.Domain.Entities.ProductInfo;
using Belaz.WeldingApp.FileApi.Domain.Entities.TaskInfo;
using Belaz.WeldingApp.FileApi.Domain.Mappings;

namespace Belaz.WeldingApp.FileApi.Domain.Dtos.SeamPassportInfo;

public class WeldPassageDto : IMapFrom<WeldPassage>
{
    public int Number { get; set; }

    public string Name { get; set; } = null!;

    /// <summary>
    /// Значения сварочного тока
    /// </summary>
    public double[] WeldingCurrentValues { get; set; } = null!;

    /// <summary>
    /// Значения напряжения на дуге
    /// </summary>
    public double[] ArcVoltageValues { get; set; } = null!;

    /// <summary>
    /// Отклонение кратковременные, до 1 секунды
    /// </summary>
    public double? ShortTermDeviation { get; set; }

    /// <summary>
    /// Отклонения длительные, более 1 секунды
    /// </summary>
    public double? LongTermDeviation { get; set; }

    /// <summary>
    /// Время начала сварки
    /// </summary>
    public TimeSpan WeldingStartTime { get; set; }

    /// <summary>
    /// Время окончания сварки
    /// </summary>
    public TimeSpan WeldingEndTime { get; set; }

    /// <summary>
    /// Температура предварительного нагрева
    /// </summary>
    public double? PreheatingTemperature { get; set; }

    /// <summary>
    /// Обеспечивает ли допуск для тока. True - обеспечивает, false - не обеспечивает
    /// </summary>
    public bool? IsEnsuringCurrentAllowance { get; set; }

    /// <summary>
    /// Обеспечивает ли допуск для напряжения. True - обеспечивает, false - не обеспечивает
    /// </summary>
    public bool? IsEnsuringVoltageAllowance { get; set; }

    /// <summary>
    /// Обеспечивает ли допуск для температуры. True - обеспечивает, false - не обеспечивает
    /// </summary>
    public bool? IsEnsuringTemperatureAllowance { get; set; }

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<WeldPassage, WeldPassageDto>()
            .ForMember(
                dto => dto.WeldingCurrentValues,
                opt => opt.MapFrom(x => x.WeldingRecord.WeldingCurrentValues)
            )
            .ForMember(
                dto => dto.ArcVoltageValues,
                opt => opt.MapFrom(x => x.WeldingRecord.ArcVoltageValues)
            )
            .ForMember(
                dto => dto.WeldingStartTime,
                opt => opt.MapFrom(x => x.WeldingRecord.WeldingStartTime)
            )
            .ForMember(
                dto => dto.WeldingEndTime,
                opt => opt.MapFrom(x => x.WeldingRecord.WeldingEndTime)
            );
    }
}
