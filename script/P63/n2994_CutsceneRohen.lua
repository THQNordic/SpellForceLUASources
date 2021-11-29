-----------------------------------------------------------------------
--
--	Dark Rohen 
--
-----------------------------------------------------------------------

CameraRohenI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,22,1,"script\\p63\\n2994_CameraRohenI.lua")
   	Camera:ScriptStart()
]]

CameraRohenII = 
[[
  	Camera:ScriptReset()
   	Camera:ScriptAddSpline(0,29,1,"script\\p63\\n2994_CameraRohenII.lua")
   	Camera:ScriptStart()
]]

CameraRohenIII = 
[[
  	Camera:ScriptReset()
   	Camera:ScriptAddSpline(0,15,1,"script\\p63\\n2994_CameraRohenIII.lua")
   	Camera:ScriptStart()
]]

CameraRohenIV = 
[[
  	Camera:ScriptReset()
   	Camera:ScriptAddSpline(0,10,1,"script\\p63\\n2994_CameraRohenIV.lua")
   	Camera:ScriptStart()
]]

CameraRohenV = 
[[
  	Camera:ScriptReset()
   	Camera:ScriptAddSpline(0,30,1,"script\\p63\\n2994_CameraRohenV.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "DarkRohen", CameraScript = "", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		FigureInRangeNpc {TargetNpcId = 0, NpcId = 2994, UpdateInterval = 5, Range = 20},
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:		
		SetGlobalFlagTrue {Name = "RandolfSpawns"},	
		--Goto {X = 127, Y = 239, NpcId = 2916, Range = 0, WalkMode = Walk},	-- bote
		Goto {X = 126, Y = 240, NpcId = 0, Range = 0, WalkMode = Walk}, 	-- avatar	
		SetNoFightFlagTrue{NpcId = 0},	
		--SetNoFightFlagTrue{NpcId = 2916},	
		SetNoFightFlagTrue{NpcId = 2994},											
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps nach der die jeweilige Action erfolgen soll:
		[0] =
		{
			-- die ersten zwei sekunden ohne kamera:
			Goto {X = 131, Y = 246, NpcId = 2994, Range = 0, WalkMode = Walk},	-- darkrohen
			--Goto {X = 127, Y = 239, NpcId = 2916, Range = 0, WalkMode = Walk},	-- bote
			
			--LookAtFigure {NpcId = 2994, Target = 2916},
			--LookAtFigure {NpcId = 2916, Target = 2994},
			LookAtFigure {NpcId = 0, Target = 2994},	
		},
		[20] =
		{
			ExecuteCameraScript {Script = CameraRohenIV},	-- erste kamera.
			LookAtFigure {Target = 0, NpcId = 2994},	
			Goto {X = 126, Y = 240, NpcId = 0, Range = 0, WalkMode = Walk}, 	-- avatar			
			SetGlobalFlagTrue {Name = "BoteUmspawning"},	
		},
		[30] = 
		{ 
			LookAtFigure {NpcId = 2916, Target = 2994},
			LookAtFigure {NpcId = 0, Target = 2994},
			Goto {X = 127, Y = 239, NpcId = 2916, Range = 0, WalkMode = Walk},	-- bote
			Goto {X = 126, Y = 240, NpcId = 0, Range = 0, WalkMode = Walk}, 	-- avatar
		},
		[50] = 
		{
			ExecuteCameraScript{Script = CameraRohenIII},	
			LookAtFigure {NpcId = 2916, Target = 2994},
			LookAtFigure {NpcId = 0, Target = 2994},
			CastSpell {Spell = 280, Target = 0, TargetType = Figure, X = 0, Y = 0, NpcId = 2994},	-- CAST : avatar freezed.									
		},
		[80] = 
		{
			ExecuteCameraScript{Script = CameraRohenI},	
			SetEffect   {Effect = "IcePack", NpcId = 0, Length = 65000}, 	-- besserer look	
			--SetEffect   {Effect = "Petrify", NpcId = 0, Length = 50000}, 	-- bessere performance		
			SetFreezeFlagTrue {},	-- avatar freezed.					
		},
		[100] =
		{		
			LookAtFigure {NpcId = 2916, Target = 2994},	
			LookAtFigure {NpcId = 2994, Target = 2916},		
			LookAtFigure {NpcId = 0, Target = 2994},
			Goto {X = 129, Y = 242, NpcId = 2994, Range = 0, WalkMode = Walk},									
			CutSceneSay {Tag = "cutdunklerGrf001", NpcId = 2994, String = "Ist der Alte aufgebrochen?"},
		},
		[125] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript {Script = CameraRohenII},
			SetFreezeFlagTrue {},	-- avatar freezed (safe).				
			Goto {X = 129, Y = 242, NpcId = 2994, Range = 0, WalkMode = Walk},							
			LookAtFigure {NpcId = 2916, Target = 2994},	
			LookAtFigure {NpcId = 2994, Target = 2916},			
			CutSceneSay {Tag = "cutboteGrf007",NpcId = 2916, String = "Wie Ihr es voraus gesagt habt, Herr! Er wird sich zum Wildland Pass begeben!"},
		},
		[150] = 
		{
			WaitForEndOfSpeech,					
			LookAtFigure {NpcId = 2916, Target = 2994},	
			LookAtFigure {NpcId = 2994, Target = 2916},			
			CutSceneSay {Tag = "cutdunklerGrf002", NpcId = 2994, String = "Gut! Die Schlinge zieht sich langsam zu! Von dort wird er nicht mehr zurückkehren!"},
		},
		[210] = 
		{
			WaitForEndOfSpeech,					
			ExecuteCameraScript {Script = CameraRohenV},				
			LookAtFigure {NpcId = 2916, Target = 2994},	
			LookAtFigure {NpcId = 2994, Target = 2916},			
			CutSceneSay {Tag = "cutboteGrf008",NpcId = 2916, String = "Was geschieht mit dem Runensklaven, Herr?"},
		},
		[250] = 
		{
			WaitForEndOfSpeech,					
			LookAtFigure {NpcId = 2916, Target = 2994},	
			LookAtFigure {NpcId = 2994, Target = 2916},			
			CutSceneSay {Tag = "cutdunklerGrf003",NpcId = 2994, String = "Töte ihn!"},
		},
		[260] = 
		{
			WaitForEndOfSpeech,					
			Goto {X = 137, Y = 248, NpcId = 3112, Range = 0, WalkMode = Walk, GotoMode = GotoForced}, -- heiler kommt!						
			LookAtFigure {NpcId = 2916, Target = 2994},	
			LookAtFigure {NpcId = 2994, Target = 2916},			
			CutSceneSay {Tag = "cutdunklerGrf004", NpcId = 2994, String = "Und übergib anschließend diese Schatulle den Anführern der Schwarzen Faust! Sie enthält die Pläne für die Invasion!"},
		},		
		[320] = 
		{
			WaitForEndOfSpeech,	
			Goto {X = 137, Y = 248, NpcId = 3112, Range = 0, WalkMode = Walk, GotoMode = GotoForced}, -- heiler kommt!								
			CutSceneSay {Tag = "cutboteGrf009",NpcId = 2916, String = "Aber Herr, ich kann diesen Runenkrieger nicht besiegen! Ich bin nur ein Bote, kein Kämpfer!"},
		},
		[380] = 
		{
			WaitForEndOfSpeech,					
			ExecuteCameraScript {Script = CameraRohenII},				
			LookAtFigure {NpcId = 2994, Target = 2916},
			Goto {X = 129, Y = 242, NpcId = 2994, Range = 0, WalkMode = Walk},			
			CutSceneSay {Tag = "cutdunklerGrf005", NpcId = 2994, String = "Ich habe vollstes Vertrauen zu Dir! Töte ihn! Dann bring die Schatulle zur Schwarzen Faust! Ich werde Dich fürstlich belohnen! Ha, ha, ha..."},
		},
		[450] = 
		{
			WaitForEndOfSpeech,					
			SetEffect   {Effect = "DeMaterialize", NpcId = 2994, Length = 2500}, 
			CutSceneSay {Tag = "cutboteGrf010", NpcId = 2916, String = "Herr... "},
		},
		[470] =
		{
			Vanish {NpcId = 2994},
			SetFreezeFlagFalse {NpcId = 0},
			StopEffect {NpcId = 0},
		},
		[490] = 
		{
			LookAtFigure {NpcId = 2916, Target = 0},
			LookAtFigure {NpcId = 0, Target = 2916},			
			CutSceneSay {Tag = "cutboteGrf011",NpcId = 2916, String = "Wohlan denn... stirb, Runensklave!"},
			SetGlobalFlagFalse {Name = "FollowSummoner"},	-- messenger stop follow avatar, stop health regen!
			QuestBegin{QuestId = 426},
			QuestSolve{QuestId = 425},	
			SetGlobalFlagTrue {Name = "DarkRohenDisappeared"},
			SetNoFightFlagFalse{NpcId = 0},	
			SetNoFightFlagFalse{NpcId = 2916},				
			SetGlobalFlagTrue {Name = "BoteMustAttackAvatar"},
			CGdsFigureSetHealth:new(2916, 1),					
		},
		[510] =
		{
			ChangeRace {NpcId = 2916, Race = 150},			
			AttackTarget {NpcId = 2916, Target = 0},			
		},
		[560] =
		{
			WaitForEndOfSpeech,
			SetGlobalTimeStamp {Name = "TimerCutsceneRohen"},
		},
	},
}

