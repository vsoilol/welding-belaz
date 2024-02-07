﻿using FluentMigrator;

namespace Belaz.WeldingApp.Migrations;

[Migration(202402060001)]
public class _202402060001_CreateProductAccountTaskTable : Migration
{
    public override void Up()
    {
        Create.Table("ProductAccountTasks")
            .WithColumn("Id").AsGuid().PrimaryKey()
            .WithColumn("IdFromSystem").AsString().Nullable()
            .WithColumn("SequenceNumber").AsString().NotNullable()
            .WithColumn("DateFromPlan").AsDateTime().NotNullable()
            .WithColumn("EndDateFromPlan").AsDateTime().Nullable()
            .WithColumn("Reason").AsString().Nullable()
            .WithColumn("DetectedDefects").AsString().Nullable()
            .WithColumn("ManufacturedAmount").AsInt32().NotNullable()
            .WithColumn("AcceptedAmount").AsInt32().NotNullable()
            .WithColumn("DefectiveAmount").AsInt32().NotNullable()
            .WithColumn("WeldingMaterial").AsString().Nullable()
            .WithColumn("WeldingMaterialBatchNumber").AsString().Nullable()
            .WithColumn("ProductAccountId").AsGuid()
            .NotNullable()
            .ForeignKey("ProductAccounts", "Id")
            .WithColumn("MasterId").AsGuid()
            .Nullable()
            .ForeignKey("Masters", "Id")
            .WithColumn("InspectorId").AsGuid()
            .Nullable()
            .ForeignKey("Inspectors", "Id");

        Alter.Table("WeldingTasks")
            .AddColumn("ProductAccountTaskId")
            .AsGuid()
            .Nullable()
            .ForeignKey("ProductAccountTasks", "Id");

        // Many-to-Many: ProductAccountTask <-> WeldingEquipment
        // You need an association table for a many-to-many relationship
        Create.Table("ProductAccountTaskWeldingEquipment")
            .WithColumn("ProductAccountTasksId").AsGuid()
            .ForeignKey("ProductAccountTasks", "Id")
            .WithColumn("WeldingEquipmentsId").AsGuid()
            .ForeignKey("WeldingEquipments", "Id");

        // Ensure the combination is unique to prevent duplicate associations
        Create.UniqueConstraint()
            .OnTable("ProductAccountTaskWeldingEquipment")
            .Columns("ProductAccountTasksId", "WeldingEquipmentsId");
    }

    public override void Down()
    {
        // Drop the association table first due to foreign key dependencies
        Delete.Table("ProductAccountTaskWeldingEquipment");

        // Remove the column added to the WeldingTask table
        // FluentMigrator does not natively support removing a column with a foreign key constraint directly,
        // so you may need to first drop the foreign key if it was explicitly named or handle this carefully.
        // This example assumes a direct column drop for simplicity.
        Delete.Column("ProductAccountTaskId").FromTable("WeldingTasks");

        // Finally, drop the ProductAccountTask table
        Delete.Table("ProductAccountTasks");
    }
}