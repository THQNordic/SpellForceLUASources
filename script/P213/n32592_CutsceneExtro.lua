-----------------------------------------------------------------------
--
--	Öffnen der Blockade
--
-----------------------------------------------------------------------

-- Dummy Kamerafahrt
ExtroI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p213\\n32592_CameraExtroI.lua")
   	Camera:ScriptStart()
]]

ExtroII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p213\\n32592_CameraExtroII.lua")
   	Camera:ScriptStart()
]]

ExtroIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,12,1,"script\\p213\\n32592_CameraExtroIII.lua")
   	Camera:ScriptStart()
]]

ExtroIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,14,1,"script\\p213\\n32592_CameraExtroIV.lua")
   	Camera:ScriptStart()
]]

--ExtroV = 
--[[
--  	Camera:ScriptReset()
--  	Camera:ScriptAddSpline(0,9,1,"script\\p213\\n32592_CameraExtroV.lua")
--   	Camera:ScriptStart()
--]]
--
--ExtroVI = 
--[[
--  	Camera:ScriptReset()
--  	Camera:ScriptAddSpline(0,7,1,"script\\p213\\n32592_CameraExtroVI.lua")
--   	Camera:ScriptStart()
--]]
--
--ExtroVII = 
--[[
--  	Camera:ScriptReset()
--  	Camera:ScriptAddSpline(0,10,1,"script\\p213\\n32592_CameraExtroVII.lua")
--   	Camera:ScriptStart()
--]]
--

CreateCutScene
{
	Name = "ExtroBone", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		--FigureDead {NpcId = 9923},
		--FigureDead {NpcId = 9924},
		--FigureDead {NpcId = 9925},
		--FigureDead {NpcId = 9926},
		--FigureDead {NpcId = 9927},
		--FigureDead {NpcId = 9928},
		--FigureDead {NpcId = 9929},
		--FigureDead {NpcId = 9930},
		--FigureDead {NpcId = 9931},
		--FigureDead {NpcId = 9932},
		--FigureDead {NpcId = 11186},
		ODER9
		{
			FigureHasHealth {NpcId = 11190, Percent = 19, UpdateInterval = 2},
			FigureDead {NpcId = 11190}
		},
		IsGlobalFlagTrue {Name = "g_P213_BelialErscheint"},
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler"}
	},
	BeginActions =
	{
		SetNoFightFlagTrue {NpcId = 0},
		SetNoFightFlagTrue {NpcId = 11190},
		SetGlobalFlagTrue{Name = "g_Irfit_SetNoFightFlag"},
		SetGlobalFlagTrue {Name = "UmspawnExtroBone"},
	},
	TimedActions =
	{
		[0] =
		{
		},
		[10] =
		{
			ExecuteCameraScript{Script = ExtroI},
			TeleportAvatar {X = 458, Y = 239},
			Goto {X = 453, Y = 239, WalkMode = Walk, NpcId = 11167}, 
		},
		[25] =
		{
			Goto {X = 453, Y = 237, WalkMode = Walk, NpcId = 0}, 
		},
		[60] =
		{
			SetGlobalFlagTrue {Name = "g_P213_BelialNachHause"},
		},
		[120] =
		{
			CutSceneSay {Tag = "csa249masked_001" , NpcId = 11183, String = "Verdammt sollt ihr sein! Ihr habt die Verwandlung unterbrochen!"},
		},
		[130] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = ExtroII},
			Goto {X = 439, Y = 241, WalkMode = Walk, NpcId = 11167}, 
			Goto {X = 447, Y = 238, WalkMode = Walk, NpcId = 0}, 
			CutSceneSay {Tag = "csa249masked_002" , NpcId = 11183, String = "Elende Runenknechte! Mein Allfeuer wird euch vernichten, so wie es euch geschaffen hat!"},
		},
		[163] =
		{
			WaitForEndOfSpeech,
			LookAtFigure {NpcId = 11167, Target = 0},
			LookAtFigure {NpcId = 0, Target = 11167},
		},
		[165] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = ExtroIII},
			CutSceneSay {Tag = "csa249avatar_003" , NpcId = 0, String = "Kamerad, es ist soweit ..."},  
			LookAtFigure {NpcId = 11167, Target = 0},
			LookAtFigure {NpcId = 0, Target = 11167},
			
		},
		[200] =
		{
			--WaitForEndOfSpeech,
			ExecuteCameraScript{Script = ExtroII},
			CastSpell {Spell = 1556, TargetType = Figure, Target = 11183, X = 0, Y = 0, NpcId = 11183},
			
		},
		[205] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa249masked_004" , NpcId = 11183, String = "Aufmüpfiges Sklavenpack! Jetzt empfangt meinen Richtspruch!"},
		},
		[250] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = ExtroIV},
			CutSceneSay {Tag = "csa249avatar_005" , NpcId = 0, String = "Der Phönix, jetzt!"},
			Goto {X = 442, Y = 241, WalkMode = Run, NpcId = 11167}, 
			Goto {X = 443, Y = 242, WalkMode = Run, NpcId = 0}, 
		},
		[255] =
		{	
			WaitForEndOfSpeech,
			
			--SetNoFightFlagFalse {NpcId = 8486},
			CGdsEndGame:new(),	-- Spiel zu ende
		},
	},
}

