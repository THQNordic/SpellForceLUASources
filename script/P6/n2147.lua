function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--OneTimeInitAction (HoldPosition{})

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome
{
	WalkMode = Walk, Direction = 5, 
	X = _X, Y = _Y, 
	--HomeActions =
	--{
	--	HoldPosition{},
	--}
}



EndDefinition()

end
