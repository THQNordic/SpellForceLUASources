function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P204_EmpyriaEndkampf", UpdateInterval = 10},
	},
	Actions = {},
}

OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = 9897},
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_YrmirAngriff", UpdateInterval = 10},
	},
	
	Actions =
	{
			Goto {X = 329, Y = 175, NpcId = 9897, Range = 0, WalkMode = Walk, GotoMode = GotoNormal},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_WachenFormieren", UpdateInterval = 10},
	},

	Actions =
	{
			Goto {X = 330, Y = 171, NpcId = 9897, Range = 0, WalkMode = Run, GotoMode = GotoNormal},
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_WachenKillenHaran", UpdateInterval = 10},
	},

	Actions =
	{
		ChangeRace{Race = 208, NpcId = self},
	}	
}


OnIdleGoHome
{
	X = 309, Y = 276, WalkMode = Run, Direction = South,
	
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_Wache3ShowdownZurueck", UpdateInterval = 60},
	},

	HomeActions =
	{
		SetGlobalFlagFalse{Name = "g_P204_Wache3ShowdownZurueck"},	
		SetGlobalFlagTrue{Name = "g_P204_Wache3ShowdownDespawn"},
	}
}


Despawn
{
	PlayDeathAnim = FALSE,

	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_Wache3ShowdownDespawn", UpdateInterval = 60},
	}
}
EndDefinition()

end