-----------------------------------------------------------------------
--
--	Talia Entry
--
-----------------------------------------------------------------------

-- avatar geht zu talia
CameraTaliaEntryI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p23\\n3736_CameraTaliaEntryI.lua")
   	Camera:ScriptStart()
]]

-- talia halbnah
CameraTaliaEntryII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p23\\n3736_CameraTaliaEntryII.lua")
	Camera:SetViewAngles(0.8, 0.8)     	
   	Camera:ScriptStart()
]]

-- blick zum spalt
CameraTaliaEntryIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,25,1,"script\\p23\\n3736_CameraTaliaEntryIII.lua")
	Camera:SetViewAngles(0.8, 0.8)    	
   	Camera:ScriptStart()
]]

-- flug durch den spalt
CameraTaliaEntryIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p23\\n3736_CameraTaliaEntryIV.lua")
	Camera:SetViewAngles(0.8, 0.8)     	
   	Camera:ScriptStart()
]]

-- ulather nah
CameraTaliaEntryV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p23\\n3736_CameraTaliaEntryV.lua")
	Camera:SetViewAngles(0.8, 0.8)     	
   	Camera:ScriptStart()
]]

-- talia geht zum spalt
CameraTaliaEntryVI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p23\\n3736_CameraTaliaEntryVI.lua")
	Camera:SetViewAngles(0.8, 0.8)     	
   	Camera:ScriptStart()
]]

-- talia mit blick auf spalt
CameraTaliaEntryVI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p23\\n3736_CameraTaliaEntryVI.lua")
	Camera:SetViewAngles(1.2, 1.2)  	
   	Camera:ScriptStart()
]]

-- talia geht zum spalt
CameraTaliaEntryVII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p23\\n3736_CameraTaliaEntryVII.lua")
	Camera:SetViewAngles(0.8, 0.8)     	
   	Camera:ScriptStart()
]]

-- kampf talia daemon
CameraTaliaEntryVIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p23\\n3736_CameraTaliaEntryVIII.lua")
	Camera:SetViewAngles(1.2, 1.2)    	
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "TaliaEntry", CameraScript = "", PlayOnlyOnce = TRUE,
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		-- startet direkt zu beginn der map.
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:
		SetNoFightFlagTrue {NpcId = 3736},	
		SetNoFightFlagTrue {NpcId = 0},	
		--SetGlobalFlagTrue {Name = "RiftIdleOn"},
		RemoveDialog {NpcId = 3736},						
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		[0] =
		{
			-- startcutscene zu beginn der map.	
			Goto {NpcId = 0, X = 71, Y = 235, WalkMode = Run},
			ExecuteCameraScript{Script = CameraTaliaEntryI},	
		},
		[100] = 
		{ 
			CutSceneSay {Tag = "cutmaincharRift001" , NpcId = 0, String = "Talia Storm?"},		
		},
		[120] = 
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraTaliaEntryII},				
			CutSceneSay {Tag = "cuttaliaRift001" , NpcId = 3736, String = "Wer seid Ihr? Was führt Euch hierher?"},				
		},
		[160] = 
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "cutmaincharRift002" , NpcId = 0, String = "In Eurem Besitz befindet sich ein Splitter aus magischem Glas..."},		
		},
		[190] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "cuttaliaRift002" , NpcId = 3736, String = "Deshalb seid Ihr gekommen? Dann war Eure Reise leider umsonst! Niemand legt Hand an diesen Splitter! Geht jetzt! Ich habe keine Zeit für Euch! Mein Schicksal erwartet mich! "},	
		},
		[250] =
		{
			Goto {NpcId = 3736, X = 74, Y = 238, WalkMode = Walk},		
		},
		[270] = 
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraTaliaEntryIV},			
			CutSceneSay {Tag = "cuttaliaRift003" , NpcId = 3736, String = "Ich werde durch den Spalt gehen und Ulather sein dunkles Herz aus der Brust reißen! Dann wird dieses Land frei sein vom Fluch der Dämonen! Für immer!"},				
		},
		[340] =
		{
			ExecuteCameraScript{Script = CameraTaliaEntryV},	
		},
		[400] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraTaliaEntryVII},					
			Goto {NpcId = 3736, X = 82, Y = 238, WalkMode = Run},
			LookAtFigure {NpcId = 0, Target = 3736},
			CutSceneSay {Tag = "cuttaliaRift004" , NpcId = 3736, String = "Ihr könnt mir ja folgen - falls Ihr es wagt..."},	
		},
		[440] = 
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "cuttaliaRift005" , NpcId = 3736, String = "Aber haltet Euch fern von den Hängen! Dort sind ihre Nester! Das würdet Ihr nicht überleben! Wenn Ihr hier unten im Tal bleibt, habt Ihr vielleicht eine Chance ..."},			
		},
		[500] = 
		{
			WaitForEndOfSpeech,	
			CastSpell {Spell = 326, Target = 3736, TargetType = Figure, X = 0, Y = 0, NpcId = 3736}, -- IceShield					
			CutSceneSay {Tag = "cuttaliaRift006" , NpcId = 3736, String = "Ihr würdet allerdings eine Armee benötigen, um mit mir Schritt halten zu können... deshalb: lebt wohl!"},			
		},
		[550] =
		{
			Goto {NpcId = 3736, X = 108, Y = 254, WalkMode = Run},	-- talia rennt los.
		},
		[600] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraTaliaEntryVI},	
			CGdsFigureSetHealth:new(3912, 1)	-- daemon health zurücksetzen.							
		},
		[760] =
		{
			ExecuteCameraScript{Script = CameraTaliaEntryVIII},		
		},
		[770] =
		{
			CastSpell {Spell = 319, Target = 3912, TargetType = Figure, X = 0, Y = 0, NpcId = 3736},
		},
		[800] =
		{
			CastSpell {Spell = 319, Target = 3912, TargetType = Figure, X = 0, Y = 0, NpcId = 3736},		
		},
		[850] = 
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraTaliaEntryVI},			
			Goto {NpcId = 3736, X = 131, Y = 275, WalkMode = Run, GotoMode = Forced},					
		},		
		[960] =
		{
			ExecuteCameraScript{Script = CameraTaliaEntryIII},				
			CutSceneSay {Tag = "cutmaincharRift003" , NpcId = 0, String = "Wir werden sehen... wir werden sehen! Eine Armee also..."},					
			SetNoFightFlagFalse {NpcId = 3736},	
			SetNoFightFlagFalse {NpcId = 0},
			EnableDialog {NpcId = 3736},								
		},
		[1020] = 
		{
			WaitForEndOfSpeech,
			QuestBegin {QuestId = 310},
			QuestBegin {QuestId = 312},
			SetGlobalFlagTrue {Name = "Q310DespawnTalia"},
			SetGlobalFlagTrue {Name = "RiftIdleOn"},
							
		},
	},
}

