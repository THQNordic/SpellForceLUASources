-----------------------------------------------------------------------
--
--	Illirias und Utran
--
-----------------------------------------------------------------------

-- fahrt durch das tor
CameraIlliriasI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p5\\n2873_CameraIlliriasI.lua")
   	Camera:ScriptStart()
]]

-- grosse totale
CameraIlliriasII = 
[[
  	Camera:ScriptReset()
   	Camera:ScriptAddSpline(0,30,1,"script\\p5\\n1957_CameraEinarII.lua")
   	Camera:ScriptStart()
]]

-- radial niedrig gruppe
CameraIlliriasIII = 
[[
  	Camera:ScriptReset()
   	Camera:ScriptAddSpline(0,30,1,"script\\p5\\n2873_CameraIlliriasIII.lua")
   	Camera:ScriptStart()
]]

-- hohe fahrt fuer einar
CameraIlliriasIV = 
[[
  	Camera:ScriptReset()
   	Camera:ScriptAddSpline(0,30,1,"script\\p5\\n2873_CameraIlliriasIV.lua")
   	Camera:ScriptStart()
]]

-- hain heran
CameraIlliriasIX = 
[[
  	Camera:ScriptReset()
   	Camera:ScriptAddSpline(0,25,1,"script\\p5\\n2873_CameraIlliriasIX.lua")
   	Camera:ScriptStart()
]]

-- altar
CameraIlliriasX = 
[[
  	Camera:ScriptReset()
   	Camera:ScriptAddSpline(0,20,1,"script\\p5\\n2873_CameraIlliriasX.lua")
   	Camera:ScriptStart()
]]

-- schleichpfad
CameraIlliriasXI = 
[[
  	Camera:ScriptReset()
   	Camera:ScriptAddSpline(0,15,1,"script\\p5\\n2873_CameraIlliriasXI.lua")
   	Camera:ScriptStart()
]]

-- orkarmee
CameraIlliriasXII = 
[[
  	Camera:ScriptReset()
   	Camera:ScriptAddSpline(0,15,1,"script\\p5\\n2873_CameraIlliriasXII.lua")
   	Camera:ScriptStart()
]]

