-----------------------------------------------------------------------
--
--	Sartarius Death
--
-----------------------------------------------------------------------

-- erste fahrt auf avatar
CameraSartariusI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p25\\n3024_CameraSartariusI.lua")
   	Camera:ScriptStart()
]]

-- sartarius halbnah
CameraSartariusII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,35,1,"script\\p25\\n3024_CameraSartariusII.lua")
   	Camera:ScriptStart()
]]

-- blades erscheinen
CameraSartariusIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,25,1,"script\\p25\\n3024_CameraSartariusIII.lua")
   	Camera:ScriptStart()
]]

-- rohen labert mit sart. und avatar
CameraSartariusIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,35,1,"script\\p25\\n3024_CameraSartariusIV.lua")
   	Camera:ScriptStart()
]]

-- urias und craigh kommen
CameraSartariusV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p25\\n3024_CameraSartariusV.lua")
   	Camera:ScriptStart()
]]

-- raith nah
CameraSartariusVI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p25\\n3024_CameraSartariusVI.lua")
   	Camera:ScriptStart()
]]

-- sartarius fesseln
CameraSartariusVII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p25\\n3024_CameraSartariusVII.lua")
   	Camera:ScriptStart()
]]

-- durch die blades
CameraSartariusVIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p25\\n3024_CameraSartariusVIII.lua")
   	Camera:ScriptStart()
]]

-- avatar nah
CameraSartariusIX = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p25\\n3024_CameraSartariusIX.lua")
   	Camera:ScriptStart()
]]

