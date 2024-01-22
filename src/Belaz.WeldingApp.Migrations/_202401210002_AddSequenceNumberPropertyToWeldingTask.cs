using FluentMigrator;

namespace Belaz.WeldingApp.Migrations;

[Migration(202401210002)]
public class _202401210002_AddSequenceNumberPropertyToWeldingTask : Migration
{
    public override void Up()
    {
        Alter.Table("WeldingTasks")
            .InSchema("public")
            .AddColumn("SequenceNumber")
            .AsString()
            .Nullable();
    }

    public override void Down()
    {
        Delete.Column("SequenceNumber").FromTable("WeldingTasks").InSchema("public");
    }
}