using System.ComponentModel.DataAnnotations;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Entities.CalendarInfo
{
    public class Calendar : Entity
    {
        public int Year { get; set; }
        
        public bool IsMain { get; set; }

        public List<Day> WorkingDays { get; set; }
    }
}