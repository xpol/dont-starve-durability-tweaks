local require = GLOBAL.require
local math = GLOBAL.math
local DST = GLOBAL.TheSim.GetGameID ~= nil and GLOBAL.TheSim:GetGameID() == "DST"

-- Hide percentage for Dont Starve/Reign of Giants/Shipwrecked.
if not DST then
	local ItemTile = require "widgets/itemtile"
	local ItemTile_SetPercent = ItemTile.SetPercent
	function ItemTile:SetPercent(percent)
		if not self.item.components.inventoryitem or not self.item:HasTag("Infinite") then
			ItemTile_SetPercent(self, percent)
		end
	end
end


local function TuningDurability(inst, factor)
	local function tune(component, ...)
		if component then
			local fields, original = {...}, component.original
			if not original then
				original = {}
				for _, field in ipairs(fields) do
					original[field] = component[field]
				end
				component.original = original
			end

			for _, field in ipairs(fields) do
				if original[field] and component[field] then
					component[field] = math.max(component[field], original[field] * factor)
				end
			end
		end
	end

	tune(inst.components.finiteuses, 'total', 'current')
	tune(inst.components.perishable, 'perishtime', 'perishremainingtime')
	tune(inst.components.fueled, 'maxfuel', 'currentfuel', 'bonusmult')
	tune(inst.components.armor, 'maxcondition', 'condition')
end

local function DoNothing() end
local function FullPerishablePercent(self) return 1 end

local function RemoveDurability(inst)
	inst:AddTag("Infinite")
	-- To hide percentage on Dont Starve Together we set of the `hide_percentage` tag.
	if DST then inst:AddTag("hide_percentage") end

	local finiteuses = inst.components.finiteuses
	if finiteuses then
		finiteuses.Use = DoNothing
	end

	local perishable = inst.components.perishable
	if perishable then
		perishable.StartPerishing = DoNothing
		local SetPercent = perishable.SetPercent
		perishable.SetPercent = function(self, percent)
			SetPercent(self, 1)
		end

		perishable.GetPercent = FullPerishablePercent
	end

	local fueled = inst.components.fueled
	if fueled then
		fueled.StartConsuming = DoNothing
		fueled.DoDelta = DoNothing
	end

	local armor = inst.components.armor
	if armor then
		armor.SetCondition = DoNothing
	end
end

local function Tweak(prefabs, option)
	if option == "Default" then return end
	local function TweakNumberOption(inst)
		TuningDurability(inst, option)
	end
	local tweakfn = option == "Infinite" and RemoveDurability or TweakNumberOption
	local processed = {}
	for _, prefab in ipairs(prefabs) do
		if not processed[prefab] then
			AddPrefabPostInit(prefab, tweakfn)
			processed[prefab] = true
		end
	end
end

