-- this file registers all effect objects to the DrwObjectLibrary

print("-- INITIALIZING EQUIPMENT   object_equipment_init.lua")


local sql_races = doscript("sql_race")


function Register(type_id, name, race, gender)
	local object
	if type_id then

		object = ObjectLibrary:AddNewEquipment(type_id, gender or 0);
		local element = object:ElementMesh(name..".msh");
		
		if race and %sql_races[race] then
			object:SetReferenceScale(%sql_races[race].equipmentscaling*0.01)
			--print(name,race,%sql_races[race].equipmentscaling*0.01)
		end
	else
		error("type_id undefined - name is " .. name)
	end
	return object
end

function AttachEffect(objectid, effectname, offset)
	for iGender = 0,1 do	
		object = ObjectLibrary:GetObject(kGtCategoryEquipment, objectid, iGender)
		if object == nil then return end

		if effectname then
			local pEffect = EffectGet(effectname)
			if pEffect == nil then return object end

			if offset then
				NewMovie()
				Translation{min=offset}
				pEffect=NewObject{subobject=pEffect, movie=pMovie}
			end
			
			local pObject = tolua.cast(pEffect, "CDrwEffectObject")
			object:ElementSubObject(pObject)
		end
	end
end


prefix = ""
local sql_items = doscript("sql_item")
for i,v in sql_items do
	v.mesh = v.meshmalecold
	if strfind(v.mesh,"^equipment_") then

		if FindMesh(v.mesh) then	-- male version
			Register(i,v.mesh,v.race, 0)
			-- print("registered equipment mesh:", v.mesh)
			
			if FindMesh(v.meshfemalecold) then  -- female version
				Register(i,v.meshfemalecold,v.race, 1)
			else
				Register(i,v.mesh,v.race, 1)
			end
		else
			print("MISSING FILE:", i,v.mesh)
		end

	end
end

-- now the goods (for carrying around)
local racenames = {"human","dwarf","elf","troll","orc","darkelf"}
function RegisterGood(good,mesh)
	for race = 1,6 do 
		local mesh_with_race = gsub(mesh,"_good","_good_"..%racenames[race])
		if FindMesh(mesh_with_race) then
			Register(8192 + 64 * race + good, mesh_with_race, race)
		else
			Register(8192 + 64 * race + good, mesh, race)
		end
	end
end

RegisterGood(kGdGoodStone, "equipment_good_stone")
RegisterGood(kGdGoodLog, "equipment_good_log")
RegisterGood(kGdGoodMithril, "equipment_good_mithrill")
RegisterGood(kGdGoodIron, "equipment_good_iron")
RegisterGood(kGdGoodManaElixir, "equipment_good_aria")
RegisterGood(kGdGoodFish, "equipment_good_fishnet_fish")
RegisterGood(kGdGoodBerry, "equipment_good_berry_full")
RegisterGood(kGdGoodMushroom, "equipment_good_mushroom_full")
RegisterGood(kGdGoodGrain, "equipment_good_hay")
RegisterGood(kGdGoodMeat, "equipment_good_meat")
RegisterGood(kGdGoodManaHerb, "equipment_good_lenya")


--------------------------------------------------- attach upgrade weapon effects
AttachEffect(3308, "WeaponHypnotize", {0,0,0.6})
AttachEffect(3468, "WeaponSparkStaff", {0,0,0.7})
AttachEffect(3553, "WeaponSparkStaff", {0,0,0.7})
AttachEffect(3554, "WeaponSparkStaff", {0,0,0.7})
AttachEffect(3260, "WeaponFireStaff", {0,0,0.7})
AttachEffect(2946, "WeaponFireBlade")
AttachEffect(3249, "WeaponIceBlade", {-0.1,0,0})
AttachEffect(3259, "WeaponPoison")
AttachEffect(3262, "WeaponFlashHammer")
AttachEffect(3272, "WeaponTrollFlashHammer")
AttachEffect(3270, "WeaponAmok", {0,0,0.7})
AttachEffect(3269, "WeaponMana", {0,0,1})
AttachEffect(3268, "WeaponIceClub")
AttachEffect(3275, "WeaponDarkElfHammer")
AttachEffect(3276, "WeaponBlackCircle", {0,0,0.7})
AttachEffect(3277, "WeaponStarBurst", {0,0,1.6})

-------------------------------------------------- attach player/npc weapon effects
AttachEffect(2146, "WeaponFireBlade", {-0.3,0,0.05})
AttachEffect(3318, "WeaponIceBladeShort")
AttachEffect(2045, "WeaponPoisonShort")
AttachEffect(2046, "WeaponPestilence")
AttachEffect(2673, "WeaponIceStaff", {0,0,0.6})
AttachEffect(3238, "WeaponBlackAxe")
AttachEffect(3239, "WeaponBlackBlade")
AttachEffect(3237, "WeaponBlackSceptre", {0,0,0.4})
AttachEffect(2388, "WeaponPain", {0,0,0.6})
AttachEffect(3173, "WeaponPain", {0,0,0.8})
AttachEffect(2387, "WeaponMana", {0,0,0.5})
AttachEffect(2375, "WeaponFireHammer", {-0.2,0,0.8})
AttachEffect(2189, "WeaponPoisonAxe", {-0.25,0.05,0.4})
AttachEffect(3475, "WeaponPain", {0,0,0.6})
AttachEffect(3476, "WeaponFireBlade")
AttachEffect(3577, "WeaponFlashBlade", {0,0,0.1})

