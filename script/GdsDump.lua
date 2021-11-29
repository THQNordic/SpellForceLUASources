-- You Are Currently Editing: 
-----------------------------
--		GdsDump.lua
-----------------------------

-- GdsCreateDoc HTML doc generator needs these:
numdoc = 1
doc = {}


GdsLogFileName = tostring(LogDirectory) .. "GdsLog.txt"
--print("Logging GDS to: " .. tostring(GdsLogFileName))

-- override application logging, log GDS stuff to different logfile
function ClearGdsLog()
	if _DEBUG ~= TRUE then return end

	if NpcId == 0 then
		remove(GdsLogFileName)
		print("Logging GDS to: " .. tostring(GdsLogFileName))
		print("Begin GDS Logging " .. tostring(date("-- Date: %Y/%m/%d -- Time: %H:%M:%S")) .. "\n")
	end
end

function _ALERT(s)
	if _DEBUG ~= TRUE then return end

	local f = openfile(GdsLogFileName, "a+")
	write(f, s .. "\n")
	closefile(f)

	local f = openfile(LogDirectory .. "log.txt", "a+")
	write(f, s .. "\n")
	closefile(f)
end

-- override assert
function assert (v, msg)
	if _DEBUG ~= TRUE then return end

	if not v then
		msg = msg or "\nSorry again, I was too lazy to type in a meaningful message. Feel free to kick my ass whenever you want to..."
		msg = "I am sorry, I got something wrong and can not continue. The cause of this error is:\n" .. msg
		print(msg)
		if GdsDebug then
			GdsDebug:Assert(msg)
		end
		error(msg)
	end
end


function BeginLog(_NpcId)
	if _DEBUG ~= TRUE then return end

	-- log Npc Statemachine No
	if not counter then
		counter = 1
	else
		counter = counter + 1
	end
	if _NpcId == 0 then
		counter = 0
	end
	
	print("GDS: ================ NPC " .. tostring(_NpcId) .. " -- StateMachine No " .. tostring(counter) .. ". ===================")

	if Debug and Debug.DisableCutscenes == 1 and _NpcId == 0 and _DEBUG == 1 then
		print("WARNING: CutScenes are disabled via config.lua!\n")
	end
end

------------------------------------------------------------------------
--		WATCH VARS STUFF ....
------------------------------------------------------------------------

function InitWatchVarsSystem()
	if _DEBUG ~= TRUE then return end

	WatchedVars = {}
	WatchStates = nil
	WatchStatesNoise = nil
	
	NpcDump = nil

	if NpcId == 0 then
		remove("script/!test/GdsWatchedVarsTemp.lua")
	end
end

function CreateWatchVarsSystem()
	if _DEBUG ~= TRUE then return end

	DumpVarsOnlyOnce = nil

	if NpcDump == WAHR and NpcId == 0 then
		--print("\nGDS: DumpAll: Dumping STATEMACHINES ...")
		--GdsMain:Dump(0)
		print("\nGDS: DumpAll: Dumping QUESTSTATES ...")
		GdsMain:DumpQuestBook()
		print("\nGDS: DumpAll: Dumping VARS ...")
		GdsMain:DumpVars()
		NpcDump = nil
	end

	-- early out...
	if getn(WatchedVars) < 1 and WatchStates == nil then return end

	f, msg = openfile("script/!test/GdsWatchedVarsTemp.lua", "a+")
	if not f then
		print("CreateWatchVarsSystem(): open file: script/!test/GdsWatchedVarsTemp.lua\nResult:" .. tostring(msg))
		return
	end

	write(f, "function Watch" .. NpcId .. "(toggle)\n")
	write(f, "\tprint('now executing Watch"..NpcId.."() function') \n")
	write(f, "\tif toggle == 1 then\n")

	if WatchStates then
		if WatchStatesNoise then
			write(f, "\t\tGdsMain:WatchNpc("..NpcId..", CGdsDebug.kNoise)\n")
			GdsMain:WatchNpc(NpcId, CGdsDebug.kNoise)
		else
			write(f, "\t\tGdsMain:WatchNpc("..NpcId..", CGdsDebug.kModify)\n")
			GdsMain:WatchNpc(NpcId, CGdsDebug.kModify)
		end
	end

	if getn(WatchedVars) > 0 then
		foreachi(WatchedVars, function (_i, _name)
			write(f, "\t\tGdsMain:WatchVar(\"".._name.."\", CGdsDebug.kModify)\n")
			GdsMain:WatchVar(_name, CGdsDebug.kModify)
		end)
	end

	write(f, "\telse\n")

	if WatchStates then
		write(f, "\t\tGdsMain:UnwatchNpc("..NpcId..")\n")
	end

	if getn(WatchedVars) > 0 then
		foreachi(WatchedVars, function (_i, _name)
			write(f, "\t\tGdsMain:UnwatchVar(\"".._name.."\")\n")
		end)
	end

	write(f, "\tend\n")

	write(f, "end\n")
	--write(f, "print('now calling Watch"..NpcId.."() function') \n")
	write(f, "Watch" .. NpcId .. "(1)\n\n")

	closefile(f)
