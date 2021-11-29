function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = 67, Y = 194, 
	Conditions = {
		FigureAlive{NpcId = 2906},
		IsGlobalTimeElapsed{Name = "SharknarSpawningActive", Seconds = 35, UpdateInterval = 20},
	},
	Actions = {
		SetEffect{X = 67, Y = 194, Effect = "Materialize", Length = 2500},
	},
}

Respawn
{
	WaitTime = 24, 
	X = 67, Y = 194, 
	Conditions = {
		FigureAlive{NpcId = 2906},
		FigureHasAggro{NpcId = 2906, UpdateInterval = 20},
	},
	Actions = {
		SetEffect{X = 67, Y = 194, Effect = "Materialize", Length = 2500},
	},
}

EndDefinition()

end
