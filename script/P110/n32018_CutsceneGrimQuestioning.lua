-----------------------------------------------------------------------
--
--	GrimQuestioning
--
-----------------------------------------------------------------------

-- totale 1
CameraGrimQuestI =
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,60,1,"script\\p110\\n6555_CameraGrimQuestioningI.lua")
   	Camera:ScriptStart()
]]

-- grim nah
CameraGrimQuestII =
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,60,1,"script\\p110\\n6555_CameraGrimQuestioningII.lua")
   	Camera:ScriptStart()
]]

-- fahrt runter fuer initialisation
CameraGrimQuestIII =
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,60,1,"script\\p110\\n6555_CameraGrimQuestioningIII.lua")
   	Camera:ScriptStart()
]]

-- avatar nah
CameraGrimQuestIV =
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,60,1,"script\\p110\\n6555_CameraGrimQuestioningIV.lua")
   	Camera:ScriptStart()
]]

-- totale 2
CameraGrimQuestV =
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p110\\n6555_CameraGrimQuestioningV.lua")
   	Camera:ScriptStart()
]]

-- lena kommt an
CameraGrimQuestVI =
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p110\\n6555_CameraGrimQuestioningVI.lua")
   	Camera:ScriptStart()
]]

-- grim nah mit fahrt
CameraGrimQuestVII =
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p110\\n6555_CameraGrimQuestioningVII.lua")
   	Camera:ScriptStart()
]]

-- lena castet
CameraGrimQuestVIII =
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p110\\n6555_CameraGrimQuestioningVIII.lua")
   	Camera:ScriptStart()
]]

-- zoom out zentral
CameraGrimQuestIX =
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p110\\n6555_CameraGrimQuestioningIX.lua")
   	Camera:ScriptStart()
]]

-- totale 3 schwenk
CameraGrimQuestX =
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p110\\n6555_CameraGrimQuestioningX.lua")
   	Camera:ScriptStart()
]]

-- lena kommt naeher
CameraGrimQuestXI =
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p110\\n6555_CameraGrimQuestioningXI.lua")
   	Camera:ScriptStart()
]]

