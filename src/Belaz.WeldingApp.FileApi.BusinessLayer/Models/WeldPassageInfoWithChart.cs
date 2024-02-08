using Belaz.WeldingApp.FileApi.Domain.Dtos.SeamPassportInfo;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Models;

public class WeldPassageInfoWithChart
{
    public WeldPassageInstructionDto WeldPassageInstructionInfo { get; set; } = null!;

    public WeldPassageDto WeldPassageInfo { get; set; } = null!;

    public byte[] WeldingCurrentChartImageBytes { get; set; } = null!;

    public byte[] ArcVoltageChartImageBytes { get; set; } = null!;
}