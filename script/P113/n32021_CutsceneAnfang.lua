-----------------------------------------------------------------------
--
--	Anfang
--
-----------------------------------------------------------------------

-- Anfangstotale Portal
CameraAnfangI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p113\\n6654_CameraAnfangI.lua")
   	Camera:ScriptStart()
]]

---- Feuerwände
CameraAnfangII = 
[[
 	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p113\\n6654_CameraAnfangII.lua")
   	Camera:ScriptStart()
]]

---- ueber lena und abgrund
CameraAnfangIII = 
[[
 	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p113\\n6654_CameraAnfangIII.lua")
   	Camera:ScriptStart()
]]

---- abgrund gegenschuss
CameraAnfangIV = 
[[
 	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p113\\n6654_CameraAnfangIV.lua")
   	Camera:ScriptStart()
]]

---- fial darg und cenwen
CameraAnfangV = 
[[
 	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p113\\n6654_CameraAnfangV.lua")
   	Camera:ScriptStart()
]]

---- sklaveneskorte
CameraAnfangVI = 
[[
 	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p113\\n6654_CameraAnfangVI.lua")
   	Camera:ScriptStart()
]]

---- einer der 4 bosse
CameraAnfangVII = 
[[
 	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p113\\n6654_CameraAnfangVII.lua")
   	Camera:ScriptStart()
]]