CreateCutScene
{
	Name = "SartariusDeath", CameraScript = "", PlayOnlyOnce = TRUE,
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		Negated (FigureAlive {NpcId = 4460}),
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:
		SetNoFightFlagTrue {NpcId = 0},	
		CGdsFigureSetHealth:new(4461, 1),	
		SetNoFightFlagTrue {NpcId = 4461},	-- sartarius ist geschuetzt.	
		RemoveDialog {NpcId = 4461},	
		TalkAnimStop{NpcId = 4461},
		
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		[0] =
		{
		},
		[10] =
		{
			ExecuteCameraScript{Script = CameraSartariusI},	
			Goto{X = 372, Y = 188, NpcId = 0, WalkMode = Run, Range = 0},	-- avatar.
			LookAtFigure{Target = 4461, NpcId = 0},	
		},
		[20] =
		{
			SetGlobalFlagTrue {Name = "BladeSpawns"},				
		},
		[40] = 
		{ 
			LookAtFigure{Target = 4461, NpcId = 0},			
			CutSceneSay {Tag = "cutmaincharSthGodm001", NpcId = 0, String = "Sartarius!"},
			
			SetNoFightFlagTrue {NpcId = 3037},	
			SetNoFightFlagTrue {NpcId = 3038},	
			SetNoFightFlagTrue {NpcId = 3039},	
			SetNoFightFlagTrue {NpcId = 3040},	
			SetNoFightFlagTrue {NpcId = 3041},	
			SetNoFightFlagTrue {NpcId = 3042},	
			SetNoFightFlagTrue {NpcId = 3043},	
			
			SetEffect   {Effect = "SimpleInvis", NpcId = 3037, Length = 0},	-- raith invisible
			SetEffect   {Effect = "SimpleInvis", NpcId = 3038, Length = 0}, -- blades invisible.....>>
			SetEffect   {Effect = "SimpleInvis", NpcId = 3039, Length = 0}, 
			SetEffect   {Effect = "SimpleInvis", NpcId = 3040, Length = 0}, 
			SetEffect   {Effect = "SimpleInvis", NpcId = 3041, Length = 0}, 
			SetEffect   {Effect = "SimpleInvis", NpcId = 3042, Length = 0},
			SetEffect   {Effect = "SimpleInvis", NpcId = 3043, Length = 0}, 				
		},
		[60] = 
		{
			WaitForEndOfSpeech,		
			--LookAtFigure{Target = 0, NpcId = 4461},		
			LookAtFigure{Target = 4461, NpcId = 0},										
			CutSceneSay {Tag = "cutsartariusSthGodm001", NpcId = 4461, String = "Ihr? Den Göttern... sei Dank, dann... besteht noch Hoffnung!"},
			SetNoFightFlagTrue {NpcId = 3037},	
			SetNoFightFlagTrue {NpcId = 3038},	
			SetNoFightFlagTrue {NpcId = 3039},	
			SetNoFightFlagTrue {NpcId = 3040},	
			SetNoFightFlagTrue {NpcId = 3041},	
			SetNoFightFlagTrue {NpcId = 3042},	
			SetNoFightFlagTrue {NpcId = 3043},				
		},
		[90] = 
		{
			WaitForEndOfSpeech,				
			CutSceneSay {Tag = "cutsartariusSthGodm002", NpcId = 4461, String = "Kümmert Euch nicht um mich... Ihr müsst weiter... ins Nachtflüstertal! Dort... steht das große Portal... nach Urgath!"},
		},
		[150] = 
		{
			ExecuteCameraScript{Script = CameraSartariusII},		
			WaitForEndOfSpeech,				
			CutSceneSay {Tag = "cutsartariusSthGodm003", NpcId = 4461, String = "Sie kommen von dort! Ihr Ursprung... muss in Urgath liegen! Ihr müsst... dorthin! Wir haben sie... unterschätzt..."},
		},
		[210] = 
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraSartariusVII},				
			CutSceneSay {Tag = "cutmaincharSthGodm002", NpcId = 0, String = "Lasst mich Euch zuerst befreien..."},

			LookAtFigure{Target = 0, NpcId = 3037},	-- blades und raith sehen richtung avatar.
			LookAtFigure{Target = 0, NpcId = 3038},
			LookAtFigure{Target = 0, NpcId = 3039},
			LookAtFigure{Target = 0, NpcId = 3040},
			LookAtFigure{Target = 0, NpcId = 3041},
			LookAtFigure{Target = 0, NpcId = 3042},
			LookAtFigure{Target = 0, NpcId = 3043},																					
		},
		[240] = 
		{
			WaitForEndOfSpeech,			
			--Goto {NpcId = 0, X = 371, Y = 189, WalkMode = Walk},	-- avatar geht zu sartarius.
			CutSceneSay {Tag = "cutsartariusSthGodm004", NpcId = 4461, String = "Nein! Rührt... die Fesseln nicht an! Ein... Zauber liegt..."},
		},
		[280] = 
		{
			-- Blitz friert beide ein, Dunkler erscheint
			ExecuteCameraScript{Script = CameraSartariusII},			
			SetEffect   {Effect = "IcePack", NpcId = 4461, Length = 100000}, 
			SetEffect   {Effect = "IcePack", NpcId = 0, Length = 290000}, 
			
			--SetEffect   {Effect = "IcePackForever", NpcId = 4461, Length = 0}, 
			--SetEffect   {Effect = "IcePackForever", NpcId = 0, Length = 0}, 			
			
			SetFreezeFlagTrue {NpcId = 0},

			SetFreezeFlagTrue {NpcId = 4461},			
					
			CGdsFigureSetHealth:new(4461, 1),	
		},
		[310] = 
		{
			ExecuteCameraScript{Script = CameraSartariusIII},	
			
			StopEffect {NpcId = 3037},			
			StopEffect {NpcId = 3038},
			StopEffect {NpcId = 3039},			
			StopEffect {NpcId = 3040},			
			StopEffect {NpcId = 3041},			
			StopEffect {NpcId = 3042},
			StopEffect {NpcId = 3043},		
			
			SetEffect   {Effect = "Materialize", NpcId = 3038, Length = 3000}, 
			SetEffect   {Effect = "Materialize", NpcId = 3039, Length = 3000}, 
			SetEffect   {Effect = "Materialize", NpcId = 3040, Length = 3000}, 
			SetEffect   {Effect = "Materialize", NpcId = 3041, Length = 3000}, 
			SetEffect   {Effect = "Materialize", NpcId = 3042, Length = 3000}, 
			SetEffect   {Effect = "Materialize", NpcId = 3043, Length = 3000}, 
			
			SetEffect   {Effect = "Materialize", NpcId = 3037, Length = 3000}, 																							
			
			-- CastSpell {Spell = 280, X = 0, Y = 0, Target = 0, TargetType = Figure, NpcId = 3037},
		},
		[350] = 
		{ 
			Goto{X = 369, Y = 188, NpcId = 3037, WalkMode = Walk, Range = 0},	-- raith.
			
			Goto{X = 363, Y = 184, NpcId = 3038, WalkMode = Walk, Range = 0},	
			Goto{X = 365, Y = 182, NpcId = 3039, WalkMode = Walk, Range = 0},
			Goto{X = 364, Y = 181, NpcId = 3040, WalkMode = Walk, Range = 0},
			Goto{X = 361, Y = 182, NpcId = 3041, WalkMode = Walk, Range = 0},
			Goto{X = 362, Y = 183, NpcId = 3042, WalkMode = Walk, Range = 0},
			Goto{X = 363, Y = 180, NpcId = 3043, WalkMode = Walk, Range = 0},																	
		},
		
		[410] = 
		{
			ExecuteCameraScript{Script = CameraSartariusIV},	
			CutSceneSay {Tag = "cutdunklerSthGodm001", NpcId = 3037, String = "Das kommt mir doch bekannt vor! Wartet, was kam noch gleich als nächstes...? Ah, natürlich!"},
			LookAtFigure{Target = 4461, NpcId = 3037},	
			CGdsFigureSetHealth:new(4461, 1),				
		},
		[470] =
		{
			CGdsFigureSetHealth:new(4461, 1),			
		},
		[490] = 
		{
			-- Sartarius töten
			WaitForEndOfSpeech,				
			StopEffect {NpcId = 4461},	
			SetFreezeFlagFalse {NpcId = 4461},
			-- safe, da in cutscene:
			-- AttackTarget{Target = 4461, NpcId = 3037, FriendlyFire = TRUE},	-- angriff mit schwert
			CastSpell {Spell = 1719, X = 0, Y = 0, Target = 4461, TargetType = Figure, NpcId = 3037},				
		},
		[530] = 
		{
			ExecuteCameraScript{Script = CameraSartariusVI},	
			CutSceneSay {Tag = "cutdunklerSthGodm002", NpcId = 3037, String = "Der Phönixstein! Ich wusste doch, dass ich mich auf Euch verlassen kann!"},
			LookAtFigure{Target = 0, NpcId = 3037},
			StopEffect {NpcId = 4461},
			SetEffect   {Effect = "IcePack", NpcId = 0, Length = 29000}, 											
		},
		[550] = 
		{
			WaitForEndOfSpeech,	
			LookAtFigure{Target = 0, NpcId = 3037},						
			CutSceneSay {Tag = "cutdunklerSthGodm003", NpcId = 3037, String = "Wenn Ihr gestattet... Dieses kostbare Artefakt macht alle meine Bemühungen um die Gottsteine überflüssig! Seine Macht allein ist stark genug, das Portal zu öffnen!"},
		},
		[660] = 
		{
			WaitForEndOfSpeech,		
			--ExecuteCameraScript{Script = CameraSartariusIX},	
			ExecuteCameraScript{Script = CameraSartariusVIII},				
			LookAtFigure{Target = 0, NpcId = 3037},			
			CutSceneSay {Tag = "cutdunklerSthGodm004", NpcId = 3037, String = "Wie immer habt Ihr Euch als treuer Diener erwiesen, mein Freund! Oh, was haben wir denn da noch...?"},
		},
		[690] =
		{
			-- Goto{X = 370, Y = 188, NpcId = 3037, WalkMode = Walk, Range = 0},	-- raith.		
		},
		[710] = 
		{
			WaitForEndOfSpeech,	
			--ExecuteCameraScript{Script = CameraSartariusVIII},	
			LookAtFigure{Target = 0, NpcId = 3037},			
			SetGlobalFlagTrue {Name = "UriasCraigSpawns"},	-- craig und urias spawnen.
			SetEffect   {Effect = "IcePack", NpcId = 0, Length = 29000}, 	
			CutSceneSay {Tag = "cutdunklerSthGodm005", NpcId = 3037, String = "Ein Buch über die Konvokation? Diese Lektüre scheint mir ein wenig zu schwer für Euch! Ich werde es an mich nehmen... Ihr werdet ohnehin nicht mehr zum Lesen kommen..."},
		},
		[810] = 
		{
			ExecuteCameraScript{Script = CameraSartariusIV},				
			Goto {NpcId = 3037, X = 369, Y = 187, WalkMode = Walk},
			--ChangeRace {NpcId = 2910, Race = 124},	
			--ChangeRace {NpcId = 3001, Race = 124},						
		},
		[830] =
		{
			SetEffect   {Effect = "DeMaterialize", NpcId = 3037, Length = 3000},	-- raith verschwindet.
			StopEffect {NpcId = 0},	
			RemoveDialog {NpcId = 2910},
			RemoveDialog {NpcId = 3001},						
		},
		[840] =
		{
			Goto {NpcId = 3001, X = 357, Y = 184, WalkMode = Run},		
			Goto {NpcId = 2910, X = 357, Y = 184, WalkMode = Run},		
		},
		[850] = 
		{
			ExecuteCameraScript{Script = CameraSartariusV},	
			Vanish{NpcId = 3037},	-- raith.	
			CutSceneSay {Tag = "cuturiasSthGodm001", NpcId = 3001, String = "Jetzt! Schnell!"},
		},
		[860] =
		{
			SetNoFightFlagFalse {NpcId = 3038},	
			SetNoFightFlagFalse {NpcId = 3039},	
			SetNoFightFlagFalse {NpcId = 3040},	
			SetNoFightFlagFalse {NpcId = 3041},	
			SetNoFightFlagFalse {NpcId = 3042},			
			SetNoFightFlagFalse {NpcId = 3043},	
			
			ChangeRace {NpcId = 2910, Race = 148},	
			ChangeRace {NpcId = 3001, Race = 148},			
		},
		[930] = 
		{
			WaitForEndOfSpeech,	

			SetNoFightFlagFalse {NpcId = 0},	
			SetFreezeFlagFalse  {NpcId = 0},
				
			StopEffect {NpcId = 0},			
			
			StopEffect {NpcId = 3038},
			StopEffect {NpcId = 3039},			
			StopEffect {NpcId = 3040},			
			StopEffect {NpcId = 3041},			
			StopEffect {NpcId = 3042},
			StopEffect {NpcId = 3043},	
			
			SetGlobalFlagTrue {Name = "UriasCraigIdleOn"},				
			
			QuestSolve{QuestId = 532},
			QuestBegin{QuestId = 533},
			TransferItem{TakeItem = 3461 , Amount = 1 , Flag = Take},
			TransferItem{TakeItem = 2814 , Amount = 1 , Flag = Take},
			SetRewardFlagTrue{ Name = "Klingensturm2Sartarius"},
			EnableDialog {NpcId = 2910},
			EnableDialog {NpcId = 3001},
			SetGlobalFlagTrue {Name = "CraighUriasDespawnIcegate"},															
		},
	},
}

