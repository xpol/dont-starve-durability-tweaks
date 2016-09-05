name = "Durability Tweaks"
description = "Tweaks durabilities of tools, weapons & armors + Increase torch radius(opt) + % hidden on infinite items"
author = "DMCartz, Phixius83, Noldaz, xpolife"

version = "3.0.1"

forumthread = ""

api_version = 6

icon_atlas = "DurabilityTweaks.xml"
icon = "DurabilityTweaks.tex"

dont_starve_compatible = true
reign_of_giants_compatible = true
shipwrecked_compatible = true
dst_compatible = false

configuration_options =
{
	{
		name = "WEAPON_DURABILITY",
		label = "Tweak weapons",
		hover = "All but swords",
		options = {
			{description = "25%", data = 0.25},
			{description = "50%", data = 0.5},
			{description = "75%", data = 0.75},
			{description = "Default", data = "Default"},
			{description = "200%", data = 2},
			{description = "300%", data = 3},
			{description = "400%", data = 4},
			{description = "500%", data = 5},
			{description = "750%", data = 7.5},
			{description = "1000%", data = 10},
			{description = "Infinite", data = "Infinite"},
		},

		default = "Default",
	},

	{
		name = "PROJECTILE_DURABILITY",
		label = "Change boomerang uses",
		hover = "Boomerang",
		options = {
			{description = "25%", data = 0.25},
			{description = "50%", data = 0.5},
			{description = "75%", data = 0.75},
			{description = "Default", data = "Default"},
			{description = "200%", data = 2},
			{description = "300%", data = 3},
			{description = "400%", data = 4},
			{description = "500%", data = 5},
			{description = "750%", data = 7.5},
			{description = "1000%", data = 10},
			{description = "Infinite", data = "Infinite"},
		},

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
		name = "SWORD_DURABILITY",
		label = "Tweak swords only",
		hover = "nightsword",
		options = {
			{description = "25%", data = 0.25},
			{description = "50%", data = 0.5},
			{description = "75%", data = 0.75},
			{description = "Default", data = "Default"},
			{description = "200%", data = 2},
			{description = "300%", data = 3},
			{description = "400%", data = 4},
			{description = "500%", data = 5},
			{description = "750%", data = 7.5},
			{description = "1000%", data = 10},
			{description = "Infinite", data = "Infinite"},
		},

		default = "Default",
	},

	{
		name = "ARMOR_DURABILITY",
		label = "Tweak armor life",
		hover = "Include body & head armor",
		options = {
			{description = "25%", data = 0.25},
			{description = "50%", data = 0.5},
			{description = "75%", data = 0.75},
			{description = "Default", data = "Default"},
			{description = "200%", data = 2},
			{description = "300%", data = 3},
			{description = "400%", data = 4},
			{description = "500%", data = 5},
			{description = "750%", data = 7.5},
			{description = "1000%", data = 10},
			{description = "Infinite", data = "Infinite"},
		},

		default = "Default",
	},

	{
		name = "STAFF_DURABILITY",
		label = "Tweak staffs uses",
		options = {
			{description = "25%", data = 0.25},
			{description = "50%", data = 0.5},
			{description = "75%", data = 0.75},
			{description = "Default", data = "Default"},
			{description = "200%", data = 2},
			{description = "300%", data = 3},
			{description = "400%", data = 4},
			{description = "500%", data = 5},
			{description = "750%", data = 7.5},
			{description = "1000%", data = 10},
			{description = "Infinite", data = "Infinite"},
		},

		default = "Default",
	},

	{
		name = "AMULET_DURABILITY",
		label = "Tweak amulets duration",
		options = {
			{description = "25%", data = 0.25},
			{description = "50%", data = 0.5},
			{description = "75%", data = 0.75},
			{description = "Default", data = "Default"},
			{description = "200%", data = 2},
			{description = "300%", data = 3},
			{description = "400%", data = 4},
			{description = "500%", data = 5},
			{description = "750%", data = 7.5},
			{description = "1000%", data = 10},
			{description = "Infinite", data = "Infinite"},
		},

		default = "Default",
	},

	{
		name = "TOOL_DURABILITY",
		label = "Tweak survival tools",
		hover = "Tools in general",
		options = {
			{description = "25%", data = 0.25},
			{description = "50%", data = 0.5},
			{description = "75%", data = 0.75},
			{description = "Default", data = "Default"},
			{description = "200%", data = 2},
			{description = "300%", data = 3},
			{description = "400%", data = 4},
			{description = "500%", data = 5},
			{description = "750%", data = 7.5},
			{description = "1000%", data = 10},
			{description = "Infinite", data = "Infinite"},
		},

		default = "Default",
	},

	{
		name = "SEWINGKIT_DURABILITY",
		label = "Tweak sewing kit",
		options = {
			{description = "25%", data = 0.25},
			{description = "50%", data = 0.5},
			{description = "75%", data = 0.75},
			{description = "Default", data = "Default"},
			{description = "200%", data = 2},
			{description = "300%", data = 3},
			{description = "400%", data = 4},
			{description = "500%", data = 5},
			{description = "750%", data = 7.5},
			{description = "1000%", data = 10},
			{description = "Infinite", data = "Infinite"},
		},

		default = "Default",
	},

	{
		name = "COMPASS_DURABILITY",
		label = "Tweak compass",
		options = {
			{description = "25%", data = 0.25},
			{description = "50%", data = 0.5},
			{description = "75%", data = 0.75},
			{description = "Default", data = "Default"},
			{description = "200%", data = 2},
			{description = "300%", data = 3},
			{description = "400%", data = 4},
			{description = "500%", data = 5},
			{description = "750%", data = 7.5},
			{description = "1000%", data = 10},
			{description = "Infinite", data = "Infinite"},
		},

		default = "Default",
	},

	{
		name = "PRIMARYTOOL_DURABILITY",
		label = "Tweak primary tools",
		hover = "Axe, pickaxe, shovel, hammer, pitchfork",
		options = {
			{description = "25%", data = 0.25},
			{description = "50%", data = 0.5},
			{description = "75%", data = 0.75},
			{description = "Default", data = "Default"},
			{description = "200%", data = 2},
			{description = "300%", data = 3},
			{description = "400%", data = 4},
			{description = "500%", data = 5},
			{description = "750%", data = 7.5},
			{description = "1000%", data = 10},
			{description = "Infinite", data = "Infinite"},
		},

		default = "Default",
	},

	{
		name = "GOLD_DURABILITY",
		label = "Tweak gold items",
		hover = "gold axe, gold pickaxe, gold shovel, weapons, armors",
		options = {
			{description = "25%", data = 0.25},
			{description = "50%", data = 0.5},
			{description = "75%", data = 0.75},
			{description = "Default", data = "Default"},
			{description = "200%", data = 2},
			{description = "300%", data = 3},
			{description = "400%", data = 4},
			{description = "500%", data = 5},
			{description = "750%", data = 7.5},
			{description = "1000%", data = 10},
			{description = "Infinite", data = "Infinite"},
		},

		default = "Default",
	},

	{
		name = "OBSIDIAN_DURABILITY",
		label = "Obsidian items durability",
		hover = "Obsidian axe, mahete, spear",
		options = {
			{description = "25%", data = 0.25},
			{description = "50%", data = 0.5},
			{description = "75%", data = 0.75},
			{description = "Default", data = "Default"},
			{description = "200%", data = 2},
			{description = "300%", data = 3},
			{description = "400%", data = 4},
			{description = "500%", data = 5},
			{description = "750%", data = 7.5},
			{description = "1000%", data = 10},
			{description = "Infinite", data = "Infinite"},
		},

		default = "Default",
	},

	{
		name = "BOOST_GOLD",
		label = "Boost gold tools",
		hover = "Weapon damage X 2, action required / 2",
		options = {
			{description = "No", data = false},
			{description = "Yes", data = true},
		},

		default = false,
	},

	{
		name = "BOOST_OBSIDIAN",
		label = "Boost obsidian tools(SW)",
		hover = "Weapon damage X 3, action required / 3",
		options = {
			{description = "No", data = false},
			{description = "Yes", data = true},
		},

		default = false,
	},

	{
		name = "TRAP_DURABILITY",
		label = "Traps durability",
		hover = "trap, bird trap, teeth trap",
		options = {
			{description = "25%", data = 0.25},
			{description = "50%", data = 0.5},
			{description = "75%", data = 0.75},
			{description = "Default", data = "Default"},
			{description = "200%", data = 2},
			{description = "300%", data = 3},
			{description = "400%", data = 4},
			{description = "500%", data = 5},
			{description = "750%", data = 7.5},
			{description = "1000%", data = 10},
			{description = "Infinite", data = "Infinite"},
		},

		default = "Default",
	},

	{
		name = "HEATROCK_DURABILITY",
		label = "Tweak heatrock",
		hover = "heatrock warming speed in summer and cool down speed in winter",
		options = {
			{description = "25%", data = 0.25},
			{description = "50%", data = 0.5},
			{description = "75%", data = 0.75},
			{description = "Default", data = "Default"},
			{description = "200%", data = 2},
			{description = "300%", data = 3},
			{description = "400%", data = 4},
			{description = "500%", data = 5},
			{description = "750%", data = 7.5},
			{description = "1000%", data = 10},
			{description = "Infinite", data = "Infinite"},
		},

		default = "Default",
	},

	{
		name = "CLOTHING_DURABILITY",
		label = "Tweak clothing decay",
		hover = "Include all cloths and hats",
		options = {
			{description = "25%", data = 0.25},
			{description = "50%", data = 0.5},
			{description = "75%", data = 0.75},
			{description = "Default", data = "Default"},
			{description = "200%", data = 2},
			{description = "300%", data = 3},
			{description = "400%", data = 4},
			{description = "500%", data = 5},
			{description = "750%", data = 7.5},
			{description = "1000%", data = 10},
			{description = "Infinite", data = "Infinite"},
		},

		default = "Default",
	},

		{
		name = "LIGHT_DURABILITY",
		label = "Tweak portable light",
		hover = "Lantern, lighter, miner's hat, nightlight, pumpkin lantern",
		options = {
			{description = "25%", data = 0.25},
			{description = "50%", data = 0.5},
			{description = "75%", data = 0.75},
			{description = "Default", data = "Default"},
			{description = "200%", data = 2},
			{description = "300%", data = 3},
			{description = "400%", data = 4},
			{description = "500%", data = 5},
			{description = "750%", data = 7.5},
			{description = "1000%", data = 10},
			{description = "Infinite", data = "Infinite"},
		},

		default = "Default",
	},

		{
		name = "TORCH_DURABILITY",
		label = "Torch life",
		options = {
			{description = "25%", data = 0.25},
			{description = "50%", data = 0.5},
			{description = "75%", data = 0.75},
			{description = "Default", data = "Default"},
			{description = "200%", data = 2},
			{description = "300%", data = 3},
			{description = "400%", data = 4},
			{description = "500%", data = 5},
			{description = "750%", data = 7.5},
			{description = "1000%", data = 10},
			{description = "Infinite", data = "Infinite"},
		},

		default = "Default",
	},

	{
		name = "TORCH_RADIUS",
		label = "Increase light radius of torch",
		hover = "From 2m to 5m",
		options = {
			{description = "Default", data = false},
			{description = "Increased", data = true},
		},

		default = false,
	},

		{
		name = "CAMPING_DURABILITY",
		label = "Tweak sleep items",
		hover = "bed roll, tent, siesta hut",
		options = {
			{description = "25%", data = 0.25},
			{description = "50%", data = 0.5},
			{description = "75%", data = 0.75},
			{description = "Default", data = "Default"},
			{description = "200%", data = 2},
			{description = "300%", data = 3},
			{description = "400%", data = 4},
			{description = "500%", data = 5},
			{description = "750%", data = 7.5},
			{description = "1000%", data = 10},
			{description = "Infinite", data = "Infinite"},
		},

		default = "Default",
	},

		{
		name = "BOOK_DURABILITY",
		label = "Book Durability",
		options = {
			{description = "25%", data = 0.25},
			{description = "50%", data = 0.5},
			{description = "75%", data = 0.75},
			{description = "Default", data = "Default"},
			{description = "200%", data = 2},
			{description = "300%", data = 3},
			{description = "400%", data = 4},
			{description = "500%", data = 5},
			{description = "750%", data = 7.5},
			{description = "1000%", data = 10},
			{description = "Infinite", data = "Infinite"},
		},

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
		options = {
			{description = "25%", data = 0.25},
			{description = "50%", data = 0.5},
			{description = "75%", data = 0.75},
			{description = "Default", data = "Default"},
			{description = "200%", data = 2},
			{description = "300%", data = 3},
			{description = "400%", data = 4},
			{description = "500%", data = 5},
			{description = "750%", data = 7.5},
			{description = "1000%", data = 10},
			{description = "Infinite", data = "Infinite"},
		},

		default = "Default",
	},
	{
		name = "BOATITEMS_DURABILITY",
		label = "Lantern, telescope & cannon(SW)",
		options = {
			{description = "25%", data = 0.25},
			{description = "50%", data = 0.5},
			{description = "75%", data = 0.75},
			{description = "Default", data = "Default"},
			{description = "200%", data = 2},
			{description = "300%", data = 3},
			{description = "400%", data = 4},
			{description = "500%", data = 5},
			{description = "750%", data = 7.5},
			{description = "1000%", data = 10},
			{description = "Infinite", data = "Infinite"},
		},

		default = "Default",
	},
	{
		name = "BOATREPAIRKIT_DURABILITY",
		label = "Boat repairkit durability(SW)",
		options = {
			{description = "25%", data = 0.25},
			{description = "50%", data = 0.5},
			{description = "75%", data = 0.75},
			{description = "Default", data = "Default"},
			{description = "200%", data = 2},
			{description = "300%", data = 3},
			{description = "400%", data = 4},
			{description = "500%", data = 5},
			{description = "750%", data = 7.5},
			{description = "1000%", data = 10},
			{description = "Infinite", data = "Infinite"},
		},

		default = "Default",
	},

}
