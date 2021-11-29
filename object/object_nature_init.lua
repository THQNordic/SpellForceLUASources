-- this file registers all nature objects to the DrwObjectLibrary

print("-- INITIALIZING NATURE   object_nature_init.lua")

-- register a nature object
local Register = function(params)
	if params.id then
		local object
		local monument

		if strfind(params.mesh[1], "monument_main") then
			monument = ObjectLibrary:AddNewMonument(params.id)
			object = monument
		else
			object = ObjectLibrary:AddNewObject(kGtCategoryObject, params.id);
		end

        -- create point shadow first
		if params.shadow and params.shadow ~= 0 then
			local element = object:ElementPointShadow("system_element_pointshadow.msh");
			element:SetSize(params.shadow)
		end
		-- then the mesh

		for i, v in params.mesh do
			if v ~= "" then
				if strfind(v, "decal") then
					local element = object:ElementDecal(v)
					element:ChangeTypeToBuildingDecal()
				else
					local element = object:ElementMesh(v..".msh")

					if monument and FindBones(v) then
						monument:AddAttachments(v .. ".bor")
					end

					if strfind(params.mesh[1], "landscape_attachment") then
						element:SetIllumination(9)   -- ignore terrain light!
					end
				end
			end
		end

		if params.selectionscaling then
			object:SetSelectSize(params.selectionscaling)
		end


		return object
	else
		error("id undefined - mesh is " .. params.mesh[1])
	end
end

RegisterObjectEffect = function(sql_objects, meshId, effectname, offset)
	local Object

	if type(meshId) == "string" then
		--attach to all objects using this mesh
		for i,v in sql_objects do
			if (v.mesh[1] == meshId) then
				RegisterObjectEffect(sql_objects, i, effectname, offset)
			end
		end
		return  
		--done
	else
		--attach to this objectid only
		object = ObjectLibrary:GetObject(kGtCategoryObject, meshId)
	end	
	
	if (object == nil) then
		print("WARNING: RegisterObjectEffect(), object (mesh) not found: " .. tostring(meshname))
		return
	end

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
	return object
end

-- Syntax für dieses File:
-- Register{id=Id-Nummer, mesh=Mesh-params.mesh, illumination="indirect/inhouse", shadow=Durchmesser}

local sql_objects = doscript("sql_object")
for i,v in sql_objects do
	if not strfind(v.mesh[1],"^<") then -- begins with "<..." ? is not defined then
		v.id = i

		Register(v)

	end
end

RegisterObjectEffect(sql_objects, "building_human_wall_towngate_open", "GateTorch", {-5.6,4.2,0})
RegisterObjectEffect(sql_objects, "building_human_wall_towngate_closed", "GateTorch", {-5.6,4.2,0})
RegisterObjectEffect(sql_objects, "building_human_wall_towngate_portalkeep_closed", "SmallGateTorch", {-2.8,2.8,0})
RegisterObjectEffect(sql_objects, "building_human_wall_towngate_portalkeep_open", "SmallGateTorch", {-2.8,2.8,0})

-- changes made by steffen (TM)
RegisterObjectEffect(sql_objects, 831, "PlasmaSmoke", {0,0,-0.3})
RegisterObjectEffect(sql_objects, 832, "PlasmaSmoke", {0,0,-0.3})
RegisterObjectEffect(sql_objects, 833, "PlasmaSmoke", {0,0,-0.3})
RegisterObjectEffect(sql_objects, 834, "PlasmaSmoke", {0,0,-0.3})

-- always burning fackel
--RegisterObjectEffect(sql_objects, "nature_prop_torch_always", "Torch")
RegisterObjectEffect(sql_objects, "nature_prop_torch1_lit", "Torch")
RegisterObjectEffect(sql_objects, "nature_prop_torch2_lit", "Torch")
RegisterObjectEffect(sql_objects, "nature_prop_torch3_lit", "Torch")
RegisterObjectEffect(sql_objects, "nature_prop_torch4_lit", "Torch")

RegisterObjectEffect(sql_objects, "nature_prop_fireplace_lit", "Campfire")

-- obelisk fx
RegisterObjectEffect(sql_objects, 919, "Obelisk")

-- portal fx
RegisterObjectEffect(sql_objects, "worlditem_portal", "Portal")
RegisterObjectEffect(sql_objects, "worlditem_portal_time", "PortalTime")

---------ein portal ausnehmen -> neu registrieren ohne effekt
v = sql_objects[2906]
v.id = 2906
Register(v)

-- Fog an Gebäuden
RegisterObjectEffect(sql_objects, "worlditem_forest_shrine", "MiniFog")

-- PlayerMonument light effect
RegisterObjectEffect(sql_objects, "worlditem_player_monument_main", "Bindstone", {0.5,0,0})

-- Elementarpunkt Feuer
RegisterObjectEffect(sql_objects, 2882, "BuildingFire")

-- fx auf coop spawnobject
RegisterObjectEffect(sql_objects, "system_element_invis", "GroundWave", {0,0,0})
RegisterObjectEffect(sql_objects, "system_element_invis", "Lightning", {0,0,0})

-- hoho 8-]
-- ha-ha I->

-- Loot fx auf Leichen ...
--RegisterObjectEffect(sql_objects, "dloot_npc_skeleton_normal", "Loot", {0,0,0.25})
--RegisterObjectEffect(sql_objects, "dloot_human_enchanter_cold", "Loot", {0,0,0.25})
--RegisterObjectEffect(sql_objects, "dloot_human_paladin_cold", "Loot", {0,0,0.25})
--RegisterObjectEffect(sql_objects, "dloot_npc_giant_cloth1", "Loot", {0,0,0.25})
--RegisterObjectEffect(sql_objects, "dloot_elf_druid_cold", "Loot", {0,0,0.25})
--RegisterObjectEffect(sql_objects, "dloot_elf_ranger_cold", "Loot", {0,0,0.25})



RegisterObjectEffect(sql_objects, "worlditem_icemonolith_on", "DragonStone", {-0.4,0,0})