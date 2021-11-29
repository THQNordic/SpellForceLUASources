-----------------------------------------------------------------------
--
--	Northern Windwalls Entry (Marcia)
--
-----------------------------------------------------------------------

-- totale bruecke
CameraMarciaEntryI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,25,1,"script\\p9\\n2016_CameraMarciaEntryI.lua")
   	Camera:ScriptStart()
]]

-- marcia halbnah 1
CameraMarciaEntryII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p9\\n2016_CameraMarciaEntryII.lua")
   	Camera:ScriptStart()
]]

-- marcia halbnah 2
CameraMarciaEntryIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p9\\n2016_CameraMarciaEntryIII.lua")
   	Camera:ScriptStart()
]]

-- janir und gruppe halbnah
CameraMarciaEntryIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,25,1,"script\\p9\\n2016_CameraMarciaEntryIV.lua")
   	Camera:ScriptStart()
]]

-- zum elfenmonument 2
CameraMarciaEntryV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p9\\n2016_CameraMarciaEntryV.lua")
   	Camera:ScriptStart()
]]

-- zum elfenmonument 3
CameraMarciaEntryVI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p9\\n2016_CameraMarciaEntryVI.lua")
   	Camera:ScriptStart()
]]

-- vertikalfahrt armee
CameraMarciaEntryVII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p9\\n2016_CameraMarciaEntryVII.lua")
   	Camera:ScriptStart()
]]

-- totale fahrt zum monument
CameraMarciaEntryVIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p9\\n2016_CameraMarciaEntryVIII.lua")
   	Camera:ScriptStart()
]]

-- vertikalfahrt armee und haenge
CameraMarciaEntryIX = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p9\\n2016_CameraMarciaEntryIX.lua")
   	Camera:ScriptStart()
]]

-- eisenkarren 1
CameraMarciaEntryX = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p9\\n2016_CameraMarciaEntryX.lua")
   	Camera:ScriptStart()
]]

