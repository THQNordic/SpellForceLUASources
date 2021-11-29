REM = [[
-15 kämpfe von 3-10 bis 10-3
-kämpfe pro rasse auf seperaten rechner verteilt (6 rechner)
-sylk file format möglichkeiten genauer prüfen (formeln direkt eingeben?)
-excel prüfen, inwieweit "reload" von daten möglich ist, ohne das darauf 
angewandte formeln & diagramme kaputtgehen
-ergebnis ist: feindl. tote / gesamte tote
-ergebnis in tabelle 64 zeilen a 8 spalten, inkl. figurnamen
-muss auch mit versch. leveln der prod. einheiten funktionieren (versch. creos)
-script soll auch mit NPCs funktionieren
-optional: support gemischte rassen, jede figur einer rasse gleichzeitig gegen 
jede figur anderer rasse
]]


function Log(s)
	if not ArenaLogFileName then return end

	assert(s)
	assert(type(s) == "string")
	f = openfile(ArenaLogFileName, "a+")
	write(f, s)
	write(f, "\n")
	closefile(f)
end

-- load SYLK export functions
dofile("../../tool/bin/SylkExport.lua")

-- load initial data
doscript("!test\\conbalancesingleplayer3.lua")
doscript("!test\\conbalancemultiplayer3.lua")

FALSE	= 0
TRUE	= 1

RemainingRounds = 0
UnitStats		= {}
Fights			= {}
Fighting		= FALSE
StillFighting	= 0
LeftWins		= 1
RightWins		= 2
-- default position:
DefaultX = 35
DefaultY = 10
MultipleFights	= FALSE
MultipleFightsData	= {}
MultipleFightsNum	= 0
	
MaxFightTime = 30	-- abort fight after this many minutes...
CurFightName = ""

TestOnce = FALSE

function DetermineWinner()
	assert(LeftUnits and RightUnits)
	assert(getn(LeftUnits) ~= 0 and getn(RightUnits) ~= 0)
	
	-- get the alive status of all units of each side
	local LeftAllDead = TRUE
	local RightAllDead = TRUE
	
	for i = 1, getn(LeftUnits) do
		local alive = Figure:IsAlive(LeftUnits[i].Id)
		if CurStep > (TimeFightBegins + (MaxFightTime - 0.5) * 60 * 10) then
			AppSession:SetTimeMultiplier(0.1)
			if TestOnce == FALSE then
				TestOnce = TRUE
				execute("start /w echo PLEASE DEBUG THIS ... Fight took longer than " .. MaxFightTime .. " minutes!")
			end
			Log("LeftUnits["..i.."].Id: " .. tostring(LeftUnits[i].Id) .. " --- alive: " .. tostring(alive))
		end
		-- if at least one unit is alive we are still fighting...
		if alive == 1 and not LeftUnits[i].IsReallyDead then
			LeftAllDead = FALSE
		else
			-- mark this unit as dead!
			LeftUnits[i].IsReallyDead = TRUE
		end
	end
	
	-- all left side units dead? then right side wins...
	if LeftAllDead == TRUE then
		Log("Right Side Wins!")
		return RightWins
	end
	
	for i = 1, getn(RightUnits) do
		local alive = Figure:IsAlive(RightUnits[i].Id)
		if CurStep > (TimeFightBegins + (MaxFightTime - 0.5) * 60 * 10) then
			Log("RightUnits["..i.."].Id: " .. tostring(RightUnits[i].Id) .. " --- alive: " .. tostring(alive))
		end
		-- if at least one unit is alive we are still fighting...
		if alive == 1 and not RightUnits[i].IsReallyDead then
			RightAllDead = FALSE
		else
			-- mark this unit as dead!
			RightUnits[i].IsReallyDead = TRUE
		end
	end
	
	-- all right side units dead? then left side wins...
	if RightAllDead == TRUE then
		Log("Left Side Wins!")
		return LeftWins
	end
	
	return StillFighting
end

-- restliche units wieder löschen
function RemoveRemainingUnits()
	RemoveBruteForce = FALSE	-- manchmal kriegt man nicht alle IDs
	
	REM = [[
	foreachi(LeftUnits, function(i, units)
		--Log("Removing Left Unit: " .. tostring(units.Id))
		--assert(units.Id and units.Id ~= 0)
		if units.Id == 0 then RemoveBruteForce = TRUE end
		Application:Test_FigureVanish(units.Id)
	end)
	foreachi(RightUnits, function(i, units)
		--Log("Removing Right Unit: " .. tostring(units.Id))
		--assert(units.Id and units.Id ~= 0)
		if units.Id == 0 then RemoveBruteForce = TRUE end
		Application:Test_FigureVanish(units.Id)
	end)
	]]

	-- hack: always use brute force!
	RemoveBruteForce = TRUE		-- manchmal kriegt man nicht alle IDs
	if RemoveBruteForce == TRUE then
		--Log("Need to remove units using brute force method....")
		for i = 2, 300 do
			Application:Test_FigureVanish(i)
		end
	end
	
	-- cleanup
	LeftUnits		= {} -- aktuelle linke seiten units daten
	RightUnits		= {} -- aktuelle rechte seiten units daten
end

-- wrapper fürs unit platzieren
function PlaceUnit(_id, _x, _y, _rts)
	if _rts == 0 or _rts == nil then
		--Log("placing unit " .. tostring(_id) .. " at pos " .. tostring(_x) .. "," .. tostring(_y))
		Application:Test_SpawnUnit(_id, 0, _x, _y)
	else
		if _id == nil then
			_id = 0 
			--Log("placing worker " .. tostring(_rts) .. " at pos " .. tostring(_x) .. "," .. tostring(_y))
		else
			--Log("placing RTS unit " .. tostring(_id) .. " with creo " .. tostring(_rts) .. " at pos " .. tostring(_x) .. "," .. tostring(_y))
		end
		Application:Test_PlaceRTSUnit(_x, _y, _rts, _id)
	end
end

-- figure placement for balancing...
function SpawnNewUnits(Unit1, Unit2, Amount1, Amount2, Distance, UnitsPerRow, RtsLeft, RtsRight)
	if not Amount1 then Amount1 = 10 end
	if not Amount2 then Amount2 = 10 end
	if not Distance then Distance = 6 else Distance = Distance + 1 end
	if not UnitsPerRow then UnitsPerRow = 10 end
	
	local x = DefaultX
	local y = DefaultY

	for u = 1, getn(Unit1) do
		local unit = Unit1[u]
		local creo = RtsLeft[u]
		
		for i = 1, Amount1 do
			PlaceUnit(unit, x, y, creo)
			local index = Amount1 * (u - 1) + i
			--Log("left index: " .. index)
			LeftUnits[index] = {}
			LeftUnits[index].X = x
			LeftUnits[index].Y = y
			y = y + 1
			if mod(i, UnitsPerRow) == 0 then
				x = x - 1 
				y = DefaultY
			end
		end
	end

	local x = DefaultX + Distance
	local y = DefaultY

	for u = 1, getn(Unit2) do
		local unit = Unit2[u]
		local creo = RtsRight[u]
		
		for i = 1, Amount2 do
			PlaceUnit(unit, x, y, creo)
			local index = Amount2 * (u - 1) + i
			--Log("right index: " .. index)
			RightUnits[index] = {}
			RightUnits[index].X = x
			RightUnits[index].Y = y
			y = y + 1
			if mod(i, UnitsPerRow) == 0 then 
				x = x + 1
				y = DefaultY
			end
		end
	end
end

function ResetData()
	--Log("ResetData()")
	CurFight		= {}
	CurEncounter	= {}
	UnitInfo		= {} -- temp storage für aktuelle unit daten
	LeftUnits		= {} -- aktuelle linke seiten units daten
	RightUnits		= {} -- aktuelle rechte seiten units daten
	BattleInfo		= {} -- info über alle runden eines kampfes
end



