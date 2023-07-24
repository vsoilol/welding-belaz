﻿using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Calendar;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Calendar;

public class MainCalendarIsAlreadyExistValidatorFor : AsyncPropertyValidator<CreateMainCalendarByYearRequest, int>
{
    private readonly ApplicationContext _context;

    public MainCalendarIsAlreadyExistValidatorFor(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(ValidationContext<CreateMainCalendarByYearRequest> context, int value,
        CancellationToken cancellation)
    {
        if (value is < 1000 or > 2999)
        {
            return false;
        }

        var isExist = await _context.Calendars.AnyAsync(_ => _.Year == value && _.IsMain,
            cancellation);

        return !isExist;
    }

    public override string Name => "MainCalendarIsAlreadyExistValidatorFor";

    protected override string GetDefaultMessageTemplate(string errorCode)
        => "Year is not valid or already exist";
}