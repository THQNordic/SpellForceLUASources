function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnIdleGoHome
{
	X = 191, Y = 341, WalkMode = Walk, Direction = South,

	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_PalastgartenPatrol"},
	},

	HomeActions =
	{
		SetGlobalFlagTrue{Name = "g_P204_PalastPunkt1"},
		SetGlobalFlagFalse{Name = "g_P204_PalastgartenPatrol"},
	}
}


OnIdleGoHome
{
	X = 167, Y = 342, WalkMode = Walk, Direction = South,

	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_PalastPunkt1"},
	},

	HomeActions =
	{
		SetGlobalFlagTrue{Name = "g_P204_PalastgartenPatrol"},
		SetGlobalFlagFalse{Name = "g_P204_PalastPunkt1"},
	}
}

--- Wache wird lieb wenn Alyah Kaiserin ---
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P204_AlyahKaiserin"},
	},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = self},
	}
}

EndDefinition()

end
