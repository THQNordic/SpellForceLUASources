--> Round 5 Screamer Caster

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

KillOnDominate{NpcId = self}

SpawnOnlyWhen
{
	X = 113,
	Y = 113,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP200Round4Solved"},
		IsGlobalFlagFalse {Name = "g_sP200AvatarInArena"},	
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_sP200Round5Monster1Gesetzt"},
		ChangeRace {Race = 152, NpcId = self},
	}
} 

Umspawn
{
	UnitId = self,
	X = 102,
	Y = 102,
	NoSpawnEffect = TRUE,
	OnlyOnce = TRUE,
	PlayDeathAnim = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP200Round5Monster1Gesetzt"},
		IsGlobalFlagTrue {Name = "g_sP200Round4Solved"},
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart"},	
		IsGlobalFlagFalse {Name = "g_sP200AvatarInArena"},
	},
	Actions = 
	{
		ChangeRace {Race = 196, NpcId = self},
		SetGlobalFlagTrue {Name = "g_sP200ReadytoStartRound5Monster1"},
	}
}

Despawn
{
	Conditions = 
	{
		ODER9
		{
		IsGlobalFlagTrue { Name = "g_sP200Round5Solved"},
			UND9
			{
				IsGlobalFlagTrue {Name = "g_sP200Round5Lost", UpdateInterval = 10},
				IsGlobalFlagFalse {Name = "g_sP200ArenaKampfStart", UpdateInterval = 10},
				IsGlobalFlagFalse {Name = "g_sP200AvatarInArena", UpdateInterval = 10},	
			},
		},
	},
	Actions = 
	{
		SetNpcFlagTrue {Name = "npc_sP200Figure9597Tot"},
	}
}

Respawn
{
	WaitTime = 1,
	UnitId = self,
	X = 102,
	Y = 102,
	NoSpawnEffect = FALSE,
	Conditions = 
	{
		IsNpcFlagTrue {Name = "npc_sP200Figure9597Tot", UpdateInterval = 10},	
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart", UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "g_sP200AvatarInArena", UpdateInterval = 10},
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 4, Operator = IsEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		SetNpcFlagFalse {Name = "npc_sP200Figure9597Tot"},
		Goto {X = 117, Y = 121, NpcId = self, Range = 5, WalkMode = Walk, GotoMode = GotoContinuous},
	},
	DeathActions = 
	{
		SetNpcFlagTrue {Name = "npc_sP200Figure9597Tot"},
	}
}

--Der Gladiator begibt sich in die Mitte der Arena sobald der Spieler die Arena betritt.
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound5Monster1"},
		IsGlobalFlagTrue {Name = "g_sP200AvatarInArena", UpdateInterval = 10},
		
	},
	Actions = 
	{
		Goto {X = 117, Y = 121, NpcId = self, Range = 5, WalkMode = Walk, GotoMode = GotoContinuous},
	},
}


EndDefinition()

end