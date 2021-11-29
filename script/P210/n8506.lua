function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--- Wenn alle 9 Kisten geöffnet wurden, stirbt das Skelett
Despawn
{
	PlayDeathAnim = TRUE,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P210_Room5Chest9Open"}
	},
}


-- Geisterroute Raum 5
OnIdleGoHome
{
	X = 213, Y = 283, Range = 2, WalkMode = Walk,
	Conditions = 
	{
		IsNpcCounter{Name = "npc_P210_Room5Geisterroute", Value = 0, Operator = IsEqual},
	},
	HomeActions =
	{
		IncreaseNpcCounter{Name = "npc_P210_Room5Geisterroute"},
	}
}

OnIdleGoHome
{
	X = 198, Y = 283, Range = 2, WalkMode = Walk,
	Conditions = 
	{
		IsNpcCounter{Name = "npc_P210_Room5Geisterroute", Value = 1, Operator = IsEqual},
	},
	HomeActions =
	{
		IncreaseNpcCounter{Name = "npc_P210_Room5Geisterroute"},
	}
}

OnIdleGoHome
{
	X = 198, Y = 266, Range = 2, WalkMode = Walk,
	Conditions = 
	{
		IsNpcCounter{Name = "npc_P210_Room5Geisterroute", Value = 2, Operator = IsEqual},
	},
	HomeActions =
	{
		IncreaseNpcCounter{Name = "npc_P210_Room5Geisterroute"},
	}
}

OnIdleGoHome
{
	X = 247, Y = 266, Range = 2, WalkMode = Walk,
	Conditions = 
	{
		IsNpcCounter{Name = "npc_P210_Room5Geisterroute", Value = 3, Operator = IsEqual},
	},
	HomeActions =
	{
		IncreaseNpcCounter{Name = "npc_P210_Room5Geisterroute"},
	}
}

OnIdleGoHome
{
	X = 247, Y = 283, Range = 2, WalkMode = Walk,
	Conditions = 
	{
		IsNpcCounter{Name = "npc_P210_Room5Geisterroute", Value = 4, Operator = IsEqual},
	},
	HomeActions =
	{
		ResetNpcCounter{Name = "npc_P210_Room5Geisterroute"},
	}
}


EndDefinition()

end
