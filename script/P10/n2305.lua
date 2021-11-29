function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 0}
--!EDS ONIDLEGOHOME END

-- erstes Auslösen der Spawnfalle

SpawnOnlyWhen 
{
	X =_X, Y = _Y,
	Conditions =
	{
		PlayerUnitInRange {X = 732, Y = 574, Radius = 1},
	},
	Actions =
	{
		
	}
}

-- jedes weitere Auslösen der Spawnfalle

Respawn
{
	X = _X, Y = _Y , 
	WaitTime = 60,
	Conditions = 
				{
					PlayerUnitInRange {X = 732, Y = 574, Radius = 1},
				}
}

EndDefinition()

end
