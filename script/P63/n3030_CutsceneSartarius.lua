-----------------------------------------------------------------------
--
--	Sartarius 1
--
-----------------------------------------------------------------------

-- start sartarius halbnah
CameraSartariusI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,40,1,"script\\p63\\n3030_CameraSartariusI.lua")
   	Camera:ScriptStart()
]]

CameraSartariusII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,6,1,"script\\p63\\n3030_CameraSartariusII.lua")
   	Camera:ScriptStart()
]]

CameraSartariusIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,4,1,"script\\p63\\n3030_CameraSartariusIII.lua")
   	Camera:ScriptStart()
]]

CameraSartariusIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,19,1,"script\\p63\\n3030_CameraSartariusIV.lua")
   	Camera:ScriptStart()
]]

-- sartarius halbnah 2
CameraSartariusV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p63\\n3030_CameraSartariusV.lua")
   	Camera:ScriptStart()
]]

-- avatar halbnah gegenschuss
CameraSartariusVI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p63\\n3030_CameraSartariusVI.lua")
   	Camera:ScriptStart()
]]

CameraSartariusVII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p63\\n3030_CameraSartariusVII.lua")
   	Camera:ScriptStart()
]]

-- ordenskrieger
CameraSartariusVIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p63\\n3030_CameraSartariusVIII.lua")
   	Camera:ScriptStart()
]]

