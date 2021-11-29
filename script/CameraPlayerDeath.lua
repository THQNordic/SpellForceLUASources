doscript("GdsCameraHelper.lua")

CreateCameraFunction
{
Name = "ExecutePlayerDeathCamera",
	Script = {
		"Camera:ScriptAvatarIsDogFood(0,0,0)\n"..
		RotateCameraAroundNpc
		{
			NpcId = 0, Radius = 8, Height = 5, LookAtHeight = 0.5,
			BeginTime = 0, Duration = 60, Speed = 1.5, Points = 13, Dump = 0,
		},
	},
}

ExecutePlayerDeathCamera()
