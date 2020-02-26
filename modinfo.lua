name = "Durability Tweaks"
description = "Tweaks durabilities of tools, weapons & armors + Increase torch radius(opt) + % hidden on infinite items"
author = "DMCartz, Phixius83, Noldaz, xpolife"

version = "3.1.1"

forumthread = ""

api_version = 6

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

local yes_no_options = {
	{description = "No", data = false},
	{description = "Yes", data = true},
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
		name = "BOOMERANG_SPEED",
		label = "Tweak boomerang speed",
		hover = "Auto-catch mod recommended",
		options = {
			{description = "5", data = 5},
			{description = "10 (Default)", data = 10},
			{description = "15", data = 15},
			{description = "20", data = 20},
			{description = "25", data = 25},
			{description = "30", data = 30},
			{description = "35", data = 35},
			{description = "40", data = 40},
			{description = "50", data = 50},
		},
		default = 10,
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
		name = "BOOST_GOLD_DAMAGE",
		label = "Boost gold tools damage",
		hover = "Weapon damage X 2",
		options = yes_no_options,
		default = false,
	},
	{
		name = "BOOST_GOLD_ACTION",
		label = "Boost gold tools acction",
		hover = "Action required / 2",
		options = yes_no_options,
		default = false,
	},

	{
		name = "OBSIDIAN_DURABILITY",
		label = "Obsidian items durability",
		hover = "Obsidian axe, mahete, spear",
		options = durability_options,
		default = "Default",
	},

	{
		name = "BOOST_OBSIDIAN_DAMAGE",
		label = "Boost obsidian tools damage(SW)",
		hover = "Weapon damage X 3",
		options = yes_no_options,
		default = false,
	},

	{
		name = "BOOST_OBSIDIAN_ACTION",
		label = "Boost obsidian tools action(SW)",
		hover = "Action required / 3",
		options = yes_no_options,
		default = false,
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
		name = "TORCH_RADIUS",
		label = "Increase light radius of torch",
		hover = "From 2m to 5m",
		options = yes_no_options,
		default = false,
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
		name = "ICEBOX_TUNING",
		label = "Icebox efficiency",
		options = {
			{descript = "50% (Default)", data = "Default"},
			{description = "75%", data = 0.75},
			{description = "100%", data = 1},
			{description = "125%", data = 1.25},
			{description = "150%", data = 1.5},
			{description = "200%", data = 2},
			{description = "500%", data = 5},
			{description = "1000%", data = 10},
			{description = "Infinite", data = -10},
		},

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

}
