-- this file registers all test objects to the DrwObjectLibrary
for id = 0,59 do
	local filename = "test_"..id..".msh"
	if FindMesh(filename) then
		-- print("loading "..filename)
		local object = ObjectLibrary:AddNewObject(kGtCategoryObject, 10000+id);
		local element = object:ElementMesh(filename);
	end
end
