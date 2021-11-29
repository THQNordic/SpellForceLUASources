function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnIdleGoHome
{
	X = 141 , Y = 331 ,
	Direction = North,
	Range = 3, WalkMode = Walk,
	Conditions = 
	{
		--IsGlobalFlagFalse{Name ="g_P202_HadekoEndgameOn"},
		IsGlobalFlagTrue{Name = "g_P212_GoodTricksterInBattle"},
	},
	HomeActions =
	{
		SetGlobalFlagTrue{Name = "g_P212_PuppetsGetAngry"},
	},
}

--OnIdleGoHome
--{
--	X = 139 , Y = 331 ,
--	Direction = 2,
--	Range = 1, WalkMode = Walk,
--	Conditions = 
--	{
--		IsGlobalFlagTrue{Name ="g_P202_HadekoEndgameOn"},
--		IsGlobalFlagTrue{Name = "g_P212_GoodTricksterInBattle"},
--	},
--}

OnIdleGoHome
{
	X = 139 , Y = 327 ,
	Direction = North,
	Range = 3, WalkMode = Walk,
	Conditions = 
	{
		Negated(IsGlobalFlagTrue{Name = "g_P212_GoodTricksterInBattle"}),
	},
}

OnDeath
{
	Actions =
	{
		SetGlobalFlagTrue{ Name = "g_P212_GoodPuppetDead"},
	},
}

OnToggleEvent
{
	OnConditions =
	{
		IsGlobalFlagTrue{Name = "g_P212_GoodTricksterInBattle"},
		IsGlobalFlagTrue{Name = "g_P212_PuppetsGetAngry"},
	},
	OnActions =
	{
		ChangeRace{Race = 139 , NpcId = self },
		RandomizeNpcCounter{Name = "npc_P202_HighOrLow", MaxValue = 1},
		IncreaseNpcCounter{Name = "npc_P202_HighOrLow"},
	},
	OffConditions =
	{
		IsGlobalFlagFalse{Name = "g_P212_PuppetsGetAngry"},
	},
	OffActions =
	{
		ChangeRace{Race = 215 , NpcId = self },
	},
	
}

SpawnOnlyWhen
{
	Conditions =
	{
		IsGlobalCounter{Name ="g_P202_HadekoCounter", Value = 3, Operator = IsEqual},
	},
	Actions =
	{
		IncreaseGlobalCounter{Name = "g_P202_PuppetsDurchzaehlen"},
		RandomizeNpcCounter{Name = "npc_P202_HighOrLow", MaxValue = 1},
		IncreaseNpcCounter{Name = "npc_P202_HighOrLow"},
	}
}

OnEvent
{
	Conditions =
	{
		IsNpcCounter{Name ="npc_P202_HighOrLow", Value = 1, Operator = IsEqual},
	},
	Actions =
	{
		ChangeUnit {Unit = 2599 , NpcId = self},
		ResetNpcCounter{Name ="npc_P202_HighOrLow"},
	},
}

OnEvent
{
	Conditions =
	{
		IsNpcCounter{Name ="npc_P202_HighOrLow", Value = 2, Operator = IsEqual},
	},
	Actions =
	{
		ChangeUnit {Unit = 2600 , NpcId = self},
		ResetNpcCounter{Name ="npc_P202_HighOrLow"},
	},
}

Respawn
{
	WaitTime = 5,
	Conditions =
	{
		IsGlobalCounter{Name ="g_P202_HadekoCounter", Value = 3, Operator = IsEqual},
	},
	Actions =
	{
		IncreaseGlobalCounter{Name = "g_P202_PuppetsDurchzaehlen"},
		RandomizeNpcCounter{Name = "npc_P202_HighOrLow", MaxValue = 1},
		IncreaseNpcCounter{Name = "npc_P202_HighOrLow"},
	}
}


Despawn
{
	PlayDeathAnim = TRUE,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P202_AllHadekoPuppetsDespawn", UpdateInterval = 10},
	},
}

EndDefinition()

end
