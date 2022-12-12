using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Production;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Entities.IdentityUser
{
    public class UserData : Entity
    {
        [Required]
        [MaxLength(50)]
        public string FirstName { get; set; }

        [Required]
        [MaxLength(50)]
        public string LastName { get; set; }

        [Required]
        [MaxLength(50)]
        public string MiddleName { get; set; }

        [Required]
        [MaxLength(50)]
        public string UserName { get; set; }

        [Required]
        [MaxLength(100)]
        public string Email { get; set; }

        [Required]
        [MaxLength(300)]
        public string PasswordHash { get; set; }

        [Required]
        [MaxLength(100)]
        public string Position { get; set; }

        /// <summary>
        /// Табельный номер
        /// </summary>
        [Required]
        [MaxLength(100)]
        public string ServiceNumber { get; set; }

        /// <summary>
        /// Срок действия удостоверения
        /// </summary>
        [Required]
        public DateTime CertificateValidityPeriod { get; set; }

        /// <summary>
        /// RFID-метка
        /// </summary>
        [Required]
        [MaxLength(100)]
        public string RfidTag { get; set; }

        [Required]
        public Guid ProductionAreaId { get; set; }

        [ForeignKey(nameof(ProductionAreaId))]
        public ProductionArea ProductionArea { get; set; }
    }
}
