function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

--OneTimeInitAction (HoldPosition{})

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome
{
	WalkMode = Walk, Direction = 4, 
	X = _X, Y = _Y, 
	HomeActions =
	{
	--	HoldPosition{},
	}
}
--!EDS ONIDLEGOHOME END

EndDefinition()

end
