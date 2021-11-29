n32323_CameraShowdownEmpyria = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P204\\n32323_CameraShowdownEmpyria.lua")
   	Camera:ScriptStart()
]]

n32323_CameraShowdownEmpyria1 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P204\\n32323_CameraShowdownEmpyria1.lua")
   	Camera:ScriptStart()
]]

n32323_CameraShowdownEmpyria2 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P204\\n32323_CameraShowdownEmpyria2.lua")
   	Camera:ScriptStart()
]]

n32323_CameraShowdownEmpyria3 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P204\\n32323_CameraShowdownEmpyria3.lua")
   	Camera:ScriptStart()
]]

n32323_CameraShowdownEmpyria4 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P204\\n32323_CameraShowdownEmpyria4.lua")
   	Camera:ScriptStart()
]]

n32323_CameraShowdownEmpyria5 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P204\\n32323_CameraShowdownEmpyria5.lua")
   	Camera:ScriptStart()
]]




CreateCutScene
{
	Name = "P204_Cutscene_Showdown", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions =
	{
		IsGlobalFlagTrue {Name = "g_P204_CutsceneShowdownStart", UpdateInterval = 10},
	},
	BeginActions =
	{

	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[0] =
		{
			SetGlobalFlagTrue{Name = "g_Irfit_SetNoFightFlag"},		
			SetGlobalFlagTrue{Name = "g_P204_EmpyriaEndkampf"},			
			SetGlobalFlagTrue{Name = "g_P204_NandiniNervNicht"},	
		},
			
		[5] =
		{
			ExecuteCameraScript{Script = n32323_CameraShowdownEmpyria},
			ChangeRace{Race = 152, NpcId = 8791},
			ChangeRace{Race = 152, NpcId = 8787},
			Goto {X = 324, Y = 168, NpcId = 0, Range = 0, WalkMode = Run, GotoMode = GotoNormal},
		},
	
		[10] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "csa223alyah_002" , NpcId = 8787, String = "Die Palastwache!"},
		},
		
		[20] =
		{
			SetGlobalFlagTrue{Name = "g_P204_YrmirAngriff"},			
		},
		
		[70] =
		{
			ExecuteCameraScript{Script = n32323_CameraShowdownEmpyria1},	
			SetGlobalFlagTrue{Name = "g_P204_TorNachRedWasteAufmachen"},					
			CutSceneSay {Tag = "csa223yrmir_001" , NpcId = 9895, String = "Steht wo ihr seid! Wachen, kreist sie ein!"},
		},
		
		[100] =
		{	
			SetGlobalFlagTrue{Name = "g_P204_WachenFormieren"},			
		},			
		
		[160] =
		{
			ExecuteCameraScript{Script = n32323_CameraShowdownEmpyria2},	
			LookAtFigure{NpcId = 8794, Target = 8787},	
			LookAtFigure{NpcId = 8787, Target = 8794},						
			CutSceneSay {Tag = "csa223haran_005" , NpcId = 8794, String = "Flieht schnell, Prinzessin! Mir werden sie nichts antun! Ich halte sie auf!"},
		},
		
		[200] =
		{
			Goto {X = 354, Y = 168, NpcId = 8787, Range = 0, WalkMode = Run, GotoMode = GotoNormal},
			Goto {X = 356, Y = 169, NpcId = 8791, Range = 0, WalkMode = Run, GotoMode = GotoNormal},
			Goto {X = 354, Y = 170, NpcId = 0, Range = 0, WalkMode = Run, GotoMode = GotoNormal},			
		},
		
		
		[220] =
		{
			WaitForEndOfSpeech,		
			Goto {X = 327, Y = 169, NpcId = 8794, Range = 0, WalkMode = Walk, GotoMode = GotoNormal},			
			CutSceneSay {Tag = "csa223haran_006" , NpcId = 8794, String = "Palastwachen! Zurück mit euch! Ich bin Gesandter der Kathai!"},
		},
		
		[270] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = n32323_CameraShowdownEmpyria4},			
			CutSceneSay {Tag = "csa223yrmir_004" , NpcId = 9895, String = "Da! Sie leisten Widerstand, macht sie nieder!"},
		},	
		
		
		[290] =
		{
			WaitForEndOfSpeech,	
			SetGlobalFlagTrue{Name = "g_P204_WachenKillenHaran"},	
		},
		[300] =
		{
	
			ExecuteCameraScript{Script = n32323_CameraShowdownEmpyria5},			
			CastSpell{Spell = 2567, Target = 9901, TargetType = Figure, X = 0, Y = 0, NpcId = 8794},
		},
		
		[370] =
		{
			LookAtFigure{NpcId = 8787, Target = 8791},	
			LookAtFigure{NpcId = 8791, Target = 8787},				
		},

		[380] =
		{
			ExecuteCameraScript{Script = n32323_CameraShowdownEmpyria3},	
			CutSceneSay {Tag = "csa223urias_007" , NpcId = 8791, String = "Wir müssen ihm helfen!"},
		},
		
		[400] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "csa223alyah_008" , NpcId = 8787, String = "Es ist zu spät! Los, durch das Portal, ihr Narren!"},
		},
		
		[430] =
		{
			WaitForEndOfSpeech,						
			Goto {X = 362, Y = 169, NpcId = 8787, Range = 0, WalkMode = Run, GotoMode = GotoNormal},
			Goto {X = 362, Y = 169, NpcId = 8791, Range = 0, WalkMode = Run, GotoMode = GotoNormal},				
		},
		
		
		[470] =
		{
			SetGlobalTimeStamp{Name = "c_P205_CounterUriasDespawnt"},
			SetGlobalTimeStamp{Name = "c_P205_CounterAlyahDespawnt"},					
			SetGlobalFlagTrue{Name = "g_P204_YrmirZurueck"},				
			SetGlobalFlagTrue{Name = "g_P204_YrmirSidequestOn"},
			ChangeRace{Race = 152, NpcId = 9895},	
			SetGlobalFlagTrue{Name = "g_P204_HaranKampf"},				
			SetGlobalTimeStamp{Name = "c_P204_CounterShowdownWachenZurueck"},	
			SetGlobalFlagFalse{Name = "g_P204_NandiniNervNicht"},	
			SetGlobalFlagFalse{Name = "g_Irfit_SetNoFightFlag"},	
			QuestSolve {QuestId = 1058},					
		},
		
		[500] =
		{
					
		},

	},
}



