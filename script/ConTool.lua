-- useful functions to call from console.
-- mostly for debugging...

-- print statistic info on current figures in the world
function CountFigures()
	local count = {}
	local total_count = 0
	print("-- Counting Figures:")
	for i = 1,Figure:GetMaxUsed() do
		if Figure:InUse(i) == 1 then
			local key = Figure:GetRace(i)
			count[key] = (count[key] or 0) + 1
			total_count = total_count + 1
		end
	end
	local s=""
	for i,v in count do
		local name = search_global(i, "kGtRace", 1)
		if name then
			s = s .. name .. ": " .. v .. ", "
		else
			s = s .. "unknown race #"..i..": " .. v .. ", "
		end
	end
	if s ~= "" then print(s) end
	print("Total: " .. tostring(total_count))
end

-- print statistic info on the objects specified by parameters
function GdCount(gd_class_name, get_func, prefix, not_this_prefix)
	local count = {}
	local total_count = 0
	local gd_class = getglobal(gd_class_name)
	print("-- Counting "..gd_class_name.."s:")
	for i = 1,gd_class:GetMaxUsed() do
		if gd_class:InUse(i) == 1 then
			local key = gd_class[get_func](gd_class, i)
			count[key] = (count[key] or 0) + 1
			total_count = total_count + 1
		end
	end
	local s=""
	for i,v in count do
		local name = prefix and search_global(i, prefix, 1, not_this_prefix)
		if name then
			s = s .. name .. ": " .. v .. ", "
		else
			s = s .. "#"..i..": " .. v .. ", "
		end
	end
	if s ~= "" then print(s) end
	print("Total: " .. total_count)
end

-- print statistic info on the objects specified by parameters
function GdList(gd_class_name, ...)
	local gd_class = getglobal(gd_class_name)
	print("-- Listing "..gd_class_name.."s:")
	for i = 1,gd_class:GetMaxUsed() do
		if gd_class:InUse(i) == 1 then
			local s=gd_class_name .. " " .. i .. ": "
			for _,params in arg do 
				local get_func, prefix, not_this_prefix
				if type(params) == "table" then
					get_func, prefix, not_this_prefix = params[1], params[2], params[3]
				elseif type(params) == "string" then
					get_func = params
				end
				if get_func then
					local info = gd_class[get_func](gd_class, i)
					local name = prefix and search_global(info, prefix, 1, not_this_prefix)
					if name then
						s = s .. name .. ", "
					else
						s = s .. tostring(info) .. ", "
					end
				end
			end
			if s ~= "" then print(s) end
		end
	end
end

function Statistics()
	-- CountFigures() -- the same as:
	GdCount("Figure", "GetRace", "kGtRace")

	GdCount("Building", "GetType", "kGdBuilding", "kGdBuildingCalc")
	GdCount("Spell", "GetSpellLine", "kGdSpellLine")
	GdCount("Effect", "GetType")
end

function ListFigures()
	GdList("Figure", "GetX", "GetY", {"GetRace", "kGtRace"}, "GetLifeCurrent")
end

function ListEffects()
	GdList("Effect", "GetX", "GetY", {"GetType", "kGdEffect"}, {"GetTargetType", "kGdTarget"}, "GetTargetObject")
end

function ListSpells()
	GdList("Spell", "GetX", "GetY", {"GetSpellLine", "kGdSpellLine"}, {"GetTargetType", "kGdTarget"}, "GetTargetObject")
end
