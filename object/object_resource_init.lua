-- this file registers all resources (hardcoded)

print("-- INITIALIZING RESOURCES   object_resource_init.lua")

local kGdObjGrpBerryBushMin = tonumber("080",16)
local kGdObjGrpBerryBushMax = tonumber("0ff",16)
local kGdObjGrpStonesMin = tonumber("100",16)
local kGdObjGrpStonesMax = tonumber("1FF",16)
local kGdObjGrpTreesMin = tonumber("200",16)
local kGdObjGrpTreesMax = tonumber("2FF",16)
local kGdObjGrpManaSpringMin = tonumber("500",16) 
local kGdObjGrpManaSpringMax = tonumber("57f",16)
local kGdObjGrpManaHerbMin = tonumber("580",16) 
local kGdObjGrpManaHerbMax = tonumber("5ff",16)
local kGdObjGrpIronMin = tonumber("600",16)
local kGdObjGrpIronMax = tonumber("67f",16)
local kGdObjGrpMithrilMin = tonumber("680",16)
local kGdObjGrpMithrilMax = tonumber("6ff",16)
local kGdObjGrpFishMin = tonumber("700",16)
local kGdObjGrpFishMax = tonumber("77f",16)
local kGdObjGrpWheatMin = tonumber("300",16)
local kGdObjGrpWheatMax = tonumber("300",16)
local kGdObjGrpMushroomMin = tonumber("302",16)
local kGdObjGrpMushroomMax = tonumber("302",16)


local resource_objects = {
	{ min=kGdObjGrpBerryBushMin, max=kGdObjGrpBerryBushMax, meshbase="nature_berry_%02d", meshcount=6, shadow=0.5},
	{ min=kGdObjGrpWheatMin, max=kGdObjGrpWheatMax, meshbase="nature_wheat_step%02d", meshcount=12, shadow=0},
	{ min=kGdObjGrpMushroomMin, max=kGdObjGrpMushroomMax, meshbase="nature_mushroom_%02d", meshcount=12, shadow=0},
	{ min=kGdObjGrpStonesMin, max=kGdObjGrpStonesMax, meshbase="nature_crushable_rock%1d", meshcount=9, shadow=2.5 },
--	{ min=kGdObjGrpStonesMin, max=kGdObjGrpStonesMax, shadow=2.5, effectname="Sparkle4Point"},
-- wird intern gehandlet: (per scaling, bäume werden ganz normal registriert
--	{ min=kGdObjGrpTreesMin, max=kGdObjGrpTreesMax, }, 
	{ min=kGdObjGrpManaSpringMin, max=kGdObjGrpManaSpringMax, shadow=2.5, effectname="AriaFountain"}, -- missing meshes
	{ min=kGdObjGrpManaHerbMin, max=kGdObjGrpManaHerbMax, meshbase="nature_lenya_%02d", meshcount=9, selectionscaling=2, effectname="LeniaEffect" },
	{ min=kGdObjGrpIronMin, max=kGdObjGrpIronMax, meshbase="nature_iron_%02d", meshcount=9, shadow=2 },
	{ min=kGdObjGrpMithrilMin, max=kGdObjGrpMithrilMax, meshbase="nature_mitthril_%02d", meshcount=9, shadow=2.5 },
	{ min=kGdObjGrpFishMin, max=kGdObjGrpFishMax, shadow=0, effectname="Fish"},
}

-- old:
--	{256, 264}, -- crushable rock
--	{265, 511}, -- maybe other rocks?
--  {1408, 1535}, -- lenya (seperate this into more groups if more than 1 lenya "heap" should be defined)
--  {1536, 1663}, -- iron
--  {1664, 1791}, -- mithril

local sql_objects = doscript("sql_object")
for _,t in resource_objects do
	local ids = {} -- collect all ids of resource objects in DB

	for i = t.min,t.max do -- for each index in the given range
		if sql_objects[i] then -- check if registered in DB
			tinsert(ids,i)
		end
	end

	if getn(ids) < 1 then
		print("ERROR: no resource objects defined in DB for group",t.min,t.max)
	else
		if (t.meshcount == nil) then t.meshcount=1 end
		for mesh_no = 1,t.meshcount do
			local object = ObjectLibrary:CreateNewObject(kGtCategoryObject);

			-- create point shadow first
			if t.shadow and t.shadow ~= 0 then
				local element = object:ElementPointShadow("system_element_pointshadow.msh");
				element:SetSize(t.shadow)
				object:SetSelectSize(t.shadow) -- same as shadowsize
			end

			-- then the mesh
			if t.meshbase then
				local name = format(t.meshbase, mesh_no)
				local element = object:ElementMesh(name..".msh")
			end

			if t.effectname then
				local pEffect = EffectGet(t.effectname)
				if pEffect ~= nil then 
					if t.offset then
						NewMovie()
						Translation{min=offset}
						pEffect=NewObject{subobject=pEffect, movie=pMovie}
					end
				end
				object:ElementSubObject(tolua.cast(pEffect, "CDrwEffectObject"))
			end

			-- now register it:
			for i = 1,getn(ids) do
				ObjectLibrary:AddObject(object, kGtCategoryObject, ids[i], mesh_no-1);
			end
		end
	end
	local meshbase = t.meshbase or ""
	-- print("RESOURCES REGISTERED "..getn(ids).." in range "..t.min..", "..t.max.." with "..t.meshcount.." meshes. ("..meshbase.."*)")
end