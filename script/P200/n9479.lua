--> Round 2 Beastman & Minotaur

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

KillOnDominate{NpcId = self}

SpawnOnlyWhen
{
	X = 113,
	Y = 111,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP200Round1Solved"},
		IsGlobalFlagFalse {Name = "g_sP200AvatarInArena"},	
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_sP200Round2Monster3Gesetzt"},
		ChangeRace {Race = 152, NpcId = self},
	}
} 

Umspawn
{
	UnitId = self,
	X = 153,
	Y = 102,
	NoSpawnEffect = TRUE,
	OnlyOnce = TRUE,
	PlayDeathAnim = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP200Round2Monster3Gesetzt"},
		IsGlobalFlagTrue {Name = "g_sP200Round1Solved"},
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart"},	
		IsGlobalFlagFalse {Name = "g_sP200AvatarInArena"},
	},
	Actions = 
	{
		ChangeRace {Race = 111, NpcId = self},
		SetGlobalFlagTrue {Name = "g_sP200ReadytoStartRound2Monster3"},
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
		SetNpcFlagTrue {Name = "npc_sP200Figure9479Tot"},
	}
}




Respawn
{
	WaitTime = 1,
	UnitId = self,
	X = 153,
	Y = 102,
	NoSpawnEffect = FALSE,
	Conditions = 
	{
		IsNpcFlagTrue {Name = "npc_sP200Figure9479Tot", UpdateInterval = 10},	
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart", UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "g_sP200AvatarInArena", UpdateInterval = 10},
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 1, Operator = IsEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		SetNpcFlagFalse {Name = "npc_sP200Figure9479Tot"},
		Goto {X = 149, Y = 120, NpcId = self, Range = 5, WalkMode = Walk, GotoMode = GotoContinuous},
	},
	DeathActions = 
	{
		SetNpcFlagTrue {Name = "npc_sP200Figure9479Tot"},
	}
}

--Der Gladiator begibt sich in die Mitte der Arena sobald der Spieler die Arena betritt.
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartRound2Monster3"},
		IsGlobalFlagTrue {Name = "g_sP200AvatarInArena", UpdateInterval = 10},
		
	},
	Actions = 
	{
		Goto {X = 149, Y = 120, NpcId = self, Range = 5, WalkMode = Walk, GotoMode = GotoContinuous},
	},
}


EndDefinition()

end