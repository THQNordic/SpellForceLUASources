-----------------------------------------------------------------------
--
--	Poison
--
-----------------------------------------------------------------------

-- schale und 1. flussabschnitt totale
CameraPoisonI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p102\\n5462_CameraPoisonI.lua")
   	Camera:ScriptStart()
]]

-- 2. flussabschnitt totale
CameraPoisonII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p102\\n5462_CameraPoisonII.lua")
   	Camera:ScriptStart()
]]

-- dorfzentrum totale
CameraPoisonIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p102\\n5462_CameraPoisonIII.lua")
   	Camera:ScriptStart()
]]

-- dorfzentrum schwenk
CameraPoisonIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p102\\n5462_CameraPoisonIV.lua")
   	Camera:ScriptStart()
]]

-- setrius armee
CameraPoisonV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p102\\n5462_CameraPoisonV.lua")
   	Camera:ScriptStart()
]]

CreateCutScene
{
	Name = "Poison", CameraScript = "", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		IsGlobalFlagTrue { Name = "DialogWasserquelleEnded", UpdateInterval = 15 }, --Wenn die Wasserquelle vergiftet wurde
		FigureInRange {NpcId = 0, X = 56, Y = 315, Range = 10},
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene: 
		SetNoFightFlagTrue {NpcId = 0},
		SetNoFightFlagTrue {NpcId = 5951},			
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		[0] =
		{
		},
		[20] =
		{
			ExecuteCameraScript{Script = CameraPoisonI},
		},
		[110] =
		{
			ExecuteCameraScript{Script = CameraPoisonIV},
		},
		[130] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "cs06aGrimP102_001" , NpcId = 5951, String = "Da! Das Gift zeigt Wirkung!"}, -- Grim
		},		
		[160] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "cs06aKithar1P102_001" , NpcId = 5552, String = "Ah! Was...?"}, -- Kithar 1
		},	
		[190] =
		{
			WaitForEndOfSpeech,
			SetGlobalFlagTrue {Name = "PoisonStart"},
			CutSceneSay {Tag = "cs06aKithar2P102_001" , NpcId = 5551, String = "Raaa! Töten! Raaa!"}, -- Kithar 2
		},				
		[220] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraPoisonIII},
		},
		[260] = 
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraPoisonV},			
			CutSceneSay {Tag = "cs06aGrimP102_002" ,NpcId = 5951, String = "Es beginnt! Schnell, öffnet Setrius und seinen Leuten das Tor!"},	-- Grim		
		},
		[320] =
		{
			WaitForEndOfSpeech,
			SetNoFightFlagFalse {NpcId = 0},
			SetNoFightFlagFalse {NpcId = 5951},							
		},								
	},
}
