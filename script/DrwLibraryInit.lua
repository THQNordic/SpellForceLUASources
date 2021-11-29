-- declare some useful functions for init -----------------------------------------------

function DrwGetRaceFromName(name)
	local _, race
	_, _, race = strfind(name, "[^_]+_(%a-)_")
	if race then
		race = "kGtRace" .. strcapitalize(race)
		local value = getglobal(race) -- lookup constant e.g. kGdRaceHuman
		if not value then _ALERT("Race not found: "..race.."\n") end
		race = value
	end
	return race;
end

function DrwGetCategoryFromName(name)
	local _, category
	_, _, category = strfind(name, "^(%a-)_");
	if category then
		if category == "nature" then
		  category = "object"
		end
		category = "kGtCategory" .. strcapitalize(category);
		local value = getglobal(category) -- lookup constant e.g. kGtCategoryFigure
		if not value then _ALERT("Category not found: "..category.."\n") end
		category = value -- lookup constant e.g. kGdRaceHuman
	end
	return category;
end

-- for debugging what is called:

--function doscript(name)
--	print('doscript("'..name..'")')
--	return %doscript(name)
--end


print("-- INITIALIZING DRW   DrwLibraryInit.lua")

doscript("DrwFiles")
-- init sound --------------------------------------------------------
doscript("DrwSound") -- register sound ids for use in effects + animations

-- init effects --------------------------------------------------------
assert(doscript("object_effect_helper"))	-- do effect scripts in set order
assert(doscript("object_effect_mesh"))
assert(doscript("object_effect_standard"))
assert(doscript("object_effect_cast"))
assert(doscript("object_effect_resolve"))
assert(doscript("object_effect_area"))
assert(doscript("object_effect_aura"))
assert(doscript("object_effect_monument"))
assert(doscript("object_effect_init"))
assert(doscript("object_effect_weapon"))
assert(doscript("object_effect_lakes"))
assert(doscript("object_effect_lantern"))
assert(doscript("object_effect_gates"))
assert(doscript("object_effect_tests"))
assert(doscript("object_effect_register"))
assert(doscript("object_effect_unitattachments"))


-- init buildings, equipment, nature-objects, piles --------------------
assert(doscript("object_building_init"))
assert(doscript("object_equipment_init"))
assert(doscript("object_nature_init"))
assert(doscript("object_resource_init"))

-- init figures --------------------------------------------------------
assert(doscript("object_blending_init"))
assert(doscript("object_figure_init"))

-- init test meshes for VL ---------------------------------------------
assert(doscript("object_test_init"))

print("DrwLibraryInit done.")
