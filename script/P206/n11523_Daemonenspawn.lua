-- D�mon der hl. St�tte

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

Respawn
{
	X = 186, Y = 205, WaitTime = 120, UnitId = self, Clan = 0, Target = 0, Chief = none, NoSpawnEffect = FALSE, 
	Conditions = 
	{ 
		IsGlobalCounter {Name = "gc_P206Daemonenspawn", Value = 40, Operator = IsLessOrEqual, UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "GDS_PlayerIsTalking"},
		IsGlobalFlagFalse{Name = "g_P206RedWasteD�monenSpawnStopHlSt�tte", UpdateInterval = 20}
	}, 
	Actions = 
	{
		IncreaseGlobalCounter {Name = "gc_P206Daemonenspawn", Step = 1},
		Goto {X = _X, Y = _Y}
	}, 
	DeathActions = {}
}


EndDefinition()

end