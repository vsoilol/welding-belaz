using FluentMigrator;

namespace Belaz.WeldingApp.Migrations;

[Migration(202312180003)]
public class _202312180003_ChangeWeldingRecordSequenceNumber : Migration
{
    public override void Up()
    {
        Alter.Table("WeldingRecords")
            .InSchema("public")
            .AlterColumn("SequenceNumber")
            .AsString()
            .Nullable();
    }

    public override void Down()
    {
        Execute.Sql(
            "ALTER TABLE \"public\".\"WeldingRecords\" ALTER COLUMN \"SequenceNumber\" TYPE integer USING (\"SequenceNumber\"::integer);");
    }
}