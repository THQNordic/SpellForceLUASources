-- ich hol mir die createcamerafunction funktion aus GDS, weil sie da drin ist...
doscript("GdsCameraHelper")

FirstStep = nil
ActiveCamera = 0

	
-- benchmarking muss schon aktiv sein:
if Debug and Debug.EnableBenchmarking == 1 then
	-- wird jeden step getriggert:
	function ConTrigger(_iStep)
		if not GdMain then return end
		if not FirstStep then
			FirstStep = _iStep
			CurrentMap = strlower(GdMain:GetWorldPtr():GetWorldName())
		end

		-- kamerafahrt ist abhängig von der Karte:
		if strfind(CurrentMap, "greyfell") then
			-- 3 sekunden vorlaufzeit sollten schon sein...
			if _iStep >= FirstStep + 50 and ActiveCamera == 0 then
				print("BEGIN CAMERA #" .. ActiveCamera .. " AT STEP: " .. _iStep .. " IN MAP: " .. CurrentMap)
				greyfell_3rd()
				ActiveCamera = ActiveCamera + 1
			elseif _iStep >= FirstStep + 270 and ActiveCamera == 1 then
				print("BEGIN CAMERA #" .. ActiveCamera .. " AT STEP: " .. _iStep .. " IN MAP: " .. CurrentMap)
				greyfell_iso()
				ActiveCamera = ActiveCamera + 1
			elseif _iStep >= FirstStep + 490 and ActiveCamera == 2 then
				print("BEGIN CAMERA #" .. ActiveCamera .. " AT STEP: " .. _iStep .. " IN MAP: " .. CurrentMap)
				greyfell_still()
				ActiveCamera = ActiveCamera + 1
			elseif _iStep >= FirstStep + 720 and ActiveCamera == 3 then
				ResetCamera()
				ActiveCamera = ActiveCamera + 1
			end
		end -- greyfell

		if strfind(CurrentMap, "liannon") then
			-- 3 sekunden vorlaufzeit sollten schon sein...
			if _iStep >= FirstStep + 50 and ActiveCamera == 0 then
				print("BEGIN CAMERA #" .. ActiveCamera .. " AT STEP: " .. _iStep .. " IN MAP: " .. CurrentMap)
				liannon_3rd()
				ActiveCamera = ActiveCamera + 1
			elseif _iStep >= FirstStep + 220 and ActiveCamera == 1 then
				print("BEGIN CAMERA #" .. ActiveCamera .. " AT STEP: " .. _iStep .. " IN MAP: " .. CurrentMap)
				liannon_iso()
				ActiveCamera = ActiveCamera + 1
			elseif _iStep >= FirstStep + 490 and ActiveCamera == 2 then
				print("BEGIN CAMERA #" .. ActiveCamera .. " AT STEP: " .. _iStep .. " IN MAP: " .. CurrentMap)
				liannon_still()
				ActiveCamera = ActiveCamera + 1
			elseif _iStep >= FirstStep + 720 and ActiveCamera == 3 then
				ResetCamera()
				ActiveCamera = ActiveCamera + 1
			end
		end -- liannon

		if strfind(CurrentMap, "leafshade") then
			-- 3 sekunden vorlaufzeit sollten schon sein...
			if _iStep >= FirstStep + 50 and ActiveCamera == 0 then
				print("BEGIN CAMERA #" .. ActiveCamera .. " AT STEP: " .. _iStep .. " IN MAP: " .. CurrentMap)
				PlaceLotsOfUnits(330, 335, 8, 8, 16, 139, {543, 544, 538, 540, 537, 539, 542, 541, 1099})
				PlaceLotsOfUnits(344, 327, 4, 4, 14, 139, {538, 540, 537, 539, 542, 541})
				
				PlaceLotsOfUnits(364, 308, 6, 6, 12, 187, {566, 567, 568, 565, 566, 567, 568, 565, 1101})
				PlaceLotsOfUnits(377, 296, 8, 8, 26, 139, {543, 544, 538, 540, 537, 539, 542, 541 })
				PlaceLotsOfUnits(390, 295, 6, 6, 16, 139, {543, 544, 538, 540, 537, 539, 542, 541, 1099})
				PlaceLotsOfUnits(408, 265, 8, 8, 24, 139, {543, 544, 538, 540, 537, 539, 542, 541 })
				PlaceLotsOfUnits(436, 242, 4, 4, 8, 139, {538, 540, 537, 539, 542, 541, 1099})

				PlaceLotsOfUnits(382, 289, 3, 3, 6, 187, {566,567, 568, 565})
				PlaceLotsOfUnits(425, 260, 6, 6, 6, 187, {566,567, 568, 565})
				leafshade_still()
				ActiveCamera = ActiveCamera + 1
			elseif _iStep >= FirstStep + 260 and ActiveCamera == 1 then
				print("BEGIN CAMERA #" .. ActiveCamera .. " AT STEP: " .. _iStep .. " IN MAP: " .. CurrentMap)
				leafshade_iso()
				ActiveCamera = ActiveCamera + 1
			elseif _iStep >= FirstStep + 570 and ActiveCamera == 2 then
				print("BEGIN CAMERA #" .. ActiveCamera .. " AT STEP: " .. _iStep .. " IN MAP: " .. CurrentMap)
				leafshade_still()
				ActiveCamera = ActiveCamera + 1
			elseif _iStep >= FirstStep + 780 and ActiveCamera == 3 then
				print("BEGIN CAMERA #" .. ActiveCamera .. " AT STEP: " .. _iStep .. " IN MAP: " .. CurrentMap)
				leafshade_iso()
				ActiveCamera = ActiveCamera + 1
			elseif _iStep >= FirstStep + 1200 and ActiveCamera == 4 then
				ResetCamera()
				ActiveCamera = ActiveCamera + 1
			end
		end -- leafshade
	end -- ConTrigger
	
	function PlaceLotsOfUnits(_x, _y, xmax, ymax, amount, creo, units)
		local x, y = _x, _y
		local num = 0
		for i = 1, amount do
			num = num + 1
			if num > getn(units) then
				num = 1
			end
			
			local unit = units[num]
			print("PLACE UNIT: x,y  creo,unit: " .. x .. "," .. y .. " -- " .. creo .. "," .. unit)
			Application:Test_PlaceRTSUnit(x, y, creo, unit)
			x = x + 1
			if x > (_x + xmax) then 
				x = _x 
				y = y + 1
			end
			if y > (_y + ymax) then
				y = _y - ymax
			end
		end
	end