-- craigh kommt
CameraGrimQuestXII =
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p110\\n6555_CameraGrimQuestioningXII.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "GrimQuestioning", CameraScript = "", PlayOnlyOnce = TRUE,
	BeginConditions =
	{
		FigureInRange {NpcId = 0, X = 438, Y = 284, Range = 10, UpdateInterval = 15},
		FigureHasHealth {NpcId = 6555, Percent = 30, UpdateInterval = 15},	
		Negated(EnemyUnitInRange {X = 422, Y = 284, Range = 8, UpdateInterval = 15}),
		--IsGlobalFlagTrue {Name = "Stopper"},	
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:
		SetNoFightFlagTrue {NpcId = 0},
		SetNoFightFlagTrue {NpcId = 6046}, -- craigh
		SetNoFightFlagTrue {NpcId = 6738}, -- lena	
		SetNoFightFlagTrue {NpcId = 6555}, -- grim	
		SetGlobalFlagTrue { Name = "HaendlerFireCitySpawnP110"},
	},
	TimedActions =
	{
		[0] =
		{
		},
		[20] =
		{
			ExecuteCameraScript{Script = CameraGrimQuestIII},	
			Goto {NpcId = 0,    X = 435, Y = 284, WalkMode = Run}, -- avatar	
			SetGlobalFlagTrue {Name = "UnkillableGrimDespawn"},
			SetGlobalFlagTrue {Name = "KillableGrimRespawn"},				
		},	
		[50] =
		{
			SetNoFightFlagTrue {NpcId = 6806}, -- grim killable
		},
		[70] =
		{
			SetNoFightFlagTrue {NpcId = 6806}, -- grim killable
			CutSceneSay {Tag = "cs17MainCharP110_001" , NpcId = 0, String = "Du bist den Stahl nicht wert ... Wo ist der Fial Darg, Verräter?"},
			LookAtFigure {NpcId = 0, Target = 6806},	
			LookAtFigure {NpcId = 6806, Target = 0},		
		},
		[120] =
		{
			SetGlobalFlagTrue {Name = "CutsceneInitGrimQuestLena"},	-- lena und craigh werden umgespawnt	
		},
		[140] =
		{
			WaitForEndOfSpeech,
			SetNoFightFlagTrue {NpcId = 6738},
			CutSceneSay {Tag = "cs17GrimP110_001" , NpcId = 6806, String = "Fort! Im Abgrund am Herz der Welt schmiedet er den Bann, der unsere Götter wieder auf Eo zurückbringen wird! Er ist ein Sohn der Dunklen, eure Waffen können ihm sowieso nichts anhaben!"},
		},
		[170] =
		{
			Goto {NpcId = 6738, X = 435, Y = 287, WalkMode = Walk},	-- lena	
		},
		[190] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraGrimQuestVI},	-- lena kommts
			CutSceneSay {Tag = "cs17LenaP110_001" , NpcId = 6738, String = "Aber Du wirst uns verraten, was ihn verletzen kann, nicht wahr?"}, -- lena kommt an
		},
		[240] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraGrimQuestVII},	-- grim kommts				
			LookAtFigure {NpcId = 6806, Target = 6738},
			CutSceneSay {Tag = "cs17GrimP110_002" , NpcId = 6806, String = "Lena? Ich ... es tut mir Leid ..."},
		},
		[270] =
		{
			WaitForEndOfSpeech,	
			LookAtFigure {NpcId = 6738, Target = 6806},
			LookAtFigure {NpcId = 6806, Target = 6738},						
			CutSceneSay {Tag = "cs17LenaP110_002" , NpcId = 6738, String = "Mir auch, Grim ..."},
		},	
		[300] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraGrimQuestVIII},	-- lena castet			
			LookAtFigure {NpcId = 6738, Target = 6806},
			LookAtFigure {NpcId = 6806, Target = 6738},					
			CastSpell {Spell = 280, Target = 6806, TargetType = Figure, X = 0, Y = 0, NpcId = 6738},	-- CAST : grim freezed.	
			CutSceneSay {Tag = "cs17LenaP110_003" , NpcId = 6738, String = "... denn ich weiß, wie sehr du Kälte hasst ..."},
		},	
		[330] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraGrimQuestVII},	-- grim freezed				
			SetEffect   {Effect = "IcePackForever", NpcId = 6806, Length = 0},
			SetFreezeFlagTrue {NpcId = 6806},	-- grim freezed.					
			CutSceneSay {Tag = "cs17GrimP110_003" , NpcId = 6806, String = "Nein! Hör auf! Ah!"},
		},	
		[340] =
		{
			SetFreezeFlagTrue {NpcId = 6806},	-- grim freezed.	
		},
		[350] =
		{
			SetFreezeFlagTrue {NpcId = 6806},	-- grim freezed.	
		},		
		[360] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraGrimQuestXI},	-- lena kommt naeher				
			Goto {NpcId = 6738, X = 436, Y = 286, WalkMode = Walk},	
			CutSceneSay {Tag = "cs17LenaP110_004" , NpcId = 6738, String = "Sprich!"},
		},	
		[390] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraGrimQuestV},
			CutSceneSay {Tag = "cs17GrimP110_004" , NpcId = 6806, String = "Nur eine Waffe ... eine Waffe nicht von dieser Welt... kann den Fial Darg besiegen ..."},
		},				
		[440] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraGrimQuestXI},	-- lena kommt naeher
			Goto {NpcId = 6738, X = 437, Y = 285, WalkMode = Walk},	
			CutSceneSay {Tag = "cs17LenaP110_005" , NpcId = 6738, String = "Und du weißt, wo es eine solche Waffe gibt?"},
		},	
		[470] =
		{
			WaitForEndOfSpeech,	
			SetGlobalFlagTrue {Name = "CutsceneInitGrimQuestCraigh"},	-- lena und craigh werden umgespawnt				
			ExecuteCameraScript{Script = CameraGrimQuestII},	-- grim freezed		-- ODER VII ODER IX-zoomout!!!			
			CutSceneSay {Tag = "cs17GrimP110_005" , NpcId = 6806, String = "Er hat sie ... vor langem erbeutet ... und wohl verwahrt ..."},
		},		
		[500] =
		{
			WaitForEndOfSpeech,	
			SetNoFightFlagTrue {NpcId = 6046},			
			RemoveDialog {NpcId = 6046},
			CutSceneSay {Tag = "cs17GrimP110_006" , NpcId = 6806, String = "In den Glutfängen ... hält er sie versteckt ..."},
			Goto {NpcId = 6046, X = 436, Y = 282, WalkMode = Walk}, -- craigh				
		},	
		[530] =
		{
			WaitForEndOfSpeech,	
			CutSceneSay {Tag = "cs17GrimP110_007" , NpcId = 6806, String = "... von einem Feuerengel bewacht ..."},
		},		
		[560] =
		{
			WaitForEndOfSpeech,	
			CutSceneSay {Tag = "cs17GrimP110_008" , NpcId = 6806, String = "Es ist ... das Schattenschwert ... es kann ihn töten ... aber wer es führt, dessen Seele ist verloren!"},
			RemoveDialog {NpcId = 6046},
		},	
		[600] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraGrimQuestXII},	-- craigh kommt
			LookAtFigure {NpcId = 0, Target = 6046},
			CutSceneSay {Tag = "cs17MaincharP110_002" , NpcId = 0, String = "Craigh! Wir müssen weiter in die Glutfänge. Wir werden versuchen, diese Schattenklinge zu erbeuten. Die Stadt gehört Euch."},
		},		
		[640] =
		{
			WaitForEndOfSpeech,	
			LookAtFigure {NpcId = 0, Target = 6046},
			LookAtFigure {NpcId = 6046, Target = 0},							
			CutSceneSay {Tag = "cs17CraighP110_001" , NpcId = 6046, String = "Ich werde Shal'Dun für Euch halten. Der Glutstein, der das Tor zum Abgrund öffnet, wird für Euch bereit liegen, sobald Ihr zurückkehrt."},
		},									
		[680] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "cs17CraighP110_002" , NpcId = 6046, String = "Was ist mit ihm?"},
		},
		[710] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraGrimQuestX},	-- ODER IX grim freezed					
			CutSceneSay {Tag = "cs17LenaP110_006" , NpcId = 6738, String = "Er erinnert sich gerade an ein Versprechen, das ich ihm gab."},
		},	
		[740] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "cs17GrimP110_009" , NpcId = 6806, String = "Lena, Mädchen, du würdest doch nicht ..."},
			EnableDialog {NpcId = 6046},	
			SetFreezeFlagFalse {NpcId = 6806},
			StopEffect {NpcId = 6806},				
		},															
		[780] =
		{
			WaitForEndOfSpeech,
			SetNoFightFlagFalse {NpcId = 0},
			SetNoFightFlagFalse {NpcId = 6046}, -- craigh
			SetNoFightFlagFalse {NpcId = 6738}, -- lena	
			SetNoFightFlagFalse {NpcId = 6806}, -- grim	
			SetGlobalFlagFalse {Name = "CutsceneInitGrimQuestLena"},	
			SetGlobalFlagFalse {Name = "CutsceneInitGrimQuestCraigh"},	
			SetGlobalFlagTrue {Name = "CutsceneGrimQuestioningP109Ended"},
			SetRewardFlagTrue { Name = "GrimBesiegt" },	
			SetGlobalFlagTrue {Name = "HaendlerFireCitySpawnP110"},
			EnableDialog {NpcId = 6046},	
			QuestSolve{QuestId = 621},
			QuestBegin{QuestId = 744},								
		},																								
	},
}





