-----------------------------------------------------------------------
--
--	Ismail Entry
--
-----------------------------------------------------------------------

-- ismail
CameraIsmailI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p16\\n2497_CameraIsmailEntryI.lua")
   	Camera:ScriptStart()
]]

-- uthar
CameraIsmailII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p16\\n2497_CameraIsmailEntryII.lua")
   	Camera:ScriptStart()
]]

CameraIsmailIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p16\\n2497_CameraIsmailEntryIII.lua")
   	Camera:ScriptStart()
]]

-- totale beginn
CameraIsmailIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p16\\n2497_CameraIsmailEntryIV.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "IsmailEntry", CameraScript = "", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		-- startet zu beginn der map.
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:	
		SetNoFightFlagTrue {NpcId = 0},
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		[0] =
		{
			-- opening cutscene ohne pause.
			ExecuteCameraScript{Script = CameraIsmailIV},				
		},
		[70] =
		{
			ExecuteCameraScript{Script = CameraIsmailI},				
			CutSceneSay {Tag = "cutismailWhis001", NpcId = 2497, String = "Was willst Du, sterbliche Kreatur? Bist Du hier, um des Meisters Schlaf zu stören? Oder willst Du Deine lächerlichen Kräfte mit den meinen messen?"},						
		},
		[140] =
		{
			WaitForEndOfSpeech,			
			ExecuteCameraScript{Script = CameraIsmailII},					
			CutSceneSay {Tag = "cutismailWhis002", NpcId = 2497, String = "Du wirst scheitern! So wie andere vor Dir!"},						
		},
		[190] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraIsmailIII},				
			CutSceneSay {Tag = "cutismailWhis003", NpcId = 2497, String = "Meine Macht ist unbezwingbar!"},						
		},				
		[260] = 
		{
			WaitForEndOfSpeech,		
			SetNoFightFlagFalse {NpcId = 0},			
		},
	},
}

