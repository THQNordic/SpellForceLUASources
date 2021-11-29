--> Round 3 Small Dragons 4 Seasons

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

KillOnDominate{NpcId = self}

SpawnOnlyWhen
{
	X = 147,
	Y = 144,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP200Round2Solved"},
		IsGlobalFlagFalse {Name = "g_sP200AvatarInArena"},	
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_sP200Round3Monster3Gesetzt"},
		ChangeRace {Race = 152, NpcId = self},
	}
} 

Umspawn
{
	UnitId = self,
	X = 144,
	Y = 155,
	NoSpawnEffect = TRUE,
	OnlyOnce = TRUE,
	PlayDeathAnim = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP200Round3Monster3Gesetzt"},
		IsGlobalFlagTrue {Name = "g_sP200Round2Solved"},
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart"},	
		IsGlobalFlagFalse {Name = "g_sP200AvatarInArena"},
	},
	Actions = 
	{
		ChangeRace {Race = 111, NpcId = self},
		SetGlobalFlagTrue {Name = "g_sP200ReadytoStartRound3Monster3"},
	}
}

Despawn
{
	Conditions = 
	{
		ODER9
		{
		IsGlobalFlagTrue { Name = "g_sP200Round3Solved"},
			UND9
			{
				IsGlobalFlagTrue {Name = "g_sP200Round3Lost", UpdateInterval = 10},
				IsGlobalFlagFalse {Name = "g_sP200ArenaKampfStart", UpdateInterval = 10},
				IsGlobalFlagFalse {Name = "g_sP200AvatarInArena", UpdateInterval = 10},	
			},
		},
	},
	Actions = 
	{
		SetNpcFlagTrue {Name = "npc_sP200Figure9588Tot"},
	}
}




Respawn
{
	WaitTime = 1,
	UnitId = self,
	X = 144,
	Y = 155,
	NoSpawnEffect = FALSE,
	Conditions = 
	{
		IsNpcFlagTrue {Name = "npc_sP200Figure9588Tot", UpdateInterval = 10},	
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart", UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "g_sP200AvatarInArena", UpdateInterval = 10},
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 2, Operator = IsEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		SetNpcFlagFalse {Name = "npc_sP200Figure9588Tot"},
		ChangeRace {Race = 111, NpcId = self},
		Goto {X = 149, Y = 136, NpcId = self, Range = 5, WalkMode = Walk, GotoMode = GotoContinuous},
	},
	DeathActions = 
	{
		SetNpcFlagTrue {Name = "npc_sP200Figure9588Tot"},
	}
}

--Der Gladiator begibt sich in die Mitte der Arena sobald der Spieler die Arena betritt.
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound3Monster3"},
		IsGlobalFlagTrue {Name = "g_sP200AvatarInArena", UpdateInterval = 10},
		
	},
	Actions = 
	{
		Goto {X = 149, Y = 136, NpcId = self, Range = 5, WalkMode = Walk, GotoMode = GotoContinuous},
	},
}

EndDefinition()

end