end


-- hier kommen die Kamerafahrten -----------------------------------------------------------

BenchCam_STOP = 
[[
	Camera:ScriptDeactivateControllers()
]]
CreateCameraFunction {
	Name = "ResetCamera",
	Script = { BenchCam_STOP },
}


BenchCam_Greyfell_01 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\!test\\BenchCam_Greyfell_City_3rd.lua")
   	Camera:ScriptStart()
]]
CreateCameraFunction {
	Name = "greyfell_3rd",
	Script = { BenchCam_Greyfell_01 },
}

BenchCam_Greyfell_02 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\!test\\BenchCam_Greyfell_City_Iso.lua")
   	Camera:ScriptStart()
]]
CreateCameraFunction {
	Name = "greyfell_iso",
	Script = { BenchCam_Greyfell_02 },
}

BenchCam_Greyfell_03 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\!test\\BenchCam_Greyfell_City_Still.lua")
   	Camera:ScriptStart()
]]
CreateCameraFunction {
	Name = "greyfell_still",
	Script = { BenchCam_Greyfell_03 },
}


BenchCam_Liannon_01 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,25,1,"script\\!test\\BenchCam_Liannon_Village_Iso.lua")
   	Camera:ScriptStart()
]]
CreateCameraFunction {
	Name = "liannon_iso",
	Script = { BenchCam_Liannon_01 },
}

BenchCam_Liannon_02 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,25,1,"script\\!test\\BenchCam_Liannon_Village_3rd.lua")
   	Camera:ScriptStart()
]]
CreateCameraFunction {
	Name = "liannon_3rd",
	Script = { BenchCam_Liannon_02 },
}

BenchCam_Liannon_03 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\!test\\BenchCam_Liannon_Village_Still.lua")
   	Camera:ScriptStart()
]]
CreateCameraFunction {
	Name = "liannon_still",
	Script = { BenchCam_Liannon_03 },
}


BenchCam_Leafshade_01 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\!test\\BenchCam_Leafshade_OrcCamp_Iso.lua")
   	Camera:ScriptStart()
]]
CreateCameraFunction {
	Name = "leafshade_iso",
	Script = { BenchCam_Leafshade_01 },
}

BenchCam_Leafshade_02 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\!test\\BenchCam_Leafshade_OrcCamp_Still.lua")
   	Camera:ScriptStart()
]]
CreateCameraFunction {
	Name = "leafshade_still",
	Script = { BenchCam_Leafshade_02 },
}


----------------------------------------------------------------------------------------------








