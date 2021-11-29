-----------------------------------------------------------------------
--
--	Tutorial Extro
--
-----------------------------------------------------------------------


-- start cam - wird nicht gebraucht.
CameraTutExtroI = 
[[
  	Camera:ScriptReset()
  	Camera:SetViewAngles(0.8, 0.8) 	  	
  	Camera:ScriptAddSpline(0,20,1,"script\\p78\\n3325_CameraTutExtroI.lua")
   	Camera:ScriptStart()
]]

-- hohe fahrt entlang der achse
CameraTutExtroII = 
[[
  	Camera:ScriptReset()
  	Camera:SetViewAngles(0.6, 0.6) 	  	
  	Camera:ScriptAddSpline(0,31,1,"script\\p78\\n3325_CameraTutExtroII.lua") 

   	Camera:ScriptStart()
]]

-- fahrt-zoom auf das tor
CameraTutExtroIII = 
[[
  	Camera:ScriptReset()
  	Camera:SetViewAngles(0.8, 0.8) 	  	  	
  	Camera:ScriptAddSpline(0,25,1,"script\\p78\\n3325_CameraTutExtroIII.lua")  	
   	Camera:ScriptStart()
]]

-- nah an der gruppe
CameraTutExtroIV = 
[[
  	Camera:ScriptReset()
  	Camera:SetViewAngles(0.8, 0.8) 	  	
  	Camera:ScriptAddSpline(0,30,1,"script\\p78\\n3325_CameraTutExtroIV.lua")  	
   	Camera:ScriptStart()
]]

-- kampfgetuemmel
CameraTutExtroV = 
[[
  	Camera:ScriptReset()
  	Camera:SetViewAngles(0.9, 0.9) 	  	
  	Camera:ScriptAddSpline(0,31,1,"script\\p78\\n3325_CameraTutExtroV.lua")  	
   	Camera:ScriptStart()
]]

-- kampfgetuemmel nah - focus joshua
CameraTutExtroVI = 
[[
  	Camera:ScriptReset()
  	Camera:SetViewAngles(0.8, 0.8) 	  	
  	Camera:ScriptAddSpline(0,31,1,"script\\p78\\n3325_CameraTutExtroVI.lua")  	
   	Camera:ScriptStart()
]]

-- hohe radialfahrt gruppe
CameraTutExtroVII = 
[[
  	Camera:ScriptReset()
  	Camera:SetViewAngles(0.8, 0.8) 	  	
  	Camera:ScriptAddSpline(0,31,1,"script\\p78\\n3325_CameraTutExtroVII.lua")  	
   	Camera:ScriptStart()
]]

-- rohen halbnah beim kampf
CameraTutExtroVIII = 
[[
  	Camera:ScriptReset()
  	Camera:SetViewAngles(0.8, 0.8) 	  	
  	Camera:ScriptAddSpline(0,20,1,"script\\p78\\n3325_CameraTutExtroVIII.lua")  	
   	Camera:ScriptStart()
]]

-- gruppe gegenschuss
CameraTutExtroIX = 
[[
  	Camera:ScriptReset()
  	Camera:SetViewAngles(0.8, 0.8) 	  	
  	Camera:ScriptAddSpline(0,20,1,"script\\p78\\n3325_CameraTutExtroIX.lua")  	
   	Camera:ScriptStart()
]]

-- gruppe (rohen erscheint)
CameraTutExtroX = 
[[
  	Camera:ScriptReset()
  	Camera:SetViewAngles(0.8, 0.8) 	  	
  	Camera:ScriptAddSpline(0,20,1,"script\\p78\\n3325_CameraTutExtroX.lua")  	
   	Camera:ScriptStart()
]]

