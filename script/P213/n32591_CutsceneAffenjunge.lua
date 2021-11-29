-----------------------------------------------------------------------
--
--	Öffnen der Blockade
--
-----------------------------------------------------------------------

-- Dummy Kamerafahrt
AffeI = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,14,1,"script\\p213\\n32591_CameraAffenjungeI.lua")
   	Camera:ScriptStart()
]]

AffeII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p213\\n32591_CameraAffenjungeII.lua")
   	Camera:ScriptStart()
]]

AffeIII = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,7,1,"script\\p213\\n32591_CameraAffenjungeIII.lua")
   	Camera:ScriptStart()
]]

AffeIV = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,7,1,"script\\p213\\n32591_CameraAffenjungeIV.lua")
   	Camera:ScriptStart()
]]




CreateCutScene
{
	Name = "Affenjunge", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		IsGlobalFlagTrue {Name = "g_P213_AffenjungeDeal"},
	},
	BeginActions =
	{
		SetNoFightFlagTrue {NpcId = 10985},	
		SetNoFightFlagTrue {NpcId = 0},
		SetGlobalFlagTrue{Name = "g_Irfit_SetNoFightFlag"},
		-- Blades erst mal NoFight, damit sie den Spieler nicht in CS angreifen
		SetNoFightFlagTrue {NpcId = 11015},
		SetNoFightFlagTrue {NpcId = 11016},
		SetNoFightFlagTrue {NpcId = 11017},
		SetNoFightFlagTrue {NpcId = 11018},
		SetNoFightFlagTrue {NpcId = 11019},
		SetNoFightFlagTrue {NpcId = 11020},
		SetNoFightFlagTrue {NpcId = 11021},
		SetNoFightFlagTrue {NpcId = 11022},
		SetNoFightFlagTrue {NpcId = 11023},
		SetNoFightFlagTrue {NpcId = 11024},
		--QuestSolve {QuestId = 945},
	},
	TimedActions =
	{
		[0] =
		{
			Goto {X = 152, Y = 165, WalkMode = Run, NpcId = 10985},
		},
		[40] =
		{
			SetGlobalFlagTrue {Name = "UmspawnBone"},
		},
		[100] =
		{
			ExecuteCameraScript{Script = AffeI},	
		},
		[105] =
		{
			Goto {X = 152, Y = 165, WalkMode = Walk, NpcId = 10985},
			SetGlobalFlagTrue {Name = "UmspawnAffeBone"},
		},
		[140] =
		{
			ExecuteCameraScript{Script = AffeII},	
		},
		[150] =
		{
			Goto {X = 135, Y = 175, WalkMode = Walk, NpcId = 11007}
		},
		[300] =
		{
			Goto {X = 159, Y = 203, WalkMode = Run, NpcId = 11007}
		},
		[340] =
		{
			ExecuteCameraScript{Script = AffeIII},	
		},
		[360] =
		{
			Goto {X = 124, Y = 170, WalkMode = Walk, NpcId = 11015, GotoMode = GotoContinous},
			Goto {X = 126, Y = 168, WalkMode = Run, NpcId = 11016, GotoMode = GotoContinous},
			Goto {X = 128, Y = 166, WalkMode = Walk, NpcId = 11017, GotoMode = GotoContinous},
			Goto {X = 130, Y = 164, WalkMode = Run, NpcId = 11018, GotoMode = GotoContinous},
			Goto {X = 132, Y = 162, WalkMode = Run, NpcId = 11019, GotoMode = GotoContinous},
			Goto {X = 122, Y = 168, WalkMode = Run, NpcId = 11020, GotoMode = GotoContinous},
			Goto {X = 124, Y = 166, WalkMode = Walk, NpcId = 11021, GotoMode = GotoContinous},
			Goto {X = 122, Y = 164, WalkMode = Run, NpcId = 11022, GotoMode = GotoContinous},
			Goto {X = 120, Y = 162, WalkMode = Run, NpcId = 11023, GotoMode = GotoContinous},
			Goto {X = 118, Y = 403, WalkMode = Run, NpcId = 11024, GotoMode = GotoContinous},
		},
		[440] =
		{
			ExecuteCameraScript{Script = AffeIV},
			
		},
		
		[600] =
		{	
			WaitForEndOfSpeech,
			SetNoFightFlagFalse {NpcId = 0},
			SetGlobalFlagFalse{Name = "g_Irfit_SetNoFightFlag"},
			SetGlobalFlagFalse {Name = "UmspawnBone"},
			SetGlobalFlagTrue {Name = "g_P213_AffenjungeCsZuEnde"},
			--SetNoFightFlagFalse {NpcId = 8486},
			SetGlobalFlagTrue{Name = "g_StoryQuestTempleFound"},
			SetGlobalTimeStamp{Name = "c_P213_CounterVollAufDieFresse"},			
		},
	},
}
