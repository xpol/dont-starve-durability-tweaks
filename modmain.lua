local TUNING = GLOBAL.TUNING
local ACTIONS = GLOBAL.ACTIONS
local require = GLOBAL.require
local math = GLOBAL.math
local DST = GLOBAL.TheSim.GetGameID ~= nil and GLOBAL.TheSim:GetGameID() == "DST"

local BOOMERANG_SPEED = GetModConfigData("BOOMERANG_SPEED")
local HEATROCK_DURABILITY = GetModConfigData("HEATROCK_DURABILITY")
local TORCH_RADIUS = GetModConfigData("TORCH_RADIUS")
local ICEBOX_TUNING = GetModConfigData("ICEBOX_TUNING")

-- Usage IsSeason(value)
-- Where value can be one of: "autumn", "winter", "spring", "summer", "mild", "wet", "green", "dry", "temperate", "humid", "lush"
local function IsSeason(value)
	local season = DST and GLOBAL.TheWorld.state.season or GLOBAL.GetSeasonManager():GetSeason()
	return season == value
end

-- Remove % on itemslot for infinte items

local ItemTile = require "widgets/itemtile"
local ItemTile_SetPercent = ItemTile.SetPercent
function ItemTile:SetPercent(percent)
	if not self.item.components.inventoryitem or not self.item:HasTag("Infinite") then
		ItemTile_SetPercent(self, percent)
	end
end

local GOLD_TOOLS = {
	{
		prefab = "goldenaxe",
		damage = "AXE_DAMAGE",
		action = "CHOP",
	},
	{
		prefab = "goldenpickaxe",
		action = "MINE",
		damage = "PICK_DAMAGE",

	},
	{
		prefab = "goldenmachete",
		action = "HACK",
		damage = "MACHETE_DAMAGE",
	}
}

local OBSIDIAN_TOOLS = {
	{
		prefab = "obsidianaxe",
		action = "CHOP",
		damage = "AXE_DAMAGE",
	},
	{
		prefab = "obsidianmachete",
		action = "HACK",
		damage = "MACHETE_DAMAGE",
	},
	{
		prefab = "spear_obsidian",
		damage = "SPEAR_DAMAGE",
	},
}


local function BoostAction(items, time)
	for _, item in ipairs(items) do
		if item.action then
			AddPrefabPostInit(item.prefab, function(inst)
				inst.components.tool:SetAction(ACTIONS[item.action], time)
			end)
		end
	end
end

local function BoostDamage(items, time)
	for _, item in ipairs(items) do
		if item.damage then
			AddPrefabPostInit(item.prefab, function(inst)
				inst.components.weapon:SetDamage(TUNING[item.damage] * time)
			end)
		end
	end
end

if GetModConfigData("BOOST_GOLD_ACTION") then BoostAction(GOLD_TOOLS, 2) end
if GetModConfigData("BOOST_GOLD_DAMAGE") then BoostDamage(GOLD_TOOLS, 2) end
if GetModConfigData("BOOST_OBSIDIAN_ACTION") then BoostAction(OBSIDIAN_TOOLS, 3) end
if GetModConfigData("BOOST_OBSIDIAN_DAMAGE") then BoostDamage(OBSIDIAN_TOOLS, 3) end

-- Increase boomerang speed

if BOOMERANG_SPEED ~= 10 then
	AddPrefabPostInit("boomerang", function(inst)
		inst.components.projectile:SetSpeed(BOOMERANG_SPEED)
	end)
end

-- Increase torch light radius

if TORCH_RADIUS then
	AddPrefabPostInit("torchfire", function(inst)
		if inst and inst.Light then
			inst.Light:SetRadius(5) --Default: 2 (meters)
		end
	end)
end


if ICEBOX_TUNING ~= "Default" then
	TUNING.PERISH_FRIDGE_MULT = ICEBOX_TUNING
end


if HEATROCK_DURABILITY ~= "Default" then
	if HEATROCK_DURABILITY == "Infinite" then
		AddPrefabPostInit("heatrock", function(inst)
			if inst.components.temperature then
				inst.components.temperature:SetTemperature(19) -- always at 19 dgree
				inst.components.temperature.DoDelta = function() end
			end
		end)
	else
		AddPrefabPostInit("heatrock", function(inst)
			if inst.components.temperature then
				local DoDelta = inst.components.temperature.DoDelta
				inst.components.temperature.DoDelta = function(self, delta, ...)
					if (IsSeason("winter") and delta < 0)
					or (IsSeason("summer") and delta > 0) then
						DoDelta(self, delta/HEATROCK_DURABILITY, ...)
						return
					end
					DoDelta(self, delta/HEATROCK_DURABILITY, ...)
				end
			end
		end)
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

local function RemoveDurability(inst)
	inst:AddTag("Infinite")

	if inst.components.finiteuses then
		inst.components.finiteuses.Use = DoNothing
	end

	if inst.components.perishable then
		inst.components.perishable.StartPerishing = DoNothing
	end

	if inst.components.fueled then
		inst.components.fueled.StartConsuming = DoNothing
		inst.components.fueled.DoDelta = DoNothing
	end
	if inst.components.armor then
		inst.components.armor.SetCondition = DoNothing
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

		-- Mod: Mining Machine [DST]:
		"wrench",
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
		-- Mod: Fishbrella DST
		"fishbrella",

		-- Mod: DST Survival Gear:
		"cave_armor",
	},
	LIGHT_DURABILITY = {
		"lantern",
		"lighter",
		"minerhat",
		"nightlight",
		"pumpkin_lantern",
        "molehat",
	},
	TORCH_DURABILITY = {
		"torch"
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
	BOAT_DURABILITY = {
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
	},
	BOATITEMS_DURABILITY = {
		"boatcannon",
		"boat_lantern",
		"telescope",
		"supertelescope",
		"harpoon",
	},
	BOATREPAIRKIT_DURABILITY = {
		"boatrepairkit"
	},
	OBSIDIAN_DURABILITY = {
		"obsidianmachete",
		"obsidianaxe",
		"spear_obsidian"
	},
}

for option, prefabs in pairs(DURABILITIES) do
	Tweak(prefabs, GetModConfigData(option))
end
