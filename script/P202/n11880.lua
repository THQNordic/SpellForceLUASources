--Endlosspawn
--d?mon

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

Despawn
{
 	PlayDeathAnim = FALSE,
	Conditions = 
	{
		IsNpcFlagFalse{Name = "g_P202Endlosspawn2DespawnAus", UpdateInterval = 30},
	}, 
	Actions = 
	{
		SetNpcFlagTrue{Name = "g_P202Endlosspawn2DespawnAus"},
	}
}

Respawn
{
 	WaitTime = 10, UnitId = self, Clan = 0, Target = none, X = 192, Y = 280, Chief = none, NoSpawnEffect = FALSE, 
 	Conditions = 
 	{
 		IsGlobalFlagTrue{Name = "g_P202Endlosspawn2An", UpdateInterval = 30},
		IsGlobalCounter {Name = "gc_P202CounterEndlosSpawn2", Value = 4, Operator = IsEqual, UpdateInterval = 30}
	}, 
 	Actions = {},
 	 
 	DeathActions = 
 	{
 		Goto {X = _X, Y = _Y},
 	},
}

EndDefinition()

end
