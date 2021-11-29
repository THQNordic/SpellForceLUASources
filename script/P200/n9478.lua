--> Round 2 Beastman & Minotaur

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

KillOnDominate{NpcId = self}

SpawnOnlyWhen
{
	X = 115,
	Y = 111,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP200Round1Solved"},	
		IsGlobalFlagFalse {Name = "g_sP200AvatarInArena"},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_sP200Round2Monster4Gesetzt"},
		ChangeRace {Race = 152, NpcId = self},
	}
} 

Umspawn
{
	UnitId = self,
	X = 151,
	Y = 102,
	NoSpawnEffect = TRUE,
	OnlyOnce = TRUE,
	PlayDeathAnim = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP200Round2Monster4Gesetzt"},
		IsGlobalFlagTrue {Name = "g_sP200Round1Solved"},
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart"},
		IsGlobalFlagFalse {Name = "g_sP200AvatarInArena"},	
	},
	Actions = 
	{
		ChangeRace {Race = 111, NpcId = self},
		SetGlobalFlagTrue {Name = "g_sP200ReadytoStartRound2Monster4"},
	}
}

Despawn
{
	Conditions = 
	{
		ODER9
		{
		IsGlobalFlagTrue { Name = "g_sP200Round2Solved"},
			UND9
			{
				IsGlobalFlagTrue {Name = "g_sP200Round2Lost", UpdateInterval = 10},
				IsGlobalFlagFalse {Name = "g_sP200ArenaKampfStart", UpdateInterval = 10},
				IsGlobalFlagFalse {Name = "g_sP200AvatarInArena", UpdateInterval = 10},	
			},
		},
	},
	Actions = 
	{
		SetNpcFlagTrue {Name = "npc_sP200Figure9478Tot"},
	}
}




Respawn
{
	WaitTime = 1,
	UnitId = self,
	X = 151,
	Y = 102,
	NoSpawnEffect = FALSE,
	Conditions = 
	{
		IsNpcFlagTrue {Name = "npc_sP200Figure9478Tot", UpdateInterval = 10},	
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart", UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "g_sP200AvatarInArena", UpdateInterval = 10},
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 1, Operator = IsEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		SetNpcFlagFalse {Name = "npc_sP200Figure9478Tot"},
		Goto {X = 149, Y = 120, NpcId = self, Range = 5, WalkMode = Walk, GotoMode = GotoForced},
	},
	DeathActions = 
	{
		SetNpcFlagTrue {Name = "npc_sP200Figure9478Tot"},
	}
}

--Der Gladiator begibt sich in die Mitte der Arena sobald der Spieler die Arena betritt.
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound2Monster4"},
		IsGlobalFlagTrue {Name = "g_sP200AvatarInArena", UpdateInterval = 10},
		
	},
	Actions = 
	{
		Goto {X = 149, Y = 120, NpcId = self, Range = 5, WalkMode = Walk, GotoMode = GotoForced},
	},
}
EndDefinition()

end