-----------------------------------------------------------------------
--
--	FireCityEntry
--
-----------------------------------------------------------------------

CameraEntryI =
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p110\\n6046_CameraEntryI.lua")
   	Camera:ScriptStart()
]]

CameraEntryII =
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p110\\n6046_CameraEntryII.lua")
   	Camera:ScriptStart()
]]

-- fire city totale
CameraEntryIII =
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p110\\n6046_CameraEntryIII.lua")
   	Camera:ScriptStart()
]]

-- testtotale meeting point
CameraEntryIV =
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p110\\n6046_CameraEntryIV.lua")
   	Camera:ScriptStart()
]]

-- fahrt rueckwaerts - die armee erscheint
CameraEntryV =
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p110\\n6046_CameraEntryV.lua")
   	Camera:ScriptStart()
]]

-- gegenschuss tief mit leichter fahrt auf craigh
CameraEntryVI =
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p110\\n6046_CameraEntryVI.lua")
   	Camera:ScriptStart()
]]

-- craigh nah
CameraEntryVII =
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p110\\n6046_CameraEntryVII.lua")
   	Camera:ScriptStart()
]]

-- avatar nah
CameraEntryVIII =
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p110\\n6046_CameraEntryVIII.lua")
   	Camera:ScriptStart()
]]

-- craigh und armee abschreitend
CameraEntryIX =
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p110\\n6046_CameraEntryIX.lua")
   	Camera:ScriptStart()
]]

-- craigh und armee abschreitend
CameraEntryX =
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p110\\n6046_CameraEntryX.lua")
   	Camera:ScriptStart()
]]

-- fire city 2
CameraEntryXI =
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p110\\n6046_CameraEntryXI.lua")
   	Camera:ScriptStart()
]]

