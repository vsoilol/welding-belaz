using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Belaz.WeldingApp.FileApi.Domain.Exceptions;

namespace Belaz.WeldingApp.FileApi.Domain.Models;

public class ValidationResult
{
    public bool IsValid { get; set; }

    public ValidationException? Exception { get; set; }
}