-- Ab hier Phoenixstein
CreateCutScene
{
	Name = "ExtroBonePhoenix", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		--FigureDead {NpcId = 9923},
		--FigureDead {NpcId = 9924},
		--FigureDead {NpcId = 9925},
		--FigureDead {NpcId = 9926},
		--FigureDead {NpcId = 9927},
		--FigureDead {NpcId = 9928},
		--FigureDead {NpcId = 9929},
		--FigureDead {NpcId = 9930},
		--FigureDead {NpcId = 9931},
		--FigureDead {NpcId = 9932},
		--FigureDead {NpcId = 11186},
		ODER9
		{
			FigureHasHealth {NpcId = 11190, Percent = 19, UpdateInterval = 2},
			FigureDead {NpcId = 11190}
		},
		IsGlobalFlagTrue {Name = "g_P213_BelialErscheint"},
		IsGlobalFlagTrue {Name = "g_nP202_SchattenklingeSpieler"}
		--IsGlobalFlagTrue {Name = "Test"},
	},
	BeginActions =
	{
		SetNoFightFlagTrue {NpcId = 0},
		SetNoFightFlagTrue {NpcId = 11190},
		SetGlobalFlagTrue{Name = "g_Irfit_SetNoFightFlag"},
		SetGlobalFlagTrue {Name = "UmspawnExtroBone"},
	},
	TimedActions =
	{
		[0] =
		{
		},
		[10] =
		{
			ExecuteCameraScript{Script = ExtroI},
			TeleportAvatar {X = 458, Y = 239},
			Goto {X = 453, Y = 239, WalkMode = Walk, NpcId = 11168}, 
		},
		[25] =
		{
			Goto {X = 453, Y = 237, WalkMode = Walk, NpcId = 0}, 
		},
		[60] =
		{
			SetGlobalFlagTrue {Name = "g_P213_BelialNachHause"},
		},
		[120] =
		{
			CutSceneSay {Tag = "csa249masked_001" , NpcId = 11183, String = "Verdammt sollt ihr sein! Ihr habt die Verwandlung unterbrochen!"},
		},
		[130] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = ExtroII},
			Goto {X = 439, Y = 241, WalkMode = Walk, NpcId = 11168}, 
			Goto {X = 447, Y = 238, WalkMode = Walk, NpcId = 0}, 
			CutSceneSay {Tag = "csa249masked_002" , NpcId = 11183, String = "Elende Runenknechte! Mein Allfeuer wird euch vernichten, so wie es euch geschaffen hat!"},
		},
		[163] =
		{
			WaitForEndOfSpeech,
			LookAtFigure {NpcId = 11168, Target = 0},
			LookAtFigure {NpcId = 0, Target = 11168},
		},
		[165] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = ExtroIII},
			CutSceneSay {Tag = "csa249avatar_003" , NpcId = 0, String = "Kamerad, es ist soweit ..."},  
			LookAtFigure {NpcId = 11168, Target = 0},
			LookAtFigure {NpcId = 0, Target = 11167},
			
		},
		[200] =
		{
			--WaitForEndOfSpeech,
			ExecuteCameraScript{Script = ExtroII},
			CastSpell {Spell = 1556, TargetType = Figure, Target = 11183, X = 0, Y = 0, NpcId = 11183},
			
		},
		[205] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa249masked_004" , NpcId = 11183, String = "Aufmüpfiges Sklavenpack! Jetzt empfangt meinen Richtspruch!"},
		},
		[250] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = ExtroIV},
			CutSceneSay {Tag = "csa249avatar_005" , NpcId = 0, String = "Der Phönix, jetzt!"},
			Goto {X = 442, Y = 241, WalkMode = Run, NpcId = 11168}, 
			Goto {X = 443, Y = 242, WalkMode = Run, NpcId = 0}, 
		},
		[255] =
		{	
			WaitForEndOfSpeech,
			
			--SetNoFightFlagFalse {NpcId = 8486},
			CGdsEndGame:new(),	-- Spiel zu ende
		},
	},
}