-----------------------------------------------------------------------
--
--	Tree Attack
--
-----------------------------------------------------------------------

-- totale
CameraTreeAttackI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,50,1,"script\\p30\\n4177_CameraTreeAttackI.lua")
   	Camera:ScriptStart()
]]

-- tree kommt an
CameraTreeAttackII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,25,1,"script\\p30\\n4177_CameraTreeAttackII.lua")
   	Camera:ScriptStart()
]]

-- tree kaempft gegen blades und turm
CameraTreeAttackIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,25,1,"script\\p30\\n4177_CameraTreeAttackIII.lua")
   	Camera:ScriptStart()
]]

-- gespraech fall
CameraTreeAttackIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p30\\n4177_CameraTreeAttackIV.lua")
   	Camera:ScriptStart()
]]

-- altar
CameraTreeAttackV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p30\\n4177_CameraTreeAttackV.lua")
   	Camera:ScriptStart()
]]

-- tree nah
CameraTreeAttackVI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,10,1,"script\\p30\\n4177_CameraTreeAttackVI.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "Tree Attack", CameraScript = "", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		--ODER
		--(
		--	ODER
		--	(
		--		ODER
		--		(
		--			FigureInRange {NpcId = 0, X = 318, Y = 276, Range = 5,  UpdateInterval = 5},
		--			FigureInRange {NpcId = 0, X = 311, Y = 222, Range = 7,  UpdateInterval = 5}
		--		),
		--		FigureInRange {NpcId = 0, X = 259, Y = 212, Range = 7, UpdateInterval = 5}
		--	),
		--	FigureInRange {NpcId = 0, X = 284, Y = 276, Range = 12, UpdateInterval = 5}
		--),	
		FigureInRange {NpcId = 0, X = 359, Y = 249, Range = 10, UpdateInterval = 5},	
	},
	BeginActions =
	{
		-- actions zu beginn der cutscene:
		SetGlobalFlagFalse {Name = "TreeIdleOn"},	
		SetNoFightFlagTrue {NpcId = 0},		
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
			ExecuteCameraScript{Script = CameraTreeAttackII},
			ChangeRace {NpcId = 4177, Race = 148},				
			Goto {NpcId = 4177, X = 334, Y = 252, WalkMode = Run, GotoMode = GotoForced},	-- tree
		},
		[80] =
		{
			Goto {NpcId = 4177, X = 327, Y = 247, WalkMode = Run, GotoMode = GotoForced},	-- tree			
		},
		[200] =
		{
			ExecuteCameraScript{Script = CameraTreeAttackIII},
			Goto {NpcId = 0, X = 332, Y = 247, WalkMode = Run, GotoMode = GotoForced},		-- avatar									
		},
		[250] =
		{
			ExecuteCameraScript{Script = CameraTreeAttackVI},		
		},
		[300] =
		{
			-- nach zerstoerung des turms:
			ExecuteCameraScript{Script = CameraTreeAttackII},
			Goto {NpcId = 4177, X = 327, Y = 247, WalkMode = Run},	-- tree
			LookAtFigure {NpcId = 0, Target = 4177},
			LookAtFigure {NpcId = 4177, Target = 0},
		},
		[340] =
		{
			LookAtFigure {NpcId = 0, Target = 4177},
			LookAtFigure {NpcId = 4177, Target = 0},
			CutSceneSay {Tag = "cuttreeBreathF001" , NpcId = 4177, String = "Ooh! Kreaturen aus Stahl! Bauen schreckliche Türme in meinem Wald! Ooh!"},	-- Blutesche	
		},
		[380] = 
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraTreeAttackIII},					
			LookAtFigure {NpcId = 0, Target = 4177},
			LookAtFigure {NpcId = 4177, Target = 0},			
			CutSceneSay {Tag = "cuttreeBreathF002" , NpcId = 4177, String = "Ich würde sie alle zerschmettern... Doch ich muss es bewachen... Ooh!"},
		},
		[420] = 
		{
			WaitForEndOfSpeech,		
			ExecuteCameraScript{Script = CameraTreeAttackVI},--IV
			LookAtFigure {NpcId = 0, Target = 4177},
			LookAtFigure {NpcId = 4177, Target = 0},					
			CutSceneSay {Tag = "cutmaincharBreathF001" , NpcId = 0, String = "Worüber wacht Ihr, Herr des Waldes?"},	-- Avatar
	 	},
		[450] = 
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraTreeAttackV},					
			CutSceneSay {Tag = "cuttreeBreathF003" , NpcId = 4177, String = "Mein Kleinod! Das Herz des Waldes! Mein... Besitz! Es gehört... mir..."},
		},
		[510] = 
		{
			WaitForEndOfSpeech,	
			ExecuteCameraScript{Script = CameraTreeAttackIV},				
			CutSceneSay {Tag = "cuttreeBreathF004" , NpcId = 4177, String = "Ich muss es behüten... beschützen... Ohh!"},
		},
		[560] =
		{
			WaitForEndOfSpeech,
			-- rueckkehr zum altar automatisch durch idlegohome...
			SetGlobalFlagTrue {Name = "TreeIdleOn"},			
			ChangeRace {NpcId = 4177, Race = 152},	-- tree neutral.
			SetNoFightFlagFalse {NpcId = 0},								
		},
	},
}

