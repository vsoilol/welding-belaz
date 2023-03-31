using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Belaz.WeldingApp.FileApi.Domain.Dtos;

public class WelderOperationTimeDto
{
    public int WeldingPreparationTimeMinutes { get; set; }

    public int WorkTimeMinutes { get; set; }

    public int DowntimeMinutes { get; set; }

    public double AverageEstimation { get; set; }
}
