function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnIdleGoHome
{
	X = 141 , Y = 333 ,
	Direction = 2,
	Range = 3, WalkMode = Walk,
	Conditions = 
	{
		--Negated( IsGlobalFlagTrue{Name ="g_P202_HadekoEndgameOn"} ),
		IsGlobalFlagTrue{Name = "g_P212_EvilDoorkeeperInBattle"},
	},
}


--OnIdleGoHome
--{
--	X = 139 , Y = 333 ,
--	Direction = 2,
--	Range = 1, WalkMode = Walk,
--	Conditions = 
--	{
--		IsGlobalFlagTrue{Name ="g_P202_HadekoEndgameOn"},
--		IsGlobalFlagTrue{Name = "g_P212_EvilDoorkeeperInBattle"},
--	},
--}


OnIdleGoHome
{
	X = 139 , Y = 337 ,
	Direction = 2,
	Range = 3, WalkMode = Walk,
	Conditions = 
	{
		Negated(IsGlobalFlagTrue{Name = "g_P212_EvilDoorkeeperInBattle"}),
	},
}

OnDeath
{
	Actions =
	{
		SetGlobalFlagTrue{ Name = "g_P212_EvilPuppetDead"},
	},
}

OnToggleEvent
{
	OnConditions =
	{
		IsGlobalFlagTrue{Name = "g_P212_EvilDoorkeeperInBattle"},
		IsGlobalFlagTrue{Name = "g_P212_PuppetsGetAngry"},
	},
	OnActions =
	{
		ChangeRace{Race = 121 , NpcId = self },
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
	}
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
