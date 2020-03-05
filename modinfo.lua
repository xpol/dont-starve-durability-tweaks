name = "Durability Tweaks"
description = "Tweaks durabilities of tools, weapons, armors, boats, staffs, amulets, saddles and more"
author = "DMCartz, Phixius83, Noldaz, xpolife"

version = "3.2.0"

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
	{description = "Default", data = "Default"},
	{description = "200%", data = 2},
	{description = "400%", data = 4},
	{description = "800%", data = 8},
	{description = "Infinite", data = "Infinite"},
}

configuration_options =
{
	{
		name = "WEAPON_DURABILITY",
		label = "Weapons durability",
		hover = "All but swords",
		options = durability_options,
		default = "Default",
	},

	{
		name = "SWORD_DURABILITY",
		label = "Swords durability",
		hover = "nightsword",
		options = durability_options,
		default = "Default",
	},

	{
		name = "ARMOR_DURABILITY",
		label = "Tweak armor life",
		hover = "Include body & head armor",
		options = durability_options,
		default = "Default",
	},

	{
		name = "TOOL_DURABILITY",
		label = "Tweak survival tools",
		hover = "Tools in general",
		options = durability_options,
		default = "Default",
	},

	{
		name = "PROJECTILE_DURABILITY",
		label = "Change boomerang uses",
		hover = "Boomerang",
		options = durability_options,
		default = "Default",
	},

	{
		name = "STAFF_DURABILITY",
		label = "Tweak staffs uses",
		options = durability_options,
		default = "Default",
	},

	{
		name = "AMULET_DURABILITY",
		label = "Tweak amulets duration",
		options = durability_options,
		default = "Default",
	},

	{
		name = "SEWINGKIT_DURABILITY",
		label = "Tweak sewing kit",
		options = durability_options,
		default = "Default",
	},
	{
		name = "COMPASS_DURABILITY",
		label = "Tweak compass",
		options = durability_options,
		default = "Default",
	},
	{
		name = "PRIMARYTOOL_DURABILITY",
		label = "Tweak primary tools",
		hover = "Axe, pickaxe, shovel, hammer, pitchfork",
		options = durability_options,
		default = "Default",
	},

	{
		name = "GOLD_DURABILITY",
		label = "Tweak gold items",
		hover = "gold axe, gold pickaxe, gold shovel, weapons, armors",
		options = durability_options,
		default = "Default",
	},
	{
		name = "OBSIDIAN_DURABILITY",
		label = "Obsidian items durability",
		hover = "Obsidian axe, mahete, spear",
		options = durability_options,
		default = "Default",
	},
	{
		name = "TRAP_DURABILITY",
		label = "Traps durability",
		hover = "trap, bird trap, teeth trap",
		options = durability_options,
		default = "Default",
	},

	{
		name = "HEATROCK_DURABILITY",
		label = "Tweak heatrock",
		hover = "heatrock warming speed in summer and cool down speed in winter",
		options = durability_options,
		default = "Default",
	},

	{
		name = "CLOTHING_DURABILITY",
		label = "Tweak clothing decay",
		hover = "Include all cloths and hats",
		options = durability_options,
		default = "Default",
	},

	{
		name = "LIGHT_DURABILITY",
		label = "Tweak portable light",
		hover = "Lantern, lighter, miner's hat, nightlight, pumpkin lantern",
		options = durability_options,
		default = "Default",
	},

	{
		name = "TORCH_DURABILITY",
		label = "Torch life",
		options = durability_options,
		default = "Default",
	},
	{
		name = "CAMPING_DURABILITY",
		label = "Tweak sleep items",
		hover = "bed roll, tent, siesta hut",
		options = durability_options,
		default = "Default",
	},
	{
		name = "BOOK_DURABILITY",
		label = "Book Durability",
		options = durability_options,
		default = "Default",
	},
	{
		name = "BOAT_DURABILITY",
		label = "Tweak boat(SW)",
		hover = "Both boat and sail",
		options = durability_options,
		default = "Default",
	},
	{
		name = "BOATITEMS_DURABILITY",
		label = "Lantern, telescope & cannon(SW)",
		options = durability_options,
		default = "Default",
	},
	{
		name = "BOATREPAIRKIT_DURABILITY",
		label = "Boat repairkit durability(SW)",
		options = durability_options,
		default = "Default",
	},
	{
		name = "SADDLE_DURABILITY",
		label = "Saddles durability(DST)",
		options = durability_options,
		default = "Default",
	},
}
