using FluentMigrator;

namespace Belaz.WeldingApp.Migrations;

[Migration(202312180002)]
public class _202312180002_ChangeSeamNumberType : Migration
{
    public override void Up()
    {
        Alter.Table("Seams")
            .InSchema("public")
            .AlterColumn("Number")
            .AsString()
            .NotNullable();
    }

    public override void Down()
    {
        Execute.Sql(
            "ALTER TABLE \"public\".\"Seams\" ALTER COLUMN \"Number\" TYPE integer  USING (\"Number\"::integer); ALTER TABLE \"public\".\"Seams\" ALTER COLUMN \"Number\" SET NOT NULL;");
    }
}