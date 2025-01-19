name = "Durability Tweaks 调整耐久度"
description = "Tweaks durabilities of tools, weapons, armors, boats, staffs, amulets, saddles and more. 调整工具、武器盔甲、船只、法杖、护符和鞍具等的耐久度。"
author = "DMCartz, Phixius83, Noldaz, xpolife"

version = "3.5.13"

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
		label = "所有武器 All Weapons",
		hover = "所有等的武器 All weapons",
		options = durability_options,
		default = "Default",
	},
	{
		name = "ARMOR_DURABILITY",
		label = "护甲 Armors",
		hover = "所有头盔和护甲 All body & head armors",
		options = durability_options,
		default = "Default",
	},
	{
		name = "PRIMARYTOOL_DURABILITY",
		label = "生产工具 Primary tools",
		hover = "斧头等用于生产的工具 Tools used for work like axe",
		options = durability_options,
		default = "Default",
	},
	{
		name = "TOOL_DURABILITY",
		label = "生存工具 Survival tools",
		hover = "捕虫网等用于生存目的的工具 Tools for survival like Bug Net",
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
		name = "RUINS_DURABILITY",
		label = "远古(铥矿)物品 Ruins items",
		hover = "Ruins armor, hat, bat, axe",
		options = durability_options,
		default = "Default",
	},
	{
		name = "GLASS_DURABILITY",
		label = "[DST]玻璃物品 Glass items",
		hover = "Glass cutter and axe",
		options = durability_options,
		default = "Default",
	},
	{
		name = "OBSIDIAN_DURABILITY",
		label = "[SW]黑曜石物品 Obsidian items",
		hover = "Obsidian axe, mahete, spear",
		options = durability_options,
		default = "Default",
	},
	{
		name = "TRAP_DURABILITY",
		label = "陷阱 Traps",
		hover = "陷阱，捕鸟陷阱、犬牙陷阱 trap, bird trap, teeth trap",
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
		label = "衣帽 Cloths and hats",
		hover = "包括衣服和帽子 Include all cloths and hats",
		options = durability_options,
		default = "Default",
	},
	{
		name = "LIGHT_DURABILITY",
		label = "光源 Lights",
		hover = "火把 灯笼 薇洛的打火机 矿工帽 鼹鼠帽 蓝挂灯 Lantern, lighter, miner's hat, nightlight, pumpkin lantern",
		options = durability_options,
		default = "Default",
	},
	{
		name = "FUELS_DURABILITY",
		label = "光源的燃料 Fuels for Lights",
		hover = "荧光珠 光莓 孢子 Light bulb, wormlight and spores",
		options = durability_options,
		default = "Default",
	},

	{
		name = "CAMPING_DURABILITY",
		label = "睡觉用品 Sleep items",
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
		label = "鞍具 Saddles",
		options = durability_options,
		default = "Default",
	},
	{
		name = "FARMING_DURABILITY",
		label = "农耕 Farming items",
		options = durability_options,
		default = "Default",
	}
}
