-----------------------------------------------------------------------
--
--	P200Collosseum_CutszeneRound1
--
-----------------------------------------------------------------------


n32200_CameraRound1 = 
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,5,1,"script\\P200\\n32200_CameraRound1.lua")
   	Camera:ScriptStart()
]]



CreateCutScene
{
	Name = "P200Collosseum_CutszeneRound1", CameraScript = "", PlayOnlyOnce = TRUE,
	
	BeginConditions =
	{
		-- bedingungen, die angeben, wann die cutscene gestartet werden soll:
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart"},
	},
	BeginActions =
	{
		--actions zu beginn der cutscene:
		StopEffect {X = 114, Y = 99, NpcId = 10497},
		SetEffect {Effect = "IndoorGateClose", X = 114, Y = 99, NpcId = 10498}, 
		LookAtDirection {Direction = South, NpcId = 9333},
		LookAtDirection {Direction = South, NpcId = 9332},
		LookAtDirection {Direction = South, NpcId = 9331},
		SetEffect {Effect = "IndoorGateOpen", X = 114, Y = 109, NpcId = 10497}, 
	},
	TimedActions =
	{
		-- in eckigen klammern die anzahl GD Steps(1/10 sec) nach der die jeweilige Action erfolgen soll:
		
		[30] =
		{
			ExecuteCameraScript{Script = n32200_CameraRound1},
			
			
		},
		[40] =
		{
			
			StopEffect {X = 114, Y = 99, NpcId = 10498},
			SetEffect {Effect = "IndoorGateOpen", X = 114, Y = 99, NpcId = 10498}, 
			CutSceneSay {Tag = "oca2zerboP200_004" , NpcId = 9321, String = "Gladiatoren! Lasst den Kampf beginnen!"},			
			PlaySound{Sound = SoundAttackSignalTroops},
		    PlaySound{Sound = SoundColosseumApplause},
		
		},
		[50] =
		{
			
			Goto {X = 114, Y = 101, NpcId = 9333, Range = 3, WalkMode = Run, GotoMode = GotoNormal},
			Goto {X = 113, Y = 102, NpcId = 9331, Range = 3, WalkMode = Run, GotoMode = GotoNormal},
			Goto {X = 115, Y = 102, NpcId = 9332, Range = 3, WalkMode = Run, GotoMode = GotoNormal},
			PlaySound{Sound = SoundColosseumCheers},
		},
		[75] =
		{
			WaitForEndOfSpeech,	 --sollte immer angegeben werden
			SetGlobalFlagTrue {Name = "g_sP200CutszeneRound1Ended"},
		},		
	},
}



