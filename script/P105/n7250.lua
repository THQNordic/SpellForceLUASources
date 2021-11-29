function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 4}
--!EDS ONIDLEGOHOME END

Respawn
{
	X = 266, Y = 241, NoSpawnEffect = FALSE, WaitTime = 60,
	Conditions = 
	{ 
	},
	Actions = 
	{
	},
}

EndDefinition()

end
