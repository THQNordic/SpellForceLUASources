function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 1}
--!EDS ONIDLEGOHOME END

OnToggleEvent
{
	OnConditions =
	{
		IsGlobalFlagTrue{Name = "g_P212_GoodArchmageInBattle"},
		IsGlobalFlagTrue{Name = "g_P212_PuppetsGetAngry"},
	},
	OnActions =
	{
		ChangeRace{Race = 139 , NpcId = self },
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
