using Belaz.WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.FileApi.Domain.Constants;

public static class PositionRoles
{
    public static readonly Dictionary<string, Role> PositionsMapping = new()
    {
        { "Мастер производственного участка", Role.Master },
        { "Мастер контрольный (участка, цеха)", Role.Master },
        { "Старший мастер производственного участка", Role.Master },
        { "Электросварщик на автоматических и полуавтоматических машинах", Role.Welder },
        { "Контролер сварочных работ", Role.Inspector }
    };

    public static readonly Dictionary<string, string> PositionsMappingToDisplayName = new()
    {
        { "МАСТЕР ПРОИЗВОДСТВЕННОГО УЧАСТКА", "Мастер производственного участка" },
        { "МАСТЕР КОНТРОЛЬНЫЙ (УЧАСТКА, ЦЕХА)", "Мастер контрольный (участка, цеха)" },
        { "СТАРШИЙ МАСТЕР ПРОИЗВОДСТВЕННОГО УЧАСТКА", "Старший мастер производственного участка" },
        {
            "ЭЛЕКТРОСВАРЩИК НА АВТОМАТИЧЕСКИХ И ПОЛУАВТОМАТИЧЕСКИХ МАШИНАХ",
            "Электросварщик на автоматических и полуавтоматических машинах"
        },
        {
            "ЭЛ.СВАРЩИК НА АВТОМАТИЧЕСКИХ И ПОЛУАВТОМАТИЧ.МАШИНАХ",
            "Электросварщик на автоматических и полуавтоматических машинах"
        },
        {
            "КОНТРОЛЕР СВАРОЧНЫХ РАБОТ",
            "Контролер сварочных работ"
        }
    };

    public static Role GetRoleByPosition(string position)
    {
        if (PositionsMapping.TryGetValue(position, out Role role))
        {
            return role;
        }

        throw new ArgumentException("Cannot find role by position");
    }
}