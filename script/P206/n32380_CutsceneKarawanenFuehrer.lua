-----------------------------------------------------------------------
--
--	Öffnen der Blockade
--
-----------------------------------------------------------------------

-- Kamerafahrt Auf Karawanenführer
CameraKarawaneI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p206\\n32380_CameraKarawanenFuehrerI.lua")
   	Camera:ScriptStart()
]]

-- Kamerafahrt erstes Camp
CameraKarawaneII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p206\\n32380_CameraKarawanenFuehrerII.lua")
   	Camera:ScriptStart()
]]

-- Kamerafahrt Zweites Camp
CameraKarawaneIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p206\\n32380_CameraKarawanenFuehrerIII.lua")
   	Camera:ScriptStart()
]]

-- Kamerafahrt Ritualplatz
CameraKarawaneIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p206\\n32380_CameraKarawanenFuehrerIV.lua")
   	Camera:ScriptStart()
]]

-- Zwischeneinschub Alyah Urias
CameraKarawaneVI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p206\\n32380_CameraKarawanenFuehrerVI.lua")
   	Camera:ScriptStart()
]]

-- Zwischeneinschub Klarawanenfuerer Close Up
CameraKarawaneVII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,5,1,"script\\p206\\n32380_CameraKarawanenFuehrerVII.lua")
   	Camera:ScriptStart()
]]

-- Zwischeneinschub Hebel Close Up
CameraKarawaneVIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p206\\n32380_CameraKarawanenFuehrerVIII.lua")
   	Camera:ScriptStart()
]]


-- Zwischeneinschub Hebel Close Up
CameraKarawaneIX = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p206\\n32380_CameraKarawanenFuehrerIX.lua")
   	Camera:ScriptStart()
]]

