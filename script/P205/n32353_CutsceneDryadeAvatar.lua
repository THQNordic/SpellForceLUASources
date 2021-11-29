n32353_CameraDryadeAvatarDunkel1 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,8,1,"script\\P205\\n32353_CameraDryadeAvatarDunkel1.lua")
   	Camera:ScriptStart()
]]

n32353_CameraDryadeAvatarDunkel2 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,8,1,"script\\P205\\n32353_CameraDryadeAvatarDunkel2.lua")
   	Camera:ScriptStart()
]]

n32353_CameraDryadeAvatarDunkel3 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P205\\n32353_CameraDryadeAvatarDunkel3.lua")
   	Camera:ScriptStart()
]]

n32353_CameraDryadeAvatarDunkel4 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P205\\n32353_CameraDryadeAvatarDunkel4.lua")
   	Camera:ScriptStart()
]]

n32353_CameraDryadeAvatarDunkel5 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P205\\n32353_CameraDryadeAvatarDunkel5.lua")
   	Camera:ScriptStart()
]]

n32353_CameraDryadeAvatarDunkel6 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\P205\\n32353_CameraDryadeAvatarDunkel6.lua")
   	Camera:ScriptStart()
]]


n32353_CameraDryadeAvatarDunkel7 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,8,1,"script\\P205\\n32353_CameraDryadeAvatarDunkel7.lua")
   	Camera:ScriptStart()
]]



CreateCutScene
{
	Name = "P205_CutsceneDryadePhoenix", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions =
	{
		IsGlobalFlagTrue {Name = "g_P205_CutsceneDryadePhoenixStart", UpdateInterval = 10},-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
	},
	BeginActions =
	{

	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:

		[0] =
		{
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9250"},
		},
		
		[10] =
		{
			ExecuteCameraScript{Script = n32353_CameraDryadeAvatarDunkel1},
			TeleportAvatar{ X = 244, Y = 279},
			LookAtFigure{NpcId = 9250, Target = 0},				
			Goto {X = 227, Y = 281, NpcId = 0, Range = 1, WalkMode = Walk, GotoMode = GotoNormal},						
		},
	
		[30] =
		{
			CutSceneSay {Tag = "csa216dryad_001" , NpcId = 9250, String = "Endlich! Ihr seid gekommen!"},
		},			
		
		[60] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32353_CameraDryadeAvatarDunkel2},			
			LookAtFigure{NpcId = 9250, Target = 0},
			LookAtFigure{NpcId = 0, Target = 9250},			
			CutSceneSay {Tag = "csa216avatar_002" , NpcId = 0, String = "Ihr müsst die Dryade sein! Ihr seht schwach aus!"},
		},

		[70] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = n32353_CameraDryadeAvatarDunkel6},			
			CutSceneSay {Tag = "csa216dryad_003" , NpcId = 9250, String = "Ein Mörder des Maskierten vergiftet das Wasser dieses Hains!"},
		},		
		
		[80] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "csa216dryad_004" , NpcId = 9250, String = "Das Gift tötet die Bäume ... und mich mit ihnen."},
		},	
		
		[120] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32353_CameraDryadeAvatarDunkel5},				
			CutSceneSay {Tag = "csa216avatar_005" , NpcId = 0, String = "Woher kommt dieses Gift?"},
		},
				
		[140] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32353_CameraDryadeAvatarDunkel3},			
			CutSceneSay {Tag = "csa216dryad_006" , NpcId = 9250, String = "Ich ... weiß es nicht! Der Giftmischer verbirgt sich ... irgendwo im Hain!"},
		},
		
		[160] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32353_CameraDryadeAvatarDunkel7},			
			CutSceneSay {Tag = "csa216avatar_007" , NpcId = 0, String = "Ich bin nicht von Fiara hierher gereist, damit Ihr jetzt vor meinen Augen sterbt! Ich finde diesen Giftmörder! Harrt aus!"},
		},
				
		[180] =
		{
			WaitForEndOfSpeech,		
			SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_9250"},
			SetGlobalFlagFalse {Name = "g_P205_CutsceneDryadePhoenixStart"},
			SetGlobalFlagTrue{Name = "g_P205_Dryadenquest"},
			QuestSolve {QuestId = 847},
			QuestBegin {QuestId = 866},
			SetGlobalFlagTrue{Name = "g_P205_DialogDryadeFertig"},
		},		
	},
}