end

-- **DOC** ----------------------------------------------------------
function WatchGlobalCounter(Name)
	if _DEBUG ~= TRUE then return end
	tinsert(WatchedVars, CreateGlobalCounterName(Name))
end
doc[numdoc] = [[Die angegebene Variable wird mittels GdsMain:WatchVar(Name, CGdsDebug.kModify) auf Veränderungen überwacht, die dumps werden ins log.txt geschrieben. Das watching ist gleich zu Beginn der Karte aktiv, und lässt sich pro NPC in dem mind. einer der Befehle benutzt wurde mittels Watch1240(0) abschalten und mit Watch1240(1) wieder anschalten. "1240" steht hier beispielhaft für eine beliebige NpcId.]]
docWatch = doc[numdoc]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function WatchGlobalFlag(Name)
	if _DEBUG ~= TRUE then return end
	tinsert(WatchedVars, CreateGlobalFlagName(Name))
end
doc[numdoc] = docWatch
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function WatchGlobalState(Name)
	if _DEBUG ~= TRUE then return end
	tinsert(WatchedVars, CreateGlobalStateName(Name))
end
doc[numdoc] = docWatch
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function WatchGlobalTimeStamp(Name)
	if _DEBUG ~= TRUE then return end
	tinsert(WatchedVars, CreateGlobalTimeName(Name))
end
doc[numdoc] = docWatch
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function WatchPlayerCounter(Name)
	if _DEBUG ~= TRUE then return end
	tinsert(WatchedVars, CreatePlayerCounterName(Name))
end
doc[numdoc] = docWatch
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function WatchPlayerFlag(Name)
	if _DEBUG ~= TRUE then return end
	tinsert(WatchedVars, CreatePlayerFlagName(Name))
end
doc[numdoc] = docWatch
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function WatchPlayerState(Name)
	if _DEBUG ~= TRUE then return end
	tinsert(WatchedVars, CreatePlayerStateName(Name))
end
doc[numdoc] = docWatch
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function WatchPlayerTimeStamp(Name)
	if _DEBUG ~= TRUE then return end
	tinsert(WatchedVars, CreatePlayerTimeName(Name))
end
doc[numdoc] = docWatch
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function WatchNpcCounter(Name)
	if _DEBUG ~= TRUE then return end
	tinsert(WatchedVars, CreateNpcCounterName(Name))
end
doc[numdoc] = docWatch
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function WatchNpcFlag(Name)
	if _DEBUG ~= TRUE then return end
	tinsert(WatchedVars, CreateNpcFlagName(Name))
end
doc[numdoc] = docWatch
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function WatchNpcState(Name)
	if _DEBUG ~= TRUE then return end
	tinsert(WatchedVars, CreateNpcStateName(Name))
end
doc[numdoc] = docWatch
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function WatchNpcTimeStamp(Name)
	if _DEBUG ~= TRUE then return end
	tinsert(WatchedVars, CreateNpcTimeName(Name))
end
doc[numdoc] = docWatch
doc[numdoc] = nil
numdoc = numdoc + 1

docWatch = nil

-- **DOC** ----------------------------------------------------------
function WatchStateMachine(Noise)
	if _DEBUG ~= TRUE then return end
	if Noise then WatchStatesNoise = TRUE end
	WatchStates = TRUE
	NpcDump = TRUE
end
doc[numdoc] = [[Wenn verwendet, wird zusätzlich das logging von State Machine transitions aktiviert.]]
doc[numdoc] = nil
numdoc = numdoc + 1


------------------------------------------------------------------------
--		DUMP VARS STUFF ....
------------------------------------------------------------------------

-- Container für benutzte Variablen:
GlobalVars	= GlobalVars or {}
PlayerVars	= PlayerVars or {}
NpcVars		= NpcVars or {}
DumpNpcIds	= nil
DumpAllVars	= nil
Modify		= 1

function AddVar(Name, Modify, Timer)
	--if _DEBUG ~= TRUE then return end

	local var = {}
	local ids = {}
	ids[1] = NpcId
	var.NpcId	= ids
	var.Name	= Name
	var.Timer	= Timer
	if Modify then
		var.NumModify	= 1
		var.NumRead		= 0
	else
		var.NumModify	= 0
		var.NumRead		= 1
	end
	
	return var
end

function UpdateVar(var, Modify)
	--if _DEBUG ~= TRUE then return end

	if not tfind(var.NpcId, NpcId) then tinsert(var.NpcId, NpcId) end
	if Modify then
		var.NumModify = var.NumModify + 1
	else
		var.NumRead = var.NumRead + 1
	end
