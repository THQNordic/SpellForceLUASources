--> Round 8 Untote

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

KillOnDominate{NpcId = self}

SpawnOnlyWhen
{
	X = 115,
	Y = 113,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP200Round7Solved"},
		IsGlobalFlagFalse {Name = "g_sP200AvatarInArena"},	
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_sP200Round8Monster2Gesetzt"},
		ChangeRace {Race = 152, NpcId = self},
	}
} 

Umspawn
{
	UnitId = self,
	X = 101,
	Y = 101,
	NoSpawnEffect = TRUE,
	OnlyOnce = TRUE,
	PlayDeathAnim = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP200Round8Monster2Gesetzt"},
		IsGlobalFlagTrue {Name = "g_sP200Round7Solved"},
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart"},	
		IsGlobalFlagFalse {Name = "g_sP200AvatarInArena"},
	},
	Actions = 
	{
		ChangeRace {Race = 114, NpcId = self},
		SetGlobalFlagTrue {Name = "g_sP200ReadytoStartRound8Monster2"},
	}
}

Despawn
{
	Conditions = 
	{
		ODER9
		{
		IsGlobalFlagTrue { Name = "g_sP200Round8Solved"},
			UND9
			{
				IsGlobalFlagTrue {Name = "g_sP200Round8Lost", UpdateInterval = 10},
				IsGlobalFlagFalse {Name = "g_sP200ArenaKampfStart", UpdateInterval = 10},
				IsGlobalFlagFalse {Name = "g_sP200AvatarInArena", UpdateInterval = 10},	
			},
		},
	},
	Actions = 
	{
		SetNpcFlagTrue {Name = "npc_sP200Figure9636Tot"},
	}
}

Respawn
{
	WaitTime = 1,
	UnitId = self,
	X = 101,
	Y = 101,
	NoSpawnEffect = FALSE,
	Conditions = 
	{
		IsNpcFlagTrue {Name = "npc_sP200Figure9636Tot", UpdateInterval = 10},	
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart", UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "g_sP200AvatarInArena", UpdateInterval = 10},
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 7, Operator = IsEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		SetNpcFlagFalse {Name = "npc_sP200Figure9636Tot"},
		Goto {X = 117, Y = 121, NpcId = self, Range = 5, WalkMode = Walk, GotoMode = GotoContinuous},
	},
	DeathActions = 
	{
		SetNpcFlagTrue {Name = "npc_sP200Figure9636Tot"},
	}
}

--Der Gladiator begibt sich in die Mitte der Arena sobald der Spieler die Arena betritt.
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound8Monster2"},
		IsGlobalFlagTrue {Name = "g_sP200AvatarInArena", UpdateInterval = 10},
		
	},
	Actions = 
	{
		Goto {X = 117, Y = 121, NpcId = self, Range = 5, WalkMode = Walk, GotoMode = GotoContinuous},
	},
}


EndDefinition()

end