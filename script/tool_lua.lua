-- This file contains the lua standard library for the game
-- which is called automatically in ScrEnvironment
-- there is also a version for tool_lua which is nearly identical!

---------------------------------------------------------------------
-- search_global(value, prefix, strip_prefix)
--
-- searches for a global variable with the given value 
-- if you specify a prefix, only variables with the given 
-- prefix will be searched.
--
-- returns the name of the global variable, if found - or nil
-- if you specify a 3rd parameter strip_prefix,
-- the returned name will be stripped of the prefix
--
-- especially useful if you are looking for the name of a constant:
-- search_global(38, "kGdJob") -> "kGdJobGoto"
--
function search_global(value, prefix, strip_prefix, not_this_prefix) 
	if prefix then prefix = "^"..prefix end -- convert to search expression
	for i,v in globals() do
		if prefix==nil or strfind(i, prefix) then
			if v==value then
				-- if more than one variables match, the result is any one of them.
				-- (it is not defined which one will be returned)
				-- you can exclude another group of variables with not_this_prefix
				if not_this_prefix==nil or not strfind(i, not_this_prefix) then
					if strip_prefix then
						return strsub(i,strlen(prefix))
					end
					return i
				end
			end
		end
	end
	return nil -- not found
end

function make_dict(table, prefix, strip_prefix, not_this_prefix) 
	result = {}
	if prefix then prefix = "^"..prefix end -- convert to search expression
	for i,v in table do
		if prefix==nil or strfind(i, prefix) then
			if not_this_prefix==nil or not strfind(i, not_this_prefix) then
				if strip_prefix then
					result[v] = strsub(i,strlen(prefix))
				else
					result[v] = i
				end
			end
		end
	end
	return result
end

-- switch() statements for lua!
--
-- example usage:
--
-- case = 1 -- or 2, or "x" or whatever
-- switch(case) 
-- {
--   [1] = function() print("one") end,
--   [2] = print,
--   default = function(x) print("default",x) end,
-- }
--
function switch(case)
	return function(codetable)
		local f
		f = codetable[%case] or codetable.default
		if f then
			if type(f)=="function" then
				return f(%case)
			else
				error("case "..tostring(%case).." not a function")
			end
		end
	end
end

-- like strupper applied only to the first character
function strcapitalize(str)
	return strupper(strsub(str, 1, 1)) .. strlower(strsub(str, 2));
end

-- Concat the contents of the parameter list,
-- separated by the string delimiter (just like in perl)
-- example: strjoin(", ", {"Anna", "Bob", "Charlie", "Dolores"})
function strjoin(delimiter, list)
	local len = getn(list)
	if len == 0 then return "" end
	local string = list[1]
	for i = 2, len do string = string .. delimiter .. list[i] end
	return string
end

-- Split text into a list consisting of the strings in text,
-- separated by strings matching delimiter (which may be a pattern). 
-- example: strsplit(",%s*", "Anna, Bob, Charlie,Dolores")
function strsplit(delimiter, text)
	local list = {}
	local pos = 1
	if strfind("", delimiter, 1) then -- this would result in endless loops
		error("delimiter matches empty string!")
	end
	while 1 do
		local first, last = strfind(text, delimiter, pos)
		if first then -- found?
			tinsert(list, strsub(text, pos, first-1))
			pos = last+1
		else
			tinsert(list, strsub(text, pos))
			break
		end
	end
	return list
end

-- a better standard compare function for sort
local standard_cmp = function(a,b) 
	if type(a) == type(b) then 
		return a < b 
	end	
	return type(a) < type(b) 
end

-- upgrade sort function (default compare function now accepts different types in table)
function sort(table, f_cmp)
	return %sort(table, f_cmp or %standard_cmp)
end

-- foreach replacement that sorts the indizes
function foreachsorted(t, f)
	local indizes = tkeys(t)
	sort(indizes)
	foreachi(indizes, function(_, i) %f(i, %t[i]) end)
