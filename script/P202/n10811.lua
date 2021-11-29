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
		IsGlobalFlagTrue{Name = "g_P212_GoodHeroInBattle"},
		Negated(IsGlobalFlagTrue{Name = "g_P212_GoodHeroWasUsed"}),
	},
	HomeActions =
	{
		SetGlobalFlagTrue{Name = "g_P212_PuppetsGetAngry"},
	},
}

--OnIdleGoHome
--{
--	X = 141 , Y = 331,
--	Direction = 2,
--	Range = 1, WalkMode = Walk,
--	Conditions = 
--	{
--		IsGlobalFlagTrue{Name ="g_P202_HadekoEndgameOn"},
--		IsGlobalFlagTrue{Name = "g_P212_GoodHeroInBattle"},
--	},
--}

OnIdleGoHome
{
	X = 141 , Y = 327 ,
	Direction = North,
	Range = 3, WalkMode = Walk,
	Conditions = 
	{
		Negated(IsGlobalFlagTrue{Name = "g_P212_GoodHeroInBattle"}),
		Negated(IsGlobalFlagTrue{Name = "g_P212_GoodHeroWasUsed"}),
	},
}

OnIdleGoHome
{
	X = 138 , Y = 325 ,
	Direction = North,
	Range = 1, WalkMode = Walk,
	Conditions = 
	{
		Negated(IsGlobalFlagTrue{Name = "g_P212_GoodHeroInBattle"}),
		IsGlobalFlagTrue{Name = "g_P212_GoodHeroWasUsed"},
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
		IsGlobalFlagTrue{Name = "g_P212_GoodHeroInBattle"},
		IsGlobalFlagTrue{Name = "g_P212_PuppetsGetAngry"},
		IsGlobalFlagFalse{Name = "g_P212_GoodHeroWasUsed"},
	},
	OnActions =
	{
		ChangeRace{Race = 139 , NpcId = self },
		SetGlobalFlagTrue{Name = "g_P212_GoodHeroWasUsed"},
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




Despawn
{
	PlayDeathAnim = TRUE,
	Conditions =
	{
			ODER9
			{
				UND9
				{
				IsGlobalFlagTrue{Name ="g_P202_HadekoEndgameOn"},
				IsGlobalFlagTrue{Name = "g_P212_GoodHeroWasUsed"}
				},
			IsGlobalFlagTrue{Name = "g_P202_AllHadekoPuppetsDespawn", UpdateInterval = 10},
			},
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


EndDefinition()

end
