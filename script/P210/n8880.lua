function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 3}
--!EDS ONIDLEGOHOME END


Respawn
{
	X = 113, Y = 249, NoSpawnEffect = FALSE, WaitTime = 90,
	Conditions = 
	{ 
		BuildingInRange {X = 113, Y = 249, Range = 0}
	},
	Actions = 
	{
	},
}

EndDefinition()

end
