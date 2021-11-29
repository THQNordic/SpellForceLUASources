function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue{Name ="g_P205_KaiserDerZweite"},
	},
	Actions = {},
}


-- Kaiser despawnt in der Cutscene wenn er am Portal ist
OnOneTimeEvent
{
	Conditions = 
	{
	   	FigureInRange {X = 231, Y = 446, Range = 0, NpcId = 9305, UpdateInterval = 10},
	},
	
	Actions =
	{
		SetEffect {Effect = "DeMaterialize", NpcId = 9305, Length = 5000},	
--		SetGlobalTimeStamp{Name = "c_P205_CounterKaiserDespawnt"},
	}
}

Despawn
{
	PlayDeathAnim = FALSE,

	Conditions =
	{
	   IsGlobalFlagTrue {Name = "g_P205_KaiserDespawnt"},
--	   IsGlobalTimeElapsed{Name = "c_P205_CounterKaiserDespawnt", Seconds = 5, UpdateInterval = 10}, 
	}
}

EndDefinition()

end
