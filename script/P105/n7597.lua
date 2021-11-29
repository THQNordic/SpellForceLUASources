function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 1}
--!EDS ONIDLEGOHOME END

Respawn
{
	X = 410, Y = 437, NoSpawnEffect = FALSE, WaitTime = 150,
	Conditions = 
	{ 
		FigureAlive{NpcId = 7272}
	},
	Actions = 
	{
	},
}

EndDefinition()

end