function StartNewFight()
	--Log("StartNewFight ... ")
	if RemainingRounds == 0 then
		--Log("Remaining Rounds == 0")
		ResetData()
		-- still some remaining fights?
		if getn(Fights) <= CurFightNumber then
			return 0
		end
		
		CurFightNumber	= CurFightNumber + 1
		CurFight		= Fights[CurFightNumber]
		CurEncounter	= CurFight.Units
		if not CurFight.Rounds then
			RemainingRounds = 0
		else
			RemainingRounds = CurFight.Rounds - 1
		end
	else
		--Log("Remaining Rounds > 0")
		RemainingRounds = RemainingRounds - 1
	end	

	local enc = CurEncounter
	local fgt = CurFight
	SpawnNewUnits(enc.LUnit, enc.RUnit, fgt.LAmount, fgt.RAmount, fgt.Distance, fgt.UnitsPerRow, enc.LCreo, enc.RCreo)
	Log("Starting Fight #" .. CurFightNumber .. " Round: " .. CurFight.Rounds - RemainingRounds .. " Name: \"" .. tostring(CurFight.Name) .. " >> " ..  tostring(CurFight.LeftUnitName) .. "_vs_" ..  tostring(CurFight.RightUnitName) .. "\"")
	return 1
end


-- called every Gd Step:
function GdTrigger()
	if Fighting == FALSE then
		if MultipleFights == TRUE then
			if getn(MultipleFightsData) > MultipleFightsNum then
				MultipleFightsNum = MultipleFightsNum + 1
				Log("Beginning Fight " .. MultipleFightsNum .. " of " .. getn(MultipleFightsData) .. " multiple fights.")
				LetTheGamesBegin(MultipleFightsData[MultipleFightsNum])
			end
		end
		return
	end
	
	--Log("--------Trig-------")
	
	if BattleRaging == TRUE then
		--Log("Battling one more tick...")
		UpdateAllUnitStats()

		local win = DetermineWinner()
		if win ~= StillFighting or CurStep > (TimeFightBegins + MaxFightTime * 60 * 10) then
			local Abort = FALSE
			if CurStep > (TimeFightBegins + MaxFightTime * 60 * 10) then
				Log(">>>>> Aborting Fight!!!! Could not determine a winner within a reasonable amount of time!!!!!!!!!")
				Abort = TRUE
			end
			Log("We have a winner!")
			--Log("Rounds left: " .. RemainingRounds)
			StoreUnitStats(Abort)
			DumpUnitStats()
			RemoveRemainingUnits()
			BattleRaging = FALSE
		end
	elseif InitFigures == TRUE then
		-- must wait 1 GD step before initializing figure data
		GetFigureId()
		if CurEncounter.ForceAggro == TRUE then
			--Log("ForceAggro: SetAggroRect...")
			Application:SetAggroRects(6, 0, DefaultX, 511, DefaultX + 1, 0, 511, 511)
		end
		InitFigures = FALSE
		BattleRaging = TRUE
	else
		if StartNewFight() == 0 then
			Fighting = FALSE
			Log("The Show is over!")
			DumpFinal(TRUE)
			local file = openfile("c:\\arena_temp.txt", "w+")
			if file then
				write(file, "ARENA:\n\nAll done! Finished! Yip-iiiiie-yay!\n\nBitte Arena jetzt beenden...\n")
				closefile(file)
				execute("start notepad.exe c:\\arena_temp.txt")
			end
			--DebugDumpFinal()
		else
			InitFigures = TRUE
			TimeFightBegins = CurStep
		end
	end
end


-- called every Frame:
function ConTrigger(_Step)
	if NotInArenaMap == TRUE then return end
	if not GdMain then return end
	if not AppSession then return end
	
	steps_old = CurStep
	CurStep = _Step

	if CurStep ~= steps_old and CurStep > 50 then
		if NotInArenaMap == FALSE then
			GdTrigger()
		else
			if (strfind(strlower(GdMain:GetWorldPtr():GetWorldName()), "arena3")) then
				NotInArenaMap = FALSE
				NetworkPath = ""
				if findfile("\\\\Tester\\d\\!balancing\\!!_DO_NOT_DELETE_THIS_FILE_!!.txt") then
					NetworkPath = "\\\\Tester\\d\\!balancing\\"
				elseif findfile("\\\\Elba\\ftp\\jowood\\beta\\!balancing\\!!_DO_NOT_DELETE_THIS_FILE_!!.txt") then
					NetworkPath = "\\\\Elba\\ftp\\jowood\\beta\\!balancing\\"
				else
					print("arena networkpath not found !!!")
					if findfile("spellforce.exe") then
						print("spellforce.exe found !!!")
					end
				end
				-- enforce networkpath!
				--NetworkPath = "\\\\Tester\\d\\!balancing\\"
				ComputerName = tostring(getenv("COMPUTERNAME")) .. "_"
			 	StrDate = date("%y%m%d_%H%M")
				ArenaLogFileName = NetworkPath .. "!LogArena_" .. ComputerName .. StrDate .. ".txt"
				print("Logging Arena stuff to:\n"..ArenaLogFileName)
				Log("Logging Arena stuff to:\n"..ArenaLogFileName)
				doscript("!test\\ConCurrentArenaFight.lua")
				
				BeginSteps		= CurStep
				BeginTimeStr	= date("%d/%m/%y at %H:%M")
				FinalSteps		= -1
				FinalTimeStr	= ""
			else
				NotInArenaMap = TRUE
			end
		end
	end
end


function MultipleArena(data)
	MultipleFights		= TRUE
	MultipleFightsData	= data
	MultipleFightsNum	= 0
end

-- create fights table
FightCount = 0
NumFightsTillMix = 0
function CreateFights(FightData)

	Fights = {}

	-- für jeden opponent
	for Ops = 1, getn(FightData.Opponents) do
		CurOpponent = FightData.Opponents[Ops]

		if FightData.MixFightsOnly ~= TRUE then
			NumFightsTillMix = 0
			
			-- für jede unit eines challenger
			for Ch = 1, getn(FightData.Challenger) do
				CurLeftUnitData = FightData.Challenger[Ch]
				
				NumFightsTillMix = NumFightsTillMix + 1
	
				-- für jede unit eines opponent
				for Op = 1, getn(CurOpponent) do
					CurRightUnitData = CurOpponent[Op]
	
					NumFightsTillMix = NumFightsTillMix + 1

					-- für jede zahl minunits <= maxunits
					local min = FightData.MinUnits
					for i = min, FightData.MaxUnits do
						FightCount = FightCount + 1
						--Log("Fight #" .. FightCount)
						
						-- name this fight:
						local fightcatname = CurLeftUnitData.CatName .. "_vs_" .. CurRightUnitData.CatName
	
						-- insert fight
						local tempfight =				
						{
							Units = 
							{
								LCreo = { [1] = CurLeftUnitData.Creo },
								RCreo = { [1] = CurRightUnitData.Creo },
								LUnit = { [1] = CurLeftUnitData.Unit },
								RUnit = { [1] = CurRightUnitData.Unit },
								ForceAggro = TRUE,
							},
							LAmount = i,
							RAmount = FightData.MaxUnits,
							Distance = FightData.Distance,
							Rounds = 1,
							UnitsPerRow = FightData.UnitsPerRow,
							Name = fightcatname,
							LeftUnitName = CurLeftUnitData.Name,
							RightUnitName = CurRightUnitData.Name,
							LeftSideName = CurLeftUnitData.CatName,
							RightSideName = CurRightUnitData.CatName,
						}
						
						tinsert(Fights, tempfight)
						
						-- insert second fight, with exchanged unit numbers, unless both unit numbers are the same:
						if i ~= FightData.MaxUnits then
							local tempfight2 = tcopy(tempfight)
							tempfight2.LAmount = FightData.MaxUnits
							tempfight2.RAmount = i
							tinsert(Fights, tempfight2)
						end
					end -- for each unit number
				end -- for each opponent unit
			end -- for each challenger unit