end

-- print entire table
function dump(table)
	print("[" .. tostring(table) .. "]")
	if type(table) ~= "table" then
		print(table) -- dump is the same as print on non-table values
	else
		local indizes = tkeys(table)
		if getn(indizes) == 0 then
			print("<empty table>")
		else
			sort(indizes)
			foreachi(indizes, function(_, index)
				local value = %table[index]
				if type(index) == "string" then
					print(index .. ":\t" .. tostring(value))
				else
					print("[" .. index .. "]\t" .. tostring(value))
				end
			end)
		end
	end
	print("")
end

-- dofile for every lua file in folder
function dodirectory(directory, mask)
	mask = mask or "*.lua" -- default extension is lua
	local list = ScrReadDirectory(directory.."\\"..mask)
	local i=1
	sort(list)
	while list[i] do
		dofile(directory.."\\"..list[i])
		i=i+1
	end
end

-- user function for every file in (current) folder
-- example: fordirectory(print) or fordirectory(dofile, "*.lua") or fordirectory(execute, "*.bat", "C:\\")
function fordirectory(f, mask, directory)
	local prefix = "" -- default folder is current folder
	if directory then prefix = directory.."\\" end
	mask = mask or "*.*"  -- default mask is "all files with extension"
	local list = ScrReadDirectory(prefix..mask)
	local i=1
	sort(list)
	while list[i] do
		f(prefix..list[i])
		i=i+1
	end
end

-- do file in path
function import(name)
    if ScrSearchEnv ~= nil then
	    dofile(ScrSearchEnv(name, "PATH"))
    else
        dofile(name)
    end
end

-- check if a file exists, returns nil if not
function findfile(name)
	local f = openfile(name, "r")
	if f then
		closefile(f)
		return 1
	end
	return nil
end

-- advanced dofile function to report an error if file not found
function dofile(name)
	if findfile(name) then
		return %dofile(name)
	else
		print('dofile: file not found "' .. name .. '"')
		assert2(nil, 'dofile: file not found "' .. name .. '"')
		return nil
	end
end

-- read entire file and return as string
function readfile(name)
	local f = openfile(name, "rt")
	local s = read(f, "*a")
	closefile(f)
	return s
end

-- write string to a file
function writefile(name, content)
	local f = openfile(name, "wt")
	write(f, content)
	closefile(f)
end

-- table stuff: find a value in a table
function tfind(t, s)
	return foreachi(t, function(i, v) if v==%s then return i end end)
end

-- like tinsert for sets: only adds if not already in the table
function tadd(t, v) 
	if not tfind(t, v) then tinsert(t, v) end
end

-- makes a deep copy of a given table (the 2nd param is optional and for internal use)
-- circular dependencies are correctly copied.
function tcopy(t, lookup_table)
	local copy = {}
	for i,v in t do
		if type(v) ~= "table" then
			copy[i] = v
		else
			lookup_table = lookup_table or {}
			lookup_table[t] = copy
			if lookup_table[v] then
				copy[i] = lookup_table[v] -- we already copied this table. reuse the copy.
			else
				copy[i] = tcopy(v,lookup_table) -- not yet copied. copy it.
			end
		end
	end
	return copy
end

-- returns all keys of the given table as values (in an array-table)
function tkeys(t)
	local n=1
	local ret={}
	for i,v	in t do
		ret[n] = i
		n = n + 1
	end
	return ret
end

list_insert = tinsert

-- concatenates two list
function list_concat(l, m)
  local n = {}
  foreachi(l, function (i, v) list_insert(%n, v) end)
  foreachi(m, function (i, v) list_insert(%n, v) end)
  return n
end

-- eliminated all double entries from a list 
-- the remaining list entries keep their relative order
function list_converttoset(l)
    local inv = {}
    local r = {}
	assert(type(l) == "table")
    foreachi(l, function(i, v) 
		assert(v)
		if %inv[v] == nil then 
			%inv[v]=i 
		end 
	end)
    foreach(inv, function(i,v) list_insert(%r, i) end)
    sort(r, function(a,b) return %inv[a] < %inv[b] end)
    return r
