-- You Are Currently Editing: 
-----------------------------
--		GdsVariables.lua
-----------------------------


-- GdsCreateDoc HTML doc generator needs these:
numdoc = 1
doc = {}

------------------------------------------------------------------------

function CreateItemFlagName(Name)
	return "gi" .. Name
end

function CreateRewardFlagName(Name)
	return "gr" .. Name
end

function CreateGlobalCounterName(Name)
	return "gc" .. Name
end
function CreateGlobalFlagName(Name)
	return "gf" .. Name
end
function CreateGlobalStateName(Name)
	return "gs" .. Name
end
function CreateGlobalTimeName(Name)
	return "gt" .. Name
end

function CreatePlayerCounterName(Name)
	return "pc" .. Name
end
function CreatePlayerFlagName(Name)
	return "pf" .. Name
end
function CreatePlayerStateName(Name)
	return "ps" .. Name
end
function CreatePlayerTimeName(Name)
	return "pt" .. Name
end

function CreateNpcCounterName(Name)
	return "nc" .. Name .. "_Npc" .. tostring(NpcId) .. "_P" .. tostring(PlatformId)
end
function CreateNpcFlagName(Name)
	return "nf" .. Name .. "_Npc" .. tostring(NpcId) .. "_P" .. tostring(PlatformId)
end
function CreateNpcStateName(Name)
	return "ns" .. Name .. "_Npc" .. tostring(NpcId) .. "_P" .. tostring(PlatformId)
end
function CreateNpcTimeName(Name)
	return "nt" .. Name .. "_Npc" .. tostring(NpcId) .. "_P" .. tostring(PlatformId)
end


function CreatePlatformCounterName(Name)
	return "vc" .. Name .. "_P" .. tostring(PlatformId)
end
function CreatePlatformFlagName(Name)
	return "vf" .. Name .. "_P" .. tostring(PlatformId)
end
function CreatePlatformStateName(Name)
	return "vs" .. Name .. "_P" .. tostring(PlatformId)
end
function CreatePlatformTimeName(Name)
	return "vt" .. Name .. "_P" .. tostring(PlatformId)
end


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
--		VARIABLE ACTIONS ....
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------

if Application then 
	print("Registering GdsVariables.lua console set variable functions...")
	ConsoleDebug = TRUE
	doscript("GdsVariableStates.lua")
	doscript("GdsDefines.lua")
	DefineGlobalConstants()

	-- empty dummies, not needed in console	
	function LogGlobalVar(Name, Modify)
	end
	function LogPlayerVar(Name, Modify)
	end
	function LogNpcVar(Name, Modify)
	end
else
	ConsoleDebug = FALSE
end

------------------------------------------------------------------------
--		FLAG ACTIONS:
------------------------------------------------------------------------
-- **DOC** -----------------------------------------------------------
function SetItemFlagTrue(params)
	local FuncName = "GDS: SetItemFlagTrue(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	-- force naming conventions:
	params.Name = CreateItemFlagName(params.Name)
	LogGlobalVar(params.Name, Modify)

	if ConsoleDebug == TRUE then
		GdsMain:SetVariableInt(params.Name, GlobalVariable, TRUE)
		print(FuncName .. '"' .. params.Name .. '"')
	else
		return CGdsDbVariableSet:new(params.Name, GlobalVariable, TRUE)
	end
end