---------------- MIX FIGHTS: -------------------------------------------------------------------------------------------------
		
			local lcreos = {}
			local rcreos = {}
			local lunits = {}
			local runits = {}
	
			-- für jede unit eines challenger
			for Ch = 1, getn(FightData.Challenger) do
				CurLeftUnitData = FightData.Challenger[Ch]
	
				-- prepare mixfights...
				tinsert(lcreos, CurLeftUnitData.Creo)
				tinsert(lunits, CurLeftUnitData.Unit)
			end
	
			-- für jede unit eines opponent
			for Op = 1, getn(CurOpponent) do
				CurRightUnitData = CurOpponent[Op]
	
				-- prepare mixfights...
				tinsert(rcreos, CurRightUnitData.Creo)
				tinsert(runits, CurRightUnitData.Unit)
			end
	
			FightCount = FightCount + 1
			--Log(">>>>>>>>>>>> (MIX FIGHT) Fight #" .. FightCount)
			
			-- name this fight:
			local fightcatname = CurLeftUnitData.CatName .. "_vs_" .. CurRightUnitData.CatName
			--Log(">>>>>>>>>>>> (MIX FIGHT) Fightname: " .. fightcatname)
		
			-- insert fight
			local tempfight =				
			{
				Units = 
				{
					LCreo = lcreos,
					RCreo = rcreos,
					LUnit = lunits,
					RUnit = runits,
					ForceAggro = TRUE,
				},
				LAmount = 1,
				RAmount = 1,
				Distance = FightData.Distance,
				Rounds = (FightData.MaxUnits - FightData.MinUnits) * 2 + 1,
				UnitsPerRow = FightData.UnitsPerRow,
				Name = fightcatname,
				LeftUnitName = CurLeftUnitData.CatName .. "_Mix",
				RightUnitName = CurRightUnitData.CatName .. "_Mix",
				LeftSideName = CurLeftUnitData.CatName,
				RightSideName = CurRightUnitData.CatName,
			}
			
			--Log(">>>>>>>>>> TEMPFIGHT:")
			--dump(tempfight)
			--Log(">>>>>>>>>> TEMPFIGHT UNITS:")
			--dump(tempfight.Units)

			tinsert(Fights, tempfight)

		end -- MixFights only...
	end -- for each in opponents
end


function arena(FightData, name)
	LetTheGamesBegin(FightData, name)
end
function Arena(FightData, name)
	LetTheGamesBegin(FightData, name)
end
function arena3(FightData, name)
	LetTheGamesBegin(FightData, name)
end
function Arena3(FightData, name)
	LetTheGamesBegin(FightData, name)
end

function LetTheGamesBegin(FightData, name)
	if MultipleFights ~= TRUE then
		remove(ArenaLogFileName)
	end

	if name and type(name) == "string" then
		CurFightName = name
	end

	-- create table: Fights = {}
	doscript("!test\\conbalancemultiplayer3.lua")
	CreateFights(FightData)

	if not Fights or type(Fights) ~= "table" or getn(Fights) == 0 then
		Log("No Fights table!")
		return
	end

	Log("Counted " .. getn(Fights) .. " different Fights...")

	CurFightNumber	= 0
	CurStep 		= 0
	RemainingRounds = 0
	InitFigures		= FALSE
	BattleRaging	= FALSE
	Fighting		= TRUE
	LeftUnits		= {}
	RightUnits		= {}
	UnitStats		= {}
end





-- UPDATE FUNCTIONS .........................................

function GetFigureId()
	foreachi(LeftUnits, function(i, unit)
		local Id = WorldToolBox:GetFigure(LeftUnits[i].X, LeftUnits[i].Y, 0)
		LeftUnits[i].Id = Id
		--Log("Left unit #" .. i .. " Id: " .. tostring(Id))

		GetUnitStats(LeftUnits[i])
	end)

	foreachi(RightUnits, function(i, unit)
		local Id = WorldToolBox:GetFigure(RightUnits[i].X, RightUnits[i].Y, 0)
		RightUnits[i].Id = Id
		--Log("Right unit #" .. i .. " Id: " .. tostring(Id))

		GetUnitStats(RightUnits[i])
	end)
end


function StoreUnitStats(Abort)
	local data = {}
	
	data.FightNumber = CurFightNumber
	data.LeftUnits = tcopy(LeftUnits)
	data.RightUnits = tcopy(RightUnits)

	CurFight.LeftDead = 0
	CurFight.RightDead = 0

	foreachi(data.LeftUnits, function(_, lu)
		if lu.IsDead == 1 then
			%CurFight.LeftDead = %CurFight.LeftDead + 1
		end
	end)

	foreachi(data.RightUnits, function(_, ru)
		if ru.IsDead == 1 then
			%CurFight.RightDead = %CurFight.RightDead + 1
		end
	end)

	if Abort == TRUE then
		CurFight.LeftDead = 0
		CurFight.RightDead = 0
	end

	data.FightData = tcopy(CurFight)
	
	tinsert(UnitStats, CurFightNumber, data)
	
	-- test:
	DumpFinal()
end

