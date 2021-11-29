-----------------------------------------------------------------------
--
--	P209KathaiCutszeneKaiser
--
-----------------------------------------------------------------------


n32493_CameraKaiser1 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32493_CameraKaiser1.lua")
   	Camera:ScriptStart()
]]

n32494_CameraKaiser2 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32494_CameraKaiser2.lua")
   	Camera:ScriptStart()
]]

n32495_CameraKaiser3 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32495_CameraKaiser3.lua")
   	Camera:ScriptStart()
]]

n32496_CameraKaiser4 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32496_CameraKaiser4.lua")
   	Camera:ScriptStart()
]]

n32496_CameraKaiser5 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\P209\\n32496_CameraKaiser5.lua")
   	Camera:ScriptStart()
]]

n32486_CameraBote25 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\P209\\n32486_CameraBote25.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "P209KathaiCutszeneKaiser", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		IsGlobalFlagTrue {Name = "g_sP209CutszeneKaiserStart", UpdateInterval = 10},
		FigureInRange {X = 238, Y = 317, NpcId = 8590, Range = 3, UpdateInterval = 10},
		Negated(EnemyUnitInRange {X = 225, Y = 300, NpcId = Avatar, Range = 20, UnitId = 0, UpdateInterval = 10}),
	},
	BeginActions =
	{
		--actions zu beginn der cutscene:
		SetNoFightFlagTrue {NpcId = 9906}, --Kaiser
		SetNoFightFlagTrue {NpcId = 8590}, --Aliah
		SetNoFightFlagTrue {NpcId = 0}, --Avatar
		SetGlobalFlagTrue{Name = "g_Irfit_SetNoFightFlag"},
		SetGlobalFlagFalse {Name = "g_sP209KhalFollow"}, 
		SetGlobalFlagFalse {Name = "g_sP209JenquaiFollow"},
		Goto {X = 210, Y = 319, NpcId = 8590, Range = 0, WalkMode = Walk, GotoMode = GotoForced},
		Goto {X = 209, Y = 319, NpcId = 9906, Range = 3, WalkMode = Walk, GotoMode = GotoForced},
		SetHealth {HitPoints = 1059, NpcId = 8590, Decrease = FALSE},
		 
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[10] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32493_CameraKaiser1},
				CutSceneSay {Tag = "csa234emperor_001" , NpcId = 9906, String = "Ihr denkt ihr habt gesiegt, aber es hat erst begonnen!"},	
				HoldPosition {NpcId = 9906, FreeWill = FALSE},
				SetNoFightFlagFalse {NpcId = 8590}, --Aliah
				SetNoFightFlagFalse {NpcId = 9906}, --Kaiser
				--Goto {X = 210, Y = 319, NpcId = 8590, Range = 3, WalkMode = Walk, GotoMode = GotoForced},
		},
		[80] =
		{
				CastSpell {Spell = 72, Target = 8590, TargetType = Figure, X = 0, Y = 0, NpcId = 9906},
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				CutSceneSay {Tag = "csa234emperor_002" , NpcId = 9906, String = "Spürt nun meine Macht!"},
			
		},
		[140] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				CutSceneSay {Tag = "csa234alyah_003" , NpcId = 8590, String = "Deine Macht ist nur Schabernack, Vater!"},	
		},
		[200] =
		{
				
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				HoldPosition {NpcId = 9906, FreeWill = TRUE},
				
				Goto {X = 210, Y = 319, NpcId = 8590, Range = 0, WalkMode = Walk, GotoMode = GotoForced},
				CutSceneSay {Tag = "csa234emperor_004" , NpcId = 9906, String = "Neiiin! Das ist ... unmöglich! Unmöglich!"},
		},
		[250] =
		{
				Goto {X = 210, Y = 319, NpcId = 8590, Range = 0, WalkMode = Walk, GotoMode = GotoForced},
		},
		[270] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32495_CameraKaiser3},
									
				Goto {X = 210, Y = 319, NpcId = 8590, Range = 0, WalkMode = Walk, GotoMode = GotoForced},
				CutSceneSay {Tag = "csa234emperor_005" , NpcId = 9906, String = "Er hatte es versprochen ..."},
				SetNoFightFlagTrue {NpcId = 9906}, --Kaiser
				SetNoFightFlagTrue {NpcId = 8590}, --Aliah
		},
		[340] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				
				CutSceneSay {Tag = "csa234emperor_006" , NpcId = 9906, String = "Die Macht ... Die Macht der Zirkelmagier ..."},
				LookAtFigure{ Target = 9906, NpcId = 8590},
		},
		[410] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32494_CameraKaiser2},
				
				LookAtFigure{ Target = 9906, NpcId = 8590},
				LookAtFigure{ Target = 8590, NpcId = 9906},
				CutSceneSay {Tag = "csa234alyah_007" , NpcId = 8590, String = "Leichtgläubiger! Der Maskierte hat einen Narren aus dir gemacht!"},
				SetNoFightFlagFalse {NpcId = 9906}, --Kaiser
				SetNoFightFlagFalse {NpcId = 8590}, --Aliah
				
				

		},
		[500] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32495_CameraKaiser3},
				CutSceneSay {Tag = "csa234emperor_008" , NpcId = 9906, String = "Nein! Ich bin ... der Göttliche! Der Göttliche!"},
				
				
		},
		[560] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32493_CameraKaiser1},
				SetNoFightFlagTrue {NpcId = 9906}, --Kaiser
				SetNoFightFlagTrue {NpcId = 8590}, --Aliah
				Goto {X = 213, Y = 318, NpcId = 9906, Range = 3, WalkMode = Walk, GotoMode = GotoForced},
				CutSceneSay {Tag = "csa234emperor_009" , NpcId = 9906, String = "Aber ... ich kann doch nicht ... sterben ..."},
				
		},
		[590] =
		{
				Goto {X = 210, Y = 319, NpcId = 8590, Range = 0, WalkMode = Walk, GotoMode = GotoForced},
		},
		[630] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32496_CameraKaiser4},
				LookAtFigure{ Target = 9906, NpcId = 8590},
				CutSceneSay {Tag = "csa234alyah_010" , NpcId = 8590, String = "Ruh dich aus, Vater. Mutter wartet auf dich."},
				--TeleportAvatar {X = 226, Y = 318},	
				
		},
		[690] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				SetNoFightFlagFalse {NpcId = 8590}, --Aliah
				AttackTarget {Target = 9906, NpcId = 8590, FriendlyFire = FALSE},
				CutSceneSay {Tag = "csa234emperor_011" , NpcId = 9906, String = "Kaira ..."},
				LookAtFigure{ Target = 9906, NpcId = 8590},
				SetGlobalFlagTrue {Name = "g_sP209KaiserStirbtInCutszene"},	
		},
		[740] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32493_CameraKaiser1},
				--CutSceneSay {Tag = "csa234alyah_012" , NpcId = 8590, String = "Und jetzt bekommt diese maskierte Schlange, was sie verdient!"},
				--CutSceneSay {Tag = "oca2alyahP209_011" , NpcId = 8590, String = "Der Kaiser ist tot! Nun habt Ihr endlich Zeit, mit der Uru zu sprechen!"},
				SetNoFightFlagTrue {NpcId = 8590}, --Aliah
				Goto {X = 250, Y = 317, NpcId = 8590, Range = 3, WalkMode = Walk, GotoMode = GotoForced},
				
		},
		[800] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32496_CameraKaiser5},
				CutSceneSay {Tag = "oca2alyahP209_011" , NpcId = 8590, String = "Der Kaiser ist tot! Nun habt Ihr endlich Zeit, mit der Uru zu sprechen!"},
				--CutSceneSay {Tag = "oca2alyahP209_012" , NpcId = 8590, String = "Und dann ist diese Maskierte Schlange an der Reihe!"},
				SetGlobalFlagTrue {Name = "g_sP209UmspawnKaiserCutsazene1"},
				TeleportAvatar {X = 380, Y = 254},	
				SetEffect {Effect = "BuildingFire", X = 486, Y = 240, Length = 0, TargetType = World},
				SetEffect {Effect = "BuildingFire", X = 488, Y = 240, Length = 0, TargetType = World},
				SetEffect {Effect = "Torch", X = 490, Y = 238, Length = 0, TargetType = World},
				SetEffect {Effect = "Torch", X = 490, Y = 242, Length = 0, TargetType = World},
				SetEffect {Effect = "Torch", X = 484, Y = 238, Length = 0, TargetType = World},
				SetEffect {Effect = "Torch", X = 484, Y = 242, Length = 0, TargetType = World},
				SetEffect {Effect = "Torch", X = 485, Y = 239, Length = 0, TargetType = World},
				SetEffect {Effect = "Torch", X = 485, Y = 241, Length = 0, TargetType = World},
				SetEffect {Effect = "Torch", X = 489, Y = 239, Length = 0, TargetType = World},
				SetEffect {Effect = "Torch", X = 489, Y = 241, Length = 0, TargetType = World},
		},
		[860] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				--ExecuteCameraScript{Script = n32496_CameraKaiser5},
				--CutSceneSay {Tag = "oca2alyahP209_011" , NpcId = 8590, String = "Der Kaiser ist tot! Nun habt Ihr endlich Zeit, mit der Uru zu sprechen!"},
				CutSceneSay {Tag = "oca2alyahP209_012" , NpcId = 8590, String = "Und dann ist diese Maskierte Schlange an der Reihe!"},
				
		},
		[920] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				ExecuteCameraScript{Script = n32486_CameraBote25},
				--CutSceneSay {Tag = "oca2alyahP209_012" , NpcId = 8590, String = "Und dann ist diese Maskierte Schlange an der Reihe!"},
				
				Goto {X = 410, Y = 255, NpcId = 0, Range = 3, WalkMode = Run, GotoMode = GotoForced},
				StopEffect {X = 486, Y = 240, TargetType = World},
				StopEffect {X = 488, Y = 240, TargetType = World},
				StopEffect {X = 490, Y = 242, TargetType = World},
				StopEffect {X = 490, Y = 238, TargetType = World},
				StopEffect {X = 484, Y = 238, TargetType = World},
				StopEffect {X = 484, Y = 242, TargetType = World},
				StopEffect {X = 485, Y = 239, TargetType = World},
				StopEffect {X = 485, Y = 241, TargetType = World},
				StopEffect {X = 489, Y = 239, TargetType = World},
				StopEffect {X = 489, Y = 241, TargetType = World},
				
		},
		[1080] =
		{
				WaitForEndOfSpeech,	 --sollte immer angegeben werden
				SetNoFightFlagFalse {NpcId = 8590}, --Aliah
				SetNoFightFlagFalse {NpcId = 0}, --Avatar
				SetGlobalFlagFalse{Name = "g_Irfit_SetNoFightFlag"},
				SetGlobalFlagTrue{Name = "g_sP209CutszeneKaiserEnded"},
		},		
	},
}



