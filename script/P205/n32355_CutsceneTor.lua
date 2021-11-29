n32355_CameraTor1 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P205\\n32355_CameraTor1.lua")
   	Camera:ScriptStart()
]]

n32355_CameraTor2 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P205\\n32355_CameraTor2.lua")
   	Camera:ScriptStart()
]]

n32355_CameraTor3 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P205\\n32355_CameraTor3.lua")
   	Camera:ScriptStart()
]]

n32355_CameraTor4 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P205\\n32355_CameraTor4.lua")
   	Camera:ScriptStart()
]]

n32355_CameraTor5 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\P205\\n32355_CameraTor5.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "P205_CutsceneTor", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions =
	{
		IsGlobalFlagTrue {Name = "g_P205_CutsceneGartentor", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_nP202_SchattenklingeSpieler"},
	},
	BeginActions =
	{

	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[0] =
		{
			SetGlobalFlagTrue{Name ="PleaseRemoveDialog_9250"},		
			SetGlobalFlagTrue{Name = "g_P205_DariusUndDerMaskierte"},		
			SetGlobalFlagTrue{Name = "g_P205_CutsceneTorNoFight"},		
		},
		
		[10] =
		{
			ExecuteCameraScript{Script = n32355_CameraTor1},
		},
	
		[20] =
		{
			WaitForEndOfSpeech,	
			Goto {X = 335, Y = 265, NpcId = 0, Range = 1, WalkMode = Walk, GotoMode = GotoNormal},			
			CutSceneSay {Tag = "csa215avatar_001" , NpcId = 0, String = "Die Schmerzen werden stärker. Ich muss diese Frau töten ... bald kann ich das Schwert nicht mehr heben ..."},
		},			
		
		[30] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32355_CameraTor2},			
			CutSceneSay {Tag = "csa215darius_002" , NpcId = 11759, String = "Noch ist es nicht zu spät...."},
		},
		
		
		[40] =
		{
			WaitForEndOfSpeech,			
			ExecuteCameraScript{Script = n32355_CameraTor1},
			Goto {X = 334, Y = 270, NpcId = 0, Range = 1, WalkMode = Walk, GotoMode = GotoNormal},
		},
		
		[60] =
		{
			WaitForEndOfSpeech,			
			CutSceneSay {Tag = "csa215avatar_003" , NpcId = 0, String = "Wer spricht da?"},
		},		
		
		[80] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32355_CameraTor2},			
			CutSceneSay {Tag = "csa215darius_004" , NpcId = 11759, String = "Lasst ab, Runenknecht ... erhebt nicht das Schwert gegen diejenige, die Euch helfen kann."},
		},	
		
		[120] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "csa215darius_005" , NpcId = 11759, String = "Übt stattdessen Vergeltung an dem, der Eure Rache verdient hat!"},
		},
				
		[140] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32355_CameraTor5},			
			LookAtFigure{NpcId = 9250, Target = 0},
			CutSceneSay {Tag = "csa215masked_006" , NpcId = 11758, String = "Genug!"},
		},

		[160] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "csa215masked_007" , NpcId = 11758, String = "Hört nicht auf ihre Täuschungen! Erschlagt sie! Dann werde ich Eure Schmerzen lindern ... nur dann!"},
		},
		
		[230] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "csa215masked_008" , NpcId = 11758, String = "Vorwärts! Tötet die Dryade!"},
		},	
		
		[280] =
		{
			WaitForEndOfSpeech,		
			SetGlobalFlagFalse {Name = "g_P205_CutsceneGartentor"},
			SetGlobalFlagFalse{Name = "g_P205_CutsceneTorNoFight"},	
			SetGlobalFlagTrue{Name = "g_P205_DariusUndDerMaskierteDespawn"},					
		},		
	},
}



