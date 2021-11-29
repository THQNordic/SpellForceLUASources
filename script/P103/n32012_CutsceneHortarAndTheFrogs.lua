-----------------------------------------------------------------------
--
--	HortarAndTheFrogs
--
-----------------------------------------------------------------------

-- totale
CameraHortarAndTheFrogsI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,15,1,"script\\p103\\n5640_CameraHortarAndTheFrogsI.lua")
   	Camera:ScriptStart()
]]

-- hortar lift hoch
CameraHortarAndTheFrogsII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p103\\n5640_CameraHortarAndTheFrogsII.lua")
   	Camera:ScriptStart()
]]

-- gegenschuss ausbruch
CameraHortarAndTheFrogsIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,30,1,"script\\p103\\n5640_CameraHortarAndTheFrogsIII.lua")
   	Camera:ScriptStart()
]]

-- komplette rundfahrt
CameraHortarAndTheFrogsIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,45,1,"script\\p103\\n5640_CameraHortarAndTheFrogsIV.lua")
   	Camera:ScriptStart()
]]


CreateCutScene
{
	Name = "HortarAndTheFrogs", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		IsGlobalFlagTrue{Name = "Avatar_soll_sich_zurueckziehen", UpdateInterval = 10},
		PlayerUnitInRange {X = 275, Y = 378, Range = 12 , FigureType = FigureAvatar , UpdateInterval = 20},
		Negated (PlayerUnitInRange {X = 304, Y = 385, Range = 15 , FigureType = FigureAll , UpdateInterval = 20}),	
		Negated (PlayerUnitInRange {X = 324, Y = 395, Range = 15 , FigureType = FigureAll , UpdateInterval = 20}),	
		Negated (PlayerUnitInRange {X = 320, Y = 380, Range = 15 , FigureType = FigureAll , UpdateInterval = 20}),	
	},
	BeginActions =
	{
		SetNoFightFlagTrue {NpcId = 5640},	
		SetNoFightFlagTrue {NpcId = 0},
		SetGlobalFlagTrue {Name = "CutsceneInitFrogs"},			
	},
	TimedActions =
	{
		[0] =
		{
			-- die ersten zwei sekunden ohne kamera:
		},
		[20] =
		{
			RemoveDialog {NpcId = 5640},
			ExecuteCameraScript{Script = CameraHortarAndTheFrogsIV},			
		},
		[25] = 
		{
			RemoveDialog {NpcId = 5640},		
			Goto{X = 336, Y = 407, NpcId = 5640, Range = 1 , WalkMode = Walk , GotoMode = GotoNormal , XRand = 0 , YRand = 0},
			SetGlobalFlagFalse {Name = "CutsceneInitFrogs"},				
		},
		[50] = 
		{
			CutSceneSay {Tag = "cs13HortarP103_001", NpcId = 5640, String = "So ihr Monster, es gibt Futter!"},
		},
		[60] =
		{
			SetGlobalFlagTrue{Name = "Froschtor_aufmachen"},
		},
		[90] =
		{
			WaitForEndOfSpeech,			
			CutSceneSay {Tag = "cs13HortarP103_002" , NpcId = 5640, String = "Passt gut auf, die Flöte wird sie meinem Willen unterwerfen..."},			
			Goto{X = 332, Y = 403, NpcId = 5640, Range = 1 , WalkMode = Walk , GotoMode = GotoNormal , XRand = 0 , YRand = 0},
		},
		[140] =
		{	
			WaitForEndOfSpeech,						
			CutSceneSay {Tag = "cs13HortarP103_003" , NpcId = 5640, String = "(flötet)"},
		},
		[220] =
		{	
			WaitForEndOfSpeech,				
			CutSceneSay {Tag = "cs13HortarP103_004" , NpcId = 5640, String = "Nein! Verdammt!"},
		},
		[260] =
		{	
			WaitForEndOfSpeech,
			SetGlobalFlagTrue{Name = "Froschangriff"},
			ChangeRace {Race = 134, NpcId = 5640}, 
			SetNoFightFlagFalse {NpcId = 0},
			SetNoFightFlagFalse {NpcId = 5640},
			Follow {NpcId = 6757, Target = Avatar},	
			Follow {NpcId = 6756, Target = Avatar},
			SetGlobalFlagFalse {Name = "CutsceneInitFrogs"},					
		},
	},
}
