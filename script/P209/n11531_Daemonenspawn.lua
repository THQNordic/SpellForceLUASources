-- Dämon der hl. Stätte

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

Respawn
{
	X = 186, Y = 76, WaitTime = 120, UnitId = self, Clan = 0, Target = 0, Chief = none, NoSpawnEffect = FALSE, 
	Conditions = 
	{ 
		IsGlobalCounter {Name = "gc_P209Daemonenspawn", Value = 40, Operator = IsLessOrEqual, UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "GDS_PlayerIsTalking"},
		IsGlobalFlagFalse{Name = "g_P209KathaiDämonenSpawnStopHlStätte", UpdateInterval = 20}
	}, 
	Actions = 
	{
		Goto {X = _X, Y = _Y},
		IncreaseGlobalCounter {Name = "gc_P209Daemonenspawn", Step = 1},
	}, 
	DeathActions = {}
}


EndDefinition()

end