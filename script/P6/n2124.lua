function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
--OneTimeInitAction (HoldPosition{})

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome
{
	WalkMode = Walk, Direction = 3, 
	X = _X, Y = _Y, 
	--HomeActions =
	--{
	--	HoldPosition{},
	--}
}
Respawn
{
	WaitTime = 480,
	X = 257, Y = 269,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "WildlandpassFakeSpawn"},
	},
}






EndDefinition()

end
