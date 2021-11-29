-----------------------------------------------------------------------
--
--	Hokan 2nd time no mask
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
	Name = "HokanII_nomask", CameraScript = "", PlayOnlyOnce = TRUE,
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		FigureInRange { X = 405, Y = 415, Range = 10, NpcId = 0,  UpdateInterval = 5},
		ODER
		(
			Negated (PlayerHasItem {ItemId = 2337, Amount = 1}),
			Negated (PlayerHasItem {ItemId = 2615, Amount = 1})
		),
		Negated(QuestState{QuestId = 210 , State = StateSolved}),			
		IsGlobalFlagTrue {Name = "AlreadyBeenThere2",  UpdateInterval = 5},		
		IsGlobalTimeElapsed {Name = "CutsceneHokanEnd", Seconds = 120, UpdateInterval = 30 },		
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:
		SetNoFightFlagTrue {NpcId = 0},	
		SetNoFightFlagTrue {NpcId = 2576},			
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll: 401 417
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
			CutSceneSay {Tag = "cuthokanWhis005", NpcId = 2576, String = "Habt Ihr sie? Ah, ich spüre Euer Versagen! Ohne die Maske wird es keine Rettung für Eure Völker geben!"},
		},
		[210] = 
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraHokanIII},	
			LookAtFigure{NpcId = 0, Target = 2576},		
			LookAtFigure{NpcId = 2576, Target = 0},											
			CutSceneSay {Tag = "cuthokanWhis006", NpcId = 2576, String = "Geht! Sucht die Teile der Maske!"},
		},
		[260] = 
		{
			WaitForEndOfSpeech,	
			-- Goto {NpcId = 0, X = 401, Y = 417, WalkMode = Walk},
			SetNoFightFlagFalse {NpcId = 0},	
			SetNoFightFlagFalse {NpcId = 2576},												
		},
	},
}

