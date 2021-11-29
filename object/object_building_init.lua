-- this file registers all building objects to the DrwObjectLibrary
-- and adds effect information

print("-- INITIALIZING BUILDINGS   object_building_init.lua")

RegisterEffect(kGdEffectBuilding, kDrwBuildingEffectFlame, EffectGet("BuildingFire"))
RegisterEffect(kGdEffectBuilding, kDrwBuildingEffectFlameSound, EffectGet("BuildingFireSound"))
RegisterEffect(kGdEffectBuilding, kDrwBuildingEffectSmoke, EffectGet("PlasmaSmoke"))
RegisterEffect(kGdEffectBuilding, kDrwBuildingEffectFlag, EffectGet("BuildingFlag"))
RegisterEffect(kGdEffectBuilding, kDrwBuildingEffectBuild, EffectGet("Build"))
RegisterEffect(kGdEffectBuilding, kDrwBuildingEffectDestroy, EffectGet("Destroy"))
RegisterEffect(kGdEffectBuilding, kDrwBuildingEffectOccupied, EffectGet("BuildingFlagOccupied"))

RegisterEffect(kGdEffectBuilding, kDrwBuildingEffectLightHuman, EffectGet("BuildingLightHuman"))
RegisterEffect(kGdEffectBuilding, kDrwBuildingEffectLightDwarf, EffectGet("BuildingLightDwarf"))
RegisterEffect(kGdEffectBuilding, kDrwBuildingEffectLightElf, EffectGet("BuildingLightElf"))
RegisterEffect(kGdEffectBuilding, kDrwBuildingEffectLightTroll, EffectGet("BuildingLightTroll"))
RegisterEffect(kGdEffectBuilding, kDrwBuildingEffectLightOrc, EffectGet("BuildingLightOrc"))
RegisterEffect(kGdEffectBuilding, kDrwBuildingEffectLightDarkelf, EffectGet("BuildingLightDarkelf"))

RegisterEffect(kGdEffectBuilding, kDrwBuildingEffectCow, EffectGet("Cow"))
RegisterEffect(kGdEffectBuilding, kDrwBuildingEffectPig, EffectGet("Pig"))
RegisterEffect(kGdEffectBuilding, kDrwBuildingEffectBoar, EffectGet("Boar"))


-- register a building object
local Register = function(t)
	if t.id then
		local pLib = CDrwMovieLibrary:new()
		local building = ObjectLibrary:AddNewBuilding(t.id, pLib)
		local frame  = ObjectLibrary:AddNewObject(kGtCategoryBuilding, t.id, 1, 0);

		local i = 1
		local j = 1
		while t.mesh[i] do
			local mesh = t.mesh[i]
			local element

			if strfind(mesh, "frame") then
			
			-- don't add scaffold

			else 
				if strfind(mesh, "decal") then
					element = building:ElementDecal(mesh..".msh")
					element:ChangeTypeToBuildingDecal()
					j = j + 1
				else 
					if FindBones(mesh) and FindAnim(mesh) then		-- has bones
						element = building:ElementSkin(mesh..".msh")
						local pMovie = pLib:AddNewMovie(j - 1, 0, 0)
						local pEffect = pMovie:AddAnimation(mesh..".boa")
						pEffect:SetRangeAndModes(0, 1, kDrwPlayLooped)
						j = j + 1
					else
						element = building:ElementMesh(mesh..".msh");
						j = j + 1
					end

					if FindBones(mesh) then
						building:AddAttachments(mesh .. ".bor")
					end
				end
			end

			i = i + 1
		end
		if t.selectionscaling then
			building:SetSelectSize(t.selectionscaling)
		end

		local i = 1
		while t.mesh[i] do
			if strfind(t.mesh[i], "frame") then
				frame:ElementMesh(t.mesh[i]..".msh")
			end
			i=i+1
		end

	else
		print("ERROR: Building id undefined - name is " .. t.mesh[1])
	end
end

function AttachEffect(objectid, effectname, offset)
	object = ObjectLibrary:GetObject(kGtCategoryBuilding, objectid)
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

----------------------------------------------------------------------------
local t = doscript("sql_building")
for i,v in t do
	if v.mesh and v.mesh[1] then 
		v.id = i
		Register(v)
	end
end


AttachEffect(17, "Temple")
AttachEffect(166, "SoulforgerCrystal")
AttachEffect(165, "SoulforgerCrystalGreen")

AttachEffect(153, "MiniFog")
AttachEffect(148, "MiniFog", {0,-3,0})
