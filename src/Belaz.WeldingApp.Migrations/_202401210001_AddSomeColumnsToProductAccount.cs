using FluentMigrator;

namespace Belaz.WeldingApp.Migrations;

[Migration(202401210001)]
public class _202401210001_AddSomeColumnsToProductAccount : Migration
{
    public override void Up()
    {
        Alter.Table("ProductAccounts")
            .InSchema("public")
            .AddColumn("EndDateFromPlan")
            .AsDateTime()
            .Nullable();
        
        Alter.Table("ProductAccounts")
            .InSchema("public")
            .AddColumn("SequenceNumbers")
            .AsCustom("TEXT[]")
            .Nullable();
    }

    public override void Down()
    {
        Delete.Column("EndDateFromPlan").FromTable("ProductAccounts").InSchema("public");
        Delete.Column("SequenceNumbers").FromTable("ProductAccounts").InSchema("public");
    }
}