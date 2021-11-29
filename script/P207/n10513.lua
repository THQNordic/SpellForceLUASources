function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{	X = 349,
	Y = 451,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "p207_Giant_Spawn_Transfer"},
	},
	Actions = 
	{
		RemoveObject {X = 351, Y = 451, Object = 2439},
		StopEffect {X = 352, Y = 452, TargetType = World},
	},
}

OnPlatformOneTimeEvent
{
	Actions =
	{
		ChangeRace {Race = 4},
		ChangeFigureOwner {NpcId = 10513},
	},
}

EndDefinition()

end