---- willit kommt an
CameraAnfangVIII = 
[[
 	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p113\\n6654_CameraAnfangVIII.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "Anfang", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		-- IsGlobalFlagTrue {Name = "Stopper"},
		-- startet direkt zu beginn der map.
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:
		SetGlobalFlagTrue {Name = "P113FialDargSpawnt"}, --Fial Darg spawnt		
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		[0] =
		{
			-- die ersten zwei sekunden ohne kamera:
			ExecuteCameraScript{Script = CameraAnfangI},
			Goto{X = 278, Y = 160, NpcId = 6654, WalkMode = Walk}, --lea	geht zum aussichtspunkt
			Goto{NpcId = 0, X = 276, Y = 160, WalkMode = Walk},		
			LookAtDirection {NpcId = 6673, Direction = SouthEast}, --cenwen schaut nach vorn			
		},
		[60] = 
		{
			SetGlobalFlagTrue {Name = "P113SpawnWillit"	}, --Willit spawnt abseits und kommt angelaufen	
		},
		[80] =
		{
			ExecuteCameraScript{Script = CameraAnfangIII},	
			RemoveDialog {NpcId = 6655},
			CutSceneSay {Tag = "cs20LenaP113_001" , NpcId = 6654, String = "Es ist soweit ... Von hier ab führt der Weg in die Tiefe ... irgendwo dort unten hält er Cenwen gefangen!"}	
		},
		[120] =
		{
			Goto {X = 282, Y = 158, NpcId = 6655, WalkMode = Run},			
		},
		[140] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraAnfangVIII},				
			CutSceneSay {Tag = "cs20WillitP113_001" , NpcId = 6655, String = "Lena! Lena!"},
		},			
		[170] =
		{
			WaitForEndOfSpeech,
			Goto {NpcId = 6654, X = 280, Y = 160, WalkMode = Run},
			CutSceneSay {Tag = "cs20LenaP113_002" , NpcId = 6654, String = "Willit? Ich dachte Du wärst tot!"},
		},	
		[200] =
		{
			WaitForEndOfSpeech,
				
			Goto {NpcId = 6954, X = 293, Y = 232, WalkMode = Walk},
			Goto {NpcId = 6957, X = 293, Y = 232, WalkMode = Walk},	
					
			Goto {NpcId = 6958, X = 294, Y = 230, WalkMode = Walk},
			Goto {NpcId = 6959, X = 294, Y = 230, WalkMode = Walk},
			Goto {NpcId = 6960, X = 294, Y = 230, WalkMode = Walk},
			Goto {NpcId = 6961, X = 294, Y = 230, WalkMode = Walk},
			Goto {NpcId = 6962, X = 294, Y = 230, WalkMode = Walk},
			Goto {NpcId = 6963, X = 294, Y = 230, WalkMode = Walk},
			
			Goto {NpcId = 6955, X = 296, Y = 228, WalkMode = Walk},
			Goto {NpcId = 6956, X = 296, Y = 228, WalkMode = Walk},																					
						
			CutSceneSay {Tag = "cs20WillitP113_002" , NpcId = 6655, String = "Oh nein! Feuerleute Willit gefangen nehmen und hierher schleifen!"},
		},	
		[210] =
		{
			ExecuteCameraScript{Script = CameraAnfangVI},		
		},
		[250] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "cs20WillitP113_003" , NpcId = 6655, String = "Aber Willit geflohen und versteckt!"},
		},	
		[280] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraAnfangV},	
			
			Goto {NpcId = 6964, X = 162, Y = 219, WalkMode = Run},	
			Goto {NpcId = 6626, X = 149, Y = 229, WalkMode = Walk},	-- fial geht zu cenwen					

			CutSceneSay {Tag = "cs20WillitP113_004" , NpcId = 6655, String = "Dunkelmann großen Zauber vorbereitet! Viele Sklaven arbeiten!"},
		},	
		[285] =
		{
			Goto {NpcId = 6965, X = 162, Y = 220, WalkMode = Run},				
		},
		[290] =
		{
			Goto {NpcId = 6966, X = 162, Y = 221, WalkMode = Run},			
		},
		[295] =
		{
			Goto {NpcId = 6967, X = 162, Y = 222, WalkMode = Run},			
		},
		[350] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "cs20LenaP113_003" , NpcId = 6654, String = "Wir müssen uns beeilen!"},
		},	
		[380] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraAnfangII},	
			CutSceneSay {Tag = "cs20WillitP113_005" , NpcId = 6655, String = "Wartet! Ihr nicht kommen dorthin! Große Wände aus Feuer im Weg!"},
		},
		[420] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "cs20WillitP113_006" , NpcId = 6655, String = "Geisterfeuer sie es nennen!"},
		},	
		[470] =
		{
			WaitForEndOfSpeech,
			CutSceneSay {Tag = "cs20LenaP113_004" , NpcId = 6654, String = "Geisterfeuer... es brennt heißer als jede Flamme! Dort gibt es kein Durchkommen!"},
		},	
		[520] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraAnfangIV},	
			LookAtDirection {NpcId = 6672, Direction = North},			
			CutSceneSay {Tag = "cs20LenaP113_005" , NpcId = 6654, String = "Geisterfeuer wird durch die Lebenskraft mächtiger Wesen genährt. Willit, versuche dich zu erinnern! Weißt du, an welche Seelen die Feuer gebunden sind?"},
		},	
		[590] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraAnfangVII},				
			CutSceneSay {Tag = "cs20WillitP113_007" , NpcId = 6655, String = "Hm, Ahrr, Grorr, Koliprag, Flammagor! Sie Wächter über den Abgrund! Dunkelmann macht Ritual mit Ihnen!"},
		},	
		[650] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraAnfangI},				
			CutSceneSay {Tag = "cs20LenaP113_006" , NpcId = 6654, String = "Das muss es sein! Jede der vier Kreaturen hält eines der Feuer am Leben! Wir müssen sie vernichten!"},
		},																								
		[720] = 
		{
			WaitForEndOfSpeech,	
			
			
			QuestBegin {QuestId = 626, SubQuestActivate = FALSE}, --Q Die gefangene Elfe
			QuestBegin {QuestId = 697, SubQuestActivate = FALSE}, --Q Befreie Cenwen
			SetGlobalFlagTrue {Name = "CutAnfangGelaufen"},
			RevealUnExplored{X = 442, Y = 287, Range = 7}, --Monumente werden aufgedeckt
			RevealUnExplored{X = 96, Y = 368, Range = 7},
			SetGlobalFlagTrue{Name = "P113LeaFolgtAvatar"},
			SetGlobalFlagTrue{Name = "P113DialogWillitAn"},
			SetGlobalFlagTrue{Name = "P113WillitFolgtAvatar"},
			QuestBegin {QuestId = 622, SubQuestActivate = FALSE}, --Die Feuerwände
			QuestBegin{QuestId = 625, SubQuestActivate = FALSE}, --Subquesten: Q Boss1-4
			QuestBegin{QuestId = 628, SubQuestActivate = FALSE},
			QuestBegin{QuestId = 629, SubQuestActivate = FALSE},
			QuestBegin{QuestId = 630, SubQuestActivate = FALSE},
			EnableDialog {NpcId = 6655},
			SetGlobalFlagTrue {Name = "FialDespawn"},
						
		},
	},
}