--------------------------------------------------- last changes
AttachEffect(2349, "WeaponFireBladeLong")
AttachEffect(2196, "WeaponPoisonShort")
AttachEffect(2359, "WeaponMana", {0,0,0.4})
AttachEffect(2253, "WeaponMana", {-0.3,0,0.05})
AttachEffect(3515, "WeaponTrail")
AttachEffect(3575, "WeaponFireHammer", {-0.3,0,0.7})


--------------------------------------------------- AddOn
AttachEffect(3772, "WeaponFireSword", {0,0,0.2})
AttachEffect(3773, "WeaponDragonHammer", {0,0,0.2})
AttachEffect(3592, "WeaponPain", {0,0,0.5})
AttachEffect(3595, "WeaponIceBladeShort", {0,0,0.15})
AttachEffect(3610, "WeaponMana", {0,0,0.7})
AttachEffect(3614, "WeaponMana", {0,0,0.65})
AttachEffect(3603, "WeaponPain", {0,0,1})
AttachEffect(3602, "WeaponFlashPecker", {0.3,0,0.7})
AttachEffect(3611, "WeaponFlashBlade")
AttachEffect(3613, "WeaponBlackSceptre", {0.1,0.1,1})
AttachEffect(3593, "WeaponBlackBlade", {0,0,-0.2})
AttachEffect(3596, "WeaponBlackAxe", {-0.35,0,0.05})
AttachEffect(3600, "WeaponDarkHammer", {0,0,-0.12})
AttachEffect(3594, "WeaponPoisonShort")
AttachEffect(3597, "WeaponPestilence", {-0.1,0,0.2})
AttachEffect(3598, "WeaponSuffocation", {-0.1,0,0.2})
AttachEffect(3601, "WeaponFireAndIce", {0.1,0,0.65})
AttachEffect(3612, "WeaponFireAndIce", {0.1,0,0.7})
AttachEffect(3615, "WeaponSuffocation", {0,0,0.2})

AttachEffect(4206, "WeaponIceBladeShort", {0,0,0.25})
AttachEffect(4206, "WeaponIceBladeShort", {0,0,-0.95})

AttachEffect(4095, "WeaponIceCrystals")
AttachEffect(4207, "WeaponIceBlade")

AttachEffect(4205, "WeaponIceCrystals", {0.05,0,0})
AttachEffect(4205, "WeaponIceCrystals", {0.05,0,-1.1})

AttachEffect(4209, "WeaponFireSword2", {0,0,0.15})
AttachEffect(4171, "WeaponFireSwordZhuul", {0,0,0.85})

-------------------------------------------------- addon2
AttachEffect(3661, "WeaponPestilence")
AttachEffect(4480, "WeaponPestilence")
AttachEffect(4456, "WeaponSuffocation", {0,0,0.5})
AttachEffect(4430, "WeaponPain", {0,0,0.5})
AttachEffect(4540, "WeaponPain", {0,0,0.5})
AttachEffect(4473, "WeaponHypnotize")
AttachEffect(4487, "WeaponPoison")
AttachEffect(3662, "WeaponMana", {0,0,0.2})
AttachEffect(4481, "WeaponFireAndIce", {0.1,0,0.5})
AttachEffect(4458, "WeaponFireAndIce", {0,0,0.9})
AttachEffect(4474, "WeaponHypnotize")
AttachEffect(4488, "WeaponSuffocation", {0,0,0})
AttachEffect(3663, "WeaponFireAndIce", {0.1,0,0.4})
AttachEffect(4482, "WeaponSuffocation", {0,0,0.3})

AttachEffect(4457, "WeaponBlackBlade", {0,0,0.3})
AttachEffect(4432, "WeaponIceBlade", {0,0,-0.2})
AttachEffect(4541, "WeaponPoisonShort", {0,0,-0.2})
AttachEffect(4475, "WeaponBlackSceptre", {0,0,0})
AttachEffect(4489, "WeaponAmok", {0,0,0.6})
AttachEffect(4426, "WeaponBlackSceptre", {0,0,0.4})
AttachEffect(4526, "WeaponPain", {0,0,0.4})
AttachEffect(4483, "WeaponPestilence", {0,0,0.2})
AttachEffect(4459, "WeaponPestilence", {0,0,0.5})
AttachEffect(4433, "WeaponBlackBlade", {0,0,0})
AttachEffect(4476, "WeaponSuffocation", {0,0,-0.3})
AttachEffect(4490, "WeaponMana", {0,0,0.7})