-- debugging
function DebugDumpFinal()
REM = [[
	CurLeftName = ""
	PrevLeftName = nil
	CurRightName = ""
	PrevRightName = nil
	FightCount = 1
	
	LeftDead = 0
	RightDead = 0
	
	--ArenaLogFileName = NetworkPath .. "!DebugLogArena__" .. ComputerName .. StrDate .. ".txt"
	--Log("Logging Arena stuff to:\n"..ArenaLogFileName)

	ChallengerName = ""
	OpponentName = ""

	local DumpData = {}
	local temp = {}

	Log("DEBUG: BEGIN DUMPFINAL ComputeResults at: " .. date("%H:%M:%S"))
	
	foreachi(UnitStats, function(i, data)
		Log("DEBUG: FIGHT NUMBER: " .. data.FightNumber)

		if CurLeftName == "" then
			CurLeftName = data.FightData.LeftSideName .. "_" .. data.FightData.LeftUnitName
		end
		if CurRightName == "" then
			CurRightName = data.FightData.RightSideName .. "_" .. data.FightData.RightUnitName
		end
		
		PrevLeftName = CurLeftName
		PrevRightName = CurRightName
		CurLeftName = data.FightData.LeftSideName .. "_" .. data.FightData.LeftUnitName
		CurRightName = data.FightData.RightSideName .. "_" .. data.FightData.RightUnitName
		ChallengerName = data.FightData.LeftSideName
		OpponentName = data.FightData.RightSideName
		
		Log("DEBUG: COMPARE LEFT : " .. PrevLeftName .. "  --  " .. CurLeftName)
		Log("DEBUG: COMPARE RIGHT: " .. PrevRightName .. "  --  " .. CurRightName)
		
		if CurLeftName == PrevLeftName and CurRightName == PrevRightName then
			LeftDead = LeftDead + data.FightData.LeftDead
			RightDead = RightDead + data.FightData.RightDead
			Log(CurLeftName .. " versus " .. CurRightName)
			Log("DEBUG: sum of DEAD in fight " .. FightCount .. ": left = " .. LeftDead .. "  --  Right = " .. RightDead)

			%DumpData[FightCount] = {}
			%DumpData[FightCount].LeftDead = LeftDead
			%DumpData[FightCount].RightDead = RightDead
			%DumpData[FightCount].LeftName = data.FightData.LeftSideName
			%DumpData[FightCount].LeftUnit = data.FightData.LeftUnitName
			%DumpData[FightCount].RightName = data.FightData.RightSideName
			%DumpData[FightCount].RightUnit = data.FightData.RightUnitName
			if (data.FightData.LeftDead + data.FightData.RightDead) == 0 then 
				%DumpData[FightCount].Abortion = -999999999 
				%DumpData[FightCount].BalanceResult = -1
			elseif %DumpData[FightCount].Abortion == nil then
				%DumpData[FightCount].BalanceResult = (RightDead * 100) / (LeftDead + RightDead)	-- formel von volker
			end
		else
			FightCount = FightCount + 1
			LeftDead = data.FightData.LeftDead
			RightDead = data.FightData.RightDead
			%DumpData[FightCount] = {}
			%DumpData[FightCount].LeftDead = LeftDead
			%DumpData[FightCount].RightDead = RightDead
			%DumpData[FightCount].LeftName = data.FightData.LeftSideName
			%DumpData[FightCount].LeftUnit = data.FightData.LeftUnitName
			%DumpData[FightCount].RightName = data.FightData.RightSideName
			%DumpData[FightCount].RightUnit = data.FightData.RightUnitName
			if (data.FightData.LeftDead + data.FightData.RightDead) == 0 then 
				%DumpData[FightCount].Abortion = -999999999 
				%DumpData[FightCount].BalanceResult = -1
			elseif %DumpData[FightCount].Abortion == nil then
				%DumpData[FightCount].BalanceResult = (RightDead * 100) / (LeftDead + RightDead)	-- formel von volker
			end
		end
		
		Log("DEBUG: FIGHT DATA:")
		dump(data.FightData)
	end)

	Log("DEBUG: BEGIN DUMPFINAL Writefile at: " .. date("%H:%M:%S"))
	
	-- remove old temp files:
	for TempFileNum = 0, 9 do
		remove(NetworkPath .. ChallengerName .. "_" .. OpponentName .. "_" .. ComputerName .. StrDate .. "_temporary#" .. tostring(TempFileNum) .. ".xls")
	end

	-- write xls file
	if SylkWriteOpen(NetworkPath .. ChallengerName .. "_" .. OpponentName .. "_" .. ComputerName .. StrDate .. ".xls") == nil then
		-- execute("start /w echo XLS FILE NOT WRITEABLE, PLEASE CLOSE IT IN EXCEL! THEN CLOSE THIS WINDOW ...")
		Log("DEBUG: Could not write to XLS file ... please close it, or open in read-only mode!")
		-- try again:
		for TempFileNum = 0, 9 do
			if SylkWriteOpen(NetworkPath .. ChallengerName .. "_" .. OpponentName .. "_" .. ComputerName .. StrDate .. "_temporary#" .. tostring(TempFileNum) .. ".xls") ~= nil then
				break
			end
			if TempFileNum == 9 then
				Log("DEBUG: all temporary files used up...!")
				return
			end
		end
	end

	PrevOpponent = ""
	PrevLeftUnit = ""
	PrevRightUnit = ""
	X = 4
	Y = 4
	CurY = 4
	MaxY = 4
	
	SylkWriteCell(1, 1, "last change:")
	SylkWriteCell(2, 1, date("%y/%m/%d"))
	SylkWriteCell(2, 2, date("%H:%M:%S"))

	Log("DEBUG: DUMP FINAL:")

	foreachi(DumpData, function(i, data)
		Log("DEBUG: DUMP DATA [" .. i .. "]:")
		dump(data)

		-- init table		
		if PrevOpponent == "" then 
			Log("DEBUG: IF >>>>> PrevOpponent == ''")
			PrevOpponent = data.RightName 
			Log("DEBUG: print leftname " .. data.LeftName .. " at " .. X .. "," .. (Y - 3))
			SylkWriteCell(X, Y - 3, data.LeftName)
			Log("DEBUG: print leftunit " .. data.LeftUnit .. " at " .. X .. "," .. (Y - 2))
			SylkWriteCell(X, Y - 2, data.LeftUnit)
			Log("DEBUG: print rightname " .. data.RightName .. " at " .. (X - 3) .. "," .. Y)
			SylkWriteCell(X - 3, Y, data.RightName)
		end
		if PrevLeftUnit == "" then 
			Log("DEBUG: IF >>>>>> PrevLeftUnit == ''")
			PrevLeftUnit = data.LeftUnit 
			Log("DEBUG: print leftunit " .. data.LeftUnit .. " at " .. (X) .. "," .. (Y))
			SylkWriteCell(X, Y, data.LeftUnit)
		end
		if PrevRightUnit == "" then 
			Log("DEBUG: IF >>>>>> PrevRightUnit == ''")
			PrevRightUnit = data.RightUnit 
			Log("DEBUG: print rightunit " .. data.RightUnit .. " at " .. (X - 2) .. "," .. (Y))
			SylkWriteCell(X - 2, Y, data.RightUnit)
		end


		if data.RightName ~= PrevOpponent then
			Log("DEBUG: IF >>>>>> RightName ~= PrevOpponent")
			PrevOpponent = data.RightName
			PrevRightUnit = data.RightUnit
			PrevLeftUnit = data.LeftUnit
			Log("DEBUG: Change Values: X = 4, Y = MaxY + 2 (" .. MaxY + 2 .. "), CurY = MaxY + 2 (" .. MaxY + 2 .. "), MaxY = CurY (" .. CurY .. ")")
			X = 4
			Y = MaxY + 2
			CurY = MaxY + 2
			MaxY = CurY
			Log("DEBUG: print rightname " .. data.RightName .. " at " .. (X - 3) .. "," .. (Y))
			SylkWriteCell(X - 3, Y, data.RightName)
			Log("DEBUG: print rightname " .. data.RightUnit .. " at " .. (X - 2) .. "," .. (Y))
			SylkWriteCell(X - 2, Y, data.RightUnit)
		else
			Log("DEBUG: ELSE >>>>> RightName == PrevOpponent")
			if data.RightUnit ~= PrevRightUnit then
				Log("DEBUG: RightUnit ~= PrevRightUnit")
				PrevRightUnit = data.RightUnit
				Log("DEBUG: Change Values: Y = Y + 1 (" .. (Y+1) .. "), increase MaxY if Y > MaxY (" .. Y .. " > " .. MaxY)
				Y = Y + 1
				if Y > MaxY then MaxY = Y end
				if X == 4 and data.LeftUnit == PrevLeftUnit then
					Log("DEBUG: \tIF >>> X == 4 and data.LeftUnit == PrevLeftUnit ... print rightunit " .. data.RightUnit .. " at " .. (X - 2) .. "," .. (Y))
					SylkWriteCell(X - 2, Y, data.RightUnit)
				end
			end
			if data.LeftUnit ~= PrevLeftUnit then
				Log("DEBUG: IF >>>>> LeftUnit ~= PrevLeftUnit")
				PrevLeftUnit = data.LeftUnit
				Log("DEBUG: Change Values: X = X + 1 (" .. (X+1) .. "), Y = CurY (" .. CurY .. ")")
				X = X + 1
				Y = CurY
				if Y == 4 then
					Log("DEBUG: \tIF >>>>> Y == 4 ... print leftunit " .. data.LeftUnit .. " at " .. (X) .. "," .. (Y - 2))
					SylkWriteCell(X, Y - 2, data.LeftUnit)
				end
			end
		end
		
		--Log("DEBUG: print balanceresult " .. data.BalanceResult .. " at " .. (X) .. "," .. (Y) .. "\n")
		if data.Abortion and data.Abortion < 0 then
			SylkWriteCell(X, Y, "")
		else
			SylkWriteCell(X, Y, data.BalanceResult)
		end
	end)

	SylkWriteClose()

	Log("DEBUG: BEGIN DUMPFINAL XLS file completed at: " .. date("%H:%M:%S"))
]]
end

