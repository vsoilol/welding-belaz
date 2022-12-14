using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Entities.TaskInfo
{
    public class Layer : Entity
    {
        /// <summary>
        /// Сварочный ток min
        /// </summary>
        [Required]
        public double WeldingCurrentMin { get; set; }
        
        /// <summary>
        /// Сварочный ток max
        /// </summary>
        [Required]
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
        [Required]
        public double PreheatingTemperatureMin { get; set; }
        
        /// <summary>
        /// Температура предварительного нагрева max
        /// </summary>
        [Required]
        public double PreheatingTemperatureMax { get; set; }
        
        [Required]
        public Guid TechnologicalProcessInstructionId { get; set; }
        
        [ForeignKey(nameof(TechnologicalProcessInstructionId))]
        public TechnologicalProcessInstruction TechnologicalProcessInstruction { get; set; }
    }
}