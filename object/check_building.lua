-- this file registers all building objects to the DrwObjectLibrary

meshes = {}

-- register a building object
local Register = function(t)
end

----------------------------------------------------------------------------
local t = dofile("../script/sql_building.lua")
for _,v in t do
	if v.mesh and v.mesh[1] then 
		i = 1
		while v.mesh[i] do
			meshes[v.mesh[i]] = 1
			i = i + 1
		end
	end
end

t = dofile("../script/sql_object.lua")
for _,v in t do
	if v.mesh then 
		if strfind(v.mesh, "^building") then
			meshes[v.mesh] = 1
		end
	end
end

-- dump(meshes)

function check(name)
	name = gsub(name, "%.ms[bh]", "")
	name = gsub(name, "^.+\\", "")
	if meshes[name] then
		meshes[name] = 2
	else
		print("unused mesh: "..name)
	end
end

fordirectory(check, "building*.ms?", "../mesh")

for i,v in meshes do
	if v==1 then
		print("missing mesh: "..i)
	end
end
pause()