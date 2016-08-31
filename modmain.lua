local TUNING = GLOBAL.TUNING
local ACTIONS = GLOBAL.ACTIONS
local require = GLOBAL.require

local WEAPON_DURABILITY = GetModConfigData("WEAPON_DURABILITY")
local PROJECTILE_DURABILITY = GetModConfigData("PROJECTILE_DURABILITY")
local BOOMERANG_SPEED = GetModConfigData("BOOMERANG_SPEED")
local SWORD_DURABILITY = GetModConfigData("SWORD_DURABILITY")
local ARMOR_DURABILITY = GetModConfigData("ARMOR_DURABILITY")
local STAFF_DURABILITY = GetModConfigData("STAFF_DURABILITY")
local AMULET_DURABILITY = GetModConfigData("AMULET_DURABILITY")
local TOOL_DURABILITY = GetModConfigData("TOOL_DURABILITY")
local SEWINGKIT_DURABILITY = GetModConfigData("SEWINGKIT_DURABILITY")
local COMPASS_DURABILITY = GetModConfigData("COMPASS_DURABILITY")
local PRIMARYTOOL_DURABILITY = GetModConfigData("PRIMARYTOOL_DURABILITY")
local GOLD_DURABILITY = GetModConfigData("GOLD_DURABILITY")
local OBSIDIAN_DURABILITY = GetModConfigData("OBSIDIAN_DURABILITY")
local BOOST_GOLD = GetModConfigData("BOOST_GOLD")
local BOOST_OBSIDIAN = GetModConfigData("BOOST_OBSIDIAN")
local TRAP_DURABILITY = GetModConfigData("TRAP_DURABILITY")
local HEATROCK_DURABILITY = GetModConfigData("HEATROCK_DURABILITY")
local CLOTHING_DURABILITY = GetModConfigData("CLOTHING_DURABILITY")
local LIGHT_DURABILITY = GetModConfigData("LIGHT_DURABILITY")
local TORCH_DURABILITY = GetModConfigData("TORCH_DURABILITY")
local TORCH_RADIUS = GetModConfigData("TORCH_RADIUS")
local CAMPING_DURABILITY = GetModConfigData("CAMPING_DURABILITY")
local BOOK_DURABILITY = GetModConfigData("BOOK_DURABILITY")
local ICEBOX_TUNING = GetModConfigData("ICEBOX_TUNING")
local BOAT_DURABILITY = GetModConfigData("BOAT_DURABILITY")
local BOATITEMS_DURABILITY = GetModConfigData("BOATITEMS_DURABILITY")
local BOATREPAIRKIT_DURABILITY = GetModConfigData("BOATREPAIRKIT_DURABILITY")

local function IsModEnabled(name)
	return GLOBAL.KnownModIndex:IsModEnabled(GLOBAL.KnownModIndex:GetModActualName(name))
end

local mods = {
	["Madman's Fighting Pack"] = {
		armors = {
			"goldarmor",
			"goldhelm",
		},
		swords = {
			"goldsword",
			"nightsword",
			"strongsword",
			"marbleblade",
			"iceblade",
		},
		weapons = {
			"houndsbite",
		},
	},
	["Ethereal spear"] = {
		weapons = {"ethrl_spear"}
	},
	["Gold Hammer"] = {
		weapons = {"goldhammer"}
	},
}

