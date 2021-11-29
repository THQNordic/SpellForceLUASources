-----------------------------------------------------------------------
--
--	Cutscene Hokan 1st time mask
--
-----------------------------------------------------------------------

-- totale
CameraHokanI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p16\\n2576_CameraHokanI.lua")
   	Camera:ScriptStart()
]]

-- parallelfahrt treppe
CameraHokanII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p16\\n2576_CameraHokanII.lua")
   	Camera:ScriptStart()
]]

-- hokan halbnah
CameraHokanIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,25,1,"script\\p16\\n2576_CameraHokanIII.lua")
   	Camera:ScriptStart()
]]

-- avatar halbnah
CameraHokanIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,25,1,"script\\p16\\n2576_CameraHokanIV.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "HokanI_mask", CameraScript = "", PlayOnlyOnce = TRUE,
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		FigureInRange { X = 405, Y = 415, Range = 10, NpcId = 0, UpdateInterval = 5},
		PlayerHasItem {ItemId = 2337, Amount = 1},
		PlayerHasItem {ItemId = 2615, Amount = 1},	
		Negated(QuestState{QuestId = 210 , State = StateSolved}),
		QuestState{QuestId = 218 , State = StateActive},	
		IsGlobalFlagFalse {Name = "AlreadyBeenThere2",  UpdateInterval = 5},		
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:	
		SetNoFightFlagTrue {NpcId = 0},	
		SetNoFightFlagTrue {NpcId = 2576},				
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
			ExecuteCameraScript {Script = CameraHokanII},	
			LookAtFigure{NpcId = 0, Target = 2576},		
			LookAtFigure{NpcId = 2576, Target = 0},		
			Goto {NpcId = 0, X = 401, Y = 417, WalkMode = Run},							
		},	
		[50] =
		{
			LookAtFigure{NpcId = 0, Target = 2576},		
			LookAtFigure{NpcId = 2576, Target = 0},					
			Goto {NpcId = 0, X = 392, Y = 416, WalkMode = Walk},				
		},			
		[140] = 
		{ 
			LookAtFigure{NpcId = 0, Target = 2576},		
			LookAtFigure{NpcId = 2576, Target = 0},				
			ExecuteCameraScript{Script = CameraHokanIII},	
			CutSceneSay {Tag = "cuthokanWhis007", NpcId = 2576, String = "Ein Runensklave? Dann seid Ihr es, der meine Heere vernichtet?"},						
		},
		[180] = 
		{
			WaitForEndOfSpeech,
			ExecuteCameraScript{Script = CameraHokanIV},								
			CutSceneSay {Tag = "cutmaincharWhis002", NpcId = 0, String = "Ich brauche Eure Hilfe! Nur Euer Wissen kann die Völker des Nordens retten!"},
		},
		[240] = 
		{ 
			WaitForEndOfSpeech,				
			CutSceneSay {Tag = "cutmaincharWhis003",NpcId = 0, String = "Ich biete Euch die Maske des Belial im Tausch für Euer Wissen!"},
		},
		[290] = 
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraHokanIII},							
			CutSceneSay {Tag = "cuthokanWhis008",NpcId = 2576, String = "Die Maske! Endlich! Gib sie mir!"},
		},
		[320] = 
		{ 
			WaitForEndOfSpeech,				
			CutSceneSay {Tag = "cutmaincharWhis004",NpcId = 0, String = "Erst, wenn Ihr Euren Teil der Abmachung erfüllt habt!"},
		},
		[370] = 
		{
			WaitForEndOfSpeech,				
			CutSceneSay {Tag = "cutmaincharWhis005", NpcId = 0, String = "Ein Magier des Zirkels..."},
		},
		[390] = 
		{ 
			WaitForEndOfSpeech,				
			CutSceneSay {Tag = "cuthokanWhis009", NpcId = 2576, String = "Ich weiß! Ein Bruder des Zirkels kam zu meiner Gruft! Er verspottete mich und stahl das Geheimnis meiner Rächer!"},
		},
		[470] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraHokanIV},						
			CutSceneSay {Tag = "cutmaincharWhis006", NpcId = 0, String = "Die Eisernen! Wie kann man sie besiegen?"},
		},
		[510] = 
		{
			WaitForEndOfSpeech,				
			CutSceneSay {Tag = "cuthokanWhis010", NpcId = 2576, String = "Indem Ihr den Seelenschmied tötet! Er ist das mächtigste Wesen, das ich je erschuf! Er schmiedet die Eisernen aus den Seelen Gepeinigter an einer finsteren Esse!"},
		},
		[590] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraHokanIII},						
			CutSceneSay {Tag = "cuthokanWhis011", NpcId = 2576, String = "Vernichtet den Seelenschmied und Ihr vernichtet die Eisernen!"},
		},
		[670] = 
		{ 
			WaitForEndOfSpeech,				
			CutSceneSay {Tag = "cuthokanWhis012",NpcId = 2576, String = "Jedoch...  mein Zirkelbruder wird das zu verhindern wissen!"},
		},
		[710] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraHokanIV},						
			CutSceneSay {Tag = "cutmaincharWhis007", NpcId = 0, String = "Gibt es eine Möglichkeit, einen Zirkelmagier aufhalten? Ich hörte von einem Artefakt..."},
		},
		[770] = 
		{ 
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraHokanIII},						
			CutSceneSay {Tag = "cuthokanWhis013", NpcId = 2576, String = "Ihr sprecht vom Phönixstein! In seinem Inneren schläft die Macht des Allfeuers selbst! Fürwahr, dies ist die einzige Kraft, die der eines Zirkelmagiers gleichkommt..."},
		},
		[870] = 
		{ 
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraHokanI},						
			CutSceneSay {Tag = "cutmaincharWhis008", NpcId = 0, String = "Wo finde ich diesen Phönixstein?"},
		},
		[890] = 
		{
			WaitForEndOfSpeech,		
			CutSceneSay {Tag = "cuthokanWhis014", NpcId = 2576, String = "Bevor der Krieg ausbrach, lagerte er wohl verwahrt in den Archiven von Mulandir! Ich würde meine Suche dort beginnen."},
		},
		[960] = 
		{ 
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraHokanIII},							
			CutSceneSay {Tag = "cuthokanWhis015", NpcId = 2576, String = "Und jetzt -  gebt mir die Maske! Legt sie auf das Grabmahl, schnell!"},
		},
		[1010] = 
		{
			WaitForEndOfSpeech,				
			CutSceneSay {Tag = "cuthokanWhis016", NpcId = 2576, String = "Endlich! Es ist vorbei!"},
			SetGlobalFlagTrue{Name = "WhisperGateHokanOpen"},
			QuestSolve{QuestId = 244},
			QuestSolve{QuestId = 245},
			QuestSolve{QuestId = 242},
			QuestBegin{QuestId = 265},
			QuestBegin{QuestId = 318},
			QuestBegin{QuestId = 552},
			TransferItem {TakeItem = 2337, Amount = 1 , Flag = Take},
			TransferItem {TakeItem = 2615, Amount = 1 , Flag = Take},
			QuestSolve{QuestId = 218},
			QuestSolve{QuestId = 210},
			SetRewardFlagTrue{ Name = "FluesterndeStadt5Maske"},
			SetEffect {Effect = "DeMaterialize", NpcId = 2576, Length = 4000},	-- hokan disappears.	
		},
		[1050] =
		{
			WaitForEndOfSpeech,	
			SetGlobalFlagTrue {Name = "AlreadyBeenThere2"},
			SetGlobalTimeStamp {Name = "CutsceneHokanEnd"},	
			SetNoFightFlagFalse {NpcId = 0},	
			Vanish {NpcId = 2576},
		},
	},
}

