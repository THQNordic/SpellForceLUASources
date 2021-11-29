function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 1}
--!EDS ONIDLEGOHOME END

Respawn
{
	X = 373, Y = 251, NoSpawnEffect = FALSE, WaitTime = 25,
	Conditions = 
	{ 
		BuildingInRange {X = 373, Y = 251, Range = 0}
	},
	Actions = 
	{
	},
}

EndDefinition()

end
