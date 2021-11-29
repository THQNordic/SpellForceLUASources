function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = 146,
	Y = 97,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP200heilGoblin2Spawn", UpdateInterval = 5},
	},
	Actions = 
	{
		ChangeRace {Race = 0, NpcId = self},
		CastSpell{ Spell = 1959, Target = 0, TargetType = Figure, X = 0, Y = 0, NpcId = self},
		SetNpcTimeStamp {Name = "npc_tnP200GoblinErscheinungszeit2"},
		SetGlobalFlagFalse {Name = "g_sP200heilGoblin2Spawn"},
	}
} 

Despawn
{
	Conditions = 
	{
		IsNpcTimeElapsed {Name = "npc_tnP200GoblinErscheinungszeit2", Seconds = 5},	
	},
	Actions = 
	{
		ClearNpcTimeStamp {Name = "npc_tnP200GoblinErscheinungszeit2"},
		SetNpcFlagTrue {Name = "npc_sP200FigureGoblinTot2"},
	}
}

Respawn
{
	WaitTime = 1,
	UnitId = self,
	X = 146,
	Y = 97,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP200heilGoblin2Spawn"},
		IsNpcFlagTrue {Name = "npc_sP200FigureGoblinTot2"},
		
	},
	Actions = 
	{
		ChangeRace {Race = 0, NpcId = self},
		CastSpell{ Spell = 1959, Target = 0, TargetType = Figure, X = 0, Y = 0, NpcId = self},
		SetNpcTimeStamp {Name = "npc_tnP200GoblinErscheinungszeit2"},
		SetGlobalFlagFalse {Name = "g_sP200heilGoblin2Spawn"},
	},
	DeathActions = 
	{
		SetNpcFlagTrue {Name = "npc_sP200FigureGoblinTot2"},
	}
}

EndDefinition()

end
