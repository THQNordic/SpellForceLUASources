-----------------------------------------------------------------------
--
--	Test
--
-----------------------------------------------------------------------

CameraTestI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,25,1,"script\\p4\\n0_CameraTestI.lua")
   	Camera:ScriptStart()
]]

CameraTestII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,5,1,"script\\p4\\n0_CameraTestII.lua")
   	Camera:ScriptStart()
]]

CameraTestIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,25,1,"script\\p4\\n0_CameraTestI.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "Test", CameraScript = "",
	
	BeginConditions =
	{
		-- bedingungen, die angeben wann die cutscene gestartet werden soll (erforderlich)
		PlayerUnitInRange {X = 96, Y = 130, Range = 4, UpdateInterval = 10},
		-- FigureAlive {NpcId = 1362},
		-- zum testen auskommentiert!!!
		-- FigureInRangeNpc {NpcId = 0, TargetNpcId = 1362, Range = 10, UpdateInterval = 10},		
	},
	
	BeginActions =
	{
		-- schliesst automatisch mit ein: 
		-- optional weitere actions zu beginn der cutscene:
	},
	
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps nach der die jeweilige Action erfolgen soll:
		[0] =
		{
		
		},
		[30] =
		{
			ExecuteCameraScript{Script = CameraTestII},
		},
		[50] =
		{
			CutSceneSay {NpcId = 0, String = "Du hörst die Stimme von Nor!"},
		},
		[130] =
		{
			CutSceneSay {NpcId = 0, String = "Nanu? Was war das denn?"},			
		},
	},
}