CreateCutScene
{
	Name = "BruderCamp", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P206_Cutscene", Seconds = 5, UpdateInterval = 2},
	},
	BeginActions =
	{
		SetNoFightFlagTrue {NpcId = 8790},	
		SetNoFightFlagTrue {NpcId = 0},
		SetNoFightFlagTrue {NpcId = 8784},
		SetNoFightFlagTrue {NpcId = 8788},
		
		SetNoFightFlagTrue {NpcId = 9012},
		SetNoFightFlagTrue {NpcId = 9013},
		SetNoFightFlagTrue {NpcId = 9014},
		SetNoFightFlagTrue {NpcId = 9015},
		SetNoFightFlagTrue {NpcId = 9016},
		SetNoFightFlagTrue {NpcId = 9017},
		SetNoFightFlagTrue {NpcId = 9018},
		SetNoFightFlagTrue {NpcId = 9019},
		SetNoFightFlagTrue {NpcId = 9020},
		SetNoFightFlagTrue {NpcId = 9021},
		SetGlobalFlagFalse{Name = "PleaseEnableMainQuestDialog_8790"},
		QuestBegin {QuestId = 820},
		
		-- Glow fuer den Hebel
		SetEffect {NpcId = 9229, Effect = "Spawnboss", Length = 0},
	},
	TimedActions =
	{
		[10] =
		{
			ExecuteCameraScript{Script = CameraKarawaneI},	
			-- Alyah
			Goto {X = 295, Y = 455, NpcId = 8788, WalkMode = Run},
			-- Urias
			Goto {X = 288, Y = 455, NpcId = 8784, WalkMode = Run},
			-- Spieler
			Goto {X = 291, Y = 453, NpcId = 0, WalkMode = Run},
			-- Karawanenführer
			Goto {X = 287, Y = 447, NpcId = 8790, WalkMode = Walk},
		},
		[15] =
		{
			Goto {X = 269, Y = 448, NpcId = 9205, WalkMode = Run},
			Goto {X = 269, Y = 448, NpcId = 9206, WalkMode = Run},
		},
		[17] =
		{
			SetGlobalFlagTrue {Name = "g_P206_SpawnPalastwachen"},
		},
		[25] =
		{
			-- Palastwachen
			Goto {X = 269, Y = 448, NpcId = 9203, WalkMode = Run},
			Goto {X = 269, Y = 448, NpcId = 9204, WalkMode = Run},
			
			AttackTarget {NpcId = 9205, Target = 9204},
			AttackTarget {NpcId = 9206, Target = 9203},
			
			CutSceneSay {Tag = "csa224alyah_001" , NpcId = 8788, String = "Sie sind uns auf den Fersen! Lauft!"},
		},	
		[30] =
		{
			Goto {X = 269, Y = 448, NpcId = 9203, WalkMode = Run},
			Goto {X = 269, Y = 448, NpcId = 9204, WalkMode = Run},
			
			AttackTarget {NpcId = 9205, Target = 9204},
			AttackTarget {NpcId = 9206, Target = 9203},
		}, 
		[40] =
		{
			WaitForEndOfSpeech,
			LookAtDirection {NpcId = 8790, Direction = NorthEast}, 	
		},
		[90] =
		{
			CutSceneSay {Tag = "csa224bario_002" , NpcId = 8790, String = "Kaiserliche Hunde! Hazim, macht sie nieder!"},
		},
		[120] =
		{
			Kill {NpcId = 9203},
			Kill {NpcId = 9204},
			LookAtFigure {NpcId = 8788, Target = 8790},
		},
		[130] =
		{
			WaitForEndOfSpeech,
			Goto {X = 296, Y = 455, NpcId = 9205, WalkMode = Run},
			Goto {X = 297, Y = 455, NpcId = 9206, WalkMode = Run},
			
		},
		[150] =
		{
			CutSceneSay {Tag = "csa224bario_003" , NpcId = 8790, String = "Halt! Verschont sie, die könnten uns helfen!"},
			Stop {NpcId = 9205},
			Stop {NpcId = 9206},
		},
		[160] =
		{
			Goto {X = 285, Y = 449, NpcId = 9205, WalkMode = Walk},
			Goto {X = 285, Y = 446, NpcId = 9206, WalkMode = Walk},
		},
		[195] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraKarawaneVI},
			LookAtFigure {NpcId = 8788, Target = 8784},
		},
		[200] =
		{
			CutSceneSay {Tag = "csa224alyah_004" , NpcId = 8788, String = "Oh, oh. Mir schwant Übles ..."},
			LookAtFigure {NpcId = 9205, Target = 8788},
			LookAtFigure {NpcId = 9206, Target = 8788},
		},
		[230] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa224urias_005" , NpcId = 8784, String = "Wenn Ihr Hilfe braucht, guter Mann, werden wir Euch beistehen!"},
		},
		[270] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa224alyah_006" , NpcId = 8788, String = "Werdet Ihr wohl still sein, Urias!"},
		},
		[290] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa224alyah_007" , NpcId = 8788, String = "Dass so viel Dummheit in eine Rüstung passt ..."},
		},
		[315] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraKarawaneVII},
		},
		[320] =
		{
			CutSceneSay {Tag = "csa224bario_008" , NpcId = 8790, String = "Ich habe einen Vorschlag für Euch."},
		},
		[350] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraKarawaneII},	
			CutSceneSay {Tag = "csa224bario_009" , NpcId = 8790, String = "Meine Karawane sitzt hier fest, weil die Gazeda-Familien die Straße nach Süden blockieren!"},
		},
		[390] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa224bario_010" , NpcId = 8790, String = "Es sind zwei Gruppen ... eigentlich waren sie immer verfeindet, aber unter der Führung der Brüder Trakan und Trokan haben sie sich nun zusammengeschlossen!"},
		},
		[430] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraKarawaneIII},	
			CutSceneSay {Tag = "csa224bario_011" , NpcId = 8790, String = "Jetzt sind sie eine Gefahr für alle! "},
		},
		[470] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa224bario_012" , NpcId = 8790, String = "Ich brauche jemand, der diese beiden Brüder aus dem Weg räumt ... ohne ihre Anführer werden die Gazeda wieder übereinander herfallen."},
		},
		[510] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraKarawaneIV},
			CutSceneSay {Tag = "csa224bario_013" , NpcId = 8790, String = "Ich hatte beschlossen, die Anführer zu dem Steinfeld zu locken, dort gibt es eine alte Gasfalle. Damit könnte man sie schnell aus dem Weg räumen."},				
		},
		[550] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraKarawaneVIII},
			CutSceneSay {Tag = "csa224bario_014" , NpcId = 8790, String = "Ich brauche jemand, der dort hingeht und die Gasfalle auslöst. Ihr seht mir wie die Richtigen dafür aus!"},
		},
		[595] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraKarawaneIX},
		},
		[600] =
		{
			CutSceneSay {Tag = "csa224alyah_015" , NpcId = 8788, String = "Warum sollten wir für Euch die Mörder spielen?"},
		},
		[645] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraKarawaneVII},
		},
		[650] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa224bario_016" , NpcId = 8790, String = "Weil ihr jemanden braucht, der Euch das Tor der Djinnis öffnet! Oder ihr sitzt fest und könnt hier verfaulen!"},
		},
		[690] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "csa224bario_017" , NpcId = 8790, String = "Überdenkt meinen Vorschlag. Gebt mir Bescheid, wenn Ihr bereit seid."},
		},
		[695] =
		{	
			WaitForEndOfSpeech,
			SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_8790"},
			SetGlobalFlagTrue{Name = "g_P206_IntroGelaufen"},
			RevealUnExplored {X = 358, Y = 326, Range = 10},
			RevealUnExplored {X = 80, Y = 306, Range = 10},
			RevealUnExplored {X = 268, Y = 251, Range = 20},
			SetNoFightFlagFalse {NpcId = 8790},	
			SetNoFightFlagFalse {NpcId = 0},
			SetNoFightFlagFalse {NpcId = 8784},
			SetNoFightFlagFalse {NpcId = 8788},
			              
			SetNoFightFlagFalse {NpcId = 9012},
			SetNoFightFlagFalse {NpcId = 9013},
			SetNoFightFlagFalse {NpcId = 9014},
			SetNoFightFlagFalse {NpcId = 9015},
			SetNoFightFlagFalse {NpcId = 9016},
			SetNoFightFlagFalse {NpcId = 9017},
			SetNoFightFlagFalse {NpcId = 9018},
			SetNoFightFlagFalse {NpcId = 9019},
			SetNoFightFlagFalse {NpcId = 9020},
			SetNoFightFlagFalse {NpcId = 9021},
			Follow {NpcId = 8788, Target = Avatar},
			Follow {NpcId = 8784, Target = Avatar},
			
			-- Die Palastwachen werden nicht angegriffen, wenn die Jungs zu früh neutral sind
			ChangeRace {Race = 152, NpcId = 9205},
			ChangeRace {Race = 152, NpcId = 9206},
			
			StopEffect {NpcId = 9229},
		},
	},
}
