-----------------------------------------------------------------------
--
--	Seth Assassin
--
-----------------------------------------------------------------------

-- seth nach dialog
CameraSethI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p21\\n2800_CameraSethAssassinI.lua")
   	Camera:ScriptStart()
]]

-- Soldaten Fahrt
CameraSethII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p21\\n2800_CameraSethAssassinII.lua")
   	Camera:ScriptStart()
]]

-- Dorf Totale 
CameraSethIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p21\\n2800_CameraSethAssassinIII.lua")
   	Camera:ScriptStart()
]]

-- Seth und Brannigan
CameraSethIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p21\\n2800_CameraSethAssassinIV.lua")
   	Camera:ScriptStart()
]]

-- Brannigan liegt tot am boden
CameraSethV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p21\\n2800_CameraSethAssassinV.lua")
   	Camera:ScriptStart()
]]

-- elite laeuft zu den soldaten
CameraSethVI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,25,1,"script\\p21\\n2800_CameraSethAssassinVI.lua")
   	Camera:ScriptStart()
]]

-- take2: haltotale birdview mord
CameraSethVII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,25,1,"script\\p21\\n2800_CameraSethAssassinVII.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "SethAssassin", CameraScript = "", PlayOnlyOnce = TRUE,
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		IsGlobalFlagTrue {Name = "SethAttacks"},
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:
		SetGlobalFlagTrue{Name = "SethIdleOff"},	--Seth Idle aus.
		StopEffect {NpcId = 2800},	-- ketten weg.	
		SetNoFightFlagTrue {NpcId = 0},
		RemoveDialog {NpcId = 2800},
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
			ExecuteCameraScript{Script = CameraSethI},	-- bei seth am anfang.
		},
		[40] =
		{
			Goto {NpcId = 2800, X = 77, Y = 159, WalkMode = Run},	-- seth.
		},
		[80] =
		{
			SetGlobalFlagTrue {Name = "SethDespawn"},
		},
		[100] =
		{
			SetGlobalFlagTrue {Name = "SethRespawn"},	
		},
		[120] =
		{
			ExecuteCameraScript {Script = CameraSethIII},
			SetNoFightFlagTrue {NpcId = 2800},			-- Seth kann kaempfen.
			SetGlobalFlagTrue{Name = "SethIdleOff"},	-- Seth Idle aus.
		},
		[140] =
		{
			ChangeUnit {NpcId = 2800, Unit = 1343},
		},
		[190] =
		{
			Goto {NpcId = 2800, X = 74, Y = 317, WalkMode = Run},		
		},
		[260] =
		{
			ExecuteCameraScript{Script = CameraSethIV},
			Goto {NpcId = 2800, X = 74, Y = 322, WalkMode = Run},				
		},
		[300] =
		{
			Goto {NpcId = 2800, X = 69, Y = 322, WalkMode = Walk},	
			-- briar health zurücksetzen...
			CGdsFigureSetHealth:new(2794, 1),					
		},
		[340] =
		{		
			AttackTarget {NpcId = 2800, Target = 2794, FriendlyFire = TRUE},
		},
		[380] =
		{
			Goto {NpcId = 2800, X = 88, Y = 310, WalkMode = Run},	-- seth haut ab.
		},
		[410] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraSethVII},			
			Vanish {NpcId = 2800},
			Goto {NpcId = 4008, X = 69, Y = 323, WalkMode = Run},	-- zeuge1			
		},
		[470] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "cutEliteFarlH001", NpcId = 4008, String = "Kommandant! Was ist...?"},
			Goto {NpcId = 4179, X = 70, Y = 324, WalkMode = Run},	-- zeuge2
			Goto {NpcId = 4180, X = 71, Y = 323, WalkMode = Run},	-- zeuge3					
		},
		[500] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "cutEliteFarlH002", NpcId = 4008, String = "Kommandant Briar ist tot!"},
		},
		[520] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "cutEliteFarlH003", NpcId = 4008, String = "Dort! Seht! Der Dolch... die rote Legion! Diese Bastarde haben ihn umgebracht!"},
		},
		[570] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraSethVI},				
			CutSceneSay {Tag = "cutEliteFarlH004", NpcId = 4008, String = "Wolfselite! Zu mir! Dafür werden sie bezahlen!"},
			Goto {NpcId = 4008, X = 111, Y = 305, WalkMode = Run},
		},
		[750] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraSethII},				
			CutSceneSay {Tag = "cutEliteFarlH005", NpcId = 4008, String = "Wir rücken aus! Diesmal gibt es keine Gnade! Wir werden sie auslöschen! Tod der roten Legion! Tod!"},

			Goto {NpcId = 3931, X = 145, Y = 282, WalkMode = Run},
			Goto {NpcId = 3932, X = 145, Y = 282, WalkMode = Run},
			Goto {NpcId = 3933, X = 145, Y = 282, WalkMode = Run},
			Goto {NpcId = 3934, X = 145, Y = 282, WalkMode = Run},
			Goto {NpcId = 3935, X = 145, Y = 282, WalkMode = Run},														
		},
		[810] =
		{
			Goto {NpcId = 3936, X = 145, Y = 282, WalkMode = Run},
			Goto {NpcId = 3937, X = 145, Y = 282, WalkMode = Run},
			Goto {NpcId = 3938, X = 145, Y = 282, WalkMode = Run},
			Goto {NpcId = 3939, X = 145, Y = 282, WalkMode = Run},
			Goto {NpcId = 3940, X = 145, Y = 282, WalkMode = Run},	
			Goto {NpcId = 3941, X = 145, Y = 282, WalkMode = Run},					
		},
		[840] =
		{
			Goto {NpcId = 3942, X = 145, Y = 282, WalkMode = Run},
			Goto {NpcId = 3943, X = 145, Y = 282, WalkMode = Run},
			Goto {NpcId = 3944, X = 145, Y = 282, WalkMode = Run},
			Goto {NpcId = 3945, X = 145, Y = 282, WalkMode = Run},
			Goto {NpcId = 3946, X = 145, Y = 282, WalkMode = Run},	
			Goto {NpcId = 3947, X = 145, Y = 282, WalkMode = Run},			
		},
		[850] =
		{
			WaitForEndOfSpeech,
			SetGlobalFlagTrue{Name = "FarlornBriarGateOpen"},			-- soldaten rennen los	
			SetNoFightFlagFalse {NpcId = 0},	
		},
	},
}

