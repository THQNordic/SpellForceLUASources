-- D�mon sammelscript der hl. St�tte

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

Respawn
{
	X = 333, Y = 335, WaitTime = 120, UnitId = self, Clan = 0, Target = 0, Chief = none, NoSpawnEffect = FALSE, 
	Conditions = 
	{ 
		IsGlobalCounter {Name = "gc_P211Daemonenspawn", Value = 40, Operator = IsLessOrEqual, UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "GDS_PlayerIsTalking"},
		IsGlobalFlagFalse{Name = "g_P211DarkwindD�monenSpawnStopHlSt�tte", UpdateInterval = 20}
	}, 
	Actions = 
	{
		Goto {X = _X, Y = _Y},
		IncreaseGlobalCounter {Name = "gc_P211Daemonenspawn", Step = 1},
	}, 
	DeathActions = {}
}


EndDefinition()

end