-- deprecated code ...
REM = [[
DefaultBlock = { Name = "Default", FrameTimeSum = 0, RenderTimeSum = 0, Samples = 0 }
GlobalBlock = { Name = "Default", FrameTimeSum = 0, RenderTimeSum = 0, Samples = 0 }
CurrentBlock = { Name = "Default", FrameTimeSum = 0, RenderTimeSum = 0, Samples = 0 }
Blocks = {}

function UpdateBlock(Block, FrameTime, RenderTime)
	Block.FrameTimeSum = Block.FrameTimeSum + FrameTime
	Block.RenderTimeSum = Block.RenderTimeSum + RenderTime
	Block.Samples = Block.Samples + 1
end

function FrameStatistics(FrameTime, RenderTime)
	UpdateBlock(GlobalBlock, FrameTime, RenderTime)
	UpdateBlock(CurrentBlock, FrameTime, RenderTime)
end

function BeginBlock(Name)
	CurrentBlock = {}
	CurrentBlock.Name = Name
	CurrentBlock.FrameTimeSum = 0
	CurrentBlock.RenderTimeSum = 0
	CurrentBlock.Samples = 0
end

function EndBlock()
	tinsert(Blocks, CurrentBlock)
	CurrentBlock = DefaultBlock
end

function DumpBlock(Block)
	print(" --- Block ---")
	print(" Name: ", Block.Name)
	print(" Samples: ", Block.Samples)
	print(" Average time per frame: ", Block.FrameTimeSum / Block.Samples)
	print(" Average frames per second: ", 1 / (Block.FrameTimeSum / Block.Samples))
end

function DumpBlocks()
	DumpBlock(GlobalBlock)
	local i = 1
	while i <= getn(Blocks) do
		DumpBlock(Blocks[i])
		i = i + 1
	end
end

function CameraScriptRun(Script)
	local i = 1

	Camera:ScriptReset()
	
	while i <= getn(Script) do
		local Action = Script[i]

		if Action.Type == "LookAt" then
			Camera:ScriptAddLookAt(Action.Begin, Action.End, Action.Duration, Action.X, Action.Y, Action.Z)
		elseif Action.Type == "MoveTo" then
			Camera:ScriptAddMoveTo(Action.Begin, Action.End, Action.Duration, Action.X, Action.Y, Action.Z)
		end

		i = i + 1
	end

	Camera:ScriptStart()
end

function CameraScriptAction(_Script, _Type, _Begin, _End, _Duration, _X, _Y, _Z)
	local Action = { Type = _Type, Begin = _Begin, End = _End, Duration = _Duration, X = _X, Y = _Y, Z = _Z }
	tinsert(_Script, Action)
end

function CameraScript0()
	local Script = {}
	CameraScriptAction(Script, "LookAt", 0, 18, 0.5, 100, 100, 3)
	CameraScriptAction(Script, "MoveTo", 0, 1, 0.1, -200, -200, 30)
	CameraScriptAction(Script, "MoveTo", 1, 5, 4, -200, 0, 10)
	CameraScriptAction(Script, "MoveTo", 5, 10, 5, 0, 50, 200)
	CameraScriptAction(Script, "MoveTo", 10, 18, 8, 128, 128, 30)
	CameraScriptRun(Script)
end

function CameraScript1()
	local Script = {}
	CameraScriptAction(Script, "LookAt", 0, 20, 0.5, 100*1.4, 55*1.4, 3)
	CameraScriptAction(Script, "MoveTo", 0, 1, 0.1, 160*1.4, 55*1.4, 30)
	CameraScriptRun(Script)
end

function CameraScript2()
	local Script = {}
	CameraScriptAction(Script, "LookAt", 0, 20, 0.5, 100*1.4, 150*1.4, 3)
	CameraScriptAction(Script, "MoveTo", 0, 1, 0.1, 150*1.4, 150*1.4, 30)
	CameraScriptRun(Script)
end

function PlaceTrees(Set)
	local x, y

	for y = 120, 180, 2 do
		for x = 70, 130, 2 do
			if Set then
				WorldToolBox:SetObject(x, y, 516)
			else
				WorldToolBox:SetObject(x, y, 0)
			end
		end
	end
end

function Timer(State)
	write("Callback #" .. State)

	if State == 0 then
		BeginBlock("Camera script 0")
		CameraScript0()
	elseif State == 1 then
		EndBlock()
		BeginBlock("Test effects")
		dofile("script\\!test\\contesteffects.lua")
		CameraScript1()
	elseif State == 2 then
		EndBlock()
		BeginBlock("Test trees")
		PlaceTrees(1)  -- mal nen haufen bäume unterbringen
		CameraScript2()
	elseif State == 3 then
		PlaceTrees(nil) -- alle bäume wieder löschen
		EndBlock()
		DumpBlocks()

	end
end

Application:AddTimer(10, "Timer", 0)
Application:AddTimer(30, "Timer", 1)
Application:AddTimer(60, "Timer", 2)
Application:AddTimer(90, "Timer", 3)
Application:StartTimer()
]]