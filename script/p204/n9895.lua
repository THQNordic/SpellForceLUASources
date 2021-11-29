function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P204_EmpyriaEndkampf", UpdateInterval = 2},
	},
	Actions =
	{
		ChangeRace{Race = 152, NpcId = 9895},
	},
}

OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = 9895},
	},
}


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_YrmirAngriff", UpdateInterval = 10},
	},
	
	Actions =
	{
		Goto {X = 327, Y = 173, NpcId = 9895, Range = 0, WalkMode = Walk, GotoMode = GotoNormal},
	}
}


OnIdleGoHome
{
	X = 326, Y = 278, WalkMode = Run, Direction = South,

	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_YrmirZurueck", UpdateInterval = 60},
	},

	HomeActions =
	{
		SetGlobalFlagFalse{Name = "g_P204_YrmirZurueck"},	
		SetGlobalFlagTrue{Name = "g_P204_YrmirShowdownDespawn"},
	}
}


Despawn
{
	PlayDeathAnim = FALSE,

	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_YrmirShowdownDespawn", UpdateInterval = 10},
	}
}




EndDefinition()

end