ErrorInCells = {}
-- dump after all fights are through...
function DumpFinal(ReallyFinal)
	CurLeftName = ""
	PrevLeftName = nil
	CurRightName = ""
	PrevRightName = nil
	FightCount = 1
	InfoStr = ""
	
	LeftDead = 0
	RightDead = 0
	
	--ArenaLogFileName = NetworkPath .. "!LogArena_" .. ComputerName .. StrDate .. ".txt"
	--Log("Logging Arena stuff to:\n"..ArenaLogFileName)

	ChallengerName = ""
	OpponentName = ""

	local DumpData = {}
	local temp = {}

	--Log("BEGIN DUMPFINAL ComputeResults at: " .. date("%H:%M:%S"))
	
	foreachi(UnitStats, function(i, data)
		--Log("FIGHT NUMBER: " .. data.FightNumber)

		if CurLeftName == "" then
			CurLeftName = data.FightData.LeftSideName .. "_" .. data.FightData.LeftUnitName
		end
		if CurRightName == "" then
			CurRightName = data.FightData.RightSideName .. "_" .. data.FightData.RightUnitName
		end
		
		PrevLeftName = CurLeftName
		PrevRightName = CurRightName
		CurLeftName = data.FightData.LeftSideName .. "_" .. data.FightData.LeftUnitName
		CurRightName = data.FightData.RightSideName .. "_" .. data.FightData.RightUnitName
		ChallengerName = data.FightData.LeftSideName
		OpponentName = data.FightData.RightSideName
		
		--Log("COMPARE LEFT : " .. PrevLeftName .. "  --  " .. CurLeftName)
		--Log("COMPARE RIGHT: " .. PrevRightName .. "  --  " .. CurRightName)
		
		if CurLeftName == PrevLeftName and CurRightName == PrevRightName then
			LeftDead = LeftDead + data.FightData.LeftDead
			RightDead = RightDead + data.FightData.RightDead
			--Log(CurLeftName .. " versus " .. CurRightName)
			--Log("sum of DEAD in fight " .. FightCount .. ": left = " .. LeftDead .. "  --  Right = " .. RightDead)

			%DumpData[FightCount] = {}
			%DumpData[FightCount].LeftDead = LeftDead
			%DumpData[FightCount].RightDead = RightDead
			%DumpData[FightCount].LeftName = data.FightData.LeftSideName
			%DumpData[FightCount].LeftUnit = data.FightData.LeftUnitName
			%DumpData[FightCount].RightName = data.FightData.RightSideName
			%DumpData[FightCount].RightUnit = data.FightData.RightUnitName
			%DumpData[FightCount].BalanceResult = -1
			if (data.FightData.LeftDead + data.FightData.RightDead) == 0 then 
				%DumpData[FightCount].Abortion = TRUE
			elseif %DumpData[FightCount].Abortion ~= TRUE then
				%DumpData[FightCount].BalanceResult = (RightDead * 100) / (LeftDead + RightDead)	-- formel von volker
			end
		else
			FightCount = FightCount + 1
			LeftDead = data.FightData.LeftDead
			RightDead = data.FightData.RightDead
			%DumpData[FightCount] = {}
			%DumpData[FightCount].LeftDead = LeftDead
			%DumpData[FightCount].RightDead = RightDead
			%DumpData[FightCount].LeftName = data.FightData.LeftSideName
			%DumpData[FightCount].LeftUnit = data.FightData.LeftUnitName
			%DumpData[FightCount].RightName = data.FightData.RightSideName
			%DumpData[FightCount].RightUnit = data.FightData.RightUnitName
			%DumpData[FightCount].BalanceResult = -1
			if (data.FightData.LeftDead + data.FightData.RightDead) == 0 then 
				%DumpData[FightCount].Abortion = TRUE
			elseif %DumpData[FightCount].Abortion ~= TRUE then
				%DumpData[FightCount].BalanceResult = (RightDead * 100) / (LeftDead + RightDead)	-- formel von volker
			end
		end
		
		--Log("FIGHT DATA:")
		--dump(data.FightData)
	end)

	--Log("BEGIN DUMPFINAL Writefile at: " .. date("%H:%M:%S"))

	-- remove old temp files:
	for TempFileNum = 0, 9 do
		remove(NetworkPath .. ChallengerName .. "_" .. OpponentName .. "_" .. ComputerName .. StrDate .. "_temporary#" .. tostring(TempFileNum) .. ".xls")
	end

	if ReallyFinal and ReallyFinal == TRUE then
		ChallengerName = "COMPLETE!_" .. ChallengerName
		FinalSteps		= CurStep
		FinalTimeStr	= date("%d/%m/%y at %H:%M")
		
		local Steps = FinalSteps - BeginSteps
		local Hours = floor(((Steps / 10) / 60) / 60)
		local f = openfile(NetworkPath .. "!!_FINAL_RESULTS!!.txt", "a+")
		InfoStr = CurFightName .. " on " .. ComputerName .. ": Steps: " .. Steps .. " Hours: " .. Hours .. " Time: " .. BeginTimeStr .. " >> " .. FinalTimeStr .. " File: \"" .. ChallengerName .. "_" .. OpponentName .. "_" .. ComputerName .. StrDate .. ".xls\""
		write(f, InfoStr .. "\n")
		closefile(f)
	end

	-- write xls file
	if SylkWriteOpen(NetworkPath .. ChallengerName .. "_" .. OpponentName .. "_" .. ComputerName .. StrDate .. ".xls") == nil then
		-- execute("start /w echo XLS FILE NOT WRITEABLE, PLEASE CLOSE IT IN EXCEL! THEN CLOSE THIS WINDOW ...")
		Log("Could not write to XLS file ... please close it, or open in read-only mode!")
		-- try again:
		for TempFileNum = 0, 9 do
			if SylkWriteOpen(NetworkPath .. ChallengerName .. "_" .. OpponentName .. "_" .. ComputerName .. StrDate .. "_temporary#" .. tostring(TempFileNum) .. ".xls") ~= nil then
				break
			end
			if TempFileNum == 9 then
				Log("ERROR: all temporary files used up...!")
				return
			end
		end
	end

	PrevOpponent = ""
	PrevLeftUnit = ""
	PrevRightUnit = ""
	X = 4
	Y = 4
	CurY = 4
	MaxY = 4
	
	SylkWriteCell(1, 1, "last change:")
	SylkWriteCell(2, 1, date("%y/%m/%d"))
	SylkWriteCell(4, 1, InfoStr)
	SylkWriteCell(2, 2, date("%H:%M:%S"))

--	Log("DUMP FINAL:")

	foreachi(DumpData, function(i, data)
--		Log("DUMP DATA [" .. i .. "]:")
--		dump(data)

		-- init table		
		if PrevOpponent == "" then 
--			Log("PrevOpponent == ''")
			PrevOpponent = data.RightName 
--			Log("print leftname " .. data.LeftName .. " at " .. X .. "," .. (Y - 3))
			SylkWriteCell(X, Y - 3, data.LeftName)
--			Log("print leftunit " .. data.LeftUnit .. " at " .. X .. "," .. (Y - 2))
			SylkWriteCell(X, Y - 2, data.LeftUnit)
--			Log("print rightname " .. data.RightName .. " at " .. (X - 3) .. "," .. Y)
			SylkWriteCell(X - 3, Y, data.RightName)
		end
		if PrevLeftUnit == "" then 
--			Log("PrevLeftUnit == ''")
			PrevLeftUnit = data.LeftUnit 
--			Log("print leftunit " .. data.LeftUnit .. " at " .. (X) .. "," .. (Y))
			SylkWriteCell(X, Y, data.LeftUnit)
		end
		if PrevRightUnit == "" then 
--			Log("PrevRightUnit == ''")
			PrevRightUnit = data.RightUnit 
--			Log("print rightunit " .. data.RightUnit .. " at " .. (X - 2) .. "," .. (Y))
			SylkWriteCell(X - 2, Y, data.RightUnit)
		end


		if data.RightName ~= PrevOpponent then
--			Log("RightName ~= PrevOpponent")
			PrevOpponent = data.RightName
			PrevRightUnit = data.RightUnit
			PrevLeftUnit = data.LeftUnit
--			Log("Change Values: X = 4, Y = MaxY + 2 (" .. MaxY + 2 .. "), CurY = MaxY + 2 (" .. MaxY + 2 .. "), MaxY = CurY (" .. CurY .. ")")
			X = 4
			Y = MaxY + 2
			CurY = MaxY + 2
			MaxY = CurY
--			Log("print rightname " .. data.RightName .. " at " .. (X - 3) .. "," .. (Y))
			SylkWriteCell(X - 3, Y, data.RightName)
--			Log("print rightname " .. data.RightUnit .. " at " .. (X - 2) .. "," .. (Y))
			SylkWriteCell(X - 2, Y, data.RightUnit)
		else
--			Log("else RightName == PrevOpponent")
			if data.RightUnit ~= PrevRightUnit then
--				Log("RightUnit ~= PrevRightUnit")
				PrevRightUnit = data.RightUnit
--				Log("Change Values: Y = Y + 1 (" .. (Y+1) .. "), increase MaxY if Y > MaxY (" .. Y .. " > " .. MaxY)
				Y = Y + 1
				if Y > MaxY then MaxY = Y end
				if X == 4 and data.LeftUnit == PrevLeftUnit then
--					Log("print rightunit " .. data.RightUnit .. " at " .. (X - 2) .. "," .. (Y))
					SylkWriteCell(X - 2, Y, data.RightUnit)
				end
			end
			if data.LeftUnit ~= PrevLeftUnit then
--				Log("LeftUnit ~= PrevLeftUnit")
				PrevLeftUnit = data.LeftUnit
--				Log("Change Values: X = X + 1 (" .. (X+1) .. "), Y = CurY (" .. CurY .. ")")
				X = X + 1
				Y = CurY
				if Y == 4 then
--					Log("print leftunit " .. data.LeftUnit .. " at " .. (X) .. "," .. (Y - 2))
					SylkWriteCell(X, Y - 2, data.LeftUnit)
				end
			end
		end
		
		--Log("print balanceresult " .. data.BalanceResult .. " at " .. (X) .. "," .. (Y) .. "\n")
		if data.Abortion then
			SylkWriteCell(X, Y, "")
			Log("ERROR: balanceresult " .. data.BalanceResult .. " at " .. (X) .. "," .. (Y) .. "\n")
			local cell = {}
			cell.X = X
			cell.Y = Y
			tinsert(ErrorInCells, cell)
		else
			local error = FALSE
			for i = 1, getn(ErrorInCells) do
				if ErrorInCells[i].X == X and ErrorInCells[i].Y == Y then
					error = TRUE
				end
			end
			if error == FALSE then
				SylkWriteCell(X, Y, data.BalanceResult)
			else
				SylkWriteCell(X, Y, "")
			end
		end
	end)

	SylkWriteClose()

	Log("DUMPFINAL XLS file dump completed at: " .. date("%H:%M:%S"))
