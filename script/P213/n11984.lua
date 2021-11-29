function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P213_FlinkAufDieFresse"},
	},
	Actions =
	{
		AttackTarget {Target = 11979, NpcId = self, FriendlyFire = TRUE},	
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P213_WieselAufDieFresse"},
	},
	Actions =
	{
		AttackTarget {Target = 11977, NpcId = self, FriendlyFire = TRUE},	
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P213_ZanzabarAufDieFresse"},
	},
	Actions =
	{
		AttackTarget {Target = 11978, NpcId = self, FriendlyFire = TRUE},	
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P213_MrSplineAufDieFresse"},
	},
	Actions =
	{
		AttackTarget {Target = 11980, NpcId = self, FriendlyFire = TRUE},	
	}
}

EndDefinition()

end