end

function LogGlobalVar(Name, Modify)
	--if _DEBUG ~= TRUE then return end

	--print("Log GLOBAL: " .. Name)
	if GlobalVars[Name] == nil then
		GlobalVars[Name] = AddVar(Name, Modify)
	else
		UpdateVar(GlobalVars[Name], Modify)
	end
end

function LogPlayerVar(Name, Modify)
	--if _DEBUG ~= TRUE then return end

	--print("Log PLAYER var: " .. Name)
	if PlayerVars[Name] == nil then
		PlayerVars[Name] = AddVar(Name, Modify)
	else
		UpdateVar(PlayerVars[Name], Modify)
	end
end

function LogNpcVar(Name, Modify, Timer)
	--if _DEBUG ~= TRUE then return end

	if NpcVars[Name] == nil then
		--print("ADD NPC var: " .. Name .. " -- Modify: " .. tostring(Modify))
		NpcVars[Name] = AddVar(Name, Modify, Timer)
	else
		--print("UPDATE NPC var: " .. Name .. " -- Modify: " .. tostring(Modify))
		UpdateVar(NpcVars[Name], Modify)
	end
end


function GdsDumpVars(table)
	if _DEBUG ~= TRUE then return end

	local indizes = tkeys(table)
	if getn(indizes) == 0 then
		print("<empty table>")
	else
		sort(indizes)
		foreachi(indizes, function(_, index)
			local value = %table[index]
			if value.NumModify == 0 then
				print("GDS: Warning: \"" .. index .. "\": only read but never modified!")
			end
			if value.NumRead == 0 then
				print("GDS: Warning: \"" .. index .. "\": only modified but never read!")
			end
			if DumpAllVars then
				print("\t\"" .. index .. "\":\t" .. "Modified: " .. value.NumModify .. " - Read: " .. value.NumRead)
			end
			if DumpNpcIds then
				foreachi(value.NpcId, function(i, ni) print("\t\tUsed in Npc " .. tostring(ni)) end)
			end
		end)
	end
end


-- **DOC** ----------------------------------------------------------
function DumpGlobalVars()
	if _DEBUG ~= TRUE then return end

	print("GDS: Dumping GLOBAL Variables for current Platform:")
	GdsDumpVars(GlobalVars)
	--print("GDS: End of GLOBAL Var Dump...")
end

doc[numdoc] = [[Schreibt alle globalen Variablen der geladenen Plattform ins GDS logfile.]]
doc[numdoc] = nil
numdoc = numdoc + 1


-- **DOC** ----------------------------------------------------------
function DumpPlayerVars()
	if _DEBUG ~= TRUE then return end

	print("GDS: Dumping PLAYER Variables for current Platform:")
	GdsDumpVars(PlayerVars)
	--print("GDS: End of PLAYER Var Dump...")
end

doc[numdoc] = [[Schreibt alle playerspezifischen Variablen der geladenen Plattform ins GDS logfile.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function DumpNpcVars()
	if _DEBUG ~= TRUE then return end

	print("GDS: Dumping NPC Variables for current Platform:")
	-- don't dump Npc Id's for NpcVars
	local dnv = DumpNpcIds
	DumpNpcIds = nil
	GdsDumpVars(NpcVars)
	DumpNpcIds = dnv
	--print("GDS: End of NPC Var Dump...")
end

doc[numdoc] = [[Schreibt alle Npc Variablen der geladenen Plattform ins GDS logfile.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function DumpStates()
	if _DEBUG ~= TRUE then return end

	print("GDS: Dumping STATES for current Platform:")
	dump(VarStates)
	--print("GDS: End of STATES Dump...")
end

doc[numdoc] = [[Schreibt alle momentan definierten States ins GDS logfile.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function SetDumpLevel(params)
	if _DEBUG ~= TRUE then return end

	if params.NpcId then
		DumpNpcIds = TRUE
	else
		DumpNpcIds = nil
	end
	if params.AllVars then
		DumpAllVars = TRUE
	else
		DumpAllVars = nil
	end
end

doc[numdoc] = [[Hiermit kann man einstellen was alles gedumpt werden soll. Es gibt folgende Parameter:<br>
<code>DumpNpcIds = , AllVars = ,</code><br>
DumpNpcIds gesetzt bewirkt das zu jeder Variable ausgegeben wird in welchem Npc Script sie verwendet wurden (ausgenommen der Npc Variablen).<br>
AllVars gesetzt bewirkt das alle Variablen gedumpt werden, ansonsten werden nur die rausgeschrieben, welche nur einseitig referenziert wurden (nur modifiziert oder nur gelesen).<br>]]
doc[numdoc] = nil
numdoc = numdoc + 1
-----------------------------------------------------------------------
