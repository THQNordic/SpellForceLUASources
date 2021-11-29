print("Registering ConDebug.lua debugging functions...")

-- schreibt wichtige scripting debug informationen ins log/gdslog ...
function DumpAll(npc)
	if not npc then npc = -1 end
	print("==============================================================================================================================")
	if type(npc) == "string" then
		print("========= ConDebug() BEGIN DUMPING: " .. npc .. " ========================================================================")
	else
		print("==============================================================================================================================")
	end
	print("==============================================================================================================================")

	print("\nGDS: DumpAll: Dumping STATEMACHINES ...")
	if type(npc) ~= "string" and npc ~= -1 then
		GdsMain:Dump(npc)
	else
		GdsMain:Dump()
	end

	print("\nGDS: DumpAll: Dumping QUESTSTATES ...")
	GdsMain:DumpQuestBook()

	print("\nGDS: DumpAll: Dumping VARS ...")
	GdsMain:DumpVars()

	print("==============================================================================================================================")
	if type(npc) == "string" then
		print("========= ConDebug() END DUMPING: " .. npc .. " ========================================================================")
	else
		print("==============================================================================================================================")
	end
	print("==============================================================================================================================")
end

function DumpQuests()
	print("\nGDS: DumpAll: Dumping QUESTSTATES ...")
	GdsMain:DumpQuestBook()
end

function DumpVars()
	print("\nGDS: DumpAll: Dumping VARS ...")
	GdsMain:DumpVars()
end

function DumpCamera()
	if not DEBUG or DEBUG == 0 then return end
	local x,y,z = Camera:GetEyeCenter(0,0,0)
	Application:Log(format("	AddLookAt(3,1,  %5.1f, %5.1f, %5.1f),", x,y,z))
end

function DumpDeploy()
	if not DEBUG or DEBUG == 0 then return end
	local x,y,z = Camera:GetPosition(0,0,0)
	local lookx,looky,lookz = Camera:GetEyeCenter(0,0,0)
	local str = format("	AddDeploy(3,4,  %5.1f, %5.1f, %5.1f,   %5.1f, %5.1f, %5.1f),", x,y,z, lookx,looky,lookz)
	Application:Log(str)
end

function DumpLookAtSven()
	if not DEBUG or DEBUG == 0 then return end
	local x,y,z = Camera:GetEyeCenter(0,0,0)
	local str = format("	AddLookAt(3,1,  %5.1f, %5.1f, %5.1f),", x,y,z)
	print(str)
end

function DumpMoveToSven()
	if not DEBUG or DEBUG == 0 then return end
	local x,y,z = Camera:GetPosition(0,0,0)
	local str = format("	AddMoveTo(3,4,  %5.1f, %5.1f, %5.1f),", x,y,z)
	print(str)
end

function DoArena(fight)
	if not DEBUG or DEBUG == 0 then return end
	arena3(fight)
	AppSession:SetTimeMultiplier(222)
	GameControl:SetCameraMode(kDrwCameraModeFree)
	Render:Textures(0)
	Render:EnableFog(0)
	Atmosphere:TimeLock(0)
end

function TestSpawn()
	if not DEBUG or DEBUG == 0 then return end
	TestSpawnUnitData = {}
	TestSpawnUnitData = doscript("!test\\TestSpawn.lua")
	if not TestSpawnUnitData then print("Error calling testspawn file!") return end

	local _x = 0
	local _y = 0
	local _valid, _x, _y = GameControl:GetMousePosGrid(_x, _y)

	for k = 1, getn(TestSpawnUnitData) do
		local unit = TestSpawnUnitData[k]
		
		for i = 1, unit.Amount do 
--			print("XY 0: " .. _x .. "," .. _y)
			_valid, _x, _y = GameControl:GetMousePosGrid(_x, _y)
			_x = _x + i
			_y = _y - k
--			print("XY 1: " .. _x .. "," .. _y)
			
			if _valid == 1 and WorldToolBox:GetFigure(_x, _y, 0) == 0 then
--				print("creo, unit: " .. tostring(TestSpawnUnitData.Creo) .. "," .. tostring(unit.Unit))
				Application:Test_PlaceRTSUnit(_x, _y, TestSpawnUnitData.Creo, unit.Unit)
			end
		end
	end
end

function cheat()
	if not DEBUG or DEBUG == 0 then return end
	Application:SetNoManaUsage(1)
	Application:SetGodMode(1)
	Application:FastHeroCast(1)
	Application:SetFigureTechTreeMode(0)
	Application:SetBuildingTechTreeMode(0)
	Application:GiveMeGoods(9000)
	Application:SetBuildingFastBuildMode(1)
end
