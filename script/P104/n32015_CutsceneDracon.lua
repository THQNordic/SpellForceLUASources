-----------------------------------------------------------------------
--
--	DraconTauschen	
--
-----------------------------------------------------------------------

-- Dracons Position
CameraStartDraconI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p104\\n32015_CameraDracon.lua")
   	Camera:ScriptStart()
]]



CreateCutScene
{
	Name = "Endkampf", CameraScript = "", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		-- Der alte Dracon ist tot es lebe der neue Dracon
		 IsGlobalFlagTrue {Name = "DraconTauschen"},
	},
	BeginActions =
	{
		SetGlobalFlagTrue {Name = "P104_CutsceneDraconSpawnen"}
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		[0] =
		{
			ExecuteCameraScript{Script = CameraStartDraconI},
		},
		[20] =
		{
			
		},
		[60] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "ocArachP004_009", NpcId = 7664, String = "Warte Runenknecht! Dein Kopf gehört mir!", Color = ColorWhite}, 
			Goto {NpcId = 7664, X = 179, Y = 353, WalkMode = Walk},
		},		
		[100] = 
		{
			WaitForEndOfSpeech,
			AttackTarget {Target = Avatar, NpcId = 7664},
		},
	},
}
