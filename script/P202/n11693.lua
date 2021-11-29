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
 		AvatarLevel {Level = 46, UpdateInterval = 40},
 		IsGlobalFlagTrue{Name = "g_P202Endlosspawn1An", UpdateInterval = 30},
		IsGlobalCounter {Name = "gc_P202CounterEndlosSpawn1", Value = 0, Operator = IsEqual, UpdateInterval = 30}
		
	
	}, 
 	Actions = {}, 
 	 
 	DeathActions = 
 	{
 		IncreaseGlobalCounter {Name = "gc_P202CounterEndlosSpawn1", Step = 1},
 		Goto {X = _X, Y = _Y},
 	},
}


EndDefinition()

end