-- schleichpfad
CameraIlliriasXIII = 
[[
  	Camera:ScriptReset()
   	Camera:ScriptAddSpline(0,10,1,"script\\p5\\n2873_CameraIlliriasXIII.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "Illirias +Avatar", CameraScript = "", PlayOnlyOnce = TRUE,
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		Negated(EnemyUnitInRange {X = 297, Y = 146, NpcId = 1957, Range = 33, UpdateInterval = 10}),
		FigureInRange {NpcId = 0, X = 297, Y = 146, Range = 33, UpdateInterval = 15},
		IsGlobalFlagFalse {Name = "UtranFreeOver", UpdateInterval = 1},				
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:	
		SetGlobalFlagTrue {Name = "EinarDespawn"},	-- Einar despawnt.
		SetNoFightFlagTrue {NpcId = 0},
		SetGlobalFlagFalse{Name = "Q87EinarRunToUtrans"},
		SetGlobalFlagTrue {Name = "IlliriasSpawns"}, 	-- Illirias spawnt.	
		RemoveDialog {NpcId = 1957},					
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps nach der die jeweilige Action erfolgen soll: 
		[0] =
		{
			-- die ersten zwei sekunden ohne kamera:	
		},
		[20] =
		{
			ExecuteCameraScript{Script = CameraIlliriasI},
			Goto {X = 296 , Y = 142, NpcId = 0, Range = 0, WalkMode = Run, GotoMode = Continous},	-- avatar rennt zur feste.					
		},
		[90] =
		{
			SetGlobalFlagTrue {Name = "UtranSpawns"}, 		-- Zivilisten und Soldaten spawnen.
			SetNoFightFlagTrue {NpcId = 2873},
		},
		[130] =
		{
			Goto {X = 296 , Y = 146, NpcId = 2873, Range = 0, WalkMode = Run},	-- Illirias rennt zur feste.		
		},
		[150] = 
		{
			CutSceneSay {Tag = "cutiliriasShiel001", NpcId = 2873, String = "Kommt raus, Leute! Sie sind fort!"},		
			Goto {X = 300 , Y = 145, NpcId = 3266, Range = 0, WalkMode = Run}, -- zivi
			Goto {X = 302 , Y = 147, NpcId = 3265, Range = 0, WalkMode = Run}, -- zivi
			Goto {X = 293 , Y = 147, NpcId = 3264, Range = 0, WalkMode = Run}, -- zivi				
		},
		[170] = 
		{
			WaitForEndOfSpeech,					
			ExecuteCameraScript{Script = CameraIlliriasII},			
			Goto {X = 294 , Y = 144, NpcId = 3267, Range = 0, WalkMode = Run}, -- zivi
		},
		[180] = 
		{
			Goto {X = 290 , Y = 145, NpcId = 3268, Range = 0, WalkMode = Run},	--zivi	
			LookAtFigure {NpcId = 0, Target = 2873}, 
			LookAtFigure {NpcId = 2873, Target = 0}, 			
		},								
		[190] =
		{
			CutSceneSay {Tag = "cutiliriasShiel002", NpcId = 2873, String = "Wer hätte gedacht, dass die Rune uns eines Tages retten würde!"},
			Goto {X = 290 , Y = 145, NpcId = 3268, Range = 0, WalkMode = Run},	-- zivi
			Goto {X = 300 , Y = 145, NpcId = 3266, Range = 0, WalkMode = Run},	-- zivi
			Goto {X = 302 , Y = 147, NpcId = 3265, Range = 0, WalkMode = Run}, 	-- zivi			
			SetGlobalFlagTrue {Name = "EinarRespawn"},							-- Einar wird neu gespawnt.						
		},
		[250] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraIlliriasIII},
			SetNoFightFlagTrue {NpcId = 1957},				
			LookAtFigure {NpcId = 0, Target = 2873}, 
			LookAtFigure {NpcId = 2873, Target = 0}, 	
			Goto {NpcId = 2873, X = 296, Y = 145, WalkMode = Walk},						
			CutSceneSay {Tag = "cutiliriasShiel003", NpcId = 2873, String = "Hier, nehmt! Diese Rohstoffe sind alles, was wir Euch zur Unterstützung anbieten können!"},
			
			-- Belohnung
			TransferItem {GiveItem = 638, Amount = 1, Flag = Give},
			TransferItem {GiveItem = 709, Amount = 1, Flag = Give},			
			TransferResource {Resource = GoodStone, 		Amount = 400, Flag = Give, Side = SideLight},
			TransferResource {Resource = GoodIron, 			Amount = 400, Flag = Give, Side = SideLight},
			TransferResource {Resource = GoodManaElixir, 	Amount = 400, Flag = Give, Side = SideLight},				
		},
		[330] =
		{
			WaitForEndOfSpeech,	
			--CutSceneSay {Tag = "cuteinarShiel008", NpcId = 3564, String = "Das wird nicht reichen!"},	 -- Soldat spricht!!!
			
			Goto {X = 298 , Y = 147, NpcId = 1957, Range = 0, WalkMode = Run}, -- Einar	
			Goto {X = 296 , Y = 151, NpcId = 3564, Range = 0, WalkMode = Run}, -- soldaten					
			Goto {X = 298 , Y = 151, NpcId = 3565, Range = 0, WalkMode = Run}, -- soldaten 	
			Goto {X = 296 , Y = 153, NpcId = 3566, Range = 0, WalkMode = Run}, -- soldaten	
			Goto {X = 298 , Y = 153, NpcId = 3567, Range = 0, WalkMode = Run}, -- soldaten	
			Goto {X = 296 , Y = 155, NpcId = 3568, Range = 0, WalkMode = Run}, -- soldaten	
			Goto {X = 298 , Y = 155, NpcId = 3569, Range = 0, WalkMode = Run}, -- soldaten	
			Goto {X = 296 , Y = 157, NpcId = 3570, Range = 0, WalkMode = Run}, -- soldaten	
			Goto {X = 298 , Y = 157, NpcId = 3571, Range = 0, WalkMode = Run}, -- soldaten																						
		},
		[360] =
		{
			--WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraIlliriasIV},
			CutSceneSay {Tag = "cuteinarShiel006" , NpcId = 1957, String = "Späher haben von einem großen Heer berichtet, das im Osten steht! Ihr könnt sie nicht schlagen, es sind zu viele!"},
		},
		[440] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "cutiliriasShiel004", NpcId = 2873, String = "Es gibt eine Möglichkeit! Im Osten, nahe dem Portal, befindet sich ein Dryadenhain..."},
		},
		[460] =
		{
			ExecuteCameraScript{Script = CameraIlliriasIX},
			SetGlobalFlagTrue {Name = "UtranIdleOn"}, -- die soldaten bekommen einen OnIdleGoHome.				
		},
		[490] =
		{
			WaitForEndOfSpeech,				
			CutSceneSay {Tag = "cuteinarShiel007" , NpcId = 1957, String = "Die Geister der Bäume! Ja, sie wären stark genug, die Orks zu vertreiben! Aber wie wollt Ihr sie aus ihrem Hain locken?"},
		},
		[580] =
		{
			WaitForEndOfSpeech,			
			ExecuteCameraScript{Script = CameraIlliriasX},				
			CutSceneSay {Tag = "cutiliriasShiel005", NpcId = 2873, String = "Im Hain gibt es einen Altar! Opfert dort Lenyapflanzen, ein gutes Tausend! Das wird die Dryaden erwecken und sie werden Euch dienen!"},
		},		
		[700] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraIlliriasIV},
			CutSceneSay {Tag = "cutiliriasShiel006", NpcId = 2873, String = "Allerdings erwachen die Dryaden nur bei Nacht! Ihr müsst das Lenya also bei Dunkelheit darbringen!"},		
		},
		[770] =
		{
			WaitForEndOfSpeech,	
			CutSceneSay {Tag = "cutiliriasShiel007", NpcId = 2873, String = "Hier, Runenkrieger! Nehmt diesen Plan! Er wird Euch helfen, genug Pflanzen zu sammeln!"},
			Goto {NpcId = 0, X = 296, Y = 143, WalkMode = Walk},
			TransferItem {GiveItem = 965, Amount = 1, Flag = Give},					
		},
		[820] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraIlliriasXIII},		
			CutSceneSay {Tag = "cutiliriasShiel008", NpcId = 2873, String = "Und seht Euch vor! Der Dryadenhain liegt hinter den feindlichen Linien! Es gibt jedoch einen kleinen Schleichpfad, über den Ihr ihn erreichen könnt!"},		
		},
		[930] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraIlliriasIII},		
			CutSceneSay {Tag = "cutiliriasShiel009" , NpcId = 2873, String = "Bedient Euch der Macht der Dryaden! Nur so könnt Ihr das feindliche Heer vernichten!"},		
			RevealUnExplored{X = 424 , Y = 319 , Range = 8},
			RevealUnExplored{X = 437 , Y = 292 , Range = 15},
		},																
		[990] = 
		{
			WaitForEndOfSpeech,		
			SetGlobalFlagTrue {Name = "UtranIdleOn"}, -- die soldaten bekommen einen OnIdleGoHome.	
			SetNoFightFlagFalse {NpcId = 0},
			SetNoFightFlagFalse {NpcId = 2873},
			SetNoFightFlagFalse {NpcId = 1957},
			QuestSolve{QuestId = 467},                              
			QuestBegin{QuestId = 484},                              
			QuestBegin{QuestId = 485}, 
			SetGlobalFlagTrue {Name = "UtranFreeOver"},				
			EnableDialog {NpcId = 1957},						                             
		},
	},
}


