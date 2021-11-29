-----------------------------------------------------------------------
--
--	Cutscene Hokan 2nd time mask
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
	Name = "HokanII_mask", CameraScript = "", PlayOnlyOnce = TRUE,
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		FigureInRange { X = 405, Y = 415, Range = 10, NpcId = 0,  UpdateInterval = 5},
		PlayerHasItem {ItemId = 2337, Amount = 1},
		PlayerHasItem {ItemId = 2615, Amount = 1},	
		Negated(QuestState{QuestId = 210 , State = StateSolved}),
		QuestState{QuestId = 218 , State = StateActive},	
		IsGlobalFlagTrue {Name = "AlreadyBeenThere2",  UpdateInterval = 5},	
	--IsGlobalTimeElapsed {Name = "CutsceneHokanEnd", Seconds = 90, UpdateInterval = 30 },	
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
			ExecuteCameraScript{Script = CameraHokanII},	
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
			ExecuteCameraScript{Script = CameraHokanI},			
			CutSceneSay {Tag = "cuthokanWhis017", NpcId = 2576, String = "Habt Ihr die Maske? Ah, ich spüre bereits ihre Macht. Oh kostbarstes Kleinod! Gebt sie mir! Schnell!"},
		},
		[220] = 
		{
			WaitForEndOfSpeech,						
			CutSceneSay {Tag = "cutmaincharWhis009",NpcId = 0, String = "Erst, wenn Ihr Euren Teil der Abmachung erfüllt habt!"},
		},
		[250] = 
		{ 
			WaitForEndOfSpeech,					
			CutSceneSay {Tag = "cutmaincharWhis010",NpcId = 0, String = "Ein Magier des Zirkels ..."},
		},
		[290] = 
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraHokanIII},								
			CutSceneSay {Tag = "cuthokanWhis018",NpcId = 2576, String = "Ich weiß! Ein Bruder des Zirkels kam zu meiner Gruft! Er verspottete mich und stahl das Geheimnis meiner Rächer!"},
		},
		[360] = 
		{ 
			WaitForEndOfSpeech,					
			CutSceneSay {Tag = "cutmaincharWhis011", NpcId = 0, String = "Die Eisernen! Wie kann man sie besiegen?"},
		},
		[400] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraHokanI},								
			CutSceneSay {Tag = "cuthokanWhis019", NpcId = 2576, String = "Indem Ihr den Seelenschmied tötet! Er ist das mächtigste Wesen, das ich je erschuf! Er schmiedet die Eisernen aus den Seelen Gepeinigter an einer finsteren Esse."},
		},
		[470] = 
		{
			WaitForEndOfSpeech,					
			CutSceneSay {Tag = "cuthokanWhis020", NpcId = 2576, String = "Vernichtet den Seelenschmied und Ihr vernichtet die Eisernen!"},
		},
		[510] = 
		{ 
			WaitForEndOfSpeech,					
			CutSceneSay {Tag = "cuthokanWhis021", NpcId = 2576, String = "Jedoch... mein Zirkelbruder wird das zu verhindern wissen!"},
		},
		[560] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraHokanIV},							
			CutSceneSay {Tag = "cutmaincharWhis012", NpcId = 0, String = "Gibt es eine Möglichkeit, einen Zirkelmagier aufzuhalten? Ich hörte von einem Artefakt..."},
		},
		[640] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraHokanIII},							
			CutSceneSay {Tag = "cuthokanWhis022",NpcId = 2576, String = "Ihr sprecht vom Phönixstein! In seinem Inneren schläft die Macht des Allfeuers selbst! Fürwahr, dies ist die einzige Kraft, die der eines Zirkelmagiers gleichkommt..."},
		},
		[740] = 
		{ 
			WaitForEndOfSpeech,					
			CutSceneSay {Tag = "cutmaincharWhis013",NpcId = 0, String = "Wo finde ich diesen Phönixstein?"},
		},
		[780] = 
		{
			WaitForEndOfSpeech,					
			CutSceneSay {Tag = "cuthokanWhis023",NpcId = 2576, String = "Bevor der Krieg ausbrach, lagerte er wohl verwahrt in den Archiven von Mulandir! Ich würde meine Suche dort beginnen."},
		},
		[860] = 
		{ 
			WaitForEndOfSpeech,			
			ExecuteCameraScript{Script = CameraHokanI},						
			CutSceneSay {Tag = "cuthokanWhis024",NpcId = 2576, String = "Und jetzt - gebt mir die Maske! Legt sie auf das Grabmahl, schnell!"},
		},
		[910] = 
		{
			WaitForEndOfSpeech,					
			CutSceneSay {Tag = "cuthokanWhis025", NpcId = 2576, String = "Endlich! Es ist vorbei!"},
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
		},
		[980] = 
		{
			WaitForEndOfSpeech,		
			SetEffect {Effect = "DeMaterialize", NpcId = 2576, Length = 4000},	-- hokan disappears.	
		},
		[1020] =
		{
			WaitForEndOfSpeech,
			Vanish {NpcId = 2576},
			SetNoFightFlagFalse {NpcId = 0},
		},
	},
}

