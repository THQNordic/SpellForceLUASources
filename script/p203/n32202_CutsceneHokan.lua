-----------------------------------------------------------------------
--
--	Öffnen der Blockade
--
-----------------------------------------------------------------------

-- Dummy Kamerafahrt
HokanI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p203\\n32202_CameraHokanI.lua")
   	Camera:ScriptStart()
]]

HokanII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p203\\n32202_CameraHokanII.lua")
   	Camera:ScriptStart()
]]

HokanIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,7,1,"script\\p203\\n32202_CameraHokanIII.lua")
   	Camera:ScriptStart()
]]

HokanIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,7,1,"script\\p203\\n32202_CameraHokanIV.lua")
   	Camera:ScriptStart()
]]

HokanV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p203\\n32202_CameraHokanV.lua")
   	Camera:ScriptStart()
]]


HokanVI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p203\\n32202_CameraHokanVI.lua")
   	Camera:ScriptStart()
]]

HokanVII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,7,1,"script\\p203\\n32202_CameraHokanVII.lua")
   	Camera:ScriptStart()
]]

HokanVIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p203\\n32202_CameraHokanVIII.lua")
   	Camera:ScriptStart()
]]

HokanIX = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p203\\n32202_CameraHokanIX.lua")
   	Camera:ScriptStart()
]]

HokanX = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p203\\n32202_CameraHokanX.lua")
   	Camera:ScriptStart()
]]

-- Phoenixsteinspieler
CreateCutScene
{
	Name = "Hokan", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		--IsGlobalFlagTrue {Name = "Test"},
		AvatarInRange {X = 281, Y = 84, Range = 5},
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler"},
	},
	BeginActions =
	{
		SetNoFightFlagTrue {NpcId = 11549},	
		SetNoFightFlagTrue {NpcId = 11548},	
		--SetNoFightFlagTrue {NpcId = 11750},
		--SetNoFightFlagTrue {NpcId = 0},
		SetGlobalFlagTrue {Name = "g_P203_HokanCutscene"},
		LookAtDirection {NpcId = 11548, Direction = West},
	},
	TimedActions =
	{
		[30] =
		{
			ExecuteCameraScript{Script = HokanI},	
		},
		[50] =
		{
			CutSceneSay {Tag = "csa209gabar_001" , NpcId = 11548, String = "Schneller! Schneller!"},
			Goto {NpcId = 11549, X = 464, Y = 406, WalkMode = Walk}
		},
		[100] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa209morton_002" , NpcId = 11549, String = "Der Maskierte wird uns finden, Gabar, ganz gleich wie eilig wir ziehen!"},
		},
		[150] =
		{
			WaitForEndOfSpeech,
			LookAtFigure {NpcId = 11548, Target = 11549},
			LookAtFigure {NpcId = 11549, Target = 11548},
			ExecuteCameraScript{Script = HokanII},
			CutSceneSay {Tag = "csa209gabar_003" , NpcId = 11548, String = "Wir müssen Urias warnen! Er weiß nicht, gegen wen er da kämpft!"},
			LookAtDirection {NpcId = 11541, Direction = South},
		},
		[200] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = HokanIII},
			CutSceneSay {Tag = "csa209masked_004" , NpcId = 11541, String = "Dein Freund hat Recht, kleiner Gabar! Ich finde euch!"},
		},
		[250] =
		{
			WaitForEndOfSpeech,
			CastSpell {NpcId = 11541, Target = 11541, TargetType = Figure, X = 0, Y = 0, Spell = 2008},
			CutSceneSay {Tag = "csa209masked_005" , NpcId = 11541, String = "Und ich lösche Euren erbärmlichen Orden aus! Mann für Mann! Ihr kommt dem Zirkel nicht noch einmal in die Quere!"},
		},
		[260] =
		{
			SetGlobalFlagTrue {Name = "g_P203_BladesSpawnen"},
			LookAtDirection {NpcId = 11548, Direction = East},	
		},
		[320] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = HokanIV},
			SetGlobalFlagTrue {Name = "g_p203_BladesUmspawnen"},
		},
		[350] =
		{
			ExecuteCameraScript{Script = HokanV},
			CutSceneSay {Tag = "csa209gabar_006" , NpcId = 11548, String = "Aonir schütze uns!"},	
		},
		[450] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = HokanVI},
			CastSpell {NpcId = 11541, Target = 0, TargetType = World, X = 476, Y = 398, Spell = 2440},
		},
		[490] =
		{
			ExecuteCameraScript{Script = HokanVII},
			-- Flag fuer zum killen tuen von den Dawn Knights
			SetGlobalFlagTrue {Name = "g_P203_WieDieFliegen"},
			LookAtFigure {NpcId = 11548, Target = 11610},
		},
		[520] =
		{
			ExecuteCameraScript{Script = HokanVIII},
		},
		[540] =
		{
			SetGlobalFlagTrue {Name = "g_P203_HokanZumKampf"},
		},
		[550] =
		{
			CastSpell {NpcId = 11541, Target = 0, TargetType = World, X = 476, Y = 398, Spell = 2440},
		},
		[610] =
		{
			SetGlobalFlagTrue {Name = "g_P203_HokanZuGabar"},
		},
		[620] =
		{
			ExecuteCameraScript{Script = HokanIX},
			
		},
		[645] =
		{
			LookAtDirection {NpcId = 11548, Direction = West},
			LookAtDirection {NpcId = 11541, Direction = SouthEast},
		},
		[650] =
		{
			CastSpell {NpcId = 11541, Target = 11548, TargetType = Figure, X = 0, Y = 0, Spell = 2014},
			CastSpell {NpcId = 11548, Target = 11548, TargetType = Figure, X = 0, Y = 0, Spell = 1292},
		}, 
		[670] = 
		{
			SetGlobalFlagTrue {Name = "g_P203_GabarTot"},
		},
		[700] =
		{
			ExecuteCameraScript{Script = HokanX},
		},
		[720] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa209masked_009" , NpcId = 11541, String = "Und nun zu diesem Urias und seinem Runenkrieger ..."},			
		},
		[750] =
		{
			SetGlobalFlagTrue {Name = "g_P203_RohenErscheint"},
		},
		[770] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa209rohen_007" , NpcId = 11542, String = "Meister! Die Schattenklinge hat uns verraten! Ihr müsst zum Tempel zurückkehren!"},			
			Goto {NpcId = 11541, X = 463, Y = 409},
		},
		[820] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa209masked_008" , NpcId = 11541, String = "Nie hat man Zeit etwas richtig zu machen ... Also gut, wir kehren zurück! Soll der Kaiser sich um die beiden kümmern!"},			
		},
		[860] =
		{
			SetGlobalFlagTrue {Name = "g_P203_RohenNachHause"}
		},
		[900] =
		{	
			WaitForEndOfSpeech,
			SetNoFightFlagFalse {NpcId = 0},
			--SetNoFightFlagFalse {NpcId = 11750},
			--SetNoFightFlagFalse {NpcId = 8486}
		},
	},
}