CameraSartariusIX = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p63\\n3030_CameraSartariusIX.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "Sartarius 1", CameraScript = "", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		-- Negated(QuestState{QuestId = 439 , State = StateUnknown , UpdateInterval = 20}),
		FigureInRange {X = 418, Y = 279, Range = 5, NpcId = 0},
	},	
	BeginActions =
	{
		-- actions zu beginn der cutscene:	
		QuestSolve {QuestId = 440},
		QuestBegin {QuestId = 441},
		QuestBegin {QuestId = 442},
		SetGlobalFlagTrue {Name = "3030_IdleOff"}, -- satarius idle off		
		-- Stop fire effect from village attack
		StopEffect {TargetType = World, X = 307, Y = 234},
		StopEffect {TargetType = World, X = 295, Y = 240},
		StopEffect {TargetType = World, X = 289, Y = 258},
		StopEffect {TargetType = World, X = 313, Y = 225},
		StopEffect {TargetType = World, X = 294, Y = 226},
		StopEffect {TargetType = World, X = 278, Y = 259},
		--
		SetNoFightFlagTrue {NpcId = 0},		
		SetNoFightFlagTrue {NpcId = 3030},			
		RemoveDialog {NpcId = 3030},								
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
			ExecuteCameraScript{Script = CameraSartariusI},
			Goto {X = 417 , Y = 277, NpcId = 0, Range = 0, WalkMode = Run}, -- Avatar on position.
			LookAtFigure{NpcId = 0, Target = 3030},
		},
		[40] = 
		{ 
			LookAtFigure{NpcId = 0, Target = 3030},
			Goto {X = 417 , Y = 281, NpcId = 0, Range = 0, WalkMode = Walk}, -- Avatar kommt.			
			CutSceneSay {Tag = "cutmaincharGrf005", NpcId = 0, String = "Sartarius?"},
		},
		[50] = 
		{
			WaitForEndOfSpeech,			
			LookAtFigure{NpcId = 0, Target = 3030},
			LookAtFigure{NpcId = 3030, Target = 0},			
			CutSceneSay {Tag = "cutsartariusGrf001", NpcId = 3030, String = "Der bin ich... Und Ihr müsst der Runenkrieger sein, den Rohen erweckt hat."},			
		},
		[80] = 
		{
			WaitForEndOfSpeech,		
			LookAtFigure{NpcId = 0, Target = 3030},
			LookAtFigure{NpcId = 3030, Target = 0},					
			CutSceneSay {Tag = "cutmaincharGrf006",NpcId = 0, String = "Rohen befindet sich in großer Gefahr! Ich muss ihn sprechen!"},
		},
		[100] = 
		{
			WaitForEndOfSpeech,	
			LookAtFigure{NpcId = 3030, Target = 0},
			LookAtFigure{NpcId = 0, Target = 3030},					
			CutSceneSay {Tag = "cutsartariusGrf002",NpcId = 3030, String = "Er brach in Richtung Wildland Pass auf - zusammen mit seiner Leibwache."},
		},
		[150] = 
		{
			WaitForEndOfSpeech,		
 			ExecuteCameraScript{Script = CameraSartariusVI},			
			LookAtFigure{NpcId = 0, Target = 3030},
			LookAtFigure{NpcId = 3030, Target = 0},			
			CutSceneSay {Tag = "cutmaincharGrf007", NpcId = 0, String = "Die wird ihm nicht genügen! Ein anderer Magier des Zirkels ist hier!"},
		},
		[200] = 
		{
			WaitForEndOfSpeech,		
			LookAtFigure{NpcId = 0, Target = 3030},
			LookAtFigure{NpcId = 3030, Target = 0},			
			CutSceneSay {Tag = "cutmaincharGrf008",NpcId = 0, String = "Er trat uns in den Bergen entgegen. Euer Bote war ein Verräter! Er führte mich geradewegs zu ihm."},
		},
		[260] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraSartariusV},		
			LookAtFigure{NpcId = 3030, Target = 0},
			LookAtFigure{NpcId = 3030, Target = 0},			
			CutSceneSay {Tag = "cutsartariusGrf003",NpcId = 3030, String = "Ein anderer Zirkelmagier? Ihr Götter! Wer?"},
			
		},
		[300] = 
		{
			WaitForEndOfSpeech,		
			LookAtFigure{NpcId = 0, Target = 3030},
			LookAtFigure{NpcId = 3030, Target = 0},			
			CutSceneSay {Tag = "cutmaincharGrf009", NpcId = 0, String = "Eine dunkle Kapuze verbarg sein Gesicht."},
		},
		[330] = 
		{
			WaitForEndOfSpeech,		
			SetGlobalFlagTrue {Name = "OrcTownAttack"},					
			LookAtFigure{NpcId = 0, Target = 3030},
			LookAtFigure{NpcId = 3030, Target = 0},			
			CutSceneSay {Tag = "cutsartariusGrf004", NpcId = 3030, String = "Und der Verräter?"},
		},
		[350] = 
		{
			WaitForEndOfSpeech,		
			LookAtFigure{NpcId = 0, Target = 3030},
			LookAtFigure{NpcId = 3030, Target = 0},			
			CutSceneSay {Tag = "cutmaincharGrf010",NpcId = 0, String = "Tot! Der dunkle Zirkelmagier gab ihm diese Schatulle, für die Anführer der Schwarzen Faust."},
		},
		[390] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraSartariusI},			
			LookAtFigure{NpcId = 3030, Target = 0},
			LookAtFigure{NpcId = 0, Target = 3030},			
			CutSceneSay {Tag = "cutsartariusGrf005",NpcId = 3030, String = "Die Schwarze Faust? Unmöglich, das würde bedeuten..."},
		},
		--------------------------------------------------------------------------------------------------------------------------------------------
		[400] = 
		{
			Goto{X = 415, Y = 272, NpcId = 3032, Range = 0, WalkMode = Run}, -- Wulfgar kommt angerannt.
		},
		[420] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraSartariusII},			
			CutSceneSay {Tag = "cutsoldatGrf001", NpcId = 3032, String = "Zu den Waffen! Zu den Waffen! Höhlenorks! Sie kommen vom Schattenpass her!"},
		},
		[480] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraSartariusV},
			CutSceneSay {Tag = "cutsartariusGrf006",NpcId = 3030, String = "Orks? Sie müssen Euch aus den Bergen gefolgt sein! Rasch!"},
			LookAtFigure{NpcId = 3032, Target = 3030},					
		},
		[495] =
		{
			WaitForEndOfSpeech,			
			ExecuteCameraScript{Script = CameraSartariusVIII},			
			Goto{X = 417, Y = 274, NpcId = 3030, Range = 3, WalkMode = Run}, -- Satarius.		
		},
		[510] = 
		{
			 Goto{X = 419, Y = 274, NpcId = 0, Range = 3, WalkMode = Run}, -- Avatar.
			 SetGlobalFlagTrue{Name = "OrdensritterZuBefehl"},
		},
		[530] = 
		{
			LookAtFigure{NpcId = 0, Target = 3031},
			LookAtFigure{NpcId = 3032, Target = 3031},
			CutSceneSay {Tag = "cutsartariusGrf007",NpcId = 3030, String = "Der Orden muss sich an der Verteidigung beteiligen! Das Stadtgesetz verlangt unser Eingreifen!"},
		},
		[580] = 
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraSartariusIX},						
			LookAtFigure{NpcId = 0, Target = 3031},
			LookAtFigure{NpcId = 3032, Target = 3031},
			CutSceneSay {Tag = "cutsartariusGrf008", NpcId = 3030, String = "Übernehmt das Kommando über diese Ritter!"},
		},
		[600] = 
		{
			WaitForEndOfSpeech,	
			LookAtFigure{NpcId = 3031, Target = 0},
			CutSceneSay {Tag = "cutritterGrf001",NpcId = 3031, String = "Zu Eurem Befehl!"}, -- ordensritter.
			QuestSolve{QuestId = 424},
		},
		[620] = 
		{
			WaitForEndOfSpeech,		
			LookAtFigure{NpcId = 3030, Target = 0},
			LookAtFigure{NpcId = 0, Target = 3030},			
			CutSceneSay {Tag = "cutsartariusGrf009",NpcId = 3030, String = "Folgt dem Soldaten zum Tor! Kehrt zu mir zurück, wenn der Angriff abgewehrt ist! Viel Glück!"},
		},
		[680] = 
		{
			WaitForEndOfSpeech,		
			LookAtFigure{NpcId = 0, Target = 3032},
			LookAtFigure{NpcId = 3032, Target = 0},
			CutSceneSay {Tag = "cutsoldatGrf002",NpcId = 3032, String = "Folgt mir!"},
		},
		[690] = 
		{
			WaitForEndOfSpeech,		
			Goto{X = 387, Y = 250, NpcId = 3032, Range = 2, WalkMode = Run}, -- wulfgar.
		},
		[710] = 
		{
			WaitForEndOfSpeech,
			SetGlobalState{Name = "Plot" , State = "JourneyOne"},
			QuestSolve{QuestId = 440},
			QuestSolve{QuestId = 424},	
			SetGlobalFlagFalse {Name = "3030_IdleOff"},	-- sartarius idle on.			
			SetGlobalFlagTrue {Name = "WulfgarGuardNowAggressive"},	-- damit der auch angrfeift, der 3032 ...
			SetNoFightFlagFalse {NpcId = 0},		
			SetNoFightFlagFalse {NpcId = 3030},
			SetRewardFlagTrue{ Name = "NachGraufurtPartEnde"},	
			EnableDialog {NpcId = 3030},									
		},
	},
}

