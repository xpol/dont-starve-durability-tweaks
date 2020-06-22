name = "Durability Tweaks 调整耐久度"
description = "Tweaks durabilities of tools, weapons, armors, boats, staffs, amulets, saddles and more. 调整工具、武器盔甲、船只、法杖、护符和鞍具等的耐久度。"
author = "DMCartz, Phixius83, Noldaz, xpolife"

version = "3.4.1"

forumthread = ""

api_version = 6
api_version_dst = 10

icon_atlas = "DurabilityTweaks.xml"
icon = "DurabilityTweaks.tex"

dont_starve_compatible = true
reign_of_giants_compatible = true
shipwrecked_compatible = true
dst_compatible = true

client_only_mod = false

local durability_options = {
	{description = "系统默认 Default", data = "Default"},
	{description = "200%", data = 2},
	{description = "400%", data = 4},
	{description = "800%", data = 8},
	{description = "永久 Infinite", data = "Infinite"},
}

configuration_options =
{
	{
		name = "WEAPON_DURABILITY",
		label = "武器 Weapons durability",
		hover = "除了剑以外的武器 All but swords",
		options = durability_options,
		default = "Default",
	},

	{
		name = "SWORD_DURABILITY",
		label = "剑 Swords durability",
		hover = "暗影剑等 nightsword etc...",
		options = durability_options,
		default = "Default",
	},

	{
		name = "ARMOR_DURABILITY",
		label = "护甲 Tweak armor life",
		hover = "头盔和护甲 body & head armor",
		options = durability_options,
		default = "Default",
	},
	{
		name = "PRIMARYTOOL_DURABILITY",
		label = "生产工具 Primary tools",
		hover = "用于生产的工具 Tools used for work",
		options = durability_options,
		default = "Default",
	},
	{
		name = "TOOL_DURABILITY",
		label = "生存工具 Survival tools",
		hover = "用于生存目的的工具 Tools for survival",
		options = durability_options,
		default = "Default",
	},
	{
		name = "PROJECTILE_DURABILITY",
		label = "回旋镖 Boomerang",
		hover = "Boomerang",
		options = durability_options,
		default = "Default",
	},
	{
		name = "STAFF_DURABILITY",
		label = "杖 Staffs",
		options = durability_options,
		default = "Default",
	},
	{
		name = "AMULET_DURABILITY",
		label = "护符 Amulets",
		options = durability_options,
		default = "Default",
	},
	{
		name = "SEWINGKIT_DURABILITY",
		label = "针线包 Sewing kit",
		options = durability_options,
		default = "Default",
	},
	{
		name = "COMPASS_DURABILITY",
		label = "指南针 Compass",
		options = durability_options,
		default = "Default",
	},

	{
		name = "GOLD_DURABILITY",
		label = "黄金物品 Tweak gold items",
		hover = "gold axe, gold pickaxe, gold shovel, weapons, armors",
		options = durability_options,
		default = "Default",
	},
	{
		name = "OBSIDIAN_DURABILITY",
		label = "远古物品 Obsidian items durability",
		hover = "Obsidian axe, mahete, spear",
		options = durability_options,
		default = "Default",
	},
	{
		name = "TRAP_DURABILITY",
		label = "陷阱 Traps durability",
		hover = "trap, bird trap, teeth trap",
		options = durability_options,
		default = "Default",
	},

	{
		name = "HEATROCK_DURABILITY",
		label = "暖石头 Tweak heatrock",
		hover = "heatrock warming speed in summer and cool down speed in winter",
		options = durability_options,
		default = "Default",
	},

	{
		name = "CLOTHING_DURABILITY",
		label = "衣物 Tweak clothing decay",
		hover = "包括衣服和帽子 Include all cloths and hats",
		options = durability_options,
		default = "Default",
	},

	{
		name = "LIGHT_DURABILITY",
		label = "光源 Tweak portable light",
		hover = "火把 灯笼 薇洛的打火机 矿工帽 鼹鼠帽 蓝挂灯 Lantern, lighter, miner's hat, nightlight, pumpkin lantern",
		options = durability_options,
		default = "Default",
	},

	{
		name = "FUELS_DURABILITY",
		label = "光源燃料 Tweak light fuels",
		hover = "荧光珠 光莓 孢子 Light bulb, wormlight and spores",
		options = durability_options,
		default = "Default",
	},

	{
		name = "CAMPING_DURABILITY",
		label = "睡觉用品 Tweak sleep items",
		hover = "睡袋 帐篷 凉棚 bed roll, tent, siesta hut",
		options = durability_options,
		default = "Default",
	},
	{
		name = "BOOK_DURABILITY",
		label = "书籍 Books",
		options = durability_options,
		default = "Default",
	},
	{
		name = "SEAFARING_DURABILITY",
		label = "航行物品 Seafaring items",
		options = durability_options,
		default = "Default",
	},
	{
		name = "SADDLE_DURABILITY",
		label = "鞍具 Saddles (DST)",
		options = durability_options,
		default = "Default",
	},
}
