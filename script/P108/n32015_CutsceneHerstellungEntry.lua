-----------------------------------------------------------------------
--
--	HerstellungEntry
--
-----------------------------------------------------------------------

-- totale
CameraHerstellungEntryI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p108\\n6048_CameraHerstellungEntryI.lua")
   	Camera:ScriptStart()
]]

-- avatar kommt an
CameraHerstellungEntryII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p108\\n6048_CameraHerstellungEntryII.lua")
   	Camera:ScriptStart()
]]

-- ragnar nah
CameraHerstellungEntryIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,60,1,"script\\p108\\n6048_CameraHerstellungEntryIII.lua")
   	Camera:ScriptStart()
]]

-- avatar nah
CameraHerstellungEntryIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,60,1,"script\\p108\\n6048_CameraHerstellungEntryIV.lua")
   	Camera:ScriptStart()
]]

-- rode kommt angelaufen
CameraHerstellungEntryV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p108\\n6048_CameraHerstellungEntryV.lua")
   	Camera:ScriptStart()
]]

-- avatar und ragnar
CameraHerstellungEntryVI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p108\\n6048_CameraHerstellungEntryVI.lua")
   	Camera:ScriptStart()
]]

-- blick auf windjalf
CameraHerstellungEntryVII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p108\\n6048_CameraHerstellungEntryVII.lua")
   	Camera:ScriptStart()
]]

-- blick auf die skelettarmee
CameraHerstellungEntryVIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p108\\n6048_CameraHerstellungEntryVIII.lua")
   	Camera:ScriptStart()
]]

-- windjalf 2
CameraHerstellungEntryIX = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p108\\n6048_CameraHerstellungEntryIX.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "HerstellungEntry", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		-- startet wenn spieler in die Naehe der Stadt kommt.
		FigureInRange{X = 164, Y = 350, Range = 9, NpcId = 0}, 
		-- IsGlobalFlagTrue {Name = "Stopper"},
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:
		SetNoFightFlagTrue {NpcId = 0},		-- avatar
		SetNoFightFlagTrue {NpcId = 6048},	-- ragnar
		SetGlobalFlagTrue {Name = "CutsceneInitHerstellungEntry"}, -- windjalf spawn
	},	
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		[0] =
		{
		},
		[20] =
		{
			ExecuteCameraScript{Script = CameraHerstellungEntryI},
			Goto {NpcId = 0, X = 165, Y = 342, WalkMode = Walk},	
			RemoveDialog {NpcId = 6304},				
		},
		[110] = 
		{
			ExecuteCameraScript{Script = CameraHerstellungEntryII},		
			CutSceneSay { Tag = "cs14MainCharP108_001" , NpcId = 0, String = "Wo finde ich Windjalf, den Schmied?"},
			LookAtFigure {NpcId = 6048, Target = 0},	
		},
		[150] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraHerstellungEntryIII},
			CutSceneSay { Tag = "cs14RagnarP108_001" , NpcId = 6048, String = "Windjalf? Hah! Windjalf ist fort und wir werden es auch bald sein."}, -- ragnar
		},
		[190] =
		{
			WaitForEndOfSpeech,
			CutSceneSay { Tag = "cs14RagnarP108_002" , NpcId = 6048, String = "Das Beben im Eis hat alte Kammern geöffnet ... und alte Gräber! Tot geglaubte Feinde kommen wieder ans Tageslicht!"},	
		},
		[250] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraHerstellungEntryIX},
			AttackTarget {NpcId = 6310, Target = 6304},				
			CutSceneSay { Tag = "cs14RagnarP108_003" , NpcId = 6048, String = "Gorg, ein untoter Riese aus der alten Welt, ist jetzt wieder frei ... und hat Windjalf gefangen. Im Osten foltert er ihn in seiner Höhle!"},		
		},
		[300] =
		{
			WaitForEndOfSpeech,
			SetGlobalFlagTrue {Name = "P108_RagnarCutscene"}, -- angriffswelle 1			
		},
		[310] =
		{
			ExecuteCameraScript{Script = CameraHerstellungEntryVIII},			
			SetGlobalFlagTrue {Name = "RodeSpawnFlag"}, -- rode wird gespawnt
			CutSceneSay { Tag = "cs14RagnarP108_004" , NpcId = 6048, String = "Währenddessen strömen seine Schergen gegen unsere Wälle."},	
		},
		[390] =
		{
			WaitForEndOfSpeech,		
			EnableDialog {NpcId = 6304},		
			ExecuteCameraScript{Script = CameraHerstellungEntryV},
			Goto {NpcId = 6758, X = 163, Y = 337, WalkMode = Run},		
			LookAtFigure {NpcId = 6048, Target = 6758},	
			CutSceneSay { Tag = "cs14RodeP108_001" , NpcId = 6758, String = "Mein König! Ein neuer Angriff beginnt!"},	-- RODE !!!!!!!!!!!!
		},
		[430] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraHerstellungEntryVI},
			LookAtFigure {NpcId = 6048, Target = 0},				
			CutSceneSay { Tag = "cs14RagnarP108_005" , NpcId = 6048, String = "Steht nicht da, wie angewurzelt, Runenkrieger! Ruft Eure Truppen herbei und verteidigt die Stadt! Bedient Euch unserer Gebäude! Verstärkt unsere Verteidigung!"},		
		},
		[490] = 
		{
			WaitForEndOfSpeech,
			SetGlobalFlagTrue {Name = "CutsceneHerstellungEntryOver"}, -- windjalf despawn	
			SetGlobalFlagFalse {Name = "RodeSpawnFlag"},			
			SetNoFightFlagFalse {NpcId = 0},
			SetNoFightFlagFalse {NpcId = 6048},			
		},
	},
}