end

-- improve functionality of execute to allow multiple parameter passing
function execute(...)
	local commandline = ""
	if arg.n == 1 then 
		commandline = arg[1]
	else
		for i = 1,arg.n do
			arg[i] = tostring(arg[i])
			if strfind(arg[i],"%s") and not strfind(arg[i], "\"") then
				-- quote arguments that contain spaces (and no quotes!)
				commandline = commandline .. " \"" .. arg[i] .. "\"" 
			else
				commandline = commandline .. " " .. arg[i]
			end
		end
		commandline = strsub(commandline, 2) -- remove extra space
	end
	if execute_echo then print("> "..commandline) end -- debug option: set execute_echo to non-nil
	return %execute(commandline)
end

-- define stdlib version number
_STDLIB_VERSION = "StandardLibrary 4.01"

-- only used locally - get version number from version string
local getversion = function(v)
	if type(v) ~= "string" then return 0 end
	return tonumber(gsub(v,".+(%d+%.%d+)","%1"),10) or 0
end

-- this function can be used to assert a minimum version of tool_lua and the standardlibrary (issues only a warning)
function assert_version(lua_check, stdlib_check)
	if lua_check and (%getversion(_VERSION) < lua_check) then
		_ALERT("Tool_lua.exe is too old - at least "..lua_check.." required!\n")
	end
	if stdlib_check and (%getversion(_STDLIB_VERSION) < stdlib_check) then
		_ALERT("Tool_lua.lua is too old - at least "..stdlib_check.." required!\n")
	end
end

-- check for high enough tool_lua.exe version for this library script:
assert_version(4.01)

-- stuff below is different between game and standalone lua:

-- do script in one of the game script dirs
function doscript(name)
	if not strfind(name, "%.lua") then
		name = name .. ".lua"
	end
	if not findfile(name) then
		if findfile("script/"..name) then
			name = "script/"..name
		end
		if findfile("object/"..name) then
			name = "object/"..name
		end
	end
	return dofile(name)
end

-- overload exit function
function exit(code)
	code = code or 0
	if code ~= 0 then
		print("lua exit code: " .. code) 
	end
	%exit(code)
end

-- fix a tolua bug (or downward incompatibility) and add a tolua debug function
if tolua then
	local origcast = tolua.cast
	tolua.cast = function(x, t)
		if type(x) == "userdata" then return %origcast(x, t) end
		return x
	end
	-- tolua info helps dumping info on tolua objects
	tolua.info = function(x)
		if x then
			if type(x) == "userdata" then
				x = tolua.type(x)
			end
			local i = tfind(ScrGetRegistry().tolua_tbl_itype, x)
			if i then
				print(x) -- print class name 
				-- and all member functions
				foreachsorted(ScrGetRegistry().tolua_tbl_class[i], function(j,v)
					if type(v) == "function" then 
						print(":" .. j .. "()") 
					end 
				end)
				-- and all member variables
				foreachsorted(ScrGetRegistry().tolua_tbl_class[i][".get"], function(j,v) print("." .. j) end)
			end
		end
	end
end


function assert2(Expr, ErrorMsg)
	if not Expr then
		ErrorMsg = ErrorMsg or "Sorry, there is no detailed error message for this assertion!"
		local msg = "ERROR in script for NPC " .. tostring(NpcId) .. "!\n"
		--msg = msg .. "You can usually IGNORE this warning but quests, spawning or other scripts may not work correctly.\n"
		msg = msg .. "\nn" .. tostring(NpcId) .. ".lua: " .. ErrorMsg .. "\n\nSee GdsLog.txt in redist folder for more details."
		_ALERT(msg)
		if GdsDebug then
			GdsDebug:Assert(msg)
		end
		error(msg)
	end
end
