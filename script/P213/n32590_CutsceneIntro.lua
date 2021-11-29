-----------------------------------------------------------------------
--
--	Öffnen der Blockade
--
-----------------------------------------------------------------------

-- Dummy Kamerafahrt
IntroI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,14,1,"script\\p213\\n32590_CameraIntroI.lua")
   	Camera:ScriptStart()
]]

IntroII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p213\\n32590_CameraIntroII.lua")
   	Camera:ScriptStart()
]]

IntroIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,12,1,"script\\p213\\n32590_CameraIntroIII.lua")
   	Camera:ScriptStart()
]]

IntroIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,14,1,"script\\p213\\n32590_CameraIntroIV.lua")
   	Camera:ScriptStart()
]]

IntroV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,9,1,"script\\p213\\n32590_CameraIntroV.lua")
   	Camera:ScriptStart()
]]

IntroVI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,7,1,"script\\p213\\n32590_CameraIntroVI.lua")
   	Camera:ScriptStart()
]]

IntroVII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p213\\n32590_CameraIntroVII.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "IntroBone", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
	},
	BeginActions =
	{
		SetNoFightFlagTrue {NpcId = 11169},	
		SetNoFightFlagTrue {NpcId = 0},
		SetGlobalFlagTrue{Name = "g_Irfit_SetNoFightFlag"},
		SetGlobalFlagTrue {Name = "UmspawnIntroBone"},
	},
	TimedActions =
	{
		[0] =
		{
			
		},
		[40] =
		{
			ExecuteCameraScript{Script = IntroI},	
			Goto {X = 213, Y = 144, WalkMode = Run, NpcId = 11169},
		},
		[60] =
		{
			CutSceneSay {Tag = "csa248masked_001" , NpcId = 11169, String = "Nun, oh Göttlicher? Seht Ihr nun, was Ihr angerichtet habt?"},
		},
		[80] =
		{
			Goto {X = 212, Y = 144, WalkMode = Run, NpcId = 11169},
		},
		[90] =
		{
			LookAtFigure {NpcId = 11169, Target = 10986},
		},
		[105] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa248masked_002" , NpcId = 11169, String = "Anstatt wie ein wahrer Sohn Aonirs abzuwarten, musstet Ihr mir ja hierher folgen!"},
		},
		[140] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = IntroII},	
			Goto {X = 211, Y = 141, WalkMode = Run, NpcId = 11169}, 
		},
		[150] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa248masked_003" , NpcId = 11169, String = "Hierher, wo Ihr keine Macht habt! Ha! Einen solch erbärmlichen Gott hat die Welt nicht verdient! Ich werde Euren Platz einnehmen!"},
			LookAtFigure {NpcId = 11169, Target = 10986},
		},
		[200] =
		{
			ExecuteCameraScript{Script = IntroIII},
		},
		[300] =
		{
			ExecuteCameraScript{Script = IntroIV},
		},
		[305] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa248darius_004" , NpcId = 10984, String = "Ihr dürft nicht mit Belial verschmelzen! Öffnet ihm kein Tor in diese Welt!"},
		},
		[380] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa248masked_005" , NpcId = 11169, String = "Zu spät! Die Verwandlung beginnt bereits!"},
		},
		[405] =
		{
			SetEffect {Effect ="OccludeBlack", TargetType = Figure, NpcId = 11169, Length = 12000}, 
			SetEffect {Effect ="OccludeBlack", TargetType = Figure, NpcId = 11183, Length = 20000}, 
		},
		[440] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa248masked_006" , NpcId = 11169, String = "Belials Macht durchdringt mich!"},
			SetGlobalFlagTrue {Name = "g_P213_Magier"}
		},
		[480] =
		{
			ExecuteCameraScript{Script = IntroV},
		},
		[520] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = IntroVI},
			CastSpell {Spell = 3531, TargetType = Figure, Target = 11183, X = 0, Y = 0, NpcId = 9923},
			CutSceneSay {Tag = "csa248masked_007" , NpcId = 11169, String = "Und wenn ich Eure erbärmliche Götterseele verschlungen habe, werde ich als neuer Gott des Todes über das Land schreiten!"},
		},
		[530] =
		{
			CastSpell {Spell = 3531, TargetType = Figure, Target = 11183, X = 0, Y = 0, NpcId = 9924},
			CastSpell {Spell = 3531, TargetType = Figure, Target = 11183, X = 0, Y = 0, NpcId = 9923},
		},
		[580] =
		{
			ExecuteCameraScript{Script = IntroVII}, 
			CastSpell {Spell = 3531, TargetType = Figure, Target = 11183, X = 0, Y = 0, NpcId = 9925},
			CastSpell {Spell = 3531, TargetType = Figure, Target = 11183, X = 0, Y = 0, NpcId = 9924},
			CastSpell {Spell = 3531, TargetType = Figure, Target = 11183, X = 0, Y = 0, NpcId = 9923},
		},
		[600] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa248masked_008" , NpcId = 11183, String = "Dann empfängt die Welt meine Gnade!"},
			SetGlobalFlagTrue {Name = "g_P213_HokanGeht"} ,
			CastSpell {Spell = 3531, TargetType = Figure, Target = 11183, X = 0, Y = 0, NpcId = 9926},
			CastSpell {Spell = 3531, TargetType = Figure, Target = 11183, X = 0, Y = 0, NpcId = 9925},
			CastSpell {Spell = 3531, TargetType = Figure, Target = 11183, X = 0, Y = 0, NpcId = 9924},
			CastSpell {Spell = 3531, TargetType = Figure, Target = 11183, X = 0, Y = 0, NpcId = 9923},
		},
		[630] =
		{
			--CastSpell {Spell = 3531, TargetType = Figure, Target = 11183, X = 0, Y = 0, NpcId = 9927},
			--CastSpell {Spell = 3531, TargetType = Figure, Target = 11183, X = 0, Y = 0, NpcId = 9926},
			--CastSpell {Spell = 3531, TargetType = Figure, Target = 11183, X = 0, Y = 0, NpcId = 9925},
			--CastSpell {Spell = 3531, TargetType = Figure, Target = 11183, X = 0, Y = 0, NpcId = 9924},
			--CastSpell {Spell = 3531, TargetType = Figure, Target = 11183, X = 0, Y = 0, NpcId = 9923},
		},
		[666] =
		{
			CastSpell {Spell = 3531, TargetType = Figure, Target = 11183, X = 0, Y = 0, NpcId = 9928},
			CastSpell {Spell = 3531, TargetType = Figure, Target = 11183, X = 0, Y = 0, NpcId = 9927},
			CastSpell {Spell = 3531, TargetType = Figure, Target = 11183, X = 0, Y = 0, NpcId = 9926},
			CastSpell {Spell = 3531, TargetType = Figure, Target = 11183, X = 0, Y = 0, NpcId = 9925},
			CastSpell {Spell = 3531, TargetType = Figure, Target = 11183, X = 0, Y = 0, NpcId = 9924},
			CastSpell {Spell = 3531, TargetType = Figure, Target = 11183, X = 0, Y = 0, NpcId = 9923},
			
			CastSpell {Spell = 3531, TargetType = Figure, Target = 11183, X = 0, Y = 0, NpcId = 9929},
			CastSpell {Spell = 3531, TargetType = Figure, Target = 11183, X = 0, Y = 0, NpcId = 9930},
			CastSpell {Spell = 3531, TargetType = Figure, Target = 11183, X = 0, Y = 0, NpcId = 9931},
			CastSpell {Spell = 3531, TargetType = Figure, Target = 11183, X = 0, Y = 0, NpcId = 11186},
			CastSpell {Spell = 3531, TargetType = Figure, Target = 11183, X = 0, Y = 0, NpcId = 9932},
		},
		[700] =
		{	
			WaitForEndOfSpeech,
			SetNoFightFlagFalse {NpcId = 0},
			SetNoFightFlagFalse {NpcId = 11183},
			SetGlobalFlagFalse{Name = "g_Irfit_SetNoFightFlag"},
			SetGlobalFlagFalse {Name = "UmspawnIntroBone"},
			ChangeRace {NpcId = 11183, Race = 179},
			SetGlobalTimeStamp {Name = "t_P213_HokanNachHause"},
			
			--SetNoFightFlagFalse {NpcId = 8486},
		},
	},
}
