﻿using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Belaz.WeldingApp.IdentityApi.Data.Repositories.Entities;

public class UserData : Entity
{
    public string FirstName { get; set; }

    public string LastName { get; set; }

    public string MiddleName { get; set; }

    public string? UserName { get; set; }

    public string? Email { get; set; }

    public string? PasswordHash { get; set; }

    public List<UserRole> UserRoles { get; set; }

    public Guid? ProductionAreaId { get; set; }

    [ForeignKey(nameof(ProductionAreaId))]
    public ProductionArea? ProductionArea { get; set; }
}