end






function DumpUnitStats()
REM = [[
	-- dumping unit STATS
	local unit = LeftUnits[1]
	local unit2 = RightUnits[1]

	local filename = ""
	if CurFight.Name then
		filename = "Fight_" .. tostring(CurFight.Name) .. "_#" .. tostring(CurFight.Rounds - RemainingRounds) .. ".xls"
	else
		filename = format("Fight%5d.xls", CurFightNumber)
	end
	
	SylkWriteOpen(filename)
	SylkWriteCell(1, 1, "Unit Stats")
	SylkWriteCell(2, 1, "Left Unit")
	SylkWriteCell(3, 1, "Right Unit")
	SylkWriteCell(4, 1, "Difference")

	-- dump all stats for one unit
	x, y = 1, 3
	local indizes = tkeys(unit)
	sort(indizes)
	foreachi(indizes, function(_, index)
		-- left unit
		SylkWriteCell(x, y, index)
		SylkWriteCell(x + 1, y, %unit[index])
		-- right unit
		SylkWriteCell(x + 2, y, %unit2[index])
		-- difference
		local value1, value2 = %unit[index], %unit2[index]
		if type(value1) == "number" and type(value2) == "number" then
			SylkWriteCell(x + 3, y, value1 - value2)
		end
		y = y + 1
	end)

	LStats = {}
	RStats = {}
	LStats.NumUnits = getn(LeftUnits)
	RStats.NumUnits = getn(RightUnits)
	LStats.NumDead = 0
	RStats.NumDead = 0
	LStats.NumAlive = 0
	RStats.NumAlive = 0
	LStats.TimeAlive = 0
	RStats.TimeAlive = 0
	LStats.LifeGain = 0
	RStats.LifeGain = 0
	LStats.LifeLost = 0
	RStats.LifeLost = 0
	LStats.ManaGain = 0
	RStats.ManaGain = 0
	LStats.ManaLost = 0
	RStats.ManaLost = 0
	
	-- dumping each unit's fight results
	for i = 1, LStats.NumUnits do
		if LeftUnits[i].IsAlive then
			LStats.NumAlive = LStats.NumAlive + 1
		else
			LStats.NumDead = LStats.NumDead + 1
			LStats.TimeAlive = LStats.TimeAlive + (LeftUnits[i].TimeDied - LeftUnits[i].TimeSpawned)
		end
		LStats.LifeGain = LStats.LifeGain + LeftUnits[i].LifeGained
		LStats.LifeLost = LStats.LifeLost + LeftUnits[i].LifeLost
		LStats.ManaGain = LStats.ManaGain + LeftUnits[i].ManaGained
		LStats.ManaLost = LStats.ManaLost + LeftUnits[i].ManaLost
	end
	for i = 1, RStats.NumUnits do
		if RightUnits[i].IsAlive then
			RStats.NumAlive = RStats.NumAlive + 1
		else
			RStats.NumDead = RStats.NumDead + 1
			RStats.TimeAlive = RStats.TimeAlive + (RightUnits[i].TimeDied - RightUnits[i].TimeSpawned)
		end
		RStats.LifeGain = RStats.LifeGain + RightUnits[i].LifeGained
		RStats.LifeLost = RStats.LifeLost + RightUnits[i].LifeLost
		RStats.ManaGain = RStats.ManaGain + RightUnits[i].ManaGained
		RStats.ManaLost = RStats.ManaLost + RightUnits[i].ManaLost
	end

	x, y = 6, 3
	SylkWriteCell(x, 1, "Fight Stats")
	SylkWriteCell(x+1, 1, "Left Units")
	SylkWriteCell(x+2, 1, "Right Units")
	
	SylkWriteCell(x, y, "Fight Duration:")
	SylkWriteCell(x+1, y, AppSession:GetCurrentStep() - LeftUnits[1].TimeSpawned)
	SylkWriteCell(x+2, y, "Steps")

	SylkWriteCell(x, y+1, "Number of Units:")
	SylkWriteCell(x+1, y+1, LStats.NumUnits)
	SylkWriteCell(x+2, y+1, RStats.NumUnits)

	SylkWriteCell(x, y+2, "Survivors:")
	SylkWriteCell(x+1, y+2, LStats.NumAlive)
	SylkWriteCell(x+2, y+2, RStats.NumAlive)

	SylkWriteCell(x, y+3, "Level:")
	SylkWriteCell(x+1, y+3, LeftUnits[1].Level)
	SylkWriteCell(x+2, y+3, RightUnits[1].Level)

	SylkWriteCell(x, y+4, "Life:")
	SylkWriteCell(x+1, y+4, LeftUnits[1].LifeCurrentMax)
	SylkWriteCell(x+2, y+4, RightUnits[1].LifeCurrentMax)

	SylkWriteCell(x, y+5, "Mana:")
	SylkWriteCell(x+1, y+5, LeftUnits[1].ManaCurrentMax)
	SylkWriteCell(x+2, y+5, RightUnits[1].ManaCurrentMax)

	y = 10
	SylkWriteCell(x, y, "Avg. Time to death:")
	if LStats.NumDead > 0 then
		SylkWriteCell(x+1, y, LStats.TimeAlive / LStats.NumDead)
	end
	if RStats.NumDead > 0 then
		SylkWriteCell(x+2, y, RStats.TimeAlive / RStats.NumDead)
	end

	y = 11
	SylkWriteCell(x, y, "Avg. Life Lost:")
	SylkWriteCell(x+1, y, LStats.LifeLost / LStats.NumUnits)
	SylkWriteCell(x+2, y, RStats.LifeLost / LStats.NumUnits)

	SylkWriteCell(x, y+1, "Total Life Lost:")
	SylkWriteCell(x+1, y+1, LStats.LifeLost)
	SylkWriteCell(x+2, y+1, RStats.LifeLost)

	SylkWriteCell(x, y+2, "Total Life Gained:")
	SylkWriteCell(x+1, y+2, LStats.LifeGain)
	SylkWriteCell(x+2, y+2, RStats.LifeGain)

	SylkWriteCell(x, y+3, "Total Mana Lost:")
	SylkWriteCell(x+1, y+3, LStats.ManaLost)
	SylkWriteCell(x+2, y+3, RStats.ManaLost)

	SylkWriteCell(x, y+4, "Total Mana Gained:")
	SylkWriteCell(x+1, y+4, LStats.ManaGain)
	SylkWriteCell(x+2, y+4, RStats.ManaGain)

	SylkWriteClose()
]]
end

function UpdateAllUnitStats()
	for i = 1, getn(LeftUnits) do
		UpdateUnitStats(LeftUnits[i])
	end
	for i = 1, getn(RightUnits) do
		UpdateUnitStats(RightUnits[i])
	end
end

-- update only the stats that may change during the fight
-- and only those of importance to balancing...
function UpdateUnitStats(UnitInfo)
	local id = UnitInfo.Id
	
	if UnitInfo.IsAngryFlagSet ~= Figure:IsFlagSet(id, 16) then
		--Log(id .. ": Angry Flag changed: " .. tostring(Figure:IsFlagSet(id, 16)))
	end
	UnitInfo.IsAngryFlagSet				= Figure:IsFlagSet(id, 16)

	if UnitInfo.IsReallyDead == TRUE then
		UnitInfo.IsAlive         			= 0
	else
		UnitInfo.IsAlive         			= Figure:IsAlive(id)
	end
	if UnitInfo.IsReallyDead == TRUE then
		UnitInfo.IsDead         		  	= 1
	else
		UnitInfo.IsDead         		  	= Figure:IsDead(id)
	end
