-- copies of some GdsBase functions here for Coop Spawn Mode...

function CreateTransitionName(system, name, fromstate, tostate)
	assert(system ~= nil)
	assert(name ~= nil)
	assert(fromstate ~= nil)
	assert(tostate ~= nil)
	return system .. " - Transition - " .. name .. " - " .. fromstate .. " - " .. tostate
end

function OneTimeInitAction(_action)
	if type(_action) == "table" then GdsDebug:Assert("OneTimeInitAction() has wrong parameter type! Probably wrong type of brackets, use 'round' brackets instead of 'pointed' ones. () instead of {}.") end
	assert2(InitActions, "InitActions = nil")
    tinsert(InitActions, _action)
end

function PostScriptLoad(_PlatformId)
	if _DEBUG ~= 1 then return end
	print("\n--------------------- COOP  ---------------------------------------------------------------")
	--- debug ausgaben hier, z.b.:
	SetDumpLevel{DumpNpcIds = TRUE, AllVars = TRUE}
	DumpStates()
	DumpGlobalVars()
	DumpPlayerVars()
	DumpNpcVars()
	print("\nFinish GDS Logging " .. tostring(date("-- Date: %Y/%m/%d -- Time: %H:%M:%S")))
	print("----------------------- COOP  ----------- EOF -----------------------------------------------")

	print("-------------------- COOP  -------------- BEGIN DUMPING -----------------------------------------------")
	print("\nGDS: DumpAll: COOP   Dumping STATEMACHINES ...")
	GdsMain:Dump()
	print("\nGDS: DumpAll: COOP   Dumping QUESTSTATES ...")
	GdsMain:DumpQuestBook()
	print("\nGDS: DumpAll: COOP   Dumping VARS ...")
	GdsMain:DumpVars()
	print("------------------- COOP  --------------- END DUMPING -----------------------------------------------")
end
