using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Production;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Entities.IdentityUser
{
    public class UserData : Entity
    {
        public string FirstName { get; set; }
        
        public string LastName { get; set; }
        
        public string MiddleName { get; set; }
        
        public string UserName { get; set; }
        
        public string Email { get; set; }
        
        public string PasswordHash { get; set; }

        public string? Position { get; set; }

        /// <summary>
        /// Табельный номер 
        /// </summary>
        public string? ServiceNumber { get; set; }
        
        /// <summary>
        /// Срок действия удостоверения 
        /// </summary>
        public DateTime? CertificateValidityPeriod { get; set; }

        /// <summary>
        /// RFID-метка
        /// </summary>
        public string? RfidTag { get; set; }
        
        public Guid? ProductionAreaId { get; set; }
        
        [ForeignKey(nameof(ProductionAreaId))]
        public ProductionArea? ProductionArea { get; set; }
        
        public List<UserRole> UserRoles { get; set; }
    }
}