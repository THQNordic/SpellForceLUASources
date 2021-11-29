function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = 115,
	Y = 158,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP200heilGoblinSpawn", UpdateInterval = 5},
	},
	Actions = 
	{
		ChangeRace {Race = 0, NpcId = self},
		CastSpell{ Spell = 1959, Target = 0, TargetType = Figure, X = 0, Y = 0, NpcId = self},
		SetNpcTimeStamp {Name = "npc_tnP200GoblinErscheinungszeit"},
		SetGlobalFlagFalse {Name = "g_sP200heilGoblinSpawn"},
	}
} 

Despawn
{
	Conditions = 
	{
		IsNpcTimeElapsed {Name = "npc_tnP200GoblinErscheinungszeit", Seconds = 5},	
	},
	Actions =	
	{
		ClearNpcTimeStamp {Name = "npc_tnP200GoblinErscheinungszeit"},
		SetNpcFlagTrue {Name = "npc_sP200FigureGoblinTot"},
	}
}

Respawn
{
	WaitTime = 1,
	UnitId = self,
	X = 115,
	Y = 158,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP200heilGoblinSpawn"},
		IsNpcFlagTrue {Name = "npc_sP200FigureGoblinTot"},
		
	},
	Actions = 
	{
		ChangeRace {Race = 0, NpcId = self},
		CastSpell{ Spell = 1959, Target = 0, TargetType = Figure, X = 0, Y = 0, NpcId = self},
		SetNpcTimeStamp {Name = "npc_tnP200GoblinErscheinungszeit"},
		SetGlobalFlagFalse {Name = "g_sP200heilGoblinSpawn"},
	},
	DeathActions = 
	{
		SetNpcFlagTrue {Name = "npc_sP200FigureGoblinTot"},
	}
}
EndDefinition()

end
