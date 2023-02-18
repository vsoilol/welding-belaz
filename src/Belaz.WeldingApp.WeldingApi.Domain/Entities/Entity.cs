using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.Domain.Entities;

[Index(nameof(IdFromSystem), IsUnique = true)]
public class Entity
{
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    [Key]
    public Guid Id { get; set; }

    public string? IdFromSystem { get; set; }
}