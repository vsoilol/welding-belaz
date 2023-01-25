﻿using System.Reflection;

namespace Belaz.WeldingApp.WeldingApi.Domain.Exceptions;

public class NotSuchValidatorException : Exception
{
    public NotSuchValidatorException(MemberInfo type) : base($"Not such validator for model {type.Name}")
    {
        
    }
}