-----------------------------------------------------------------------
--
--	Tutorial Intro
--
-----------------------------------------------------------------------

CameraTutIntroI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,13,1,"script\\p78\\n0_CameraTutIntroI.lua")
   	Camera:ScriptStart()
]]

CameraTutIntroII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p78\\n0_CameraTutIntroII.lua")  	
   	Camera:ScriptStart()
]]

CameraTutIntroIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p78\\n0_CameraTutIntroIII.lua")  	
   	Camera:ScriptStart()
]]


-- Dialog Tahira
CameraTutIntroIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,31,1,"script\\p78\\n0_CameraTutIntroV.lua")  	
   	Camera:ScriptStart()
]]

-- Dialog Avatar
CameraTutIntroV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p78\\n0_CameraTutIntroIV.lua")  	
   	Camera:ScriptStart()
]]

CameraTutIntroVI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p78\\n0_CameraTutIntroVI.lua")  	
   	Camera:ScriptStart()
]]

CameraTutIntroVII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p78\\n0_CameraTutIntroVII.lua")  	
   	Camera:ScriptStart()
]]

CameraTutIntroVIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p78\\n0_CameraTutIntroVIII.lua")  	
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "TutorialIntro", CameraScript = "", PlayOnlyOnce = TRUE,
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		-- startet direkt zu beginn der map.
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:	
		SetEffect {Effect = "SimpleInvis", NpcId = 0, Length = 0, TargetType = Figure}, 		-- Avatar
		Goto {NpcId = 0, X = 133, Y = 404},														-- Avatar Start Position
		LookAtFigure {NpcId = 3354, Target = 3355}, 											-- Caele
		LookAtFigure {NpcId = 3355, Target = 3354}, 											-- Ork1
		LookAtFigure {NpcId = 3356, Target = 3354}, 											-- Ork2
		LookAtFigure {NpcId = 3357, Target = 3354},												-- Ork3	(vielleicht obsolet)
		CGdsFigureSetHealth:new(3355, 10),														-- Ork Health zuruecksetzen
		CGdsFigureSetHealth:new(3356, 10),														-- Ork Health zuruecksetzen			
		CGdsFigureSetHealth:new(3357, 10),														-- Ork Health zuruecksetzen
		SetNoFightFlagTrue {NpcId = 0},															-- Tahira kann nicht angegriffen werden
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		[0] =
		{
			-- opening cutscene mit direktstart	
			-- Goto {NpcId = 3355, X = 144, Y = 410, WalkMode = Run},			
			-- Goto {NpcId = 3356, X = 144, Y = 408, WalkMode = Run},
			-- Goto {NpcId = 3357, X = 146, Y = 409, WalkMode = Run},	
			AttackTarget {NpcId = 3355, Target = 3354},	
			AttackTarget {NpcId = 3356, Target = 3354},
			AttackTarget {NpcId = 3357, Target = 3354},
		},
		[10] =
		{
			ExecuteCameraScript{Script = CameraTutIntroI},	-- Orks rueckwaerts		
		},
		[110] = 
		{ 
			ExecuteCameraScript {Script = CameraTutIntroII}, -- schwenk caele zum haus
		},
		[150] = 
		{
			Goto {NpcId = 3354, X = 139, Y = 405}, -- Tahira laeuft zum Haus
			CutSceneSay {Tag = "cutcaeleTut001", NpcId = 3354, String = "Tahira!"},				
		},
		[170] = 
		{
			WaitForEndOfSpeech,
			Goto {NpcId = 3354, X = 139, Y = 405}, 					-- Tahira laeuft zum Haus			
			ExecuteCameraScript {Script = CameraTutIntroIII}, 		-- Fahrt am haus entlang
			StopEffect {TargetType = Figure, NpcId = 0}, 			-- Avatar wird sichtbar			
			Goto {NpcId = 0, X = 137, Y = 405, WalkMode = Walk},	-- Avatar laeuft aus dem Haus			
		},
		[210] =
		{
			LookAtFigure{NpcId = 0, Target = 3354},
			LookAtFigure{NpcId = 3354, Target = 0},	
			CutSceneSay {Tag = "cutcaeleTut002", NpcId = 3354, String = "Rohen schickt uns! Er braucht die Macht der Runenkrieger! Die Nordreiche sind in Gefahr!"},		
		},
		[280] = 
		{
			WaitForEndOfSpeech,
			LookAtFigure{NpcId = 0, Target = 3354},
			LookAtFigure{NpcId = 3354, Target = 0},	
			CutSceneSay {Tag = "cuttahiraTut001", NpcId = 0, String = "Rohen weiß, dass ich nie wieder einem Zirkelmagier dienen werde! Meine Kräfte sind verbraucht! Ich habe genug Leid und Blutvergießen gesehen!"},
		},
		[320] =
		{
			--ExecuteCameraScript {Script = CameraTutIntroVIII}, -- Gegenschuss	
			ExecuteCameraScript {Script = CameraTutIntroIV}, -- Gegenschuss					
		},
		[370] = 
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript {Script = CameraTutIntroV}, -- DialogCam Avatar
			LookAtFigure{NpcId = 0, Target = 3354},
			LookAtFigure{NpcId = 3354, Target = 0},
			CutSceneSay {Tag = "cuttahiraTut002", NpcId = 0, String = "Rohen wird sich jemand anderen suchen müssen!"},			
		},
		[410] = 
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript {Script = CameraTutIntroIV}, -- DialogCam Caele
			LookAtFigure{NpcId = 0, Target = 3354},
			LookAtFigure{NpcId = 3354, Target = 0},
			CutSceneSay {Tag = "cutcaeleTut003", NpcId = 3354, String = "Deshalb schickt er uns ja! Irgendwo in diesen Landen liegt eine ganz besondere Rune verborgen! Wir sind hier, um sie zu suchen!"},
		},
		[490] = 
		{
			WaitForEndOfSpeech,
			LookAtFigure{NpcId = 0, Target = 3354},
			LookAtFigure{NpcId = 3354, Target = 0},
			CutSceneSay {Tag = "cutcaeleTut004", NpcId = 3354, String = "Aber wir wurden angegriffen und Lev ist verletzt! Er braucht Deine Hilfe! Wir brauchen Deine Hilfe!"},
		},
		[550] = 
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript {Script = CameraTutIntroV}, -- DialogCam Avatar			
			LookAtFigure{NpcId = 0, Target = 3354},
			LookAtFigure{NpcId = 3354, Target = 0},
			CutSceneSay {Tag = "cuttahiraTut003", NpcId = 0, String = "Dann bleibt mir wohl kaum eine Wahl... Also gut, ich werde Euch helfen! Wo ist Lev?"},	
		},
		[620] = 
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript {Script = CameraTutIntroIV}, -- DialogCam Caele			
			LookAtFigure{NpcId = 0, Target = 3354},
			LookAtFigure{NpcId = 3354, Target = 0},
			CutSceneSay {Tag = "cutcaeleTut005", NpcId = 3354, String = "Ich habe ihn irgendwo dort hinter dem Tor aus den Augen verloren! Ich hoffe, er lebt noch! Diese verfluchten Orks!"},	
		},
		[680] = 
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript {Script = CameraTutIntroVI}, -- Totale				
			LookAtFigure{NpcId = 0, Target = 3354},
			LookAtFigure{NpcId = 3354, Target = 0},
			CutSceneSay {Tag = "cuttahiraTut004", NpcId = 0, String = "Ich werde ihn suchen! Du bleibst hier bei meiner Hütte!"},		
		},
		[720] =
		{
			WaitForEndOfSpeech,
			LookAtFigure{NpcId = 0, Target = 3354},
			LookAtFigure{NpcId = 3354, Target = 0},
			CutSceneSay {Tag = "cutcaeleTut006", NpcId = 3354, String = "Danke, Tahira! Schön, dass Du wieder dabei bist!"},				
		},
		[760] = 
		{
			StopEffect {TargetType = Figure, NpcId = 0},			
			SetGlobalFlagTrue{Name = "TutorialIntroCutSceneIsOver"},
		},
		[770] =
		{
			WaitForEndOfSpeech,
			SetNoFightFlagFalse {NpcId = 0},				
			-- lev health zurücksetzen...
			CGdsFigureSetHealth:new(3326, 1)
		},
	},
}