CreateCutScene
{
	Name = "TutorialExtro", CameraScript = "", PlayOnlyOnce = TRUE,
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		-- FigureInRange {NpcId = Avatar, X = 204, Y = 209, Range = 6},
		IsGlobalFlagTrue{Name = "BeginJoshuaRohenCutscene", UpdateInterval = 10},
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:	
		SetGlobalFlagTrue {Name = "ExtroJoshuaSpawnCutscene"},
		SetGlobalFlagTrue {Name = "3325_IdleOff"},	
		SetGlobalFlagTrue {Name = "RohenLastSpawn"},
		SetNoFightFlagTrue {NpcId = 0},		
		SetNoFightFlagTrue {NpcId = 3325},	
		RemoveDialog {NpcId = 3325},		
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
			ExecuteCameraScript{Script = CameraTutExtroII},			-- der weg zum tor			
			Goto {NpcId = 3325, X = 178, Y = 193, WalkMode = Run}, 	-- joshua laeuft zum tor
			Goto {NpcId = 0, X = 178, Y = 191, WalkMode = Run}, 	-- avatar laeuft zum tor	
			SetNoFightFlagTrue {NpcId = 3383},		
		},
		[70] =
		{
			SetEffect {Effect = "SimpleInvis", NpcId = 3383, Length = 0, TargetType = Figure},	-- rohen
			Goto {NpcId = 3325, X = 178, Y = 193, WalkMode = Run}, 	-- joshua laeuft zum tor
			Goto {NpcId = 0, X = 178, Y = 191, WalkMode = Run}, 	-- avatar laeuft zum tor				
			LookAtDirection { NpcId = 0, Direction = West},	
			LookAtDirection { NpcId = 3325, Direction = West},							
		},
		[140] =
		{
			ExecuteCameraScript {Script = CameraTutExtroIII}, 	-- das tor oeffnet sich
			SetGlobalFlagTrue {Name = "ExtroSpawn"}, 			-- orks erscheinen
			LookAtDirection { NpcId = 0, Direction = West},	
			LookAtDirection { NpcId = 3325, Direction = West},				
		},		
		[160] =
		{
			Goto {NpcId = 3383, X = 175, Y = 192, WalkMode = Run},	-- rohen	
			LookAtDirection { NpcId = 0, Direction = West},	
			LookAtDirection { NpcId = 3325, Direction = West},							
		},
		[170] =
		{
			SetGlobalFlagTrue {Name = "OpenLastGate"},				-- das tor oeffnet sich			
		},
		[210] =
		{
			CutSceneSay {Tag = "cutjoshuaTut001", NpcId = 3325, String = "Zerbos Gnade! Hört das denn nie auf?"},
		},
		[250] = 
		{
			WaitForEndOfSpeech,			
			CutSceneSay {Tag = "cuttahiraTut005", NpcId = 0, String = "Das wird... interessant!"},
		},	
		[280] =
		{
			WaitForEndOfSpeech,					
			ExecuteCameraScript {Script = CameraTutExtroX}, 		
		},
		[300] =
		{
			StopEffect {TargetType = Figure, NpcId = 3383},					
			SetEffect {Effect = "Materialize", NpcId = 3383, Length = 0, TargetType = Figure}, 						
		},
		[330] =
		{
			CutSceneSay {Tag = "cutjoshuaTut002", NpcId = 3325, String = "Rohen!"},	
			StopEffect {TargetType = Figure, NpcId = 3383}					
		},	
		[350] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript {Script = CameraTutExtroV}, 			
			CastSpell {Spell = 553, Target = 0, TargetType = World, X = 155, Y = 194, NpcId = 3383},	-- rohen casts blizzard.	
		},
		[400] =
		{
			Goto {NpcId = 3383, X = 166, Y = 193, WalkMode = Run,  GotoMode = GotoForced},	-- rohen runs to battle.	
			SetNoFightFlagFalse {NpcId = 3383},			
		},
		[520] =
		{
			ExecuteCameraScript {Script = CameraTutExtroVIII}, 
			LookAtFigure {NpcId = 3325, Target = 3383},						
			CutSceneSay {Tag = "cutjoshuaTut003", NpcId = 3325, String = "Meister Rohen! Noch einen Augenblick später und wir wären verloren gewesen!"},	
		},	
		[560] =
		{
			Goto {NpcId = 3325, X = 175, Y = 194, WalkMode = Run, GotoMode = GotoContinous}, 	-- joshua kehrt zurueck vom kampf		
		},	
		[580] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript {Script = CameraTutExtroVII}, -- gespraech
			LookAtDirection {NpcId = 3325, Direction = South},
			Goto {NpcId = 3383, X = 175, Y = 191, WalkMode = Run, GotoMode = GotoContinous},  	-- rohen kehrt zurueck vom kampf
			Goto {NpcId = 3325, X = 175, Y = 194, WalkMode = Run, GotoMode = GotoContinous}, 	-- joshua kehrt zurueck vom kampf
	    },
		[620] =
		{
			LookAtDirection {NpcId = 3325, Direction = South},
			Goto {NpcId = 3383, X = 175, Y = 191, WalkMode = Run, GotoMode = GotoContinous},  	-- rohen kehrt zurueck vom kampf
			Goto {NpcId = 3325, X = 175, Y = 194, WalkMode = Run, GotoMode = GotoContinous}, 	-- joshua kehrt zurueck vom kampf
	    },	    
	    [640] =
	    {
	    	LookAtFigure {NpcId = 0, Target = 3383}, 
			LookAtFigure {NpcId = 3325, Target = 3383}, 
			LookAtFigure {NpcId = 3383, Target = 3325}, 			
	    },
		[660] =
		{
			CutSceneSay {Tag = "cutrohenTut001", NpcId = 3383, String = "Habt Ihr die Rune?"},	
		},
		[690] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript {Script = CameraTutExtroIV}, -- gespraech	
			LookAtFigure {NpcId = 3325, Target = 3383}, 	
			Goto {NpcId = 3325, X = 175, Y = 193, WalkMode = Walk, GotoMode = GotoContinous}, 	-- joshua.									
			CutSceneSay {Tag = "cutjoshuaTut004", NpcId = 3325, String = "Tahira hat sie aus den Ruinen geholt! Hier ist sie!"},	
		},
		[720] =
		{
			Goto {NpcId = 3325, X = 175, Y = 193, WalkMode = Walk, GotoMode = GotoContinous}, 	-- joshua.				
		},
		[740] =
		{
			WaitForEndOfSpeech,		
			LookAtFigure {NpcId = 3383, Target = 0}, 			
			CutSceneSay {Tag = "cutrohenTut002", NpcId = 3383, String = "Tahira, ich danke Dir! Du hast..."},				
		},
		[770] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript {Script = CameraTutExtroIX}, -- gespraech	
			LookAtFigure {NpcId = 3325, Target = 0}, 				
			CutSceneSay {Tag = "cuttahiraTut006", NpcId = 0, String = "Euch gut gedient?"},	
		},
		[800] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "cutrohenTut003", NpcId = 3383, String = "Ich verstehe Deinen Zorn... Glaub' mir, das war es wert! Diese Rune ist der Schlüssel zu unserer Zukunft... und Vergangenheit!"},	
		},
		[870] =
		{
			ExecuteCameraScript {Script = CameraTutExtroX}, -- rohen nah	
		},
		[910] =
		{
			WaitForEndOfSpeech,			
			CutSceneSay {Tag = "cutrohenTut004", NpcId = 3383, String = "Doch nun will ich Dich nicht länger behelligen! Lebe in Frieden, Tahira! Wir werden uns nicht wiedersehen!"},	
		},
		[990] =
		{
			WaitForEndOfSpeech,			
			SetEffect {Effect = "DeMaterialize", NpcId = 3383, Length = 0}, 	
		},
		[1020] =
		{
			Vanish {NpcId = 3383},
			LookAtFigure {NpcId = 0, Target = 3325}, 			
		},
		[1030] =
		{
			CutSceneSay {Tag = "cutjoshuaTut005", NpcId = 3325, String = "Leb' wohl, Tahira!"},
		},
		[1050] =
		{
			WaitForEndOfSpeech,					
			ExecuteCameraScript {Script = CameraTutExtroII}, -- josh und rohen hauen ab				
			Goto {NpcId = 3325, X = 144, Y = 196, WalkMode = Run}, 	-- josh laeuft zum portal		
		},
		[1180] = 
		{
			Vanish {NpcId = 3325},
		},
		[1210] =
		{
			WaitForEndOfSpeech,	
			SetNoFightFlagFalse {NpcId = 0},					
			SetGlobalFlagTrue {Name = "TutExtroEnd"}, 
		},
	},
}