-- fire city 3
CameraEntryXII =
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p110\\n6046_CameraEntryXII.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "FireCityEntry", CameraScript = "", PlayOnlyOnce = TRUE,
	BeginConditions =
	{
		-- startet direkt zu beginn der map.
		-- IsGlobalFlagTrue {Name = "Stopper"},	
		QuestState {QuestId = 692, State = StateActive}, 
		
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:
		SetNoFightFlagTrue {NpcId = 0},
		SetNoFightFlagTrue {NpcId = 6046}, -- craigh
		SetNoFightFlagTrue {NpcId = 6738}, -- lena	
		RemoveDialog {NpcId = 6046},
	},
	TimedActions =
	{
		[0]  =
		{
		},
		[20] =
		{
			ExecuteCameraScript{Script = CameraEntryII},	
			Goto {NpcId = 0,    X = 59, Y = 368, WalkMode = Run}, -- avatar	
		},	
		[30] =
		{
			Goto {NpcId = 6738, X = 61, Y = 368, WalkMode = Run}, -- lena			
		},
		[50] =
		{
			ExecuteCameraScript{Script = CameraEntryIII},	-- fire city totale			
			CutSceneSay {Tag = "cs16LenaP110_001" , NpcId = 6738, String = "Shal'Dun! Die brennende Stadt! Wir sind am Ziel!"},
		},
		[80] =
		{
			ExecuteCameraScript {Script = CameraEntryXI}, 			
		},
		[110] =
		{
			ExecuteCameraScript {Script = CameraEntryXII}, 
	--Erste Reihe
			Goto { X = 59 , Y = 363, NpcId = 6046 , Range = 0 , WalkMode = Run , GotoMode = GotoForced , XRand = 0 , YRand = 0}, -- craigh
			--Goto { X = 59 , Y = 366, NpcId = 6046 , Range = 0 , WalkMode = Run , GotoMode = GotoForced , XRand = 0 , YRand = 0}, -- craigh			
			Goto { X = 57 , Y = 363, NpcId = 5994 , Range = 0 , WalkMode = Run , GotoMode = GotoForced , XRand = 0 , YRand = 0},
			Goto { X = 57 , Y = 361, NpcId = 5995 , Range = 0 , WalkMode = Run , GotoMode = GotoForced , XRand = 0 , YRand = 0},
			Goto { X = 59 , Y = 361, NpcId = 5996 , Range = 0 , WalkMode = Run , GotoMode = GotoForced , XRand = 0 , YRand = 0},
		
			Goto { X = 63 , Y = 361, NpcId = 6020 , Range = 0 , WalkMode = Run , GotoMode = GotoForced , XRand = 0 , YRand = 0},
			Goto { X = 65 , Y = 361, NpcId = 6029 , Range = 0 , WalkMode = Run , GotoMode = GotoForced , XRand = 0 , YRand = 0},
			Goto { X = 67 , Y = 361, NpcId = 6034 , Range = 0 , WalkMode = Run , GotoMode = GotoForced , XRand = 0 , YRand = 0},
		
			Goto { X = 53 , Y = 361, NpcId = 6005 , Range = 0 , WalkMode = Run , GotoMode = GotoForced , XRand = 0 , YRand = 0},
			Goto { X = 51 , Y = 361, NpcId = 6006 , Range = 0 , WalkMode = Run , GotoMode = GotoForced , XRand = 0 , YRand = 0},
			Goto { X = 49 , Y = 361, NpcId = 6015 , Range = 0 , WalkMode = Run , GotoMode = GotoForced , XRand = 0 , YRand = 0},
	--Zweite Reihe		
			Goto { X = 67 , Y = 359, NpcId = 6033 , Range = 0 , WalkMode = Run , GotoMode = GotoForced , XRand = 0 , YRand = 0},
			Goto { X = 65 , Y = 359, NpcId = 6028 , Range = 0 , WalkMode = Run , GotoMode = GotoForced , XRand = 0 , YRand = 0},
			Goto { X = 63 , Y = 359, NpcId = 6021 , Range = 0 , WalkMode = Run , GotoMode = GotoForced , XRand = 0 , YRand = 0},
			
			
			Goto { X = 53 , Y = 359, NpcId = 6004 , Range = 0 , WalkMode = Run , GotoMode = GotoForced , XRand = 0 , YRand = 0},
			Goto { X = 51 , Y = 359, NpcId = 6007 , Range = 0 , WalkMode = Run , GotoMode = GotoForced , XRand = 0 , YRand = 0},
			Goto { X = 49 , Y = 359, NpcId = 6014 , Range = 0 , WalkMode = Run , GotoMode = GotoForced , XRand = 0 , YRand = 0},
	--Dritte Reihe
			Goto { X = 67 , Y = 357, NpcId = 6032 , Range = 0 , WalkMode = Run , GotoMode = GotoForced , XRand = 0 , YRand = 0},
			Goto { X = 49 , Y = 357, NpcId = 6013 , Range = 0 , WalkMode = Run , GotoMode = GotoForced , XRand = 0 , YRand = 0},	
		},
		[160] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraEntryV},				
			CutSceneSay {Tag = "cs16MainCharP110_001" , NpcId = 0, String = "Und am Ende unseres Weges ..."},
		},
		[270] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraEntryVI},			
			CutSceneSay {Tag = "cs16MainCharP110_002" , NpcId = 0, String = "Warum zögert Ihr, Dunkelelf?"},
		},
		[300] =
		{
			WaitForEndOfSpeech,		
			Goto { X = 59, Y = 365, NpcId = 6046 ,WalkMode = Walk}, -- craigh			
			CutSceneSay {Tag = "cs16CraighP110_001" , NpcId = 6046, String = "Ich bin nicht hier, um Euch aufzuhalten, Mensch. Der Plan meines Herrn darf nicht gelingen!"},
		},
		[340] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraEntryVIII},						
			CutSceneSay {Tag = "cs16MainCharP110_003" , NpcId = 0, String = "Will Euer Herr nicht die dunklen Götter in die Welt zurückholen? Ist dies nicht Euer Wunsch?"},
		},
		[380] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraEntryVII},						
			CutSceneSay {Tag = "cs16CraighP110_002" , NpcId = 6046, String = "Dies ist der Wunsch der Priester und Archonen! Ich bin Soldat. Und als Soldat muss ich mein Volk schützen. Manchmal auch vor sich selbst."},
		},	
		[440] =
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraEntryX},					
			Goto {NpcId = 6738, X = 62, Y = 366, WalkMode = Walk},
			CutSceneSay {Tag = "cs16LenaP110_002" , NpcId = 6738, String = "Und der Winter, den der Drache bringt, wird Euer Volk ebenso töten."}, -- lena
		},	
		[470] =
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraEntryVII},						
			CutSceneSay {Tag = "cs16CraighP110_003" , NpcId = 6046, String = "Deshalb ... wenn mein Volk leben soll ... müsst Ihr siegen!"},
		},	
		[500] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "cs16CraighP110_004" , NpcId = 6046, String = "Mir bleibt nur eine Wahl ..."},
		},	
		[530] =
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "cs16CraighP110_005" , NpcId = 6046, String = "Ich übergebe Euch die Sternengarde, das Heer der Sternenstadt. Sie ist mir treu ergeben."},
		},	
		[570] =
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraEntryIX},
			Goto {NpcId = 6046, X = 52, Y = 365, WalkMode = Walk},								
			CutSceneSay {Tag = "cs16CraighP110_006" , NpcId = 6046, String = "Nutzt sie zu Eurem Schutz. Beeilt Euch, eine Verteidigung zu errichten, die anderen Heere werden bald hier sein."},
		},	
		[620] =
		{
			WaitForEndOfSpeech,	
			Goto {NpcId = 6046, X = 57, Y = 367, WalkMode = Walk},	
			CutSceneSay {Tag = "cs16CraighP110_007" , NpcId = 6046, String = "Ihr müsst zuerst die Schlüssel der drei Städte erlangen, um zum Vulkan vorzudringen. Aber ruft zuvor Eure Armeen und lasst uns danach weiterreden."},
		},	
		[670] =
		{
			WaitForEndOfSpeech,
			SetNoFightFlagFalse {NpcId = 0},
			SetNoFightFlagFalse {NpcId = 6046}, -- craigh
			SetNoFightFlagFalse {NpcId = 6738}, -- lena		
			QuestSolve{QuestId = 692},
			QuestSolve{QuestId = 688},
			QuestBegin{QuestId = 615},
			QuestBegin{QuestId = 616},
			QuestBegin{QuestId = 617},
			QuestBegin{QuestId = 618},
			QuestBegin{QuestId = 619},	
			SetGlobalFlagTrue{Name = "LeaFollowP110"},	
			SetGlobalFlagTrue{Name = "EndCutsceneEntryP110"},
			EnableDialog {NpcId = 6046},								
		},																								
	},
}





