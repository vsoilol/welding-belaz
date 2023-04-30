﻿using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.Common.Entities.Production;
using Belaz.WeldingApp.Common.Entities.Users;
using Belaz.WeldingApp.Common.Enums;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.Common.Entities.IdentityUser;

[Index(nameof(RfidTag), IsUnique = true)]
public class UserData : EntityWithRfidTag
{
    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string MiddleName { get; set; } = null!;

    public string? UserName { get; set; }

    public string? Email { get; set; }

    public bool IsEmailConfirmed { get; set; }

    public string? PasswordHash { get; set; }

    public string? Position { get; set; }

    /// <summary>
    /// Табельный номер
    /// </summary>
    public string? ServiceNumber { get; set; }

    /// <summary>
    /// Срок действия удостоверения
    /// </summary>
    public DateTime? CertificateValidityPeriod { get; set; }
    
    public Role Role { get; set; }

    public Guid? ProductionAreaId { get; set; }

    [ForeignKey(nameof(ProductionAreaId))]
    public ProductionArea? ProductionArea { get; set; }

    public List<Welder> Welders { get; set; } = null!;

    public List<Master> Masters { get; set; } = null!;

    public List<Inspector> Inspectors { get; set; } = null!;

    public List<Chief> Chiefs { get; set; } = null!;
    
    public List<EventLog> EventLogs { get; set; } = null!;
    
    public string? ConfirmEmailToken { get; set; }
    
    public string? ResetPasswordToken { get; set; }
}
