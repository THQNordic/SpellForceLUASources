-->ROUND1 GLADIATOR

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OneTimeInitAction (ChangeRace {Race = 152, NpcId = self})

KillOnDominate{NpcId = self}

Umspawn
{
	UnitId = self,
	Clan = 0,
	X = 144,
	Y = 155,
	NoSpawnEffect = TRUE,
	OnlyOnce = TRUE,
	PlayDeathAnim = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP200CutszeneRound1Ended", UpdateInterval = 10},
	},
	Actions = 
	{
		ChangeRace {Race = 167, NpcId = self},
		SetGlobalFlagTrue {Name = "g_sP200ReadytoStartGladiator2"},
	}
}

Despawn
{
	Conditions = 
	{
		ODER9
		{
		IsGlobalFlagTrue { Name = "g_sP200Round1Solved"},
			UND9
			{
				IsGlobalFlagTrue {Name = "g_sP200Round1Lost", UpdateInterval = 10},
				IsGlobalFlagFalse {Name = "g_sP200ArenaKampfStart", UpdateInterval = 10},
				IsGlobalFlagFalse {Name = "g_sP200AvatarInArena", UpdateInterval = 10},	
			},
		},
	},
	Actions = 
	{
		SetNpcFlagTrue {Name = "npc_sP200Figure9330Tot"},
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
		IsNpcFlagTrue {Name = "npc_sP200Figure9330Tot", UpdateInterval = 10},	
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart", UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "g_sP200AvatarInArena",UpdateInterval = 10},
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 0, Operator = IsEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		SetNpcFlagFalse {Name = "npc_sP200Figure9330Tot"},
		Goto {X = 149, Y = 136, NpcId = self, Range = 5, WalkMode = Walk, GotoMode = GotoContinuous},
	},
	DeathActions = 
	{
		SetNpcFlagTrue {Name = "npc_sP200Figure9330Tot"},
	}
}

--Der Gladiator begibt sich in die Mitte der Arena sobald der Spieler die Arena betritt.
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP200ReadytoStartGladiator2"},
		IsGlobalFlagTrue {Name = "g_sP200AvatarInArena", UpdateInterval = 10},
		
	},
	Actions = 
	{
		Goto {X = 149, Y = 136, NpcId = self, Range = 5, WalkMode = Walk, GotoMode = GotoContinuous},
	},
}
EndDefinition()

end
