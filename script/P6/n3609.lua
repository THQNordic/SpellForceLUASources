function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)


--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome
{
	WalkMode = Walk, X = 374, Y = 309, Direction = SouthEast,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "3609_IdleOn"},
	},
}

OnIdleGoHome
{
	WalkMode = Walk, X = _X, Y = _Y, Direction = South,
	Conditions =
	{
		IsGlobalFlagFalse {Name = "3609_IdleOn"},
	},
}
--!EDS ONIDLEGOHOME END


EndDefinition()

end