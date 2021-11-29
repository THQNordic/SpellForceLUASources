-----------------------------------------------------------------------
--
--	Look Out Goblin
--
-----------------------------------------------------------------------

CameraLookOutGoblinI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,12,1,"script\\p4\\n0_CameraLookOutGoblinI.lua")
   	Camera:ScriptStart()
]]

CameraLookOutGoblinII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,12,1,"script\\p4\\n0_CameraLookOutGoblinII.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "LookOutGoblin", CameraScript = "", PlayOnlyOnce = TRUE,
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		PlayerUnitInRange{X = 171, Y = 214, Range = 8, UpdateInterval = 5},
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:	
		SetNoFightFlagTrue {NpcId = 0},
		SetNoFightFlagTrue {NpcId = 1362},		
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		[0] =
		{
			-- die ersten zwei sekunden ohne kamera:			
		},
		[20] = 
		{ 
			ExecuteCameraScript{Script = CameraLookOutGoblinI},
		},
		[40] =
		{
			CutSceneSay {Tag = "cuteinarLeaf001" , NpcId = 1362, String = "Ihre Späher haben uns entdeckt!"},		
		},
		[70] = 
		{ 
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraLookOutGoblinII},								
			Goto{X = 247, Y = 212, NpcId = 3108, WalkMode = Run},
			Goto{X = 246, Y = 213, NpcId = 3109, WalkMode = Run},
		},
		[80] = 
		{
			CutSceneSay {Tag = "cuteinarLeaf002" , NpcId = 1362, String = "Sie benachrichtigen ihre Lager! Der Tanz geht los!"},
		},
		[160] = 
		{
			WaitForEndOfSpeech,
			SetNoFightFlagFalse {NpcId = 0},
			SetNoFightFlagFalse {NpcId = 1362},										
		},
	},
}

