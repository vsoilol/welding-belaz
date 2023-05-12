CREATE OR REPLACE FUNCTION set_users_roles()
    RETURNS void
    LANGUAGE plpgsql
AS $$
DECLARE
    user_roles_cursor CURSOR FOR
        SELECT "Users"."Id" as id, "Roles"."Name" as name
        FROM "UserRoles"
        JOIN "Users" ON "Users"."Id" = "UserRoles"."UserId"
        JOIN "Roles" ON "Roles"."Id" = "UserRoles"."RoleId";
    user_id uuid;
    role_name text;
    row RECORD;
    role_enum_value integer;
BEGIN
    OPEN user_roles_cursor;

    LOOP
        FETCH NEXT FROM user_roles_cursor INTO row;
        EXIT WHEN NOT FOUND;

        user_id := row.id;
        role_name := row.name;

        CASE role_name
            WHEN 'Admin' THEN
                role_enum_value := 1;
            WHEN 'Master' THEN
                role_enum_value := 2;
            WHEN 'Welder' THEN
                role_enum_value := 3;
            WHEN 'Inspector' THEN
                role_enum_value := 4;
            WHEN 'Chief' THEN
                role_enum_value := 5;
        END CASE;

        UPDATE "Users" SET "Role" = role_enum_value WHERE "Id" = user_id;
    END LOOP;

    CLOSE user_roles_cursor;
END;
$$;

CREATE OR REPLACE FUNCTION get_first_welder_id()
    RETURNS uuid
    LANGUAGE plpgsql
AS $$
DECLARE
    welder_id uuid;
BEGIN
    SELECT "Id" INTO welder_id FROM "Welders" ORDER BY "Id" LIMIT 1;
    RETURN welder_id;
END;
$$;

BEGIN;

ALTER TABLE "Users" ADD COLUMN "Role" integer NOT NULL DEFAULT 0;

SELECT set_users_roles();

DROP TABLE "UserRoles";

DROP TABLE "Roles";

ALTER TABLE "WeldPassages" ADD COLUMN "Estimation" double precision NULL;

ALTER TABLE "WeldingEquipmentConditionTimes" ADD "WelderId" uuid NOT NULL DEFAULT get_first_welder_id();

ALTER TABLE "Users" ADD COLUMN "ConfirmEmailToken" text NULL;

ALTER TABLE "Users" ADD COLUMN "IsEmailConfirmed" boolean NOT NULL DEFAULT FALSE;

ALTER TABLE "Users" ADD COLUMN "ResetPasswordToken" text NULL;

ALTER TABLE "Products" ADD COLUMN "ManufacturingTime" double precision NOT NULL DEFAULT 0.0;

ALTER TABLE "EventLogs" ALTER COLUMN "Information" TYPE text;

CREATE INDEX "IX_WeldingEquipmentConditionTimes_WelderId" ON "WeldingEquipmentConditionTimes" ("WelderId");

ALTER TABLE "WeldingEquipmentConditionTimes" ADD CONSTRAINT "FK_WeldingEquipmentConditionTimes_Welders_WelderId" FOREIGN KEY ("WelderId") REFERENCES "Welders" ("Id") ON DELETE CASCADE;

COMMIT;