-- Dämon der hl. Stätte

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

Respawn
{
	X = 215, Y = 314, WaitTime = 120, UnitId = self, Clan = 0, Target = 0, Chief = none, NoSpawnEffect = FALSE, 
	Conditions = 
	{ 
		IsGlobalCounter {Name = "gc_P203Daemonenspawn", Value = 40, Operator = IsLessOrEqual, UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "GDS_PlayerIsTalking"},
		IsGlobalFlagFalse{Name = "g_P203OnyxDämonenSpawnStopHlStätte", UpdateInterval = 20}
	}, 
	Actions = 
	{
		IncreaseGlobalCounter {Name = "gc_P203Daemonenspawn", Step = 1},
		Goto {X = _X, Y = _Y}
	}, 
	DeathActions = {}
}


EndDefinition()

end