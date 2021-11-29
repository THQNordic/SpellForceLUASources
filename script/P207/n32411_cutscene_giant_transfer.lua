  ----------------------------------
 ------------------------------------
-- Cutscene zur Übergabe des Riesen --
 ------------------------------------
  ----------------------------------
  
Camera001 =		-- Dummy
[[
  	Camera:ScriptReset()
  	Camera:ScriptAddSpline(0,20,1,"script\\p207\\n32411_cutscene_giant_transfer_camera001.lua")
   	Camera:ScriptStart()
]]

CreateCutScene
{
	Name = "P207_Cutscene_Giant_Transfer", CameraScript = "", PlayOnlyOnce = TRUE, 
	BeginConditions =
	{
		IsGlobalFlagTrue{Name = "p207_Uebergebe_Riese"}
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
			SetGlobalFlagTrue {Name = "p207_Giant_Spawn_Transfer"},
			TeleportAvatar {X = 351, Y = 448},
			Goto {NpcId = 10061, X = 352, Y = 447, WalkMode = Walk},
		},
		[60] =
		{		
			Goto {NpcId = 10513, X = 343, Y = 447, WalkMode = Walk}, -- Riese
			Goto {NpcId = 0, X = 344, Y = 446, WalkMode = Walk}, -- Avatar
		},
		[120] =
		{
			SetGlobalFlagFalse{Name = "g_Irfit_SetNoFightFlag"},
			SetGlobalFlagFalse {Name = "g_p207_stop_follow_in_cutscenes"},		
		},
				
	},
}