local function appendIf(cond, list, ...)
    if not cond then return end
    for _, value in {...} do
        list[#list+1] = value
    end
end

local weapons = {
    appendIf = appendIf,
    "batbat",
    "boomerang",
    "hambat",
    "ruins_bat",
    "spear",
    "tentaclespike",
    "spear_wathgrithr",

    --Shipwrecked
    "trident",
    "spear_poison",
    "spear_obsidian",
    "peg_leg",
}



local MadMan = IsModEnabled("Madman's Fighting Pack")
local GoldKit = IsModEnabled("Infinite things [DS-RoG-Sw]")
local EtherealSpear = IsModEnabled("Ethereal spear")
local GoldHammer = IsModEnabled("Gold Hammer")
local Scythe = IsModEnabled("Scythe")
local FishArmor = IsModEnabled("Fish Armor DST")
local FishHat = IsModEnabled("Fishbrella DST")
local FishSword = IsModEnabled("Swordfish DST")
local MineMachine = IsModEnabled("Mining Machine [DST]")
local Machete = IsModEnabled("Machete")
local WoodClub = IsModEnabled("Basic Wooden Club")
local Knife = IsModEnabled("Knife")
local Sword = IsModEnabled("Sword")
local FightStick = IsModEnabled("Fight Stick")
local SpiderBlade = IsModEnabled("Spider Blade DST")
local Claymore = IsModEnabled("Claymore")
local EndoTorch = IsModEnabled("Endothermic Torch")
local LinkSword = IsModEnabled("linksword")
local AdventureItems = IsModEnabled("Adventure Time Items")
local SurvivalGear = IsModEnabled("DST Survival Gear")
local Zorce = IsModEnabled("ZoRcE's Sword MOD")
local GoldSpear = IsModEnabled("Golden Spear")
local Twicane = IsModEnabled("Twicane")



local function AddInfiniteTag(inst)
	inst:AddTag('Infinite')
end

-- Remove % on itemslot for infinte items

local ItemTile = require "widgets/itemtile"
local ItemTile_SetPercent = ItemTile.SetPercent
function ItemTile:SetPercent(percent)
	if not self.item.components.inventoryitem or not self.item:HasTag("Infinite") then
		ItemTile_SetPercent(self, percent)
	end
end

-- Boost gold axe, pickaxe, machete

if BOOST_GOLD then
	AddPrefabPostInit("goldenaxe", function(inst)
		inst.components.weapon:SetDamage(TUNING.AXE_DAMAGE*2)
		inst.components.tool:SetAction(ACTIONS.CHOP, 2)
	end)
	AddPrefabPostInit("goldenpickaxe", function(inst)
		inst.components.weapon:SetDamage(TUNING.PICK_DAMAGE*2)
		inst.components.tool:SetAction(ACTIONS.MINE, 2)
	end)
	AddPrefabPostInit("goldenmachete", function(inst)
		inst.components.weapon:SetDamage(TUNING.MACHETE_DAMAGE*2)
		inst.components.tool:SetAction(ACTIONS.HACK, 2)
	end)
end

if BOOST_OBSIDIAN then
	AddPrefabPostInit("obsidianaxe", function(inst)
		inst.components.weapon:SetDamage(TUNING.AXE_DAMAGE*3)
		inst.components.tool:SetAction(ACTIONS.CHOP, 3)
	end)
	AddPrefabPostInit("obsidianmachete", function(inst)
		inst.components.weapon:SetDamage(TUNING.MACHETE_DAMAGE*3)
		inst.components.tool:SetAction(ACTIONS.HACK, 3)
	end)
	AddPrefabPostInit("spear_obsidian", function(inst)
		inst.components.weapon:SetDamage(TUNING.SPEAR_DAMAGE*3)
	end)
end

-- Increase boomerang speed

if BOOMERANG_SPEED ~= "10" then
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

local function RemoveDurability(inst)
	inst:AddTag("Infinite")
	-- Set the 'finiteuses.Use' function to a blank function.
	if inst.components.finiteuses then
		inst.components.finiteuses.Use = function () end
	end
	-- Set the 'perishable.StartPerishing' function to a blank function.
	if inst.components.perishable then
		inst.components.perishable.StartPerishing = function () end
	end
	-- Set the 'fueled.StartConsuming' function to a blank function.
	if inst.components.fueled then
		inst.components.fueled.StartConsuming = function () end
	end
end

local function TweakWeapon(inst)
	local finiteuses = inst.components.finiteuses
	if finiteuses and not finiteuses.tweaked then
		finiteuses.total = (finiteuses.total * WEAPON_DURABILITY)
		finiteuses.current = (finiteuses.current * WEAPON_DURABILITY)
		finiteuses.tweaked = true
	end
	local perishable = inst.components.perishable
	if perishable and not perishable.tweaked then
		perishable.perishtime = (perishable.perishtime * WEAPON_DURABILITY)
		perishable.perishremainingtime = (perishable.perishremainingtime * WEAPON_DURABILITY)
		perishable.tweaked = true
	end
end

local function WeaponDurability()
	if WEAPON_DURABILITY == "Default" then return end

	local tweakfn = WEAPON_DURABILITY == "Infinite" and RemoveDurability or TweakWeapon
	local weapons = {
		"batbat",
		"boomerang",
		"hambat",
		"ruins_bat",
		"spear",
		"tentaclespike",
		"spear_wathgrithr",
		"trident",
		"spear_poison",
		"spear_obsidian",
		"peg_leg",
	}
	appendIf(MadMan, weapons, "houndsbite")
	appendIf(EtherealSpear, weapons, "ethrl_spear")
	appendIf(Machete, weapons, "machete")
	appendIf(WoodClub, weapons, "wooden_club")
	appendIf(Knife, weapons, "knife")
	appendIf(FightStick, weapons, "fightstick")
	appendIf(SpiderBlade, weapons, "scythe")
	appendIf(SurvivalGear, weapons, "punisher", "punisher_2")
	appendIf(GoldSpear, weapons, "goldenspear")
	appendIf(Twicane, weapons, "twicane")

	for _, prefab in ipairs(weapons) do
		AddPrefabPostInit(prefab, tweakfn)
	end
end

-- Tweak the durability of projectile weapons (Bow of archery mod already have infinitizer included)
local function TweakProjectile(inst)
	if inst.components.finiteuses then
		inst.components.finiteuses.total = (inst.components.finiteuses.total * PROJECTILE_DURABILITY)
		inst.components.finiteuses.current = (inst.components.finiteuses.current * PROJECTILE_DURABILITY)
	end
	if inst.components.perishable then
		inst.components.perishable.perishtime = (inst.components.perishable.perishtime * PROJECTILE_DURABILITY)
		inst.components.perishable.perishremainingtime = (inst.components.perishable.perishremainingtime * PROJECTILE_DURABILITY)
	end
end

local function ProjectileDurability()
	if PROJECTILE_DURABILITY == "Default" then return end
	AddPrefabPostInit("boomerang", PROJECTILE_DURABILITY == "Infinite" and RemoveDurability or TweakProjectile)
end

local function TweakSword(inst)
	local finiteuses = inst.components.finiteuses
	if finiteuses and not finiteuses.tweaked then
		finiteuses.total = (finiteuses.total * SWORD_DURABILITY)
		finiteuses.current = (finiteuses.current * SWORD_DURABILITY)
		finiteuses.tweaked = true
	end
	local perishable = inst.components.perishable
	if perishable and not perishable.tweaked then
		perishable.perishtime = (perishable.perishtime * SWORD_DURABILITY)
		perishable.perishremainingtime = (perishable.perishremainingtime * SWORD_DURABILITY)
		perishable.tweaked = true
	end
end

local function SwordDurability()
	if SWORD_DURABILITY == "Default" then return end
	local swords = { "nightsword" }
	appendIf(MadMan, swords, "goldsword", "nightsword", "strongsword", "marbleblade", "iceblade")
	appendIf(GoldKit, swords, "sword_gold")
	appendIf(FishSword, swords, "fishsword")
	appendIf(Sword, swords, "sword")
	appendIf(Claymore, swords, "claymore_gray")
	appendIf(LinkSword, swords, "linksword")
	appendIf(AdventureItems, swords, "adventure_sword", "demon_sword", "finn_sword", "axe_brass")
	appendIf(Zorce, swords, "goldsword",  "stonesword")

	local tweakfn = SWORD_DURABILITY == "Infinite" and RemoveDurability or TweakSword
	for _, prefab in ipairs(swords) do
		AddPrefabPostInit(prefab, tweakfn)
	end
end


local function TweakArmorDurability(inst)
	inst.components.armor.condition = (inst.components.armor.condition * ARMOR_DURABILITY)
	inst.components.armor.maxcondition = (inst.components.armor.maxcondition * ARMOR_DURABILITY)
end

local function InfiniteArmor()
	AddComponentPostInit("armor", function(self)
		local Armor = require "components/armor"
		function Armor:TakeDamage(damage_amount, attacker, weapon)
			if self:CanResist(attacker, weapon) then
				local leftover = damage_amount

				local max_absorbed = damage_amount * self.absorb_percent;
				local absorbed = math.floor(math.min(max_absorbed, self.condition))
				leftover = damage_amount - absorbed
				--ProfileStatsAdd("armor_absorb", absorbed)

				if METRICS_ENABLED then
					FightStat_Absorb(absorbed)
				end
				--self:SetCondition(self.condition - absorbed)
				self:SetCondition(self.condition)
				if self.ontakedamage then
					self.ontakedamage(self.inst, damage_amount, absorbed, leftover)
				end

				if self.absorb_percent >= 1 then
					return 0
				end

				return leftover
			else
				return damage_amount
			end
		end
	end)
end

local function ArmorDurability()
	if ARMOR_DURABILITY == "Default" then return end
	local armors = {
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
		--Shipwrecked
		"armorlimestone",
		"armorseashell",
		"armorobsidian",
	}
	appendIf(MadMan, armors, "goldarmor", "goldhelm")
	appendIf(GoldKit, armors, "armor_gold", "hat_gold")
	appendIf(FishArmor, armors, "armor_my")
	appendIf(FishHat, armors, "fishbrella")
	appendIf(AdventureItems, armors, "ik_crown", "pb_crown")

	local tweakfn = ARMOR_DURABILITY == "Infinite" and AddInfiniteTag or TweakArmorDurability
	for _, prefab in ipairs(armors) do
		AddPrefabPostInit(prefab, tweakfn)
	end

end

-- Tweak the durability of all staffs
local function TweakStaff(inst)
	if inst.components.finiteuses then
		inst.components.finiteuses.total = (inst.components.finiteuses.total * STAFF_DURABILITY)
		inst.components.finiteuses.current = (inst.components.finiteuses.current * STAFF_DURABILITY)
	end
	if inst.components.perishable then
		inst.components.perishable.perishtime = (inst.components.perishable.perishtime * STAFF_DURABILITY)
		inst.components.perishable.perishremainingtime = (inst.components.perishable.perishremainingtime * STAFF_DURABILITY)
	end
end

local function StaffDurability()
	if STAFF_DURABILITY == "Default" then return end
	local staffs = {
		"firestaff",
		"greenstaff",
		"icestaff",
		"orangestaff",
		"telestaff",
		"yellowstaff",
	}
	local tweakfn = STAFF_DURABILITY == "Infinite" and RemoveDurability or TweakStaff
	for _, prefab in ipairs(staffs) do
		AddPrefabPostInit(prefab, tweakfn)
	end
end

local function TweakAmulet(inst)
	if inst.components.finiteuses then
		inst.components.finiteuses.total = (inst.components.finiteuses.total * AMULET_DURABILITY)
		inst.components.finiteuses.current = (inst.components.finiteuses.current * AMULET_DURABILITY)
	end
	if inst.components.perishable then
		inst.components.perishable.perishtime = (inst.components.perishable.perishtime * AMULET_DURABILITY)
		inst.components.perishable.perishremainingtime = (inst.components.perishable.perishremainingtime * AMULET_DURABILITY)
	end
end

local function AmuletDurability()
	if AMULET_DURABILITY == "Default" then return end
	local amulets = {
		"amulet",
		"blueamulet",
		"greenamulet",
		"yellowamulet",
		"purpleamulet",
		"orangeamulet",
	}
	local tweakfn = AMULET_DURABILITY == "Infinite" and RemoveDurability or TweakAmulet
	for _, prefab in ipairs(amulets) do
		AddPrefabPostInit(prefab, tweakfn)
	end
end

local function TweakTool(inst)
	if inst.components.finiteuses then
		inst.components.finiteuses.total = (inst.components.finiteuses.total * TOOL_DURABILITY)
		inst.components.finiteuses.current = (inst.components.finiteuses.current * TOOL_DURABILITY)
	end
	if inst.components.perishable then
		inst.components.perishable.perishtime = (inst.components.perishable.perishtime * TOOL_DURABILITY)
		inst.components.perishable.perishremainingtime = (inst.components.perishable.perishremainingtime * TOOL_DURABILITY)
	end
end

local function ToolDurability()
	if TOOL_DURABILITY == "Default" then return end
	local tools = {
		"bell",
		"bugnet",
		"featherfan",
		"tropicalfan",
		"fertilizer",
		"firesuppressor",
		"fishingrod",
		"horn",
		"panflute",
	}
	appendIf(MineMachine, "wrench")

	local tweakfn = TOOL_DURABILITY == "Infinite" and RemoveDurability or TweakTool
	for _, prefab in ipairs(tools) do
		AddPrefabPostInit(prefab, tweakfn)
	end
end

local function TweakSewingKit(inst)
	if inst.components.finiteuses then
		inst.components.finiteuses.total = (inst.components.finiteuses.total * SEWINGKIT_DURABILITY)
		inst.components.finiteuses.current = (inst.components.finiteuses.current * SEWINGKIT_DURABILITY)
	end
	if inst.components.perishable then
		inst.components.perishable.perishtime = (inst.components.perishable.perishtime * SEWINGKIT_DURABILITY)
		inst.components.perishable.perishremainingtime = (inst.components.perishable.perishremainingtime * SEWINGKIT_DURABILITY)
	end
end

local function SewingkitDurability()
	if SEWINGKIT_DURABILITY == "Default" then return end
	local tweakfn = SEWINGKIT_DURABILITY == "Infinite" and RemoveDurability or TweakSewingKit
	AddPrefabPostInit("sewing_kit", tweakfn)
end

local function TweakCompass(inst)
	if inst.components.finiteuses then
		inst.components.finiteuses.total = (inst.components.finiteuses.total * COMPASS_DURABILITY)
		inst.components.finiteuses.current = (inst.components.finiteuses.current * COMPASS_DURABILITY)
	end
	if inst.components.perishable then
		inst.components.perishable.perishtime = (inst.components.perishable.perishtime * COMPASS_DURABILITY)
		inst.components.perishable.perishremainingtime = (inst.components.perishable.perishremainingtime * COMPASS_DURABILITY)
	end
	if inst.components.fueled then
		inst.components.fueled.maxfuel = (inst.components.fueled.maxfuel * COMPASS_DURABILITY)
		inst.components.fueled.currentfuel = (inst.components.fueled.currentfuel * COMPASS_DURABILITY)
		inst.components.fueled.bonusmult = (inst.components.fueled.bonusmult * COMPASS_DURABILITY)
	end
end

local function CompassDurability()
	if COMPASS_DURABILITY == "Default" then return end
	AddPrefabPostInit("compass", COMPASS_DURABILITY == "Infinite" and RemoveDurability or TweakCompass)
end

local function TweakPrimaryTools(inst)
	if inst.components.finiteuses then
		inst.components.finiteuses.total = (inst.components.finiteuses.total * PRIMARYTOOL_DURABILITY)
		inst.components.finiteuses.current = (inst.components.finiteuses.current * PRIMARYTOOL_DURABILITY)
	end
	if inst.components.perishable then
		inst.components.perishable.perishtime = (inst.components.perishable.perishtime * PRIMARYTOOL_DURABILITY)
		inst.components.perishable.perishremainingtime = (inst.components.perishable.perishremainingtime * PRIMARYTOOL_DURABILITY)
	end
	if inst.components.fueled then
		inst.components.fueled.maxfuel = (inst.components.fueled.maxfuel * PRIMARYTOOL_DURABILITY)
		inst.components.fueled.currentfuel = (inst.components.fueled.currentfuel * PRIMARYTOOL_DURABILITY)
		inst.components.fueled.bonusmult = (inst.components.fueled.bonusmult * PRIMARYTOOL_DURABILITY)
	end
end

local function PrimaryToolDurability()
	if PRIMARYTOOL_DURABILITY == "Default" then return end
	local tools = {
		"axe",
		"pickaxe",
		"shovel",
		"hammer",
		"pitchfork",
		"multitool_axe_pickaxe",
		"machete",
	}
	if Scythe then tools[#tools+1] = "Scythe" end


	local postinit = PRIMARYTOOL_DURABILITY == "Infinite" and RemoveDurability or TweakPrimaryTools
	for _, prefab in ipairs(tools) do
		AddPrefabPostInit(prefab, postinit)
	end
end

local function GoldDurability()
	if GOLD_DURABILITY == "Default" then return end
	local armors = {
		"goldenaxe",
		"goldenpickaxe",
		"goldenshovel",
		"goldenmachete",
	}
	appendIf(MadMan, armors, "goldsword", "goldarmor", "goldhelm")

	if GOLD_DURABILITY == "Infinite" then

			AddComponentPostInit("armor", function(self, inst)
				local Armor = require "components/armor"
				--local old = Armor.TakeDamage
				function Armor:TakeDamage(damage_amount, attacker, weapon)
					if self:CanResist(attacker, weapon) then
						local leftover = damage_amount
						local Golden = {
						goldarmor = true,
						goldhelm = true,
						armor_gold = true,
						hat_gold = true
						}
						local max_absorbed = damage_amount * self.absorb_percent;
						local absorbed = math.floor(math.min(max_absorbed, self.condition))
						leftover = damage_amount - absorbed
						--ProfileStatsAdd("armor_absorb", absorbed)

						if METRICS_ENABLED then
							FightStat_Absorb(absorbed)
						end
						if Golden[self.inst.prefab] then
						self:SetCondition(self.condition)
						else
						self:SetCondition(self.condition - absorbed)
						end
						if self.ontakedamage then
							self.ontakedamage(self.inst, damage_amount, absorbed, leftover)
						end

						if self.absorb_percent >= 1 then
							return 0
						end

						return leftover
					else
						return damage_amount
					end
				end
			end)
			AddPrefabPostInit("goldenaxe", RemoveDurability)
			AddPrefabPostInit("goldenpickaxe", RemoveDurability)
			AddPrefabPostInit("goldenshovel", RemoveDurability)
			--Shipwrecked
			AddPrefabPostInit("goldenmachete", RemoveDurability)
			if MadMan then
				AddPrefabPostInit("goldsword", RemoveDurability)
				AddPrefabPostInit("goldarmor", AddInfiniteTag)
				AddPrefabPostInit("goldhelm", AddInfiniteTag)
			end
			if GoldKit then
				AddPrefabPostInit("sword_gold", RemoveDurability)
				AddPrefabPostInit("armor_gold", AddInfiniteTag)
				AddPrefabPostInit("hat_gold", AddInfiniteTag)

			end
			if GoldHammer then
				AddPrefabPostInit("goldhammer", RemoveDurability)
			end
			if Scythe then
				AddPrefabPostInit("golden_scythe", RemoveDurability)
			end
			if Zorce then
				AddPrefabPostInit("goldsword", RemoveDurability)
			end
		else
			-- Tweak the durability of all gold items
			function TweakGold(inst)
				if inst.components.finiteuses then
					inst.components.finiteuses.total = (inst.components.finiteuses.total * GOLD_DURABILITY)
					inst.components.finiteuses.current = (inst.components.finiteuses.current * GOLD_DURABILITY)
				end
				if inst.components.perishable then
					inst.components.perishable.perishtime = (inst.components.perishable.perishtime * GOLD_DURABILITY)
					inst.components.perishable.perishremainingtime = (inst.components.perishable.perishremainingtime * GOLD_DURABILITY)
				end
				if inst.components.fueled then
					inst.components.fueled.maxfuel = (inst.components.fueled.maxfuel * GOLD_DURABILITY)
					inst.components.fueled.currentfuel = (inst.components.fueled.currentfuel * GOLD_DURABILITY)
					inst.components.fueled.bonusmult = (inst.components.fueled.bonusmult * GOLD_DURABILITY)
				end
			end
			function SwordInterference(inst)
				if inst.components.finiteuses then
					inst.components.finiteuses.total = (inst.components.finiteuses.total * GOLD_DURABILITY * SWORD_DURABILITY)
					inst.components.finiteuses.current = (inst.components.finiteuses.current * GOLD_DURABILITY * SWORD_DURABILITY)
				end
				if inst.components.perishable then
					inst.components.perishable.perishtime = (inst.components.perishable.perishtime * GOLD_DURABILITY * SWORD_DURABILITY)
					inst.components.perishable.perishremainingtime = (inst.components.perishable.perishremainingtime * GOLD_DURABILITY * SWORD_DURABILITY)
				end
				if inst.components.fueled then
					inst.components.fueled.maxfuel = (inst.components.fueled.maxfuel * GOLD_DURABILITY * SWORD_DURABILITY)
					inst.components.fueled.currentfuel = (inst.components.fueled.currentfuel * GOLD_DURABILITY * SWORD_DURABILITY)
					inst.components.fueled.bonusmult = (inst.components.fueled.bonusmult * GOLD_DURABILITY * SWORD_DURABILITY)
				end
			end
			function WeaponInterference(inst)
				if inst.components.finiteuses then
					inst.components.finiteuses.total = (inst.components.finiteuses.total * GOLD_DURABILITY * WEAPON_DURABILITY)
					inst.components.finiteuses.current = (inst.components.finiteuses.current * GOLD_DURABILITY * WEAPON_DURABILITY)
				end
				if inst.components.perishable then
					inst.components.perishable.perishtime = (inst.components.perishable.perishtime * GOLD_DURABILITY * WEAPON_DURABILITY)
					inst.components.perishable.perishremainingtime = (inst.components.perishable.perishremainingtime * GOLD_DURABILITY * WEAPON_DURABILITY)
				end
				if inst.components.fueled then
					inst.components.fueled.maxfuel = (inst.components.fueled.maxfuel * GOLD_DURABILITY * WEAPON_DURABILITY)
					inst.components.fueled.currentfuel = (inst.components.fueled.currentfuel * GOLD_DURABILITY * WEAPON_DURABILITY)
					inst.components.fueled.bonusmult = (inst.components.fueled.bonusmult * GOLD_DURABILITY * WEAPON_DURABILITY)
				end
			end
			function ToolInterferenceGold(inst)
				if inst.components.finiteuses then
					inst.components.finiteuses.total = (inst.components.finiteuses.total * GOLD_DURABILITY * PRIMARYTOOL_DURABILITY)
					inst.components.finiteuses.current = (inst.components.finiteuses.current * GOLD_DURABILITY * PRIMARYTOOL_DURABILITY)
				end
				if inst.components.perishable then
					inst.components.perishable.perishtime = (inst.components.perishable.perishtime * GOLD_DURABILITY * PRIMARYTOOL_DURABILITY)
					inst.components.perishable.perishremainingtime = (inst.components.perishable.perishremainingtime * GOLD_DURABILITY * PRIMARYTOOL_DURABILITY)
				end
				if inst.components.fueled then
					inst.components.fueled.maxfuel = (inst.components.fueled.maxfuel * GOLD_DURABILITY * PRIMARYTOOL_DURABILITY)
					inst.components.fueled.currentfuel = (inst.components.fueled.currentfuel * GOLD_DURABILITY * PRIMARYTOOL_DURABILITY)
					inst.components.fueled.bonusmult = (inst.components.fueled.bonusmult * GOLD_DURABILITY * PRIMARYTOOL_DURABILITY)
				end
			end
			function ArmorInterference(inst)
				inst.components.armor.condition = (inst.components.armor.condition * GOLD_DURABILITY * ARMOR_DURABILITY)
				inst.components.armor.maxcondition = (inst.components.armor.maxcondition * GOLD_DURABILITY * ARMOR_DURABILITY)
			end

			-- Apply 'TweakGold' function on following prefabs
			if PRIMARYTOOL_DURABILITY ~= "Default" then
					if PRIMARYTOOL_DURABILITY ~= "Infinite" then
						AddPrefabPostInit("goldenaxe", ToolInterferenceGold)
						AddPrefabPostInit("goldenpickaxe", ToolInterferenceGold)
						AddPrefabPostInit("goldenshovel", ToolInterferenceGold)
						--Shipwrecked
						AddPrefabPostInit("goldenmachete", ToolInterferenceGold)
					end
				else
					AddPrefabPostInit("goldenaxe", TweakGold)
					AddPrefabPostInit("goldenpickaxe", TweakGold)
					AddPrefabPostInit("goldenshovel", TweakGold)
					--Shipwrecked
					AddPrefabPostInit("goldenmachete", TweakGold)
			end

			if MadMan then
				if SWORD_DURABILITY ~= "Default" then
					if SWORD_DURABILITY ~= "Infinite" then
						AddPrefabPostInit("goldsword", SwordInterference)
					end
				else
					AddPrefabPostInit("goldsword", TweakGold)
				end
				if ARMOR_DURABILITY ~= "Default" then
					if ARMOR_DURABILITY ~= "Infinite" then
						AddPrefabPostInit("goldarmor", ArmorInterference)
						AddPrefabPostInit("goldhelm", ArmorInterference)
					end
				else
					AddPrefabPostInit("goldarmor", TweakGold)
					AddPrefabPostInit("goldhelm", TweakGold)
				end
			end
			if GoldKit then
				if SWORD_DURABILITY ~= "Default" then
					if SWORD_DURABILITY ~= "Infinite" then
						AddPrefabPostInit("sword_gold", SwordInterference)
					end
				else
					AddPrefabPostInit("sword_gold", TweakGold)
				end
				if ARMOR_DURABILITY ~= "Default" then
					if ARMOR_DURABILITY ~= "Infinite" then
						AddPrefabPostInit("armor_gold", ArmorInterference)
						AddPrefabPostInit("hat_gold", ArmorInterference)
					end
				else
					AddPrefabPostInit("armor_gold", TweakGold)
					AddPrefabPostInit("hat_gold", TweakGold)
				end
			end
			if GoldHammer then
				AddPrefabPostInit("goldhammer", TweakGold)
			end
			if Scythe then
				if PRIMARYTOOL_DURABILITY ~= "Default" then
					if PRIMARYTOOL_DURABILITY ~= "Infinite" then
						AddPrefabPostInit("golden_scythe", ToolInterferenceGold)
					end
				else
					AddPrefabPostInit("golden_scythe", TweakGold)
				end
			end
			if Zorce then
				if SWORD_DURABILITY ~= "Default" then
					if SWORD_DURABILITY ~= "Infinite" then
						AddPrefabPostInit("goldsword", ArmorInterference)
					end
				else
					AddPrefabPostInit("goldsword", TweakGold)
				end
			end
			if GoldSpear then
				if WEAPON_DURABILITY ~= "Default" then
					if WEAPON_DURABILITY ~= "Infinite" then
						AddPrefabPostInit("goldenspear", WeaponInterference)
					end
				else
					AddPrefabPostInit("goldenspear", TweakGold)
				end
			end
		end
	end

	if OBSIDIAN_DURABILITY ~= "Default" then
		if OBSIDIAN_DURABILITY == "Infinite" then
			AddPrefabPostInit("obsidianmachete", RemoveDurability)
			AddPrefabPostInit("obsidianaxe", RemoveDurability)
			AddPrefabPostInit("spear_obsidian", RemoveDurability)
		else
			-- Tweak the durability of compass
			function TweakObsidian(inst)
				if inst.components.finiteuses then
					inst.components.finiteuses.total = (inst.components.finiteuses.total * OBSIDIAN_DURABILITY)
					inst.components.finiteuses.current = (inst.components.finiteuses.current * OBSIDIAN_DURABILITY)
				end
				if inst.components.perishable then
					inst.components.perishable.perishtime = (inst.components.perishable.perishtime * OBSIDIAN_DURABILITY)
					inst.components.perishable.perishremainingtime = (inst.components.perishable.perishremainingtime * OBSIDIAN_DURABILITY)
				end
				if inst.components.fueled then
					inst.components.fueled.maxfuel = (inst.components.fueled.maxfuel * OBSIDIAN_DURABILITY)
					inst.components.fueled.currentfuel = (inst.components.fueled.currentfuel * OBSIDIAN_DURABILITY)
					inst.components.fueled.bonusmult = (inst.components.fueled.bonusmult * OBSIDIAN_DURABILITY)
				end
			end
			function ToolInterferenceObsidian(inst)
				if inst.components.finiteuses then
					inst.components.finiteuses.total = (inst.components.finiteuses.total * OBSIDIAN_DURABILITY * PRIMARYTOOL_DURABILITY)
					inst.components.finiteuses.current = (inst.components.finiteuses.current * OBSIDIAN_DURABILITY * PRIMARYTOOL_DURABILITY)
				end
				if inst.components.perishable then
					inst.components.perishable.perishtime = (inst.components.perishable.perishtime * OBSIDIAN_DURABILITY * PRIMARYTOOL_DURABILITY)
					inst.components.perishable.perishremainingtime = (inst.components.perishable.perishremainingtime * OBSIDIAN_DURABILITY * PRIMARYTOOL_DURABILITY)
				end
				if inst.components.fueled then
					inst.components.fueled.maxfuel = (inst.components.fueled.maxfuel * OBSIDIAN_DURABILITY * PRIMARYTOOL_DURABILITY)
					inst.components.fueled.currentfuel = (inst.components.fueled.currentfuel * OBSIDIAN_DURABILITY * PRIMARYTOOL_DURABILITY)
					inst.components.fueled.bonusmult = (inst.components.fueled.bonusmult * OBSIDIAN_DURABILITY * PRIMARYTOOL_DURABILITY)
				end
			end
			function WeaponInterferenceObsidian(inst)
				if inst.components.finiteuses then
					inst.components.finiteuses.total = (inst.components.finiteuses.total * OBSIDIAN_DURABILITY * WEAPON_DURABILITY)
					inst.components.finiteuses.current = (inst.components.finiteuses.current * OBSIDIAN_DURABILITY * WEAPON_DURABILITY)
				end
				if inst.components.perishable then
					inst.components.perishable.perishtime = (inst.components.perishable.perishtime * OBSIDIAN_DURABILITY * WEAPON_DURABILITY)
					inst.components.perishable.perishremainingtime = (inst.components.perishable.perishremainingtime * OBSIDIAN_DURABILITY * WEAPON_DURABILITY)
				end
				if inst.components.fueled then
					inst.components.fueled.maxfuel = (inst.components.fueled.maxfuel * OBSIDIAN_DURABILITY * WEAPON_DURABILITY)
					inst.components.fueled.currentfuel = (inst.components.fueled.currentfuel * OBSIDIAN_DURABILITY * WEAPON_DURABILITY)
					inst.components.fueled.bonusmult = (inst.components.fueled.bonusmult * OBSIDIAN_DURABILITY * WEAPON_DURABILITY)
				end
			end
			-- Apply 'TweakCompass' function on following prefabs
			if PRIMARYTOOL_DURABILITY ~= "Default" then
					if PRIMARYTOOL_DURABILITY ~= "Infinite" then
						AddPrefabPostInit("obsidianmachete", ToolInterferenceObsidian)
						AddPrefabPostInit("obsidianaxe", ToolInterferenceObsidian)
					end
				else
					AddPrefabPostInit("obsidianmachete", TweakObsidian)
					AddPrefabPostInit("obsidianaxe", TweakObsidian)
			end
			if WEAPON_DURABILITY ~= "Default" then
					if WEAPON_DURABILITY ~= "Infinite" then
						AddPrefabPostInit("goldenspear", WeaponInterferenceObsidian)
					end
				else
					AddPrefabPostInit("goldenspear", TweakObsidian)
				end
		end
	end

	if TRAP_DURABILITY ~= "Default" then
		if TRAP_DURABILITY == "Infinite" then
			AddPrefabPostInit("birdtrap", RemoveDurability)
			AddPrefabPostInit("trap", RemoveDurability)
			AddPrefabPostInit("trap_teeth", RemoveDurability)
			AddPrefabPostInit("seatrap", RemoveDurability)
		else
			-- Tweak the durability of all traps
			function TweakTrap(inst)
				if inst.components.finiteuses then
					inst.components.finiteuses.total = (inst.components.finiteuses.total * TRAP_DURABILITY)
					inst.components.finiteuses.current = (inst.components.finiteuses.current * TRAP_DURABILITY)
				end
				if inst.components.perishable then
					inst.components.perishable.perishtime = (inst.components.perishable.perishtime * TRAP_DURABILITY)
					inst.components.perishable.perishremainingtime = (inst.components.perishable.perishremainingtime * TRAP_DURABILITY)
				end
				if inst.components.fueled then
					inst.components.fueled.maxfuel = (inst.components.fueled.maxfuel * TRAP_DURABILITY)
					inst.components.fueled.currentfuel = (inst.components.fueled.currentfuel * TRAP_DURABILITY)
					inst.components.fueled.bonusmult = (inst.components.fueled.bonusmult * TRAP_DURABILITY)
				end
			end
			-- Apply 'TweakTrap' function on following prefabs
			AddPrefabPostInit("birdtrap", TweakTrap)
			AddPrefabPostInit("trap", TweakTrap)
			AddPrefabPostInit("trap_teeth", TweakTrap)
			AddPrefabPostInit("seatrap", TweakTrap)
		end
	end

	if HEATROCK_DURABILITY ~= "Default" then
		if HEATROCK_DURABILITY == "Infinite" then
			local function HeatrockNoHealth(inst)
				applyhealthdelta = false
			end
			AddComponentPostInit("temperature", HeatrockNoHealth)
		else
			-- Tweak the durability of heatrock
			local function HeatrockTweak(inst)
				self.inst.components.health:DoDelta(-self.hurtrate*dt / HEATROCK_DURABILITY, true, "cold")
			end
			AddComponentPostInit("temperature", HeatrockTweak)
		end
	end

local function TweakCloth(inst)
	if inst.components.finiteuses then
		inst.components.finiteuses.total = (inst.components.finiteuses.total * CLOTHING_DURABILITY)
		inst.components.finiteuses.current = (inst.components.finiteuses.current * CLOTHING_DURABILITY)
	end
	if inst.components.perishable then
		inst.components.perishable.perishtime = (inst.components.perishable.perishtime * CLOTHING_DURABILITY)
		inst.components.perishable.perishremainingtime = (inst.components.perishable.perishremainingtime * CLOTHING_DURABILITY)
	end
	if inst.components.fueled then
		inst.components.fueled.maxfuel = (inst.components.fueled.maxfuel * CLOTHING_DURABILITY)
		inst.components.fueled.currentfuel = (inst.components.fueled.currentfuel * CLOTHING_DURABILITY)
		inst.components.fueled.bonusmult = (inst.components.fueled.bonusmult * CLOTHING_DURABILITY)
	end
end

local function ClothingDurability()
	if CLOTHING_DURABILITY == "Default" then return end
	local clothes = {
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
	}
	appendIf(FishHat, clothes, "fishbrella")
	appendIf(SurvivalGear, clothes,"cave_armor")

	local tweakfn == CLOTHING_DURABILITY == "Infinite" then RemoveDurability or TweakCloth
	for _, prefab in ipairs(clothes) do
			AddPrefabPostInit("cave_armor", TweakCloth)
		end
	end
end

	if LIGHT_DURABILITY ~= "Default" then
		if LIGHT_DURABILITY == "Infinite" then
			AddPrefabPostInit("lantern", RemoveDurability)
			AddPrefabPostInit("lighter", RemoveDurability)
			AddPrefabPostInit("minerhat", RemoveDurability)
			AddPrefabPostInit("nightlight", RemoveDurability)
			AddPrefabPostInit("pumpkin_lantern", RemoveDurability)
		else
			-- Tweak the durability of portable lights
			function TweakLight(inst)
				if inst.components.finiteuses then
					inst.components.finiteuses.total = (inst.components.finiteuses.total * LIGHT_DURABILITY)
					inst.components.finiteuses.current = (inst.components.finiteuses.current * LIGHT_DURABILITY)
				end
				if inst.components.perishable then
					inst.components.perishable.perishtime = (inst.components.perishable.perishtime * LIGHT_DURABILITY)
					inst.components.perishable.perishremainingtime = (inst.components.perishable.perishremainingtime * LIGHT_DURABILITY)
				end
				if inst.components.fueled then
					inst.components.fueled.maxfuel = (inst.components.fueled.maxfuel * LIGHT_DURABILITY)
					inst.components.fueled.currentfuel = (inst.components.fueled.currentfuel * LIGHT_DURABILITY)
					inst.components.fueled.bonusmult = (inst.components.fueled.bonusmult * LIGHT_DURABILITY)
				end
			end
			-- Apply 'TweakLight' function on following prefabs
			AddPrefabPostInit("lantern", TweakLight)
			AddPrefabPostInit("lighter", TweakLight)
			AddPrefabPostInit("minerhat", TweakLight)
			AddPrefabPostInit("nightlight", TweakLight)
			AddPrefabPostInit("pumpkin_lantern", TweakLight)
		end
	end

	if TORCH_DURABILITY ~= "Default" then
		if TORCH_DURABILITY == "Infinite" then
			AddPrefabPostInit("torch", RemoveDurability)
			if EndoTorch then
				AddPrefabPostInit("endothermic_torch", RemoveDurability)
			end
		else
			-- Tweak the durability of torch
			function TweakTorch(inst)
				if inst.components.finiteuses then
					inst.components.finiteuses.total = (inst.components.finiteuses.total * TORCH_DURABILITY)
					inst.components.finiteuses.current = (inst.components.finiteuses.current * TORCH_DURABILITY)
				end
				if inst.components.perishable then
					inst.components.perishable.perishtime = (inst.components.perishable.perishtime * TORCH_DURABILITY)
					inst.components.perishable.perishremainingtime = (inst.components.perishable.perishremainingtime * TORCH_DURABILITY)
				end
				if inst.components.fueled then
					inst.components.fueled.maxfuel = (inst.components.fueled.maxfuel * TORCH_DURABILITY)
					inst.components.fueled.currentfuel = (inst.components.fueled.currentfuel * TORCH_DURABILITY)
					inst.components.fueled.bonusmult = (inst.components.fueled.bonusmult * TORCH_DURABILITY)
				end
			end
			-- Apply 'TweakTorch' function on following prefabs
			AddPrefabPostInit("torch", TweakTorch)

			if EndoTorch then
				AddPrefabPostInit("endothermic_torch", TweakTorch)
			end
		end
	end

	if CAMPING_DURABILITY ~= "Default" then
		if CAMPING_DURABILITY == "Infinite" then
			AddPrefabPostInit("bedroll_furry", RemoveDurability)
			AddPrefabPostInit("siestahut", RemoveDurability)
			AddPrefabPostInit("tent", RemoveDurability)
		else
			-- Tweak the durability of sleep items
			function TweakCamping(inst)
				if inst.components.finiteuses then
					inst.components.finiteuses.total = (inst.components.finiteuses.total * CAMPING_DURABILITY)
					inst.components.finiteuses.current = (inst.components.finiteuses.current * CAMPING_DURABILITY)
				end
				if inst.components.perishable then
					inst.components.perishable.perishtime = (inst.components.perishable.perishtime * CAMPING_DURABILITY)
					inst.components.perishable.perishremainingtime = (inst.components.perishable.perishremainingtime * CAMPING_DURABILITY)
				end
				if inst.components.fueled then
					inst.components.fueled.maxfuel = (inst.components.fueled.maxfuel * CAMPING_DURABILITY)
					inst.components.fueled.currentfuel = (inst.components.fueled.currentfuel * CAMPING_DURABILITY)
					inst.components.fueled.bonusmult = (inst.components.fueled.bonusmult * CAMPING_DURABILITY)
				end
			end
			-- Apply 'TweakCamping' function on following prefabs
			AddPrefabPostInit("bedroll_furry", TweakCamping)
			AddPrefabPostInit("siestahut", TweakCamping)
			AddPrefabPostInit("tent", TweakCamping)
		end
	end

	if BOOK_DURABILITY ~= "Default" then
		if BOOK_DURABILITY == "Infinite" then
			AddPrefabPostInit("book_birds", RemoveDurability)
			AddPrefabPostInit("book_brimstone", RemoveDurability)
			AddPrefabPostInit("book_gardening", RemoveDurability)
			AddPrefabPostInit("book_sleep", RemoveDurability)
			AddPrefabPostInit("book_tentacles", RemoveDurability)
		else
			-- Tweak the durability of all books.
			function TweakBook(inst)
				if inst.components.finiteuses then
					inst.components.finiteuses.total = (inst.components.finiteuses.total * BOOK_DURABILITY)
					inst.components.finiteuses.current = (inst.components.finiteuses.current * BOOK_DURABILITY)
				end
				if inst.components.perishable then
					inst.components.perishable.perishtime = (inst.components.perishable.perishtime * BOOK_DURABILITY)
					inst.components.perishable.perishremainingtime = (inst.components.perishable.perishremainingtime * BOOK_DURABILITY)
				end
				if inst.components.fueled then
					inst.components.fueled.maxfuel = (inst.components.fueled.maxfuel * TOOL_DURABILITY)
					inst.components.fueled.currentfuel = (inst.components.fueled.currentfuel * TOOL_DURABILITY)
					inst.components.fueled.bonusmult = (inst.components.fueled.bonusmult * TOOL_DURABILITY)
				end
			end
			-- Apply 'TweakBook' function on following prefabs
			AddPrefabPostInit("book_birds", TweakBook)
			AddPrefabPostInit("book_brimstone", TweakBook)
			AddPrefabPostInit("book_gardening", TweakBook)
			AddPrefabPostInit("book_sleep", TweakBook)
			AddPrefabPostInit("book_tentacles", TweakBook)
		end
	end

	if ICEBOX_TUNING ~= "Default" then
		TUNING.PERISH_FRIDGE_MULT = ICEBOX_TUNING
	end

	if BOAT_DURABILITY ~= "Default" then
		if BOAT_DURABILITY == "Infinite" then
			AddPrefabPostInit("sail", RemoveDurability)
			AddPrefabPostInit("clothsail", RemoveDurability)
			AddPrefabPostInit("snakeskinsail", RemoveDurability)
			AddPrefabPostInit("feathersail", RemoveDurability)
			AddPrefabPostInit("rowboat", RemoveDurability)
			AddPrefabPostInit("raft", RemoveDurability)
			AddPrefabPostInit("lograft", RemoveDurability)
			AddPrefabPostInit("surfboard", RemoveDurability)
			AddPrefabPostInit("cargoboat", RemoveDurability)
			AddPrefabPostInit("armouredboat", RemoveDurability)
		else
			-- Tweak the durability of all sails and boats
			function TweakBoat(inst)
				if inst.components.finiteuses then
					inst.components.finiteuses.total = (inst.components.finiteuses.total * BOAT_DURABILITY)
					inst.components.finiteuses.current = (inst.components.finiteuses.current * BOAT_DURABILITY)
				end
				if inst.components.perishable then
					inst.components.perishable.perishtime = (inst.components.perishable.perishtime * BOAT_DURABILITY)
					inst.components.perishable.perishremainingtime = (inst.components.perishable.perishremainingtime * BOAT_DURABILITY)
				end
				if inst.components.fueled then
					inst.components.fueled.maxfuel = (inst.components.fueled.maxfuel * BOAT_DURABILITY)
					inst.components.fueled.currentfuel = (inst.components.fueled.currentfuel * BOAT_DURABILITY)
					inst.components.fueled.bonusmult = (inst.components.fueled.bonusmult * BOAT_DURABILITY)
				end
			end
			-- Apply 'TweakBoat' function on following prefabs
			AddPrefabPostInit("sail", TweakBoat)
			AddPrefabPostInit("clothsail", TweakBoat)
			AddPrefabPostInit("snakeskinsail", TweakBoat)
			AddPrefabPostInit("feathersail", TweakBoat)
			AddPrefabPostInit("rowboat", TweakBoat)
			AddPrefabPostInit("raft", TweakBoat)
			AddPrefabPostInit("lograft", TweakBoat)
			AddPrefabPostInit("surfboard", TweakBoat)
			AddPrefabPostInit("cargoboat", TweakBoat)
			AddPrefabPostInit("armouredboat", TweakBoat)
		end
	end

	if BOATITEMS_DURABILITY ~= "Default" then
		if BOATITEMS_DURABILITY == "Infinite" then
			AddPrefabPostInit("boatcannon", RemoveDurability)
			AddPrefabPostInit("boat_lantern", RemoveDurability)
			AddPrefabPostInit("telescope", RemoveDurability)
			AddPrefabPostInit("supertelescope", RemoveDurability)
			AddPrefabPostInit("harpoon", RemoveDurability)
		else
			-- Tweak the durability of all boat items
			function TweakBoatItems(inst)
				if inst.components.finiteuses then
					inst.components.finiteuses.total = (inst.components.finiteuses.total * BOATITEMS_DURABILITY)
					inst.components.finiteuses.current = (inst.components.finiteuses.current * BOATITEMS_DURABILITY)
				end
				if inst.components.perishable then
					inst.components.perishable.perishtime = (inst.components.perishable.perishtime * BOATITEMS_DURABILITY)
					inst.components.perishable.perishremainingtime = (inst.components.perishable.perishremainingtime * BOATITEMS_DURABILITY)
				end
				if inst.components.fueled then
					inst.components.fueled.maxfuel = (inst.components.fueled.maxfuel * BOATITEMS_DURABILITY)
					inst.components.fueled.currentfuel = (inst.components.fueled.currentfuel * BOATITEMS_DURABILITY)
					inst.components.fueled.bonusmult = (inst.components.fueled.bonusmult * BOATITEMS_DURABILITY)
				end
			end
			-- Apply 'TweakBoatItems' function on following prefabs
			AddPrefabPostInit("boatcannon", TweakBoatItems)
			AddPrefabPostInit("boat_lantern", TweakBoatItems)
			AddPrefabPostInit("telescope", TweakBoatItems)
			AddPrefabPostInit("supertelescope", TweakBoatItems)
			AddPrefabPostInit("harpoon", TweakBoatItems)
		end
	end

	if BOATREPAIRKIT_DURABILITY ~= "Default" then
		if BOATREPAIRKIT_DURABILITY == "Infinite" then
			AddPrefabPostInit("boatrepairkit", RemoveDurability)
		else
			-- Tweak the durability of boat repairkit
			function TweakBoatRepairKit(inst)
				if inst.components.finiteuses then
					inst.components.finiteuses.total = (inst.components.finiteuses.total * BOATREPAIRKIT_DURABILITY)
					inst.components.finiteuses.current = (inst.components.finiteuses.current * BOATREPAIRKIT_DURABILITY)
				end
				if inst.components.perishable then
					inst.components.perishable.perishtime = (inst.components.perishable.perishtime * BOATREPAIRKIT_DURABILITY)
					inst.components.perishable.perishremainingtime = (inst.components.perishable.perishremainingtime * BOATREPAIRKIT_DURABILITY)
				end
				if inst.components.fueled then
					inst.components.fueled.maxfuel = (inst.components.fueled.maxfuel * BOATREPAIRKIT_DURABILITY)
					inst.components.fueled.currentfuel = (inst.components.fueled.currentfuel * BOATREPAIRKIT_DURABILITY)
					inst.components.fueled.bonusmult = (inst.components.fueled.bonusmult * BOATREPAIRKIT_DURABILITY)
				end
			end
			-- Apply 'TweakBoatRepairKit' function on following prefabs
			AddPrefabPostInit("boatrepairkit", TweakBoatRepairKit)
		end
	end