CreateCutScene
{
	Name = "Illirias -Avatar", CameraScript = "", PlayOnlyOnce = TRUE,
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		Negated (EnemyUnitInRange {X = 297, Y = 146, NpcId = 1957, Range = 33, UpdateInterval = 15}),
		Negated (FigureInRange {NpcId = 0, X = 297, Y = 146, Range = 33, UpdateInterval = 15}),
		IsGlobalFlagFalse {Name = "UtranFreeOver", UpdateInterval = 1},				
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:	
		SetGlobalFlagTrue {Name = "EinarDespawn"},	-- Einar despawnt.
		SetNoFightFlagTrue {NpcId = 0},
		SetGlobalFlagFalse{Name = "Q87EinarRunToUtrans"},
		SetGlobalFlagTrue {Name = "IlliriasSpawns"}, 	-- Illirias spawnt.	
		RemoveDialog {NpcId = 1957},							
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps nach der die jeweilige Action erfolgen soll: 
		[0] =
		{
			-- die ersten zwei sekunden ohne kamera:	
		},
		[20] =
		{
			ExecuteCameraScript{Script = CameraIlliriasI},
			--Goto {X = 296 , Y = 142, NpcId = 0, Range = 0, WalkMode = Run, GotoMode = Continous},	-- avatar rennt zur feste.					
		},
		[90] =
		{
			SetGlobalFlagTrue {Name = "UtranSpawns"}, 		-- Zivilisten und Soldaten spawnen.
			SetNoFightFlagTrue {NpcId = 2873},
		},
		[130] =
		{
			Goto {X = 296 , Y = 146, NpcId = 2873, Range = 0, WalkMode = Run},	-- Illirias rennt zur feste.		
		},
		[150] = 
		{
			CutSceneSay {Tag = "cutiliriasShiel001", NpcId = 2873, String = "Kommt raus, Leute! Sie sind fort!"},		
			Goto {X = 300 , Y = 145, NpcId = 3266, Range = 0, WalkMode = Run}, -- zivi
			Goto {X = 302 , Y = 147, NpcId = 3265, Range = 0, WalkMode = Run}, -- zivi
			Goto {X = 293 , Y = 147, NpcId = 3264, Range = 0, WalkMode = Run}, -- zivi				
		},
		[170] = 
		{
			WaitForEndOfSpeech,					
			ExecuteCameraScript{Script = CameraIlliriasII},			
			Goto {X = 294 , Y = 144, NpcId = 3267, Range = 0, WalkMode = Run}, -- zivi
		},
		[180] = 
		{
			Goto {X = 290 , Y = 145, NpcId = 3268, Range = 0, WalkMode = Run},	--zivi	
			--LookAtFigure {NpcId = 0, Target = 2873}, 
			--LookAtFigure {NpcId = 2873, Target = 0}, 			
		},								
		[190] =
		{
			CutSceneSay {Tag = "cutiliriasShiel002", NpcId = 2873, String = "Wer hätte gedacht, dass die Rune uns eines Tages retten würde!"},
			Goto {X = 290 , Y = 145, NpcId = 3268, Range = 0, WalkMode = Run},	-- zivi
			Goto {X = 300 , Y = 145, NpcId = 3266, Range = 0, WalkMode = Run},	-- zivi
			Goto {X = 302 , Y = 147, NpcId = 3265, Range = 0, WalkMode = Run}, 	-- zivi			
			SetGlobalFlagTrue {Name = "EinarRespawn"},							-- Einar wird neu gespawnt.						
		},
		[250] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraIlliriasIII},
			SetNoFightFlagTrue {NpcId = 1957},				
			--LookAtFigure {NpcId = 0, Target = 2873}, 
			--LookAtFigure {NpcId = 2873, Target = 0}, 	
			Goto {NpcId = 2873, X = 296, Y = 145, WalkMode = Walk},						
			CutSceneSay {Tag = "cutiliriasShiel003", NpcId = 2873, String = "Hier, nehmt! Diese Rohstoffe sind alles, was wir Euch zur Unterstützung anbieten können!"},
			
			-- Belohnung
			TransferItem {GiveItem = 638, Amount = 1, Flag = Give},
			TransferItem {GiveItem = 709, Amount = 1, Flag = Give},			
			TransferResource {Resource = GoodStone, 		Amount = 400, Flag = Give, Side = SideLight},
			TransferResource {Resource = GoodIron, 			Amount = 400, Flag = Give, Side = SideLight},
			TransferResource {Resource = GoodManaElixir, 	Amount = 400, Flag = Give, Side = SideLight},				
		},
		[330] =
		{
			WaitForEndOfSpeech,	
			--CutSceneSay {NpcId = 1957, String = "Das wird nicht reichen!"},	 -- Einar kommt angelaufen!
			
			Goto {X = 298 , Y = 147, NpcId = 1957, Range = 0, WalkMode = Run}, -- Einar	
			Goto {X = 296 , Y = 151, NpcId = 3564, Range = 0, WalkMode = Run}, -- soldaten					
			Goto {X = 298 , Y = 151, NpcId = 3565, Range = 0, WalkMode = Run}, -- soldaten 	
			Goto {X = 296 , Y = 153, NpcId = 3566, Range = 0, WalkMode = Run}, -- soldaten	
			Goto {X = 298 , Y = 153, NpcId = 3567, Range = 0, WalkMode = Run}, -- soldaten	
			Goto {X = 296 , Y = 155, NpcId = 3568, Range = 0, WalkMode = Run}, -- soldaten	
			Goto {X = 298 , Y = 155, NpcId = 3569, Range = 0, WalkMode = Run}, -- soldaten	
			Goto {X = 296 , Y = 157, NpcId = 3570, Range = 0, WalkMode = Run}, -- soldaten	
			Goto {X = 298 , Y = 157, NpcId = 3571, Range = 0, WalkMode = Run}, -- soldaten																						
		},
		[360] =
		{
			--WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraIlliriasIV},
			CutSceneSay {Tag = "cuteinarShiel006" , NpcId = 1957, String = "Späher haben von einem großen Heer berichtet, das im Osten steht! Ihr könnt sie nicht schlagen, es sind zu viele!"},
		},
		[440] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "cutiliriasShiel004", NpcId = 2873, String = "Es gibt eine Möglichkeit! Im Osten, nahe dem Portal, befindet sich ein Dryadenhain..."},
		},
		[460] =
		{
			ExecuteCameraScript{Script = CameraIlliriasIX},
			SetGlobalFlagTrue {Name = "UtranIdleOn"}, -- die soldaten bekommen einen OnIdleGoHome.				
		},
		[490] =
		{
			WaitForEndOfSpeech,				
			CutSceneSay {Tag = "cuteinarShiel007" , NpcId = 1957, String = "Die Geister der Bäume! Ja, sie wären stark genug, die Orks zu vertreiben! Aber wie wollt Ihr sie aus ihrem Hain locken?"},
		},
		[580] =
		{
			WaitForEndOfSpeech,			
			ExecuteCameraScript{Script = CameraIlliriasX},				
			CutSceneSay {Tag = "cutiliriasShiel005", NpcId = 2873, String = "Im Hain gibt es einen Altar! Opfert dort Lenyapflanzen, ein gutes Tausend! Das wird die Dryaden erwecken und sie werden Euch dienen!"},
		},		
		[700] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraIlliriasIV},
			CutSceneSay {Tag = "cutiliriasShiel006", NpcId = 2873, String = "Allerdings erwachen die Dryaden nur bei Nacht! Ihr müsst das Lenya also bei Dunkelheit darbringen!"},		
		},
		[770] =
		{
			WaitForEndOfSpeech,	
			CutSceneSay {Tag = "cutiliriasShiel007", NpcId = 2873, String = "Hier, Runenkrieger! Nehmt diesen Plan! Er wird Euch helfen, genug Pflanzen zu sammeln!"},
			--Goto {NpcId = 0, X = 296, Y = 143, WalkMode = Walk},
			TransferItem {GiveItem = 965, Amount = 1, Flag = Give},					
		},
		[820] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraIlliriasXIII},		
			CutSceneSay {Tag = "cutiliriasShiel008", NpcId = 2873, String = "Und seht Euch vor! Der Dryadenhain liegt hinter den feindlichen Linien! Es gibt jedoch einen kleinen Schleichpfad, über den Ihr ihn erreichen könnt!"},		
		},
		[930] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraIlliriasIII},		
			CutSceneSay {Tag = "cutiliriasShiel009" , NpcId = 2873, String = "Bedient Euch der Macht der Dryaden! Nur so könnt Ihr das feindliche Heer vernichten!"},		
		},																
		[990] = 
		{
			WaitForEndOfSpeech,		
			SetGlobalFlagTrue {Name = "UtranIdleOn"}, -- die soldaten bekommen einen OnIdleGoHome.	
			SetNoFightFlagFalse {NpcId = 0},
			SetNoFightFlagFalse {NpcId = 2873},
			SetNoFightFlagFalse {NpcId = 1957},
			QuestSolve{QuestId = 467},                              
			QuestBegin{QuestId = 484},                              
			QuestBegin{QuestId = 485},     
			SetGlobalFlagTrue {Name = "UtranFreeOver"},
			EnableDialog {NpcId = 1957},								                         
		},
	},
}

