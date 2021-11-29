function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
-- Affenjunge II für die Cutscene

SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "UmspawnAffeBone", UpdateInterval = 2},
	},
	Actions =
	{
	}
}

Despawn
{
	Conditions =
	{
		FigureInRange {X = 159, Y = 203, Range = 3},
	}
}

EndDefinition()

end
