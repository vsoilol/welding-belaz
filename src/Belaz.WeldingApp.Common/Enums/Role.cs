namespace Belaz.WeldingApp.Common.Enums;

[Flags]
public enum Role
{
    Admin = 1, // Администратор
    Master = 2, // Мастер
    Welder = 3, // Сварщик
    Inspector = 4, // Контролёр
    Chief = 5, // Руководитель цеха
    UkkRepresentative = 6, // Представитель УКК
    PlantManager = 7 // Руководитель завода
}