local DURABILITIES = {
	WEAPON_DURABILITY = {
		"batbat",
		"boomerang",
		"hambat",
		"ruins_bat",
		"spear",
		"tentaclespike",
		"spear_wathgrithr",
		"whip",
		
		--DST
		"glasscutter",

		-- DLC: Shipwrecked:
		"trident",
		"spear_poison",
		"spear_obsidian",
		"peg_leg",

		-- Mod: Madman's Fighting Pack:
		"houndsbite",

		-- Mod: Ethereal spear:
		"ethrl_spear",

		-- Mod: Machete:
		"machete",

		-- Mod: Basic Wooden Club:
		"wooden_club",

		-- Mod: Knife:
		"knife",

		-- Mod: Fight Stick:
		"fightstick",

		-- Mod: Scythe:
		"scythe",

		-- Mod: DST Survival Gear::
		"punisher", "punisher_2",

		-- Mod: Golden Spear:
		"goldenspear",

		-- Mod: Twicane:
		"twicane",
	},
	PROJECTILE_DURABILITY = {
		"boomerang",
	},
	SWORD_DURABILITY = {
		"nightsword",

		-- Mod: Madman's Fighting Pack
		"goldsword", "nightsword", "strongsword", "marbleblade", "iceblade",

		-- Mod: Gold Survival Kit:
		"sword_gold",

		-- Mod: Swordfish DST:
		"fishsword",

		-- Mod: Sword:
		"sword",

		-- Mod: Claymore
		"claymore_gray",

		-- Mod: linksword:
		"linksword",

		-- Mod: Adventure Time Items:
		"adventure_sword", "demon_sword", "finn_sword", "axe_brass",

		-- Mod: ZoRcE's Sword MOD:
		"goldsword",  "stonesword",
	},
	ARMOR_DURABILITY = {

		"armor_sanity",
		"armordragonfly",
		"armorgrass",
		"armormarble",
		"armorruins",
		"armorsnurtleshell",
		"armorwood",
		"beehat",
		"footballhat",
		"ruinshat",
		"slurtlehat",

		-- DST
		"hivehat",
		"armorskeleton",
		"skeletonhat",

		--
		"wathgrithrhat",

		-- DLC: Shipwrecked:
		"armorlimestone",
		"armorseashell",
		"armorobsidian",

		-- Mod:  Madman's Fighting Pack:
		"goldarmor", "goldhelm",

		-- Mod: Gold Survival Kit:
		"armor_gold", "hat_gold",

		--Mod: Fish Armor DST:
		"armor_my",

		-- Mod: Fishbrella DST:
		"fishbrella",

		-- Mod: Adventure Time Items:
		"ik_crown", "pb_crown",
	},
	STAFF_DURABILITY = {
		"firestaff",
		"greenstaff",
		"icestaff",
		"orangestaff",
		"telestaff",
		"yellowstaff",
		"nightstick",
		"opalstaff",
		"staff_tornado",
	},
	AMULET_DURABILITY = {
		"amulet",
		"blueamulet",
		"greenamulet",
		"yellowamulet",
		"purpleamulet",
		"orangeamulet",
	},
	TOOL_DURABILITY = {
		"bell",
		"bugnet",
		"featherfan",
		"tropicalfan",
		"fertilizer",
		"firesuppressor",
		"fishingrod",
		"horn",
		"panflute",
		-- DST
		"brush",


		-- Mod: Mining Machine [DST]:
		"wrench",
	},
	SADDLE_DURABILITY = {
		"pocket_scale",
		"saddle_basic",
		"saddle_war",
		"saddle_race",
		"saddlehorn",
	},
	SEWINGKIT_DURABILITY = {
		"sewing_kit",
	},
	COMPASS_DURABILITY = {
		"compass",
	},
	PRIMARYTOOL_DURABILITY = {
		"axe",
		"pickaxe",
		"shovel",
		"hammer",
		"pitchfork",
		"multitool_axe_pickaxe",
		"machete",

		-- DST
		"minfan",
		"moonglassaxe",

		-- Mod: Scythe:
		"Scythe"
	},
	GOLD_DURABILITY = {
		"goldenaxe",
		"goldenpickaxe",
		"goldenshovel",

		-- DLC: Shipwrecked
		"goldenmachete",

		-- Mod: Madman's Fighting Pack:
		"goldsword", "goldarmor", "goldhelm",

		-- Mod: Gold Survival Kit:
		"armor_gold","hat_gold",

		-- Mmod: Gold Hammer
		"goldhammer",
	},
	TRAP_DURABILITY = {
		"birdtrap",
		"trap",
		"trap_teeth",

		-- DLC: Shipwrecked
		"seatrap",
	},
	CLOTHING_DURABILITY = {
		"armorslurper",
		"beargervest",
		"beefalohat",
		"catcoonhat",
		"earmuffshat",
		"eyebrellahat",
		"featherhat",
		"flowerhat",
		"grass_umbrella",
		"hawaiianshirt",
		"icehat",
		"onemanband",
		"raincoat",
		"rainhat",
		"reflectivevest",
		"spiderhat",
		"strawhat",
		"sweatervest",
		"tophat",
		"trunkvest_summer",
		"trunkvest_winter",
		"umbrella",
		"walrushat",
		"watermelonhat",
		"winterhat",
		"armor_snakeskin",
		"armor_windbreaker",
		"captainhat",
		"snakeskinhat",
		"piratehat",
		"wornpiratehat",
		"gashat",
		"aerodynamichat",
		"shark_teethhat",
		"brainjellyhat",
		"grass_umbrella",
		"palmleaf_umbrella",
		"double_umbrellahat",
		"cookiecutterhat",
		-- Mod: Fishbrella DST
		"fishbrella",

		-- Mod: DST Survival Gear:
		"cave_armor",
	},
	LIGHT_DURABILITY = {
		"torch",
		"lantern",
		"lighter",
		"minerhat",
		"nightlight",
		"pumpkin_lantern",
		"molehat",
		"thurible",
	},
	FUELS_DURABILITY = {
		"lightbulb",
		"wormlight",
		"wormlight_lesser",
		"spore_tall",
		"spore_medium",
		"spore_small",
	},
	CAMPING_DURABILITY = {
		"bedroll_furry",
		"siestahut",
		"tent",
	},
	BOOK_DURABILITY = {
		"book_birds",
		"book_brimstone",
		"book_gardening",
		"book_sleep",
		"book_tentacles",
	},
	NAUTICAL_DURABILITY = { -- SW only
		"sail",
		"clothsail",
		"snakeskinsail",
		"feathersail",
		"rowboat",
		"raft",
		"lograft",
		"surfboard",
		"cargoboat",
		"armouredboat",
		"boatrepairkit"
	},
	SEAFARING_DURABILITY = { -- DST only
		"boatcannon",
		"boat_lantern",
		"telescope",
		"supertelescope",
		"harpoon",
		"oar", -- 船桨
		"oar_driftwood", -- 船桨
	},
	OBSIDIAN_DURABILITY = {
		"obsidianmachete",
		"obsidianaxe",
		"spear_obsidian"
	},
	HEATROCK_DURABILITY = {
		"heatrock"
	}
}

for option, prefabs in pairs(DURABILITIES) do
	Tweak(prefabs, GetModConfigData(option))
end