--	if UnitInfo.IsGotAggroFlagSet ~= Figure:IsFlagSet(id, 131072) then
--		Log(id .. ": GotAggro Flag changed: " .. tostring(Figure:IsFlagSet(id, 131072)))
--	end
--	UnitInfo.IsGotAggroFlagSet			= Figure:IsFlagSet(id, 131072)
	local LifeCurrent               	= Figure:GetLifeCurrent(id)
	if LifeCurrent then UnitInfo.LifeCurrent = LifeCurrent end
	local ManaCurrent               	= Figure:GetManaCurrent(id)
	if ManaCurrent then UnitInfo.ManaCurrent = ManaCurrent end

	-- update life lost and gained
	if UnitInfo.LifeCurrent < UnitInfo.LifeCurrentBefore then
		UnitInfo.LifeLost	= UnitInfo.LifeLost + (UnitInfo.LifeCurrentBefore - UnitInfo.LifeCurrent)
		UnitInfo.LifeCurrentBefore = UnitInfo.LifeCurrent
	elseif UnitInfo.LifeCurrent > UnitInfo.LifeCurrentBefore then
		UnitInfo.LifeGained	= UnitInfo.LifeGained + (UnitInfo.LifeCurrent - UnitInfo.LifeCurrentBefore)
		UnitInfo.LifeCurrentBefore = UnitInfo.LifeCurrent
	end

	-- update mana lost and gained
	if UnitInfo.IsAlive == 1 then
		if UnitInfo.ManaCurrent < UnitInfo.ManaCurrentBefore then
			UnitInfo.ManaLost	= UnitInfo.ManaLost + (UnitInfo.ManaCurrentBefore - UnitInfo.ManaCurrent)
			UnitInfo.ManaCurrentBefore = UnitInfo.ManaCurrent
		elseif UnitInfo.ManaCurrent > UnitInfo.ManaCurrentBefore then
			UnitInfo.ManaGained	= UnitInfo.ManaGained + (UnitInfo.ManaCurrent - UnitInfo.ManaCurrentBefore)
			UnitInfo.ManaCurrentBefore = UnitInfo.ManaCurrent
		end
	end

	-- update lowest life and mana
	if UnitInfo.LifeCurrent < UnitInfo.LifeLowest then
		UnitInfo.LifeLowest		= UnitInfo.LifeCurrent
	end
	if UnitInfo.ManaCurrent < UnitInfo.ManaLowest then
		UnitInfo.ManaLowest		= UnitInfo.ManaCurrent
	end

	-- note the time unit got aggro last time, needed to find out if we may have a neverending fight...
	if UnitInfo.IsGotAggroFlagSet or UnitInfo.IsAngryFlagSet and UnitInfo.TimeGotAggro == 0 then
		UnitInfo.TimeGotAggro	= AppSession:GetCurrentStep()
	end

	-- note the time of death, then rust in pieces...	
	if UnitInfo.IsDead and UnitInfo.TimeDied == 0 then
		UnitInfo.TimeDied		= AppSession:GetCurrentStep()
	end
end


-- get the unit stats after unit has been spawned
function GetUnitStats(UnitInfo)
	local id = UnitInfo.Id
	
	UnitInfo.ACBase						= Figure:GetACBase(id)
	UnitInfo.ACBuff						= Figure:GetACBuff(id)
	UnitInfo.ACCurrent					= Figure:GetACCurrent(id)
	UnitInfo.ACCurrentMax				= Figure:GetACCurrentMax(id)
	UnitInfo.ACEquip					= Figure:GetACEquip(id)
--	UnitInfo.Activity					= Figure:GetActivity(id)
	UnitInfo.AggroValue					= Figure:GetAggroValue(id, Figure:GetTargetID(id))
	UnitInfo.AgiBase                   	= Figure:GetAgiBase(id)
	UnitInfo.AgiBuff                   	= Figure:GetAgiBuff(id)
	UnitInfo.AgiCurrent                	= Figure:GetAgiCurrent(id)
	UnitInfo.AgiCurrentMax             	= Figure:GetAgiCurrentMax(id)
	UnitInfo.AgiEquip                  	= Figure:GetAgiEquip(id)
	UnitInfo.Alarmed                   	= Figure:GetAlarmed(id)
--	UnitInfo.AnimLength                	= Figure:GetAnimLength(id)
--	UnitInfo.AnimLengthRemainder       	= Figure:GetAnimLengthRemainder(id)
--	UnitInfo.Building                  	= Figure:GetBuilding(id)
	UnitInfo.CastSpeedBase             	= Figure:GetCastSpeedBase(id)
	UnitInfo.CastSpeedBuff             	= Figure:GetCastSpeedBuff(id)
	UnitInfo.CastSpeedCurrent          	= Figure:GetCastSpeedCurrent(id)
	UnitInfo.CastSpeedCurrentMax       	= Figure:GetCastSpeedCurrentMax(id)
	UnitInfo.CastSpeedEquip            	= Figure:GetCastSpeedEquip(id)
	UnitInfo.ChaBase                   	= Figure:GetChaBase(id)
	UnitInfo.ChaBuff                   	= Figure:GetChaBuff(id)
	UnitInfo.ChaCurrent                	= Figure:GetChaCurrent(id)
	UnitInfo.ChaCurrentMax             	= Figure:GetChaCurrentMax(id)
	UnitInfo.ChaEquip                  	= Figure:GetChaEquip(id)
--	UnitInfo.CurrentWayPoint           	= Figure:GetCurrentWayPoint(id)
--	UnitInfo.DebugFlagBit              	= Figure:GetDebugFlagBit(id, 255)
	UnitInfo.DexBase                   	= Figure:GetDexBase(id)
	UnitInfo.DexBuff                   	= Figure:GetDexBuff(id)
	UnitInfo.DexCurrent                	= Figure:GetDexCurrent(id)
	UnitInfo.DexCurrentMax             	= Figure:GetDexCurrentMax(id)
	UnitInfo.DexEquip                  	= Figure:GetDexEquip(id)
--	UnitInfo.Direction                 	= Figure:GetDirection(id)
--	UnitInfo.Equipment                 	= {}	-- Figure:GetEquipment(id)
	UnitInfo.Faction                   	= Figure:GetFaction(id)
	UnitInfo.FightSpeedBase            	= Figure:GetFightSpeedBase(id)
	UnitInfo.FightSpeedBuff            	= Figure:GetFightSpeedBuff(id)
	UnitInfo.FightSpeedCurrent         	= Figure:GetFightSpeedCurrent(id)
	UnitInfo.FightSpeedCurrentMax      	= Figure:GetFightSpeedCurrentMax(id)
	UnitInfo.FightSpeedEquip           	= Figure:GetFightSpeedEquip(id)
--	UnitInfo.FlagBit                   	= Figure:GetFlagBit(id)
--	UnitInfo.Good                      	= Figure:GetGood(id)
--	UnitInfo.GroupLeader               	= Figure:GetGroupLeader(id)
--	UnitInfo.HateEntry                 	= Figure:GetHateEntry(id)
	UnitInfo.HateValue                 	= Figure:GetHateValue(id, Figure:GetTargetID(id))
--	UnitInfo.InUse           		 	= Figure:InUse(id)
	UnitInfo.IntBase                   	= Figure:GetIntBase(id)
	UnitInfo.IntBuff                   	= Figure:GetIntBuff(id)
	UnitInfo.IntCurrent                	= Figure:GetIntCurrent(id)
	UnitInfo.IntCurrentMax             	= Figure:GetIntCurrentMax(id)
	UnitInfo.IntEquip                  	= Figure:GetIntEquip(id)
	UnitInfo.IsAlive         		 	= Figure:IsAlive(id)
	UnitInfo.IsAngryFlagSet				= Figure:IsFlagSet(id, 16)
--	UnitInfo.IsCheckBattleFlagSet		= Figure:IsFlagSet(id, 8192)
--	UnitInfo.IsCivilian     		  	= Figure:IsCivilian(id)
--	UnitInfo.IsCorpseCantRottFlagSet	= Figure:IsFlagSet(id, 1048576)
	UnitInfo.IsDead         		  	= Figure:IsDead(id)
--	UnitInfo.IsDebugFlagSet 		  	= Figure:IsDebugFlagSet(id)
	UnitInfo.IsFemaleFlagSet			= Figure:IsFlagSet(id, 65536)