doc[numdoc] = [[Params: <code>Name = </code><br>Setzt das angegebene Item Flag auf WAHR. Aus Name = "MeinFlag" wird intern "giMeinFlag".]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function SetItemFlagFalse(params)
	local FuncName = "GDS: SetItemFlagFalse(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	-- force naming conventions:
	params.Name = CreateItemFlagName(params.Name)
	LogGlobalVar(params.Name, Modify)

	if ConsoleDebug == TRUE then
		GdsMain:SetVariableInt(params.Name, GlobalVariable, FALSE)
		print(FuncName .. '"' .. params.Name .. '"')
	else
		return CGdsDbVariableSet:new(params.Name, GlobalVariable, FALSE)
	end
end

doc[numdoc] = [[Params: <code>Name = </code><br>Setzt das angegebene Item Flag auf FALSCH. Aus Name = "MeinFlag" wird intern "giMeinFlag".]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function SetRewardFlagTrue(params)
	local FuncName = "GDS: SetRewardFlagTrue(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	-- force naming conventions:
	params.Name = CreateRewardFlagName(params.Name)
	LogGlobalVar(params.Name, Modify)

	if ConsoleDebug == TRUE then
		GdsMain:SetVariableInt(params.Name, GlobalVariable, TRUE)
		print(FuncName .. '"' .. params.Name .. '"')
	else
		return CGdsDbVariableSet:new(params.Name, GlobalVariable, TRUE)
	end
end

doc[numdoc] = [[Params: <code>Name = </code><br>Setzt das angegebene Reward Flag auf WAHR. Aus Name = "MeinFlag" wird intern "grMeinFlag".]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function SetRewardFlagFalse(params)
	local FuncName = "GDS: SetRewardFlagFalse(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	-- force naming conventions:
	params.Name = CreateRewardFlagName(params.Name)
	LogGlobalVar(params.Name, Modify)

	if ConsoleDebug == TRUE then
		GdsMain:SetVariableInt(params.Name, GlobalVariable, FALSE)
		print(FuncName .. '"' .. params.Name .. '"')
	else
		return CGdsDbVariableSet:new(params.Name, GlobalVariable, FALSE)
	end
end

doc[numdoc] = [[Params: <code>Name = </code><br>Setzt das angegebene Reward Flag auf FALSCH. Aus Name = "MeinFlag" wird intern "grMeinFlag".]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function SetGlobalFlagTrue(params)
	local FuncName = "GDS: SetGlobalFlagTrue(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	-- force naming conventions:
	params.Name = CreateGlobalFlagName(params.Name)
	LogGlobalVar(params.Name, Modify)

	if ConsoleDebug == TRUE then
		GdsMain:SetVariableInt(params.Name, GlobalVariable, TRUE)
		print(FuncName .. '"' .. params.Name .. '"')
	else
		return CGdsDbVariableSet:new(params.Name, GlobalVariable, TRUE)
	end
end

doc[numdoc] = [[Params: <code>Name = </code><br>Setzt das angegebene globale Flag auf WAHR. Aus Name = "MeinFlag" wird intern "gfMeinFlag".]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function SetGlobalFlagFalse(params)
	local FuncName = "GDS: SetGlobalFlagFalse(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	-- force naming conventions:
	params.Name = CreateGlobalFlagName(params.Name)
	LogGlobalVar(params.Name, Modify)

	if ConsoleDebug == TRUE then
		GdsMain:SetVariableInt(params.Name, GlobalVariable, FALSE)
		print(FuncName .. '"' .. params.Name .. '"')
	else
		return CGdsDbVariableSet:new(params.Name, GlobalVariable, FALSE)
	end
end

doc[numdoc] = [[Params: <code>Name = </code><br>Setzt das angegebene globale Flag auf FALSCH. Aus Name = "MeinFlag" wird intern "gfMeinFlag".]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function FlipGlobalFlag(params)
	local FuncName = "GDS: FlipGlobalFlag(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	-- force naming conventions:
	params.Name = CreateGlobalFlagName(params.Name)
	LogGlobalVar(params.Name, Modify)

	return CGdsDbVariableModify:new(params.Name, GlobalVariable, OperatorInvertBool, 0)
end

doc[numdoc] = [[Params: <code>Name = </code><br>Ändert das angegebene globale Flag in den entgegengesetzten Zustand (aus TRUE wird FALSE bzw. aus FALSE wird TRUE). Aus Name = "MeinFlag" wird intern "gfMeinFlag".]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function SetPlayerFlagTrue(params)
	local FuncName = "GDS: SetPlayerFlagTrue(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	-- force naming conventions:
	params.Name = CreatePlayerFlagName(params.Name)
	LogPlayerVar(params.Name, Modify)

	if ConsoleDebug == TRUE then
		GdsMain:SetVariableInt(params.Name, PlayerVariable, TRUE)
		print(FuncName .. '"' .. params.Name .. '"')
	else
		return CGdsDbVariableSet:new(params.Name, PlayerVariable, TRUE)
	end
end

doc[numdoc] = [[Params: <code>Name = </code><br>Setzt das angegebene Playerspezifische Flag auf WAHR. Aus Name = "MeinFlag" wird intern "pfMeinFlag".]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function SetPlayerFlagFalse(params)
	local FuncName = "GDS: SetPlayerFlagFalse(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	-- force naming conventions:
	params.Name = CreatePlayerFlagName(params.Name)
	LogPlayerVar(params.Name, Modify)

	if ConsoleDebug == TRUE then
		GdsMain:SetVariableInt(params.Name, PlayerVariable, FALSE)
		print(FuncName .. '"' .. params.Name .. '"')
	else
		return CGdsDbVariableSet:new(params.Name, PlayerVariable, FALSE)
	end
end

doc[numdoc] = [[Params: <code>Name = </code><br>Setzt das angegebene Playerspezifische Flag auf FALSCH. Aus Name = "MeinFlag" wird intern "pfMeinFlag".]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function SetNpcFlagTrue(params)
	local FuncName = "GDS: SetNpcFlagTrue(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	if ConsoleDebug == TRUE then
		assert2(params.NpcId, FuncName .. "MISSING PARAMETER: NpcId =")
		NpcId = params.NpcId
		params.NpcId = nil
		assert2(params.PlatformId, FuncName .. "MISSING PARAMETER: PlatformId =")
		PlatformId = params.PlatformId
		params.PlatformId = nil
	end
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	-- force naming conventions:
	params.Name = CreateNpcFlagName(params.Name)
	LogNpcVar(params.Name, Modify)

	if ConsoleDebug == TRUE then
		GdsMain:SetVariableInt(params.Name, NpcVariable, TRUE)
		print(FuncName .. '"' .. params.Name .. '"')
	else
		return CGdsDbVariableSet:new(params.Name, NpcVariable, TRUE)
	end
end

doc[numdoc] = [[Params: <code>Name = </code><br>Setzt das angegebene Npc lokale Flag auf WAHR. Aus Name = "MeinFlag" wird intern z.b. "nfMeinFlag_Npc1234".]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function SetNpcFlagFalse(params)
	local FuncName = "GDS: SetNpcFlagFalse(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	if ConsoleDebug == TRUE then
		assert2(params.NpcId, FuncName .. "MISSING PARAMETER: NpcId =")
		NpcId = params.NpcId
		params.NpcId = nil
		assert2(params.PlatformId, FuncName .. "MISSING PARAMETER: PlatformId =")
		PlatformId = params.PlatformId
		params.PlatformId = nil
	end
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	-- force naming conventions:
	params.Name = CreateNpcFlagName(params.Name)
	LogNpcVar(params.Name, Modify)

	if ConsoleDebug == TRUE then
		GdsMain:SetVariableInt(params.Name, NpcVariable, FALSE)
		print(FuncName .. '"' .. params.Name .. '"')
	else
		return CGdsDbVariableSet:new(params.Name, NpcVariable, FALSE)
	end
end

doc[numdoc] = [[Params: <code>Name = </code><br>Setzt das angegebene Npc lokale Flag auf FALSCH. Aus Name = "MeinFlag" wird intern z.b. "nfMeinFlag_Npc1234".]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function FlipNpcFlag(params)
	local FuncName = "GDS: FlipNpcFlag(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	-- force naming conventions:
	params.Name = CreateNpcFlagName(params.Name)
	LogNpcVar(params.Name, Modify)

	return CGdsDbVariableModify:new(params.Name, NpcVariable, OperatorInvertBool, 0)
end

doc[numdoc] = [[Params: <code>Name = </code><br>Ändert das angegebene NPC Flag in den entgegengesetzten Zustand (aus TRUE wird FALSE bzw. aus FALSE wird TRUE). Aus Name = "MeinFlag" wird intern "gfMeinFlag".]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function SetPlatformFlagTrue(params)
	local FuncName = "GDS: SetPlatformFlagTrue(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	if ConsoleDebug == TRUE then
		assert2(params.NpcId, FuncName .. "MISSING PARAMETER: NpcId =")
		NpcId = params.NpcId
		params.NpcId = nil
		assert2(params.PlatformId, FuncName .. "MISSING PARAMETER: PlatformId =")
		PlatformId = params.PlatformId
		params.PlatformId = nil
	end
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	-- force naming conventions:
	params.Name = CreatePlatformFlagName(params.Name)
	LogNpcVar(params.Name, Modify)

	if ConsoleDebug == TRUE then
		GdsMain:SetVariableInt(params.Name, NpcVariable, TRUE)
		print(FuncName .. '"' .. params.Name .. '"')
	else
		return CGdsDbVariableSet:new(params.Name, NpcVariable, TRUE)
	end
end

doc[numdoc] = [[Params: <code>Name = </code><br>Setzt das angegebene Npc lokale Flag auf WAHR. Aus Name = "MeinFlag" wird intern z.b. "nfMeinFlag_Npc1234".]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function SetPlatformFlagFalse(params)
	local FuncName = "GDS: SetPlatformFlagFalse(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	if ConsoleDebug == TRUE then
		assert2(params.NpcId, FuncName .. "MISSING PARAMETER: NpcId =")
		NpcId = params.NpcId
		params.NpcId = nil
		assert2(params.PlatformId, FuncName .. "MISSING PARAMETER: PlatformId =")
		PlatformId = params.PlatformId
		params.PlatformId = nil
	end
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	-- force naming conventions:
	params.Name = CreatePlatformFlagName(params.Name)
	LogNpcVar(params.Name, Modify)

	if ConsoleDebug == TRUE then
		GdsMain:SetVariableInt(params.Name, NpcVariable, FALSE)
		print(FuncName .. '"' .. params.Name .. '"')
	else
		return CGdsDbVariableSet:new(params.Name, NpcVariable, FALSE)
	end
end

doc[numdoc] = [[Params: <code>Name = </code><br>Setzt das angegebene Npc lokale Flag auf FALSCH. Aus Name = "MeinFlag" wird intern z.b. "nfMeinFlag_Npc1234".]]
doc[numdoc] = nil
numdoc = numdoc + 1
--------------------------------------------------------------------------------------------------------------



------------------------------------------------------------------------
--		COUNTER ACTIONS:
------------------------------------------------------------------------

-- **DOC** -----------------------------------------------------------
function RandomizeGlobalCounter(params)
	local FuncName = "GDS: RandomizeGlobalCounter(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	assert2(params.MaxValue, FuncName .. "MISSING PARAMETER: MaxValue =")
	assert2(getn(tkeys(params)) == 2, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	-- force naming conventions:
	params.Name = CreateGlobalCounterName(params.Name)
	LogGlobalVar(params.Name, Modify)

	return CGdsDbVariableModify:new(params.Name, GlobalVariable, OperatorSetRandom, params.MaxValue)
end

doc[numdoc] = [[Params: <code>Name = , MaxValue = </code><br>Setzt den angegebenen globalen Counter auf einen zufälligen Wert zwischen 0 und MaxValue. Also MaxValue == 100 würde einen zufälligen Wert zwischen 0 und (einschliesslich!) 100 zurückliefern. Benötigt man einen Wert zwischen z.b. 50 und 70, sollte man MaxValue auf 20 setzen und den Counter in einer weiteren IncreaseCounter Action um einen Step-Wert von 50 erhöhen um die Variable auf den gewünschten Bereich anzuheben. Aus Name = "MeinCounter" wird intern "gcMeinCounter".<br>WARNUNG: NICHT IM MULTIPLAYER EINSETZEN, DA CODE VORAUSSICHTLICH ZU DESYNCH IM MULTIPLAYER FÜHREN DÜRFTE! (random wird nicht auf jedem Rechner denselben Wert zurückliefern!)]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function ResetGlobalCounter(params)
	local FuncName = "GDS: ResetGlobalCounter(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	-- force naming conventions:
	params.Name = CreateGlobalCounterName(params.Name)
	LogGlobalVar(params.Name, Modify)

	if ConsoleDebug == TRUE then
		GdsMain:SetVariableInt(params.Name, GlobalVariable, 0)
		print(FuncName .. '"' .. params.Name .. '"')
	else
		return CGdsDbVariableSet:new(params.Name, GlobalVariable, 0)
	end
end

doc[numdoc] = [[Params: <code>Name = </code><br>Setzt den angegebenen globalen Counter zurück (auf den Wert 0). Aus Name = "MeinCounter" wird intern "gcMeinCounter".]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function IncreaseGlobalCounter(params)
	local FuncName = "GDS: IncreaseGlobalCounter(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	params.Step = params.Step or 1
	assert2(getn(tkeys(params)) == 2, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	-- force naming conventions:
	params.Name = CreateGlobalCounterName(params.Name)
	LogGlobalVar(params.Name, Modify)

	if ConsoleDebug == TRUE then
		GdsMain:SetVariableInt(params.Name, GlobalVariable, params.Step)
		print(FuncName .. '"' .. params.Name .. '" == ' .. params.Step .. "\nUse Step = x to set Counter to absolute value.")
	else
		return CGdsDbVariableModify:new(params.Name, GlobalVariable, Add, params.Step)
	end
end

doc[numdoc] = [[Params: <code>Name = , Step = 1</code><br>Erhöht den angegebenen globalen Counter um den Wert "Step", default ist 1. Aus Name = "MeinCounter" wird intern "gcMeinCounter".]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function DecreaseGlobalCounter(params)
	local FuncName = "GDS: DecreaseGlobalCounter(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	params.Step = params.Step or 1
	assert2(getn(tkeys(params)) == 2, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	-- force naming conventions:
	params.Name = CreateGlobalCounterName(params.Name)
	LogGlobalVar(params.Name, Modify)

	if ConsoleDebug == TRUE then
		GdsMain:SetVariableInt(params.Name, GlobalVariable, params.Step)
		print(FuncName .. '"' .. params.Name .. '" == ' .. params.Step .. "\nUse Step = x to set Counter to absolute value.")
	else
		return CGdsDbVariableModify:new(params.Name, GlobalVariable, Add, params.Step * -1)
	end
end

doc[numdoc] = [[Params: <code>Name = , Step = 1</code><br>Verringert den angegebenen globalen Counter um den Wert "Step", default ist 1. Aus Name = "MeinCounter" wird intern "gcMeinCounter".]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function ResetPlayerCounter(params)
	local FuncName = "GDS: ResetPlayerCounter(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	-- force naming conventions:
	params.Name = CreatePlayerCounterName(params.Name)
	LogPlayerVar(params.Name, Modify)

	if ConsoleDebug == TRUE then
		GdsMain:SetVariableInt(params.Name, PlayerVariable, 0)
		print(FuncName .. '"' .. params.Name .. '"')
	else
		return CGdsDbVariableSet:new(params.Name, PlayerVariable, 0)
	end
end

doc[numdoc] = [[Params: <code>Name = </code><br>Setzt den angegebenen Playerspezifischen Counter zurück (auf den Wert 0). Aus Name = "MeinCounter" wird intern "pcMeinCounter".]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function IncreasePlayerCounter(params)
	local FuncName = "GDS: IncreasePlayerCounter(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	params.Step = params.Step or 1
	assert2(getn(tkeys(params)) == 2, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	-- force naming conventions:
	params.Name = CreatePlayerCounterName(params.Name)
	LogPlayerVar(params.Name, Modify)

	if ConsoleDebug == TRUE then
		GdsMain:SetVariableInt(params.Name, PlayerVariable, params.Step)
		print(FuncName .. '"' .. params.Name .. '" == ' .. params.Step .. "\nUse Step = x to set Counter to absolute value.")
	else
		return CGdsDbVariableModify:new(params.Name, PlayerVariable, Add, params.Step)
	end
end

doc[numdoc] = [[Params: <code>Name = , Step = 1</code><br>Erhöht den angegebenen  Playerspezifischen Counter um den Wert "Step", default ist 1. Aus Name = "MeinCounter" wird intern "pcMeinCounter".]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function DecreasePlayerCounter(params)
	local FuncName = "GDS: DecreasePlayerCounter(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	params.Step = params.Step or 1
	assert2(getn(tkeys(params)) == 2, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	-- force naming conventions:
	params.Name = CreatePlayerCounterName(params.Name)
	LogPlayerVar(params.Name, Modify)

	if ConsoleDebug == TRUE then
		GdsMain:SetVariableInt(params.Name, PlayerVariable, params.Step)
		print(FuncName .. '"' .. params.Name .. '" == ' .. params.Step .. "\nUse Step = x to set Counter to absolute value.")
	else
		return CGdsDbVariableModify:new(params.Name, PlayerVariable, Add, params.Step * -1)
	end
end

doc[numdoc] = [[Params: <code>Name = , Step = 1</code><br>Verringert den angegebenen Playerspezifischen Counter um den Wert "Step", default ist 1. Aus Name = "MeinCounter" wird intern "pcMeinCounter".]]
doc[numdoc] = nil
numdoc = numdoc + 1


-- **DOC** -----------------------------------------------------------
function RandomizeNpcCounter(params)
	local FuncName = "GDS: RandomizeNpcCounter(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	assert2(params.MaxValue, FuncName .. "MISSING PARAMETER: MaxValue =")
	assert2(getn(tkeys(params)) == 2, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	-- force naming conventions:
	params.Name = CreateNpcCounterName(params.Name)
	LogNpcVar(params.Name, Modify)

	return CGdsDbVariableModify:new(params.Name, NpcVariable, OperatorSetRandom, params.MaxValue)
end

doc[numdoc] = [[Params: <code>Name = , MaxValue = </code><br>Setzt den angegebenen NPC Counter auf einen zufälligen Wert zwischen 0 und MaxValue. Also MaxValue == 100 würde einen zufälligen Wert zwischen 0 und (einschliesslich!) 100 zurückliefern. Benötigt man einen Wert zwischen z.b. 50 und 70, sollte man MaxValue auf 20 setzen und den Counter in einer weiteren IncreaseCounter Action um einen Step-Wert von 50 erhöhen um die Variable auf den gewünschten Bereich anzuheben. Aus Name = "MeinCounter" wird intern "ncMeinCounter".<br>WARNUNG: NICHT IM MULTIPLAYER EINSETZEN, DA CODE VORAUSSICHTLICH ZU DESYNCH IM MULTIPLAYER FÜHREN DÜRFTE! (random wird nicht auf jedem Rechner denselben Wert zurückliefern!)]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function ResetNpcCounter(params)
	local FuncName = "GDS: ResetNpcCounter(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	if ConsoleDebug == TRUE then
		assert2(params.NpcId, FuncName .. "MISSING PARAMETER: NpcId =")
		NpcId = params.NpcId
		params.NpcId = nil
		assert2(params.PlatformId, FuncName .. "MISSING PARAMETER: PlatformId =")
		PlatformId = params.PlatformId
		params.PlatformId = nil
	end
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	-- force naming conventions:
	params.Name = CreateNpcCounterName(params.Name)
	LogNpcVar(params.Name, Modify)

	if ConsoleDebug == TRUE then
		GdsMain:SetVariableInt(params.Name, NpcVariable, 0)
		print(FuncName .. '"' .. params.Name .. '"')
	else
		return CGdsDbVariableSet:new(params.Name, NpcVariable, 0)
	end
end

doc[numdoc] = [[Params: <code>Name = </code><br>Setzt den angegebenen Npc Counter zurück (auf den Wert 0). Aus Name = "MeinCounter" wird intern "ncMeinCounter_Npc1234".]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function IncreaseNpcCounter(params)
	local FuncName = "GDS: IncreaseNpcCounter(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	params.Step = params.Step or 1
	if ConsoleDebug == TRUE then
		assert2(params.NpcId, FuncName .. "MISSING PARAMETER: NpcId =")
		NpcId = params.NpcId
		params.NpcId = nil
		assert2(params.PlatformId, FuncName .. "MISSING PARAMETER: PlatformId =")
		PlatformId = params.PlatformId
		params.PlatformId = nil
	end
	assert2(getn(tkeys(params)) == 2, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	-- force naming conventions:
	params.Name = CreateNpcCounterName(params.Name)
	LogNpcVar(params.Name, Modify)

	if ConsoleDebug == TRUE then
		GdsMain:SetVariableInt(params.Name, NpcVariable, params.Step)
		print(FuncName .. '"' .. params.Name .. '" == ' .. params.Step .. "\nUse Step = x to set Counter to absolute value.")
	else
		return CGdsDbVariableModify:new(params.Name, NpcVariable, Add, params.Step)
	end
end

doc[numdoc] = [[Params: <code>Name = , Step = 1</code><br>Erhöht den angegebenen Npc Counter um den Wert "Step", default ist 1. Aus Name = "MeinCounter" wird intern "ncMeinCounter_Npc1234".]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function DecreaseNpcCounter(params)
	local FuncName = "GDS: DecreaseNpcCounter(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	params.Step = params.Step or 1
	if ConsoleDebug == TRUE then
		assert2(params.NpcId, FuncName .. "MISSING PARAMETER: NpcId =")
		NpcId = params.NpcId
		params.NpcId = nil
		assert2(params.PlatformId, FuncName .. "MISSING PARAMETER: PlatformId =")
		PlatformId = params.PlatformId
		params.PlatformId = nil
	end
	assert2(getn(tkeys(params)) == 2, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	-- force naming conventions:
	params.Name = CreateNpcCounterName(params.Name)
	LogNpcVar(params.Name, Modify)

	if ConsoleDebug == TRUE then
		GdsMain:SetVariableInt(params.Name, NpcVariable, params.Step)
		print(FuncName .. '"' .. params.Name .. '" == ' .. params.Step .. "\nUse Step = x to set Counter to absolute value.")
	else
		return CGdsDbVariableModify:new(params.Name, NpcVariable, Add, params.Step * -1)
	end
end

doc[numdoc] = [[Params: <code>Name = , Step = 1</code><br>Verringert den angegebenen Npc Counter um den Wert "Step", default ist 1. Aus Name = "MeinCounter" wird intern "ncMeinCounter_Npc1234".]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function IncreasePlatformCounter(params)
	local FuncName = "GDS: IncreasePlatformCounter(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	params.Step = params.Step or 1
	if ConsoleDebug == TRUE then
		assert2(params.NpcId, FuncName .. "MISSING PARAMETER: NpcId =")
		NpcId = params.NpcId
		params.NpcId = nil
		assert2(params.PlatformId, FuncName .. "MISSING PARAMETER: PlatformId =")
		PlatformId = params.PlatformId
		params.PlatformId = nil
	end
	assert2(getn(tkeys(params)) == 2, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	-- force naming conventions:
	params.Name = CreatePlatformCounterName(params.Name)
	LogNpcVar(params.Name, Modify)

	if ConsoleDebug == TRUE then
		GdsMain:SetVariableInt(params.Name, NpcVariable, params.Step)
		print(FuncName .. '"' .. params.Name .. '" == ' .. params.Step .. "\nUse Step = x to set Counter to absolute value.")
	else
		return CGdsDbVariableModify:new(params.Name, NpcVariable, Add, params.Step)
	end
end

doc[numdoc] = [[Params: <code>Name = , Step = 1</code><br>Erhöht den angegebenen Platform Counter um den Wert "Step", default ist 1. Aus Name = "MeinCounter" wird intern "vcMeinCounter".]]
doc[numdoc] = nil
numdoc = numdoc + 1
------------------------------------------------------------------------------------------------------------------------------------------------



------------------------------------------------------------------------
--		STATE ACTIONS:
------------------------------------------------------------------------

-- **DOC** -----------------------------------------------------------
function SetGlobalState(params)
	local FuncName = "GDS: SetGlobalState(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	assert2(params.State, FuncName .. "MISSING PARAMETER: State =")
	assert2(type(params.State) == "string", FuncName .. "INVALID PARAMETER: State = " .. params.State .. " is not a string")
	assert2(getn(tkeys(params)) == 2, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	-- find the state:
	local StateName = params.State
	params.State = tfind(VarStates, params.State)
	assert2(type(params.State) == "number", FuncName .. "ERROR: State \"" .. StateName .. "\" undefined!")
	
	-- force naming conventions:
	params.Name = CreateGlobalStateName(params.Name)
	LogGlobalVar(params.Name, Modify)

	if ConsoleDebug == TRUE then
		GdsMain:SetVariableInt(params.Name, GlobalVariable, params.State)
		print(FuncName .. '"' .. params.Name .. '" == ' .. params.State)
	else
		-- print(FuncName .. '"' .. params.Name .. '" == ' .. params.State)
		return CGdsDbVariableSet:new(params.Name, GlobalVariable, params.State)
	end
end

doc[numdoc] = [[Params: <code>Name = , State = </code><br>Setzt den angegebenen globalen State. Aus Name = "MeinState" wird intern "gsMeinState". Die States sind Strings und in GdsVariableStates.lua definiert. Wenn man einen neuen State benötigt, einfach entsprechend einen hinzufügen.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function SetPlayerState(params)
	local FuncName = "GDS: SetPlayerState(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	assert2(params.State, FuncName .. "MISSING PARAMETER: State =")
	assert2(type(params.State) == "string", FuncName .. "INVALID PARAMETER: State = " .. params.State .. " is not a string")
	assert2(getn(tkeys(params)) == 2, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	-- find the state:
	local StateName = params.State
	params.State = tfind(VarStates, params.State)
	assert2(type(params.State) == "number", FuncName .. "ERROR: State \"" .. StateName .. "\" undefined!")
	
	-- force naming conventions:
	params.Name = CreatePlayerStateName(params.Name)
	LogPlayerVar(params.Name, Modify)

	if ConsoleDebug == TRUE then
		GdsMain:SetVariableInt(params.Name, PlayerVariable, params.State)
		print(FuncName .. '"' .. params.Name .. '" == ' .. params.State)
	else
		return CGdsDbVariableSet:new(params.Name, PlayerVariable, params.State)
	end
end

doc[numdoc] = [[Params: <code>Name = , State = </code><br>Setzt den angegebenen Playerspezifischen State. Aus Name = "MeinState" wird intern "psMeinState". Die States sind Strings und in GdsVariableStates.lua definiert. Wenn man einen neuen State benötigt, einfach entsprechend einen hinzufügen.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function SetNpcState(params)
	local FuncName = "GDS: SetNpcState(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	assert2(params.State, FuncName .. "MISSING PARAMETER: State =")
	assert2(type(params.State) == "string", FuncName .. "INVALID PARAMETER: State = " .. params.State .. " is not a string")
	if ConsoleDebug == TRUE then
		assert2(params.NpcId, FuncName .. "MISSING PARAMETER: NpcId =")
		NpcId = params.NpcId
		params.NpcId = nil
		assert2(params.PlatformId, FuncName .. "MISSING PARAMETER: PlatformId =")
		PlatformId = params.PlatformId
		params.PlatformId = nil
	end
	assert2(getn(tkeys(params)) == 2, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	-- find the state:
	local StateName = params.State
	params.State = tfind(VarStates, params.State)
	assert2(type(params.State) == "number", FuncName .. "ERROR: State \"" .. StateName .. "\" undefined!")
	
	-- force naming conventions:
	params.Name = CreateNpcStateName(params.Name)
	LogNpcVar(params.Name, Modify)

	if ConsoleDebug == TRUE then
		GdsMain:SetVariableInt(params.Name, NpcVariable, params.State)
		print(FuncName .. '"' .. params.Name .. '" == ' .. params.State)
	else
		return CGdsDbVariableSet:new(params.Name, NpcVariable, params.State)
	end
end

doc[numdoc] = [[Params: <code>Name = , State = </code><br>Setzt den angegebenen Npc State. Aus Name = "MeinState" wird intern "nsMeinState_Npc1234". Die States sind Strings und in GdsVariableStates.lua definiert. Wenn man einen neuen State benötigt, einfach entsprechend einen hinzufügen.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function SetPlatformState(params)
	local FuncName = "GDS: SetPlatformState(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	assert2(params.State, FuncName .. "MISSING PARAMETER: State =")
	assert2(type(params.State) == "string", FuncName .. "INVALID PARAMETER: State = " .. params.State .. " is not a string")
	if ConsoleDebug == TRUE then
		assert2(params.NpcId, FuncName .. "MISSING PARAMETER: NpcId =")
		NpcId = params.NpcId
		params.NpcId = nil
		assert2(params.PlatformId, FuncName .. "MISSING PARAMETER: PlatformId =")
		PlatformId = params.PlatformId
		params.PlatformId = nil
	end
	assert2(getn(tkeys(params)) == 2, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	-- find the state:
	local StateName = params.State
	params.State = tfind(VarStates, params.State)
	assert2(type(params.State) == "number", FuncName .. "ERROR: State \"" .. StateName .. "\" undefined!")
	
	-- force naming conventions:
	params.Name = CreatePlatformStateName(params.Name)
	LogNpcVar(params.Name, Modify)

	if ConsoleDebug == TRUE then
		GdsMain:SetVariableInt(params.Name, NpcVariable, params.State)
		print(FuncName .. '"' .. params.Name .. '" == ' .. params.State)
	else
		return CGdsDbVariableSet:new(params.Name, NpcVariable, params.State)
	end
end

doc[numdoc] = [[Params: <code>Name = , State = </code><br>Setzt den angegebenen Platform State. Aus Name = "MeinState" wird intern "nsMeinState_Npc1234". Die States sind Strings und in GdsVariableStates.lua definiert. Wenn man einen neuen State benötigt, einfach entsprechend einen hinzufügen.]]
doc[numdoc] = nil
numdoc = numdoc + 1
------------------------------------------------------------------------------------------------------------------------------------------------



------------------------------------------------------------------------
--		TIMESTAMP ACTIONS:
------------------------------------------------------------------------

-- **DOC** ----------------------------------------------------------
function SetGlobalTimeStamp(params)
	local FuncName = "GDS: SetGlobalTimeStamp(): "
	if ConsoleDebug == TRUE then
		print(FuncName .. "does not work in console!")
		return
	end
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- force naming conventions:
	params.Name = CreateGlobalTimeName(params.Name)
	LogGlobalVar(params.Name, Modify)

	return CGdsDbSetTimestamp:new(params.Name, GlobalVariable)
end

doc[numdoc] = [[Params: <code>Name = </code><br>Setzt einen Timestamp, um später abfragen zu können, wieviel Zeit seither vergangen ist. Falls z.b. eine Quest ein Zeitlimit hat. Dieser Timestamp existiert global für alle Spieler. ]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function SetPlayerTimeStamp(params)
	local FuncName = "GDS: SetPlayerTimeStamp(): "
	if ConsoleDebug == TRUE then
		print(FuncName .. "does not work in console!")
		return
	end
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- force naming conventions:
	params.Name = CreatePlayerTimeName(params.Name)
	LogPlayerVar(params.Name, Modify)

	return CGdsDbSetTimestamp:new(params.Name, PlayerVariable)
end

doc[numdoc] = [[Params: <code>Name = </code><br>Setzt einen Timestamp, dieser Timestamp existiert nur für den aktuellen Spieler und nicht global.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function SetNpcTimeStamp(params)
	local FuncName = "GDS: SetNpcTimeStamp(): "
	
	if ConsoleDebug == TRUE then
		print(FuncName .. "does not work in console!")
		return
	end
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- force naming conventions:
	params.Name = CreateNpcTimeName(params.Name)
	LogNpcVar(params.Name, Modify, TRUE)

	return CGdsDbSetTimestamp:new(params.Name, NpcVariable)
end

doc[numdoc] = [[Params: <code>Name = </code><br>Setzt einen Npc Timestamp. Dieser Timestamp gilt nur für den Npc der ihn setzt und kann nur von diesem Npc abgefragt werden. ]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function SetPlatformTimeStamp(params)
	local FuncName = "GDS: SetPlatformTimeStamp(): "
	if ConsoleDebug == TRUE then
		print(FuncName .. "does not work in console!")
		return
	end
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- force naming conventions:
	params.Name = CreatePlatformTimeName(params.Name)
	LogNpcVar(params.Name, Modify, TRUE)

	return CGdsDbSetTimestamp:new(params.Name, NpcVariable)
end

doc[numdoc] = [[Params: <code>Name = </code><br>Setzt einen Platform Timestamp. Dieser Timestamp gilt nur für den Npc der ihn setzt und kann nur von diesem Npc abgefragt werden. ]]
doc[numdoc] = nil
numdoc = numdoc + 1


-- **DOC** ----------------------------------------------------------
function ClearGlobalTimeStamp(params)
	local FuncName = "GDS: ClearGlobalTimeStamp(): "
	if ConsoleDebug == TRUE then
		print(FuncName .. "does not work in console!")
		return
	end
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- force naming conventions:
	params.Name = CreateGlobalTimeName(params.Name)
	LogGlobalVar(params.Name, Modify)

	return CGdsDbVariableReset:new(params.Name, GlobalVariable)
end

doc[numdoc] = [[Params: <code>Name = </code><br>Löscht einen Timestamp. Das heisst er verhält sich so wie ein nicht gesetzter TimeStamp, alle TimeElapsed Abfragen auf ihn werden nicht wahr. ]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function ClearPlayerTimeStamp(params)
	local FuncName = "GDS: ClearPlayerTimeStamp(): "
	if ConsoleDebug == TRUE then
		print(FuncName .. "does not work in console!")
		return
	end
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- force naming conventions:
	params.Name = CreatePlayerTimeName(params.Name)
	LogPlayerVar(params.Name, Modify)

	return CGdsDbVariableReset:new(params.Name, PlayerVariable)
end

doc[numdoc] = [[Params: <code>Name = </code><br>Löscht einen Timestamp. Das heisst er verhält sich so wie ein nicht gesetzter TimeStamp, alle TimeElapsed Abfragen auf ihn werden nicht wahr.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function ClearNpcTimeStamp(params)
	local FuncName = "GDS: ClearNpcTimeStamp(): "
	if ConsoleDebug == TRUE then
		print(FuncName .. "does not work in console!")
		return
	end
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- force naming conventions:
	params.Name = CreateNpcTimeName(params.Name)
	LogNpcVar(params.Name, Modify, TRUE)

	return CGdsDbVariableReset:new(params.Name, NpcVariable)
end

doc[numdoc] = [[Params: <code>Name = </code><br>Löscht einen Timestamp. Das heisst er verhält sich so wie ein nicht gesetzter TimeStamp, alle TimeElapsed Abfragen auf ihn werden nicht wahr.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function ClearPlatformTimeStamp(params)
	local FuncName = "GDS: ClearPlatformTimeStamp(): "
	if ConsoleDebug == TRUE then
		print(FuncName .. "does not work in console!")
		return
	end
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name =")
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- force naming conventions:
	params.Name = CreatePlatformTimeName(params.Name)
	LogNpcVar(params.Name, Modify, TRUE)

	return CGdsDbVariableReset:new(params.Name, NpcVariable)
end

doc[numdoc] = [[Params: <code>Name = </code><br>Löscht einen Timestamp. Das heisst er verhält sich so wie ein nicht gesetzter TimeStamp, alle TimeElapsed Abfragen auf ihn werden nicht wahr.]]
doc[numdoc] = nil
numdoc = numdoc + 1


------------------------------------------------------------------------
--		QUESTSTATE ACTIONS:
------------------------------------------------------------------------

-- **DOC** ----------------------------------------------------------
function QuestBegin(params)
	local FuncName = "GDS: QuestBegin(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.QuestId, FuncName .. "MISSING PARAMETER: QuestId =")
	params.SubQuestActivate = params.SubQuestActivate or 0
	assert2(getn(tkeys(params)) == 2, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	if ConsoleDebug == TRUE then
		GdsMain:SetQuestState(params.QuestId, StateActive);
		print(FuncName .. "Quest " .. params.QuestId .. " begun (" .. StateActive .. ").")
		if params.SubQuestActivate ~= 0 then
			print("NOTE: SubQuestActive does not work in console!")
		end
	else
		return CGdsQuestBegin:new(params.QuestId, params.SubQuestActivate)
	end
end

doc[numdoc] = [[Params: <code>QuestId = , SubQuestActivate = FALSE</code><br>Beginnt die (Side/Main) Quest mit der ID QuestId. SubQuestActivate ist optional. Wenn gesetzt (TRUE), aktiviert es gleich die angegebene subquest mit. ]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function QuestSolve(params)
	local FuncName = "GDS: QuestSolve(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.QuestId, FuncName .. "MISSING PARAMETER: QuestId =")
	params.ActivateNextQuest = params.ActivateNextQuest or 0
	assert2(getn(tkeys(params)) == 2, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	if ConsoleDebug == TRUE then
		GdsMain:SetQuestState(params.QuestId, StateSolved);
		print(FuncName .. "Quest " .. params.QuestId .. " solved (" .. StateSolved .. ").")
		if params.ActivateNextQuest ~= 0 then
			print("NOTE: ActivateNextQuest does not work in console!")
		end
	else
		return CGdsQuestSolve:new(params.QuestId, params.ActivateNextQuest)
	end
end

doc[numdoc] = [[Params: <code>QuestId = , ActivateNextQuest = FALSE </code><br>Beendet die (Side/Main) Quest mit der ID QuestId. Wenn ActivateNextQuest gesetzt ist, wird gleich die nächste Quest mit aktiviert. ]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function QuestChangeState(params)
	local FuncName = "GDS: QuestChangeState(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.QuestId, FuncName .. "MISSING PARAMETER: QuestId =")
	assert2(params.State, FuncName .. "MISSING PARAMETER: State =")
	assert2(getn(tkeys(params)) == 2, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	if ConsoleDebug == TRUE then
		GdsMain:SetQuestState(params.QuestId, params.State);
		print(FuncName .. "Quest " .. params.QuestId .. " changed state (" .. params.State .. ").")
	else
		return CGdsQuestChangeState:new(params.QuestId, params.State)
	end
end

doc[numdoc] = [[Params: <code>QuestId = , State = </code><br>Ändert den Zustand einer (Side/Main) Quest. Es gibt folgende Queststates:<br>
<code>StateActive<br>
StateKnown<br>
StateSolved<br>
StateUnknown<br>
StateUnsolvable<br></code>]]
doc[numdoc] = nil
numdoc = numdoc + 1
------------------------------------------------------------------------------------------------------------------------------




------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
--		VARIABLE CONDITIONS ....
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------




---------------------------------------------------------------
--		FLAG CONDITIONS:
---------------------------------------------------------------

-- **DOC** -----------------------------------------------------------
function IsItemFlagTrue(params)
	local FuncName = "GDS: IsItemFlagTrue(): "
	if ConsoleDebug == TRUE then
		print(FuncName .. "does not work in console!")
		return
	end
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name = ")
	params.UpdateInterval = params.UpdateInterval or 60
	params.PropagateNilType = 1
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- force naming conventions:
	params.Name = CreateItemFlagName(params.Name)
	LogGlobalVar(params.Name)

	local condition = CGdsDbVariable:new(params.Name, GlobalVariable, TRUE, IsEqual, params.PropagateNilType)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>Name = , UpdateInterval = 60</code><br>Prüft ob das Item Flag WAHR ist (spieler hat item zumindest mal gehabt). Ein bisher nicht gesetztes Flag hat per default den Wert FALSE.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function IsItemFlagFalse(params)
	local FuncName = "GDS: IsItemFlagFalse(): "
	if ConsoleDebug == TRUE then
		print(FuncName .. "does not work in console!")
		return
	end
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name = ")
	params.UpdateInterval = params.UpdateInterval or 60
	params.PropagateNilType = 1
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- force naming conventions:
	params.Name = CreateItemFlagName(params.Name)
	LogGlobalVar(params.Name)

	local condition = CGdsDbVariable:new(params.Name, GlobalVariable, FALSE, IsEqual, params.PropagateNilType)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>Name = , UpdateInterval = 60</code><br>Prüft ob das Item Flag FALSCH ist (Spieler hatte das item noch nie oder nicht mehr). Ein bisher nicht gesetztes Flag hat per default den Wert FALSE.]]
doc[numdoc] = nil
numdoc = numdoc + 1


-- **DOC** -----------------------------------------------------------
function IsRewardFlagTrue(params)
	local FuncName = "GDS: IsRewardFlagTrue(): "
	if ConsoleDebug == TRUE then
		print(FuncName .. "does not work in console!")
		return
	end
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name = ")
	params.UpdateInterval = params.UpdateInterval or 60
	params.PropagateNilType = 1
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- force naming conventions:
	params.Name = CreateRewardFlagName(params.Name)
	LogGlobalVar(params.Name)

	local condition = CGdsDbVariable:new(params.Name, GlobalVariable, TRUE, IsEqual, params.PropagateNilType)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>Name = , UpdateInterval = 60</code><br>Prüft ob das Reward Flag WAHR ist. Ein bisher nicht gesetztes Flag hat per default den Wert FALSE.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function IsRewardFlagFalse(params)
	local FuncName = "GDS: IsRewardFlagFalse(): "
	if ConsoleDebug == TRUE then
		print(FuncName .. "does not work in console!")
		return
	end
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name = ")
	params.UpdateInterval = params.UpdateInterval or 60
	params.PropagateNilType = 1
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- force naming conventions:
	params.Name = CreateRewardFlagName(params.Name)
	LogGlobalVar(params.Name)

	local condition = CGdsDbVariable:new(params.Name, GlobalVariable, FALSE, IsEqual, params.PropagateNilType)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>Name = , UpdateInterval = 60</code><br>Prüft ob das Reward Flag FALSCH ist. Ein bisher nicht gesetztes Flag hat per default den Wert FALSE.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function IsGlobalFlagTrue(params)
	local FuncName = "GDS: IsGlobalFlagTrue(): "
	if ConsoleDebug == TRUE then
		print(FuncName .. "does not work in console!")
		return
	end
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name = ")
	params.UpdateInterval = params.UpdateInterval or 60
	params.PropagateNilType = 1
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- force naming conventions:
	params.Name = CreateGlobalFlagName(params.Name)
	LogGlobalVar(params.Name)

	local condition = CGdsDbVariable:new(params.Name, GlobalVariable, TRUE, IsEqual, params.PropagateNilType)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>Name = , UpdateInterval = 60</code><br>Prüft ob das globale Flag WAHR ist. Ein bisher nicht gesetztes Flag hat per default den Wert FALSE.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function IsGlobalFlagFalse(params)
	local FuncName = "GDS: IsGlobalFlagFalse(): "
	if ConsoleDebug == TRUE then
		print(FuncName .. "does not work in console!")
		return
	end
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name = ")
	params.UpdateInterval = params.UpdateInterval or 60
	params.PropagateNilType = 1
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- force naming conventions:
	params.Name = CreateGlobalFlagName(params.Name)
	LogGlobalVar(params.Name)

	local condition = CGdsDbVariable:new(params.Name, GlobalVariable, FALSE, IsEqual, params.PropagateNilType)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>Name = , UpdateInterval = 60</code><br>Prüft ob das globale Flag FALSCH ist. Ein bisher nicht gesetztes Flag hat per default den Wert FALSE.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function IsPlayerFlagTrue(params)
	local FuncName = "GDS: IsPlayerFlagTrue(): "
	if ConsoleDebug == TRUE then
		print(FuncName .. "does not work in console!")
		return
	end
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name = ")
	params.UpdateInterval = params.UpdateInterval or 60
	params.PropagateNilType = 1
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- force naming conventions:
	params.Name = CreatePlayerFlagName(params.Name)
	LogPlayerVar(params.Name)

	local condition = CGdsDbVariable:new(params.Name, PlayerVariable, TRUE, IsEqual, params.PropagateNilType)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>Name = , UpdateInterval = 60</code><br>Prüft ob das Player Flag WAHR ist. Ein bisher nicht gesetztes Flag hat per default den Wert FALSE.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function IsPlayerFlagFalse(params)
	local FuncName = "GDS: IsPlayerFlagFalse(): "
	if ConsoleDebug == TRUE then
		print(FuncName .. "does not work in console!")
		return
	end
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name = ")
	params.UpdateInterval = params.UpdateInterval or 60
	params.PropagateNilType = 1
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- force naming conventions:
	params.Name = CreatePlayerFlagName(params.Name)
	LogPlayerVar(params.Name)

	local condition = CGdsDbVariable:new(params.Name, PlayerVariable, FALSE, IsEqual, params.PropagateNilType)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>Name = , UpdateInterval = 60</code><br>Prüft ob das Player Flag FALSCH ist. Ein bisher nicht gesetztes Flag hat per default den Wert FALSE.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function IsNpcFlagTrue(params)
	local FuncName = "GDS: IsNpcFlagTrue(): "
	if ConsoleDebug == TRUE then
		print(FuncName .. "does not work in console!")
		return
	end
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name = ")
	params.UpdateInterval = params.UpdateInterval or 60
	params.PropagateNilType = 1
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- force naming conventions:
	params.Name = CreateNpcFlagName(params.Name)
	LogNpcVar(params.Name)

	local condition = CGdsDbVariable:new(params.Name, NpcVariable, TRUE, IsEqual, params.PropagateNilType)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>Name = , UpdateInterval = 60</code><br>Prüft ob das Npc Flag WAHR ist. Ein bisher nicht gesetztes Flag hat per default den Wert FALSE.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function IsNpcFlagFalse(params)
	local FuncName = "GDS: IsNpcFlagFalse(): "
	if ConsoleDebug == TRUE then
		print(FuncName .. "does not work in console!")
		return
	end
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name = ")
	params.UpdateInterval = params.UpdateInterval or 60
	params.PropagateNilType = 1
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- force naming conventions:
	params.Name = CreateNpcFlagName(params.Name)
	LogNpcVar(params.Name)

	local condition = CGdsDbVariable:new(params.Name, NpcVariable, FALSE, IsEqual, params.PropagateNilType)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>Name = , UpdateInterval = 60</code><br>Prüft ob das Npc Flag FALSCH ist. Ein bisher nicht gesetztes Flag hat per default den Wert FALSE.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function IsPlatformFlagTrue(params)
	local FuncName = "GDS: IsPlatformFlagTrue(): "
	if ConsoleDebug == TRUE then
		print(FuncName .. "does not work in console!")
		return
	end
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name = ")
	params.UpdateInterval = params.UpdateInterval or 60
	params.PropagateNilType = 1
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- force naming conventions:
	params.Name = CreatePlatformFlagName(params.Name)
	LogNpcVar(params.Name)

	local condition = CGdsDbVariable:new(params.Name, NpcVariable, TRUE, IsEqual, params.PropagateNilType)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>Name = , UpdateInterval = 60</code><br>Prüft ob das Platform Flag WAHR ist. Ein bisher nicht gesetztes Flag hat per default den Wert FALSE.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function IsPlatformFlagFalse(params)
	local FuncName = "GDS: IsPlatformFlagFalse(): "
	if ConsoleDebug == TRUE then
		print(FuncName .. "does not work in console!")
		return
	end
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name = ")
	params.UpdateInterval = params.UpdateInterval or 60
	params.PropagateNilType = 1
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- force naming conventions:
	params.Name = CreatePlatformFlagName(params.Name)
	LogNpcVar(params.Name)

	local condition = CGdsDbVariable:new(params.Name, NpcVariable, FALSE, IsEqual, params.PropagateNilType)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>Name = , UpdateInterval = 60</code><br>Prüft ob das Platform Flag FALSCH ist. Ein bisher nicht gesetztes Flag hat per default den Wert FALSE.]]
doc[numdoc] = nil
numdoc = numdoc + 1
------------------------------------------------------------------------------------------------------------------------------




---------------------------------------------------------------
--		COUNTER CONDITIONS:
---------------------------------------------------------------

-- **DOC** -----------------------------------------------------------
function IsGlobalCounter(params)
	local FuncName = "GDS: IsGlobalCounter(): "
	if ConsoleDebug == TRUE then
		print(FuncName .. "does not work in console!")
		return
	end
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name = ")
	assert2(params.Value, FuncName .. "MISSING PARAMETER: Value = ")
	params.Operator = params.Operator or IsEqual
	params.UpdateInterval = params.UpdateInterval or 60
	params.PropagateNilType = 1
	assert2(getn(tkeys(params)) == 5, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- force naming conventions:
	params.Name = CreateGlobalCounterName(params.Name)
	LogGlobalVar(params.Name)

	local condition = CGdsDbVariable:new(params.Name, GlobalVariable, params.Value, params.Operator, params.PropagateNilType)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>Name = , Value = , Operator = IsEqual, UpdateInterval = 60</code><br>Prüft ob der Counter den angegebenen Wert hat, bzw. je nach Operator grösser, kleiner, usw. ist. Es gibt folgende Operatoren:<br><code>IsEqual<br>IsGreater<br>IsGreaterOrEqual<br>IsLess<br>IsLessOrEqual<br>IsNotEqual<br></code><br>Ein bisher nicht verwendeter/veränderter Counter beginnt immer mit dem Wert 0.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function IsPlayerCounter(params)
	local FuncName = "GDS: IsPlayerCounter(): "
	if ConsoleDebug == TRUE then
		print(FuncName .. "does not work in console!")
		return
	end
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name = ")
	assert2(params.Value, FuncName .. "MISSING PARAMETER: Value = ")
	params.Operator = params.Operator or IsEqual
	params.UpdateInterval = params.UpdateInterval or 60
	params.PropagateNilType = 1
	assert2(getn(tkeys(params)) == 5, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- force naming conventions:
	params.Name = CreatePlayerCounterName(params.Name)
	LogPlayerVar(params.Name)

	local condition = CGdsDbVariable:new(params.Name, PlayerVariable, params.Value, params.Operator, params.PropagateNilType)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>Name = , Value = , Operator = IsEqual, UpdateInterval = 60</code><br>Prüft ob der Counter den angegebenen Wert hat, bzw. je nach Operator grösser, kleiner, usw. ist. Es gibt folgende Operatoren:<br><code>IsEqual<br>IsGreater<br>IsGreaterOrEqual<br>IsLess<br>IsLessOrEqual<br>IsNotEqual<br></code><br>Ein bisher nicht verwendeter/veränderter Counter beginnt immer mit dem Wert 0.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function IsNpcCounter(params)
	local FuncName = "GDS: IsNpcCounter(): "
	if ConsoleDebug == TRUE then
		print(FuncName .. "does not work in console!")
		return
	end
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name = ")
	assert2(params.Value, FuncName .. "MISSING PARAMETER: Value = ")
	params.Operator = params.Operator or IsEqual
	params.UpdateInterval = params.UpdateInterval or 60
	params.PropagateNilType = 1
	assert2(getn(tkeys(params)) == 5, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- force naming conventions:
	params.Name = CreateNpcCounterName(params.Name)
	LogNpcVar(params.Name)

	local condition = CGdsDbVariable:new(params.Name, NpcVariable, params.Value, params.Operator, params.PropagateNilType)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>Name = , Value = , Operator = IsEqual, UpdateInterval = 60</code><br>Prüft ob der Counter den angegebenen Wert hat, bzw. je nach Operator grösser, kleiner, usw. ist. Es gibt folgende Operatoren:<br><code>IsEqual<br>IsGreater<br>IsGreaterOrEqual<br>IsLess<br>IsLessOrEqual<br>IsNotEqual<br></code><br>Ein bisher nicht verwendeter/veränderter Counter beginnt immer mit dem Wert 0.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function IsPlatformCounter(params)
	local FuncName = "GDS: IsPlatformCounter(): "
	if ConsoleDebug == TRUE then
		print(FuncName .. "does not work in console!")
		return
	end
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name = ")
	assert2(params.Value, FuncName .. "MISSING PARAMETER: Value = ")
	params.Operator = params.Operator or IsEqual
	params.UpdateInterval = params.UpdateInterval or 60
	params.PropagateNilType = 1
	assert2(getn(tkeys(params)) == 5, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- force naming conventions:
	params.Name = CreatePlatformCounterName(params.Name)
	LogNpcVar(params.Name)

	local condition = CGdsDbVariable:new(params.Name, NpcVariable, params.Value, params.Operator, params.PropagateNilType)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>Name = , Value = , Operator = IsEqual, UpdateInterval = 60</code><br>Prüft ob der Counter den angegebenen Wert hat, bzw. je nach Operator grösser, kleiner, usw. ist. Es gibt folgende Operatoren:<br><code>IsEqual<br>IsGreater<br>IsGreaterOrEqual<br>IsLess<br>IsLessOrEqual<br>IsNotEqual<br></code><br>Ein bisher nicht verwendeter/veränderter Counter beginnt immer mit dem Wert 0.]]
doc[numdoc] = nil
numdoc = numdoc + 1
------------------------------------------------------------------------------------------------------------------------------




---------------------------------------------------------------
--		STATE CONDITIONS:
---------------------------------------------------------------

-- **DOC** -----------------------------------------------------------
function IsGlobalState(params)
	local FuncName = "GDS: IsGlobalState(): "
	if ConsoleDebug == TRUE then
		print(FuncName .. "does not work in console!")
		return
	end
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name = ")
	assert2(params.State, FuncName .. "MISSING PARAMETER: State = ")
	assert2(type(params.State) == "string", FuncName .. "INVALID PARAMETER: State = " .. params.State .. " is not a string")
	params.Operator = params.Operator or IsEqual
	params.UpdateInterval = params.UpdateInterval or 60
	params.PropagateNilType = 1
	assert2(getn(tkeys(params)) == 5, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- find the state:
	local StateName = params.State
	params.State = tfind(VarStates, params.State)
	assert2(type(params.State) == "number", FuncName .. "ERROR: State \"" .. StateName .. "\" undefined!")
	
	-- force naming conventions:
	params.Name = CreateGlobalStateName(params.Name)
	LogGlobalVar(params.Name)

	-- print(FuncName .. '"' .. params.Name .. '" - Operator: ' .. params.Operator .. ' - ' .. params.State)
	local condition = CGdsDbVariable:new(params.Name, GlobalVariable, params.State, params.Operator, params.PropagateNilType)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>Name = , State = , Operator = IsEqual, UpdateInterval = 60</code><br>Prüft ob der State den angegebenen Zustand hat, bzw. je nach Operator grösser, kleiner, usw. ist. Es gibt folgende Operatoren:<br><code>IsEqual<br>IsGreater<br>IsGreaterOrEqual<br>IsLess<br>IsLessOrEqual<br>IsNotEqual<br></code><br>Ein bisher nicht gesetzter State wird bei Abfragen immer das Ergebnis FALSCH zurückliefern.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function IsPlayerState(params)
	local FuncName = "GDS: IsPlayerState(): "
	if ConsoleDebug == TRUE then
		print(FuncName .. "does not work in console!")
		return
	end
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name = ")
	assert2(params.State, FuncName .. "MISSING PARAMETER: State = ")
	assert2(type(params.State) == "string", FuncName .. "INVALID PARAMETER: State = " .. params.State .. " is not a string")
	params.Operator = params.Operator or IsEqual
	params.UpdateInterval = params.UpdateInterval or 60
	params.PropagateNilType = 1
	assert2(getn(tkeys(params)) == 5, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- find the state:
	local StateName = params.State
	params.State = tfind(VarStates, params.State)
	assert2(type(params.State) == "number", FuncName .. "ERROR: State \"" .. StateName .. "\" undefined!")
	
	-- force naming conventions:
	params.Name = CreatePlayerStateName(params.Name)
	LogPlayerVar(params.Name)

	local condition = CGdsDbVariable:new(params.Name, PlayerVariable, params.State, params.Operator, params.PropagateNilType)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>Name = , State = , Operator = IsEqual, UpdateInterval = 60</code><br>Prüft ob der State den angegebenen Zustand hat, bzw. je nach Operator grösser, kleiner, usw. ist. Es gibt folgende Operatoren:<br><code>IsEqual<br>IsGreater<br>IsGreaterOrEqual<br>IsLess<br>IsLessOrEqual<br>IsNotEqual<br></code><br>Ein bisher nicht gesetzter State wird bei Abfragen immer das Ergebnis FALSCH zurückliefern.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function IsNpcState(params)
	local FuncName = "GDS: IsNpcState(): "
	if ConsoleDebug == TRUE then
		print(FuncName .. "does not work in console!")
		return
	end
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name = ")
	assert2(params.State, FuncName .. "MISSING PARAMETER: State = ")
	assert2(type(params.State) == "string", FuncName .. "INVALID PARAMETER: State = " .. params.State .. " is not a string")
	params.Operator = params.Operator or IsEqual
	params.UpdateInterval = params.UpdateInterval or 60
	params.PropagateNilType = 1
	assert2(getn(tkeys(params)) == 5, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- find the state:
	local StateName = params.State
	params.State = tfind(VarStates, params.State)
	assert2(type(params.State) == "number", FuncName .. "ERROR: State \"" .. StateName .. "\" undefined!")
	
	-- force naming conventions:
	params.Name = CreateNpcStateName(params.Name)
	LogNpcVar(params.Name)

	local condition = CGdsDbVariable:new(params.Name, NpcVariable, params.State, params.Operator, params.PropagateNilType)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>Name = , State = , Operator = IsEqual, UpdateInterval = 60</code><br>Prüft ob der Counter den angegebenen Wert hat, bzw. je nach Operator grösser, kleiner, usw. ist. Es gibt folgende Operatoren:<br><code>IsEqual<br>IsGreater<br>IsGreaterOrEqual<br>IsLess<br>IsLessOrEqual<br>IsNotEqual<br></code><br>Ein bisher nicht gesetzter State wird bei Abfragen immer das Ergebnis FALSCH zurückliefern.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function IsPlatformState(params)
	local FuncName = "GDS: IsPlatformState(): "
	if ConsoleDebug == TRUE then
		print(FuncName .. "does not work in console!")
		return
	end
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name = ")
	assert2(params.State, FuncName .. "MISSING PARAMETER: State = ")
	assert2(type(params.State) == "string", FuncName .. "INVALID PARAMETER: State = " .. params.State .. " is not a string")
	params.Operator = params.Operator or IsEqual
	params.UpdateInterval = params.UpdateInterval or 60
	params.PropagateNilType = 1
	assert2(getn(tkeys(params)) == 5, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- find the state:
	local StateName = params.State
	params.State = tfind(VarStates, params.State)
	assert2(type(params.State) == "number", FuncName .. "ERROR: State \"" .. StateName .. "\" undefined!")
	
	-- force naming conventions:
	params.Name = CreatePlatformStateName(params.Name)
	LogNpcVar(params.Name)

	local condition = CGdsDbVariable:new(params.Name, NpcVariable, params.State, params.Operator, params.PropagateNilType)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>Name = , State = , Operator = IsEqual, UpdateInterval = 60</code><br>Prüft ob der Counter den angegebenen Wert hat, bzw. je nach Operator grösser, kleiner, usw. ist. Es gibt folgende Operatoren:<br><code>IsEqual<br>IsGreater<br>IsGreaterOrEqual<br>IsLess<br>IsLessOrEqual<br>IsNotEqual<br></code><br>Ein bisher nicht gesetzter State wird bei Abfragen immer das Ergebnis FALSCH zurückliefern.]]
doc[numdoc] = nil
numdoc = numdoc + 1
------------------------------------------------------------------------------------------------------------------------------




---------------------------------------------------------------
--		TIMESTAMP CONDITIONS:
---------------------------------------------------------------

-- **DOC** -----------------------------------------------------------
function IsGlobalTimeElapsed(params)
	local FuncName = "GDS: IsGlobalTimeElapsed(): "
	if ConsoleDebug == TRUE then
		print(FuncName .. "does not work in console!")
		return
	end
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name = ")
	assert2(params.Seconds, FuncName .. "MISSING PARAMETER: Seconds = ")
	params.UpdateInterval = params.UpdateInterval or 60
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- force naming conventions:
	params.Name = CreateGlobalTimeName(params.Name)
	LogGlobalVar(params.Name)

	local condition = CGdsDbTimeElapsed:new(params.Name, GlobalVariable, params.Seconds * 10)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>Name = , Seconds = , UpdateInterval = 60 </code><br>Prüft ob bestimmte Zeit verstrichen ist, wenn ja wird die Condition wahr. Der Timestamp sollte vorher mit demselben Namen gesetzt worden sein. Bei Seconds kann man auch Zehntelsekunden in der Form 1.1 angeben, also eine Nachkommastelle mit Punkt getrennt.<br>UpdateInterval besagt wie häufig der Wert gepollt werden soll in GdSteps (10 GdSteps = 1 Sekunde). Der Default Wert ist 60 GdSteps (1 Minute) wenn UpdateInterval nicht angegeben wurde.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function IsPlayerTimeElapsed(params)
	local FuncName = "GDS: IsPlayerTimeElapsed(): "
	if ConsoleDebug == TRUE then
		print(FuncName .. "does not work in console!")
		return
	end
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name = ")
	assert2(params.Seconds, FuncName .. "MISSING PARAMETER: Seconds = ")
	params.UpdateInterval = params.UpdateInterval or 60
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- force naming conventions:
	params.Name = CreatePlayerTimeName(params.Name)
	LogPlayerVar(params.Name)

	local condition = CGdsDbTimeElapsed:new(params.Name, PlayerVariable, params.Seconds * 10)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>Name = , Seconds = , UpdateInterval = 60</code><br>Hier wird auf den Timestamp eines Spielers geprüft. Der Timestamp sollte vorher mit demselben Namen gesetzt worden sein. Bei Seconds kann man auch Zehntelsekunden in der Form 1.1 angeben, also eine Nachkommastelle mit Punkt getrennt.<br>UpdateInterval besagt wie häufig der Wert gepollt werden soll in GdSteps (10 GdSteps = 1 Sekunde). Der Default Wert ist 60 GdSteps (1 Minute) wenn UpdateInterval nicht angegeben wurde.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function IsNpcTimeElapsed(params)
	local FuncName = "GDS: IsNpcTimeElapsed(): "
	if ConsoleDebug == TRUE then
		print(FuncName .. "does not work in console!")
		return
	end
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name = ")
	assert2(params.Seconds, FuncName .. "MISSING PARAMETER: Seconds = ")
	params.UpdateInterval = params.UpdateInterval or 60
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- force naming conventions:
	params.Name = CreateNpcTimeName(params.Name)
	LogNpcVar(params.Name)

	local condition = CGdsDbTimeElapsed:new(params.Name, NpcVariable, params.Seconds * 10)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>Name = , Seconds = , UpdateInterval = 60</code><br>Wieder ein TimeStamp, dieser prüft auf den Timestamp eines Npc. Der Timestamp sollte vorher mit demselben Namen gesetzt worden sein. Bei Seconds kann man auch Zehntelsekunden in der Form 1.1 angeben, also eine Nachkommastelle mit Punkt getrennt.<br>UpdateInterval besagt wie häufig der Wert gepollt werden soll in GdSteps (10 GdSteps = 1 Sekunde). Der Default Wert ist 60 GdSteps (1 Minute) wenn UpdateInterval nicht angegeben wurde.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function IsPlatformTimeElapsed(params)
	local FuncName = "GDS: IsPlatformTimeElapsed(): "
	if ConsoleDebug == TRUE then
		print(FuncName .. "does not work in console!")
		return
	end
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Name, FuncName .. "MISSING PARAMETER: Name = ")
	assert2(params.Seconds, FuncName .. "MISSING PARAMETER: Seconds = ")
	params.UpdateInterval = params.UpdateInterval or 60
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- force naming conventions:
	params.Name = CreatePlatformTimeName(params.Name)
	LogNpcVar(params.Name)

	local condition = CGdsDbTimeElapsed:new(params.Name, NpcVariable, params.Seconds * 10)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>Name = , Seconds = , UpdateInterval = 60</code><br>Wieder ein TimeStamp. Der Timestamp sollte vorher mit demselben Namen gesetzt worden sein. Bei Seconds kann man auch Zehntelsekunden in der Form 1.1 angeben, also eine Nachkommastelle mit Punkt getrennt.<br>UpdateInterval besagt wie häufig der Wert gepollt werden soll in GdSteps (10 GdSteps = 1 Sekunde). Der Default Wert ist 60 GdSteps (1 Minute) wenn UpdateInterval nicht angegeben wurde.]]
doc[numdoc] = nil
numdoc = numdoc + 1


------------------------------------------------------------------------
--		QUESTSTATE CONDITIONS:
------------------------------------------------------------------------

-- **DOC** -----------------------------------------------------------
function QuestState(params)
	local FuncName = "GDS: QuestState(): "
	if ConsoleDebug == TRUE then
		print(FuncName .. "does not work in console!")
		return
	end
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.QuestId, FuncName .. "MISSING PARAMETER: QuestId =")
	assert2(params.State, FuncName .. "MISSING PARAMETER: State =")
	params.UpdateInterval = params.UpdateInterval or 60
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	local condition = CGdsQuestBookLookup:new(params.QuestId, params.State)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>QuestId = , State = , UpdateInterval = 60 </code><br>Prüft ob die angegebene Quest (QuestId=) sich in dem angegebenen State (State=) befindet – sollte das der Fall sein, so wäre diese Condition wahr.<br>Folgende Konstanten für QuestState sind definiert (Gross/Kleinschreibung beachten!):<br>
<code>StateActive<br>
StateKnown<br>
StateSolved<br>
StateUnknown<br>
StateUnsolvable<br></code>
UpdateInterval besagt wie häufig der Wert gepollt werden soll in GdSteps (10 GdSteps = 1 Sekunde). Der Default Wert ist 60 GdSteps (1 Minute) wenn UpdateInterval nicht angegeben wurde. ]]
doc[numdoc] = nil
numdoc = numdoc + 1
------------------------------------------------------------------------------------------------------------------------------
