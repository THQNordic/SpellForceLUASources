function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- erstes Ausl�sen der Spawnfalle

SpawnOnlyWhen 
{
	X =_X, Y = _Y,
	Conditions =
	{
		PlayerUnitInRange {X = 561, Y = 385, Radius = 5},
	},
	Actions =
	{
		
	}
}

-- jedes weitere Ausl�sen der Spawnfalle

Respawn
{
	X = _X, Y = _Y , 
	WaitTime = 120,
	Conditions = 
	{
		PlayerUnitInRange {X = 561, Y = 385, Radius = 5},
	}
}

EndDefinition()

end
