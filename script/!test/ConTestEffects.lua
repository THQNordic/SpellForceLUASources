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
	object = ObjectLibrary:GetObject(kGtCategoryEquipment, objectid)
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


function Weapon(weapon)
	weapon = "equipment_weapon_" .. weapon
	print(weapon)
	if FindMesh(weapon) then
		Selection:Clear()
		DrwClear()
		Register(660, weapon, 1)	
		DrwClear()
	else
		print("missing mesh", weapon)
	end
end

function ReloadFigures()
	Selection:Clear()
	doscript("DrwFiles")
	doscript("object_figure_init")
	DrwClear()
end


function ReloadEffects()
	doscript("DrwFiles")
	dofile("script\\DrwSound.lua")
	dofile("object\\object_effect_helper.lua")
	dofile("object\\object_effect_mesh.lua")
	dofile("object\\object_effect_standard.lua")
	dofile("object\\object_effect_cast.lua")
	dofile("object\\object_effect_resolve.lua")
	dofile("object\\object_effect_area.lua")
	dofile("object\\object_effect_monument.lua")
	dofile("object\\object_effect_aura.lua")
	dofile("object\\object_effect_init.lua")
	dofile("object\\object_effect_weapon.lua")
	dofile("object\\object_effect_gates.lua")
	dofile("object\\object_effect_tests.lua")
	dofile("object\\object_effect_lakes.lua")
	dofile("object\\object_effect_lantern.lua")
	dofile("object\\object_effect_register.lua")
	dofile("object\\object_effect_unitattachments.lua")
end

ReloadEffects()