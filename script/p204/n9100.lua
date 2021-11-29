function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P204_ArenaKampfStart", UpdateInterval = 10},
		PlayerUnitInRange {X = 374, Y = 223, Range = 1 , FigureType = Avatar , UpdateInterval = 20},
	},
	Actions = 
	{
	   SetGlobalFlagTrue{Name = "g_P204_ArenaKampf"},
	},
}

EndDefinition()

end
