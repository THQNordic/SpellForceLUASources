-->INFO CutszeneOutpost
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP201OutpostCutszeneSpawn2"},
	},
	Actions = 
	{
		
	}
} 

OnEvent
{
		Conditions = 
		{
			FigureHasHealth {Percent = 90, NpcId = self, UpdateInterval = 5},
			IsNpcCounter {Name = "npc_cnP201EinmalbedingungEffekt", Value = 0, Operator = IsEqual, UpdateInterval = 5},
		},
		Actions = 
		{
			ChangeRace {Race = 152},
			SetEffect {Effect = "DeMaterialize", Length = 1250},
			SetNpcTimeStamp {Name = "g_tnP201DespawnTimerCutszene"},
			IncreaseNpcCounter {Name = "npc_cnP201EinmalbedingungEffekt"},
			SetNpcFlagTrue {Name = "npc_sP201Zwischenwelt"},
		},
	}


Despawn
{
	PlayDeathAnim = FALSE ,
	Conditions = 
	{
		IsNpcTimeElapsed{Name = "g_tnP201DespawnTimerCutszene", Seconds = 1, UpdateInterval = 5},
		IsNpcFlagTrue {Name = "npc_sP201Zwischenwelt", UpdateInterval = 5},
	},
	Actions = 
	{
		
		ResetNpcCounter {Name = "npc_cnP201EinmalbedingungEffekt"},	
		--SetNpcFlagFalse { Name = "npc_sP201Zwischenwelt"},	
	}
}
		
EndDefinition()

end
