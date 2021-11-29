--Endlosspawn
-- screamer

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

Despawn
{
 	PlayDeathAnim = FALSE,
	Conditions = 
	{
		IsNpcFlagFalse{Name = "g_P202Endlosspawn1DespawnAus", UpdateInterval = 30},
	}, 
	Actions = 
	{
		SetNpcFlagTrue{Name = "g_P202Endlosspawn1DespawnAus"},
	}
}

Respawn
{
 	WaitTime = 10, UnitId = self, Clan = 0, Target = none, X = 114, Y = 322, Chief = none, NoSpawnEffect = FALSE, 
 	Conditions = 
 	{
 		IsGlobalFlagTrue{Name = "g_P202Endlosspawn1An", UpdateInterval = 30},
		IsGlobalCounter {Name = "gc_P202CounterEndlosSpawn1", Value = 4, Operator = IsEqual, UpdateInterval = 30},
	}, 
 	Actions = {}, 
 	 
 	DeathActions = 
 	{
 		Goto {X = _X, Y = _Y},
 	},
}

EndDefinition()

end
