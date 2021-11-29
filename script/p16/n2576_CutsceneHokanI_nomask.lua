-----------------------------------------------------------------------
--
--	Hokan 1st time no mask
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
	Name = "HokanI_nomask", CameraScript = "", PlayOnlyOnce = TRUE,
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		FigureInRange { X = 405, Y = 415, Range = 10, NpcId = 0,  UpdateInterval = 5},
		ODER 
			(
				Negated (PlayerHasItem {ItemId = 2337, Amount = 1, UpdateInterval = 15}),
				Negated (PlayerHasItem {ItemId = 2615, Amount = 1, UpdateInterval = 15})
			),
		Negated(QuestState{QuestId = 210 , State = StateSolved}),		
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
			LookAtFigure{NpcId = 2576, Target = 0},		
		},
		[20] =
		{
			ExecuteCameraScript{Script = CameraHokanII},
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
			CutSceneSay {Tag = "cuthokanWhis001", NpcId = 2576, String = "Ein Runensklave? Also seid Ihr es, der meine Heere vernichtet?"},
		},
		[210] = 
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraHokanIV},						
			CutSceneSay {Tag = "cutmaincharWhis001", NpcId = 0, String = "Ich bin nicht gekommen, um gegen Euch zu kämpfen, Hokan Ashir. In Eurem Vermächtnis schlummert ein Geheimnis! Ein Geheimnis von großem Wert! Das Schicksal der Völker hängt von ihm ab!"},
		},
		[320] = 
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraHokanIII},						
			CutSceneSay {Tag = "cuthokanWhis002", NpcId = 2576, String = "Ha! Was habe ich schon mit Euren Völkern zu schaffen, Sklave?"},
		},
		[360] = 
		{
			WaitForEndOfSpeech,			
			CutSceneSay {Tag = "cuthokanWhis003", NpcId = 2576, String = "Ich begehre nur eins! Die Maske! Die Maske des Belial! Der Schmerz ist unerträglich ohne sie! Alles andere hat keine Bedeutung für mich!"},
		},
		[440] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraHokanI},					
			CutSceneSay {Tag = "cuthokanWhis004", NpcId = 2576, String = "Bringt mir die Maske! Beschafft mir ihre Teile... Sklave!"},
			QuestSolve{QuestId = 244},
			QuestBegin{QuestId = 245},
--			QuestBegin{QuestId = 211},
			QuestBegin{QuestId = 559},
			SetGlobalFlagTrue{Name = "Q210HokanWantsMask"},
 	
		},
		[490] = 
		{
			WaitForEndOfSpeech,		
			-- Goto {NpcId = 0, X = 401, Y = 417, WalkMode = Walk},
			SetGlobalFlagTrue {Name = "AlreadyBeenThere2"},		
			SetGlobalTimeStamp {Name = "CutsceneHokanEnd"},	
			SetNoFightFlagFalse {NpcId = 0},	
			SetNoFightFlagFalse {NpcId = 2576},															
		},
	},
}

