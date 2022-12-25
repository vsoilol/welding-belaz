using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Entities.TaskInfo
{
    public class Layer : Entity
    {
        /// <summary>
        /// Сварочный ток min
        /// </summary>
        public double WeldingCurrentMin { get; set; }
        
        /// <summary>
        /// Сварочный ток max
        /// </summary>
        public double WeldingCurrentMax { get; set; }

        /// <summary>
        /// Напряжения на дуге min
        /// </summary>
        public double? ArcVoltageMin { get; set; }
        
        /// <summary>
        /// Напряжения на дуге max
        /// </summary>
        public double? ArcVoltageMax { get; set; }

        /// <summary>
        /// Температура предварительного нагрева min
        /// </summary>
        public double PreheatingTemperatureMin { get; set; }
        
        /// <summary>
        /// Температура предварительного нагрева max
        /// </summary>
        public double PreheatingTemperatureMax { get; set; }
        
        public Guid TechnologicalProcessInstructionId { get; set; }
        
        [ForeignKey(nameof(TechnologicalProcessInstructionId))]
        public TechnologicalProcessInstruction TechnologicalProcessInstruction { get; set; }
    }
}