-- untotenarmee
CameraMarciaEntryXI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p9\\n2016_CameraMarciaEntryXI.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "MarciaEntry", CameraScript = "", PlayOnlyOnce = TRUE,
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		FigureAlive {NpcId = 2016}, -- Marcia
		FigureAlive {NpcId = 2017}, -- Jonir	
		FigureInRange {X = 257, Y = 408, Range = 10, NpcId = 0},	
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:	
		SetGlobalFlagFalse {Name = "MarciaJonirIdleOn"},
		SetNoFightFlagTrue {NpcId = 0},
		SetNoFightFlagTrue {NpcId = 2016},
		SetNoFightFlagTrue {NpcId = 2017},	
		RemoveDialog {NpcId = 2016},	
		RemoveDialog {NpcId = 2017},																		
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		[0] =
		{
			-- die ersten zwei sekunden ohne kamera (Niemals Goto auf Avatar):	
		},
		[20] =
		{
			ExecuteCameraScript{Script = CameraMarciaEntryI},	-- totale bruecke	
			Goto {NpcId = 0, X = 257, Y = 382, WalkMode = Run},						
		},
		[160] =
		{
			LookAtFigure{NpcId = 0, Target = 2016},
			LookAtFigure{NpcId = 2016, Target = 0},						
			CutSceneSay {Tag = "cutmaincharNW001" , NpcId = 0, String = "Seid Ihr Marcia? Der Orden schickt mich..."},				
		},
		[190] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraMarciaEntryII},	-- marcia halbnah 1				
			CutSceneSay {Tag = "cutmarciaNW001" , NpcId = 2016, String = "Seid Ihr die Verstärkung? Endlich! Wo sind Eure Truppen?"},				
		},		
		[220] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "cutmaincharNW002" , NpcId = 0, String = "Ihr missversteht mich! Ich komme nicht als Verstärkung..."},				
		},		
		[260] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraMarciaEntryIII},	-- marcia halbnah 2					
			CutSceneSay {Tag = "cutmarciaNW002" , NpcId = 2016, String = "Ihr seid ein Runenkrieger, oder? Folgt mir zu Lord Jonir! Er wird Euch die Lage schildern!"},				
		},		
		[310] =
		{
			Goto {NpcId = 2016, X = 258, Y = 377, WalkMode = Walk},
		},
		[320] =
		{
			WaitForEndOfSpeech,	
			CutSceneSay {Tag = "cutmaincharNW003" , NpcId = 0, String = "Wartet!"},
			Goto {NpcId = 0, X = 260, Y = 377, WalkMode = Walk},	
			Goto {NpcId = 2017, X = 259, Y = 376, WalkMode = Walk},									
		},		
		[350] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraMarciaEntryIV},	-- marcia halbnah 2		
			LookAtFigure{NpcId = 0, Target = 2016},
			LookAtFigure{NpcId = 2016, Target = 0},									
			CutSceneSay {Tag = "cutmarciaNW003" , NpcId = 2016, String = "Lord Jonir! Der Orden hat uns einen Runenkrieger gesandt!"},				
		},		
		[400] =
		{
			WaitForEndOfSpeech,		
			LookAtFigure{NpcId = 0, Target = 2017},
			LookAtFigure{NpcId = 2017, Target = 0},						
			CutSceneSay {Tag = "cutjonirNW001" ,NpcId = 2017, String = "Dann seid willkommen in unseren Reihen, Runenkrieger!"},				
		},		
		[440] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "cutjonirNW002" ,NpcId = 2017, String = "Unsere Lage ist wie folgt..."},				
		},		
		[470] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraMarciaEntryXI},				
			CutSceneSay {Tag = "cutjonirNW003" ,NpcId = 2017, String = "Seit Tagen ist Burg Brunnenfels den Attacken untoter Heere aus dem Süden ausgesetzt!"}, 				
		},	
		[530] =
		{
			CutSceneSay {Tag = "cutjonirNW004" ,NpcId = 2017, String = "Unsere Zwergengarde hat uns verlassen! Wir sind am Ende unserer Kräfte!"},	
		},
		[600] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraMarciaEntryVII},					
			CutSceneSay {Tag = "cutjonirNW005" ,NpcId = 2017, String = "General Gunthar erwartet mit unserem letzten Aufgebot die nächste Angriffswelle der Untoten! Es sind nur noch eine Handvoll Männer - unsere Fernkampf-Regimenter wurden bereits komplett aufgerieben!"},				
		},	
		[730] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraMarciaEntryV},						
			CutSceneSay {Tag = "cutmarciaNW004" , NpcId = 2016, String = "Nahe der Stadt gibt es ein Monument der Elfen! Helft uns, Runenkrieger! Verstärkt von dort aus Gunthars Armee mit Bogenschützen! Nur so kann der nächste Angriff noch abgewendet werden!"},				
		},	
		[800] =
		{
			ExecuteCameraScript{Script = CameraMarciaEntryVI},	
		},			
		[870] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraMarciaEntryIX},			
			CutSceneSay {Tag = "cutjonirNW006" ,NpcId = 2017, String = "Bringt Eure Elfenschützen zum Pass! Positioniert sie auf den Wällen! Gemeinsam mit unseren Männern könnt Ihr die Untoten abwehren!"},				
		},
		[1000] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraMarciaEntryIV},
			CutSceneSay {Tag = "cutmaincharNW004" ,NpcId = 0, String = "Wenn ich eine ganze Armee aufhalten soll, dann brauche ich Eisen!"},												
		},	
		[1050] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "cutjonirNW007" ,NpcId = 2017, String = "Ich kann Euch nur das wenige geben, was wir noch auf Vorrat haben. Die Untoten haben die letzte Eisenlieferung abgefangen!"},				
		},				
		[1150] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraMarciaEntryX},				
			CutSceneSay {Tag = "cutmarciaNW005" , NpcId = 2016, String = "Sie haben ihre Beute allerdings nicht weit gebracht! Achtet auf die Karren voller Eisen in ihren Lagern! Ihr könnt Eure Vorräte dort aufstocken!"},				
		},	
		[1280] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraMarciaEntryII},			
			CutSceneSay {Tag = "cutjonirNW008" ,NpcId = 2017, String = "Und jetzt geht! Handelt rasch! Der Angriff wird bald beginnen!"},						
		},
		[1350] =
		{
			WaitForEndOfSpeech,			
			SetGlobalFlagTrue {Name = "MarciaJonirIdleOn"},
			SetNoFightFlagFalse {NpcId = 0},
			SetNoFightFlagFalse {NpcId = 2016},
			SetNoFightFlagFalse {NpcId = 2017},			
			RevealUnExplored {X = 353, Y = 452, Range = 10},	-- monument
			RevealUnExplored {X = 154, Y = 216, Range = 10},	-- armee	
			QuestSolve{QuestId = 126} , QuestBegin{QuestId = 116} , 
			QuestBegin{QuestId = 114} , QuestBegin{QuestId = 127},
			SetPlayerFlagTrue{Name = "Q124DwarfInfoGiven"},
			SetGlobalFlagTrue{Name ="Q116MoveOrderGunthram"},
			QuestBegin{QuestId = 468} , 
			TransferResource{Resource = GoodIron , Amount = 400 , Side = SideLight , Flag = Give},		
			EnableDialog {NpcId = 2016},	
			EnableDialog {NpcId = 2017},						
		},
	},
}