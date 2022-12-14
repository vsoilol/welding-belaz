using System.ComponentModel.DataAnnotations;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Entities.CalendarInfo
{
    public class Calendar : Entity
    {
        [Required]
        public int Year { get; set; }

        [Required]
        public bool IsMain { get; set; }

        public List<Day> WorkingDays { get; set; }
    }
}