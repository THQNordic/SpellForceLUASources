  ---------------------------------------
 -----------------------------------------
-- Cutscene Riese verschließt die Höhlen --
 -----------------------------------------
  ---------------------------------------
  
Camera001 =		-- Dummy
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p207\\n32412_cutscene_giant_block_caves_camera001.lua")
   	Camera:ScriptStart()
]]

CreateCutScene
{
	Name = "P207_Cutscene_Giant_Block_Caves", CameraScript = "", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		IsGlobalFlagTrue{Name = "p207_Verschliesse_Hoehlen"}
	},
	BeginActions =
	{	
		SetGlobalFlagTrue{Name = "g_Irfit_SetNoFightFlag"},	
		SetGlobalFlagTrue {Name = "g_p207_stop_follow_in_cutscenes"},
	},
	TimedActions =
	{
		[0] =
		{
			ExecuteCameraScript{Script = Camera001},
			SetGlobalFlagTrue {Name = "p207_Giant_Spawn_Block_Caves"},
			TeleportAvatar {X = 351, Y = 448},
			Goto {NpcId = 10061, X = 352, Y = 447, WalkMode = Walk},
		},
		[60] =
		{
			Goto {NpcId = 0, X = 344, Y = 446, WalkMode = Walk}, -- Avatar
			Goto {NpcId = 10658, X = 307, Y = 404, GotoMode = GotoContinuous, WalkMode = Walk}, -- Riese
		},
		[120] =
		{
			SetGlobalFlagFalse{Name = "g_Irfit_SetNoFightFlag"},
			SetGlobalFlagFalse {Name = "g_p207_stop_follow_in_cutscenes"},			
		},	
	},
}