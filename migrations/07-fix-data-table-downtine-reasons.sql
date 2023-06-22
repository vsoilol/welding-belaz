DELETE FROM "WeldingEquipmentConditionTimes"
WHERE "DowntimeReasonId" = '78f2bdad-8bfc-4c08-a84b-048d1b940553';

DELETE FROM "DowntimeReasons"
WHERE "Id" = '78f2bdad-8bfc-4c08-a84b-048d1b940553';

DELETE FROM "DowntimeReasons"
WHERE "Id" = '6f6fead1-28ae-4b7d-bbf0-855c7bd623e5';

DELETE FROM "DowntimeReasons"
WHERE "Id" = '4d957a08-c1c4-44f1-98da-19353780c852';

UPDATE "DowntimeReasons" SET "Reason" = 'Неявка сварщика (б/лист, отпуск и др.)'
WHERE "Id" = 'acb66b34-5002-4575-a1b8-e84466e7b85d';

DELETE FROM "DowntimeReasons"
WHERE "Id" = 'fb8fcc6e-e0c6-46d4-b7e7-9fe8d16d4a01';

DELETE FROM "WeldingEquipmentConditionTimes"
WHERE "DowntimeReasonId" = 'dd62c87a-53aa-46a0-b5a6-3d73ed1bd2db';

DELETE FROM "DowntimeReasons"
WHERE "Id" = 'dd62c87a-53aa-46a0-b5a6-3d73ed1bd2db';

UPDATE "DowntimeReasons" SET "Reason" = 'Отсутствие сварщика в связи с необеспеченностью'
WHERE "Id" = '9ac20e22-9a85-440b-9030-eb17ee1b962d';

UPDATE "DowntimeReasons" SET "Reason" = 'Обслуживание оборудования'
WHERE "Id" = '1df97e7c-d895-4ba7-8367-2d0af5faf0b7';