-- Schattenklinge Version
CreateCutScene
{
	Name = "Nymphe", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		--IsGlobalFlagTrue {Name = "Test"},
		AvatarInRange {X = 281, Y = 84, Range = 5},
		IsGlobalFlagTrue {Name = "g_nP202_SchattenklingeSpieler"},
	},
	BeginActions =
	{
		SetNoFightFlagTrue {NpcId = 11662},	
		SetNoFightFlagTrue {NpcId = 11541},	
		--SetNoFightFlagTrue {NpcId = 11750},
		--SetNoFightFlagTrue {NpcId = 0},
		SetGlobalFlagTrue {Name = "g_P203_HokanCutscene"},
		LookAtDirection {NpcId = 11662, Direction = West},
	},
	TimedActions =
	{
		[10] =
		{
			--SetEffect {Effect = "Gladiator", NpcId = 11662, Length = 0, TargetType = Figure}
		},
		[30] =
		{
			ExecuteCameraScript{Script = HokanI},	
		},
		[50] =
		{
			CutSceneSay {Tag = "csa210nymphet_001" , NpcId = 11662, String = "Beeilt Euch, Waldwächter!"},
			Goto {NpcId = 11666, X = 462, Y = 406, WalkMode = Walk}
		},
		[100] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa210treant_002" , NpcId = 11666, String = "Wir gehen so schnell wir können... Böser Runenkrieger wird nicht entkommen!"},
			LookAtDirection {NpcId = 11541, Direction = South},
		},
		[120] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = HokanII},
			LookAtFigure {NpcId = 11666, Target = 11662},
			LookAtFigure {NpcId = 11662, Target = 11666},
			CutSceneSay {Tag = "csa210nymphet_003" , NpcId = 11662, String = "Er hat die Schattenklinge! Wenn er unsere Herrin erreicht, ist es um sie geschehen!"},
		},
		[200] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = HokanIII},
			CutSceneSay {Tag = "csa210masked_004" , NpcId = 11541, String = "Ganz recht, kleine Frau! Und ich werde dafür sorgen, dass er das auch tut!"},
		},
		[250] =
		{
			WaitForEndOfSpeech,
			CastSpell {NpcId = 11541, Target = 11541, TargetType = Figure, X = 0, Y = 0, Spell = 2008},
			CutSceneSay {Tag = "csa210masked_005" , NpcId = 11541, String = "Was bedeutet, dass keiner von euch ihn erreichen darf. Schätze, es ist an der Zeit, etwas Unkraut zu jäten ..."},
		},
		[260] =
		{
			SetGlobalFlagTrue {Name = "g_P203_BladesSpawnen"},
		},
		[320] =
		{
			ExecuteCameraScript{Script = HokanIV},
			SetGlobalFlagTrue {Name = "g_p203_BladesUmspawnen"},
		},
		[350] =
		{
			ExecuteCameraScript{Script = HokanV},
			CutSceneSay {Tag = "csa210nymphet_006" , NpcId = 11662, String = "Elen, steh uns bei!"},	
		},
		[450] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = HokanVI},
			CastSpell {NpcId = 11541, Target = 0, TargetType = World, X = 476, Y = 398, Spell = 2440},
		},
		[490] =
		{
			ExecuteCameraScript{Script = HokanVII},
			-- Flag fuer zum killen tuen von den Dawn Knights
			SetGlobalFlagTrue {Name = "g_P203_WieDieFliegen"},
			LookAtFigure {NpcId = 11662, Target = 11544},
		},
		[520] =
		{
			ExecuteCameraScript{Script = HokanVIII},
		},
		[540] =
		{
			SetGlobalFlagTrue {Name = "g_P203_HokanZumKampf"},
			CastSpell {NpcId = 11541, Target = 0, TargetType = World, X = 476, Y = 398, Spell = 2440},
		},
		[570] =
		{
			CastSpell {NpcId = 11541, Target = 0, TargetType = World, X = 476, Y = 398, Spell = 2440},
		},
		[620] =
		{
			ExecuteCameraScript{Script = HokanIX},
			SetGlobalFlagTrue {Name = "g_P203_HokanZuGabar"},
		},
		[645] =
		{
			LookAtDirection {NpcId = 11662, Direction = West},
			LookAtDirection {NpcId = 11541, Direction = SouthEast},
		},
		[650] =
		{
			CastSpell {NpcId = 11541, Target = 11662, TargetType = Figure, X = 0, Y = 0, Spell = 2014},
			CastSpell {NpcId = 11662, Target = 11662, TargetType = Figure, X = 0, Y = 0, Spell = 1303},
			SetGlobalFlagTrue {Name = "g_P203_NympheTot"},
		}, 
		[700] =
		{
			ExecuteCameraScript{Script = HokanX},
		},
		[720] =
		{
			CutSceneSay {Tag = "csa210masked_009" , NpcId = 11541, String = "Und bald ist Eure Herrin an der Reihe. Dann hält mich nichts mehr auf!"},			
		},
		[750] =
		{
			WaitForEndOfSpeech,
			SetGlobalFlagTrue {Name = "g_P203_RohenErscheint"},
		},
		[770] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa210rohen_007" , NpcId = 11542, String = "Meister! Wir haben den letzen Zirkelbruder gefunden! Ihr müsst zum Tempel zurückkehren!"},			
			Goto {NpcId = 11541, X = 463, Y = 409},
		},
		[820] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa210masked_008" , NpcId = 11541, String = "Sehr gut! Bald sind wir wieder vereint! Dann brauchen wir den Kaiser nicht mehr. Und auch nicht diesen erbärmlichen Runenkrieger ..."},			
		},
		[860] =
		{
			SetGlobalFlagTrue {Name = "g_P203_RohenNachHause"}
		},
		[900] =
		{	
			WaitForEndOfSpeech,
			SetNoFightFlagFalse {NpcId = 0},
			--SetNoFightFlagFalse {NpcId = 11750},
			--SetNoFightFlagFalse {NpcId = 8486}
		},
	},
}