--	UnitInfo.IsFlagSet      		  	= Figure:IsFlagSet(id)
	UnitInfo.IsGotAggroFlagSet			= Figure:IsFlagSet(id, 131072)
	UnitInfo.IsHasLootFlagSet			= Figure:IsFlagSet(id, 16384)
	UnitInfo.IsHero         		  	= Figure:IsHero(id)
	UnitInfo.IsMainChar     		  	= Figure:IsMainChar(id)
	UnitInfo.IsMerchant     		  	= Figure:IsMerchant(id)
--	UnitInfo.IsPatrolling   		  	= Figure:IsPatrolling(id)
	UnitInfo.IsPet          		  	= Figure:IsPet(id)
	UnitInfo.IsUndead       		  	= Figure:IsUndead(id)
	UnitInfo.IsWarrior      		  	= Figure:IsWarrior(id)
--	UnitInfo.Item                      	= Figure:GetItem(id)
--	UnitInfo.Job                       	= Figure:GetJob(id)
	UnitInfo.Level                     	= Figure:GetLevel(id)
	UnitInfo.LifeAction                	= Figure:GetLifeAction(id)
	UnitInfo.LifeBase                  	= Figure:GetLifeBase(id)
	UnitInfo.LifeBuff                  	= Figure:GetLifeBuff(id)
	UnitInfo.LifeCurrent               	= Figure:GetLifeCurrent(id)
	UnitInfo.LifeCurrentBefore         	= UnitInfo.LifeCurrent
	UnitInfo.LifeCurrentMax            	= Figure:GetLifeCurrentMax(id)
	UnitInfo.LifeEquip                 	= Figure:GetLifeEquip(id)
	UnitInfo.LifeGained					= 0
	UnitInfo.LifeLost					= 0
	UnitInfo.LifeLowest					= UnitInfo.LifeCurrent
	UnitInfo.ManaAction                	= Figure:GetManaAction(id)
	UnitInfo.ManaBase                  	= Figure:GetManaBase(id)
	UnitInfo.ManaBuff                  	= Figure:GetManaBuff(id)
	UnitInfo.ManaCurrent               	= Figure:GetManaCurrent(id)
	UnitInfo.ManaCurrentBefore         	= UnitInfo.ManaCurrent
	UnitInfo.ManaCurrentMax            	= Figure:GetManaCurrentMax(id)
	UnitInfo.ManaEquip                 	= Figure:GetManaEquip(id)
	UnitInfo.ManaGained					= 0
	UnitInfo.ManaLost					= 0
	UnitInfo.ManaLowest					= UnitInfo.ManaCurrent
--	UnitInfo.Master                    	= Figure:GetMaster(id)
	UnitInfo.MaxAttackRange            	= Figure:GetMaxAttackRange(id)
--	UnitInfo.MaxUsed                   	= Figure:GetMaxUsed()
	UnitInfo.MinAttackRange            	= Figure:GetMinAttackRange(id)
--	UnitInfo.NPCID                     	= Figure:GetNPCID(id)
--	UnitInfo.Owner                     	= Figure:GetOwner(id)
--	UnitInfo.PathBits                  	= Figure:GetPathBits(id)
--	UnitInfo.PathDir                   	= Figure:GetPathDir(id)
--	UnitInfo.PathWishDir               	= Figure:GetPathWishDir(id)
--	UnitInfo.PathingMode               	= Figure:GetPathingMode(id)
	UnitInfo.Race                      	= Figure:GetRace(id)
	UnitInfo.ResBlackMagicBase         	= Figure:GetResBlackMagicBase(id)
	UnitInfo.ResBlackMagicBuff         	= Figure:GetResBlackMagicBuff(id)
	UnitInfo.ResBlackMagicCurrent      	= Figure:GetResBlackMagicCurrent(id)
	UnitInfo.ResBlackMagicCurrentMax   	= Figure:GetResBlackMagicCurrentMax(id)
	UnitInfo.ResBlackMagicEquip        	= Figure:GetResBlackMagicEquip(id)
	UnitInfo.ResFireBase               	= Figure:GetResFireBase(id)
	UnitInfo.ResFireBuff               	= Figure:GetResFireBuff(id)
	UnitInfo.ResFireCurrent            	= Figure:GetResFireCurrent(id)
	UnitInfo.ResFireCurrentMax         	= Figure:GetResFireCurrentMax(id)
	UnitInfo.ResFireEquip              	= Figure:GetResFireEquip(id)
	UnitInfo.ResIceBase                	= Figure:GetResIceBase(id)
	UnitInfo.ResIceBuff                	= Figure:GetResIceBuff(id)
	UnitInfo.ResIceCurrent             	= Figure:GetResIceCurrent(id)
	UnitInfo.ResIceCurrentMax          	= Figure:GetResIceCurrentMax(id)
	UnitInfo.ResIceEquip               	= Figure:GetResIceEquip(id)
	UnitInfo.ResMindMagicBase          	= Figure:GetResMindMagicBase(id)
	UnitInfo.ResMindMagicBuff          	= Figure:GetResMindMagicBuff(id)
	UnitInfo.ResMindMagicCurrent       	= Figure:GetResMindMagicCurrent(id)
	UnitInfo.ResMindMagicCurrentMax    	= Figure:GetResMindMagicCurrentMax(id)
	UnitInfo.ResMindMagicEquip         	= Figure:GetResMindMagicEquip(id)
--	UnitInfo.SpellJobStartNode         	= Figure:GetSpellJobStartNode(id)
	UnitInfo.StaAction                 	= Figure:GetStaAction(id)
	UnitInfo.StaBase                   	= Figure:GetStaBase(id)
	UnitInfo.StaBuff                   	= Figure:GetStaBuff(id)
	UnitInfo.StaCurrent                	= Figure:GetStaCurrent(id)
	UnitInfo.StaCurrentMax             	= Figure:GetStaCurrentMax(id)
	UnitInfo.StaEquip                  	= Figure:GetStaEquip(id)
	UnitInfo.StrBase                   	= Figure:GetStrBase(id)
	UnitInfo.StrBuff                   	= Figure:GetStrBuff(id)
	UnitInfo.StrCurrent                	= Figure:GetStrCurrent(id)
	UnitInfo.StrCurrentMax             	= Figure:GetStrCurrentMax(id)
	UnitInfo.StrEquip                  	= Figure:GetStrEquip(id)
--	UnitInfo.Target                    	= Figure:GetTargetID(id)
--	UnitInfo.TargetAction              	= Figure:GetTargetAction(id)
--	UnitInfo.TargetType                	= Figure:GetTargetType(id)
--	UnitInfo.Task                      	= Figure:GetTask(id)
	UnitInfo.TimeSpawned				= AppSession:GetCurrentStep()
	UnitInfo.TimeDied					= 0
	UnitInfo.TimeGotAggro				= AppSession:GetCurrentStep()
--	UnitInfo.ToDoCount                 	= Figure:GetToDoCount(id)
--	UnitInfo.ToDoCountRemainder        	= Figure:GetToDoCountRemainder(id)
	UnitInfo.UnitID                    	= Figure:GetUnitID(id)
	UnitInfo.WalkSpeedBase             	= Figure:GetWalkSpeedBase(id)
	UnitInfo.WalkSpeedBuff             	= Figure:GetWalkSpeedBuff(id)
	UnitInfo.WalkSpeedCurrent          	= Figure:GetWalkSpeedCurrent(id)
	UnitInfo.WalkSpeedCurrentMax       	= Figure:GetWalkSpeedCurrentMax(id)
	UnitInfo.WalkSpeedEquip            	= Figure:GetWalkSpeedEquip(id)
--	UnitInfo.WalkToX                   	= Figure:GetWalkToX(id)
--	UnitInfo.WalkToY                   	= Figure:GetWalkToY(id)
--	UnitInfo.WeaponStats               	= {}	-- Figure:GetWeaponStats(id)
	UnitInfo.WisBase                   	= Figure:GetWisBase(id)
	UnitInfo.WisBuff                   	= Figure:GetWisBuff(id)
	UnitInfo.WisCurrent                	= Figure:GetWisCurrent(id)
	UnitInfo.WisCurrentMax             	= Figure:GetWisCurrentMax(id)
	UnitInfo.WisEquip                  	= Figure:GetWisEquip(id)
--	UnitInfo.X                         	= Figure:GetX(id)
--	UnitInfo.Y                         	= Figure:GetY(id)

	--dump(UnitInfo)
end
