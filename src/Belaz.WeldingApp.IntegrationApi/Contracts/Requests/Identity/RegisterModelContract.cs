﻿namespace Belaz.WeldingApp.IntegrationApi.Contracts.Requests.Identity;

public class RegisterModelContract
{
    public string FirstName { get; set; }

    public string MiddleName { get; set; }

    public string LastName { get; set; }

    public string Email { get; set; }

    public string UserName { get; set; }

    public string Role { get; set; }

    public string Password { get; set; }

    public string ConfirmPassword { get; set; }
}
