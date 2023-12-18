using FluentMigrator;

namespace Belaz.WeldingApp.Migrations;

[Migration(202312180001)]
public class _202312180001_InitialTables : Migration
{
    public override void Up()
    {
        Execute.EmbeddedScript("Belaz.WeldingApp.Migrations.Scripts.CreateDatabaseSchema.sql");
    }

    public override void Down()
    {
        Execute.EmbeddedScript("Belaz.WeldingApp.Migrations.Scripts.DropDatabaseSchema.sql");
    }
}