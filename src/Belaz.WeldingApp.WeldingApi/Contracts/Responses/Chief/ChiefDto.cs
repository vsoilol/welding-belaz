namespace Belaz.WeldingApp.WeldingApi.Contracts.Responses.Chief
{
    public class ChiefDto
    {
        public Guid Id { get; set; }

        public string RfidTag { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string MiddleName { get; set; }

        public string ProductionAreaName { get; set; }
    }
}
