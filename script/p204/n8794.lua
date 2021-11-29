function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = 8794},
	}
}

OnOneTimeEvent
{
	Conditions = 
	{
		FigureInRange{X = 268, Y = 331, NpcId = self, Range = 1},
	},

	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P204_HaranDespawnt"},
	}
}


Despawn
{
	PlayDeathAnim = FALSE,

	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_HaranDespawnt", UpdateInterval = 30},
	}
}

Respawn
{
	WaitTime = 2, UnitId = self , X = 167, Y = 196, NoSpawnEffect = TRUE,

	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P205_HaranUmspawn", UpdateInterval = 60},
		IsGlobalFlagFalse{Name = "g_P204_HaranKampf"},	   	 	
	},
	
		Actions = 
		{
		SetGlobalFlagFalse{Name = "g_P204_HaranDespawnt"},		
		}
}

OnIdleGoHome
{

	X = 329, Y = 166, WalkMode = Run, Direction = East,
	
	Conditions =
	{
			IsGlobalFlagTrue {Name = "g_P204_HaranZumTor", UpdateInterval = 60},
	},
	
	HomeActions = 
	{
		SetGlobalFlagFalse {Name = "g_P204_HaranZumTor"},
		SetGlobalFlagTrue {Name = "g_P204_HaranAngekommen"},		
	},
}


Despawn
{
	PlayDeathAnim = FALSE,

	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_HaranTot", UpdateInterval = 30},
	}
}
EndDefinition()

end
