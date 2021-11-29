function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = 431, Y = 360,
	Conditions =
	{
		QuestState{ QuestId = 1070, State = StateActive},
	}
}

OnIdleGoHome
{
	X = 416, Y = 371, Direction = South,
	Conditions =
	{
		Negated(IsGlobalFlagTrue{Name = "g_Mastergame_AllGoHome"}),
	}

}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_Mastergame_TuomiUndress"},
	},
	Actions =
	{
		ChangeUnit {Unit = 2695, NpcId = 11434 },
		SetNpcTimeStamp{Name = "npc_OutcryCounter"},
		IncreaseNpcCounter{Name = "npc_Striptease"},
		
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_Mastergame_TuomiUndress"},
		IsNpcTimeElapsed{Name = "npc_OutcryCounter", Seconds = 4},
		IsNpcCounter{Name = "npc_Striptease", Value = 1, Operator = IsEqual},
	},
	Actions =
	{
		ChangeUnit {Unit = 2696, NpcId = 11434 },	
		IncreaseNpcCounter{Name = "npc_Striptease"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_Mastergame_TuomiUndress"},
		IsNpcTimeElapsed{Name = "npc_OutcryCounter", Seconds = 8},
		IsNpcCounter{Name = "npc_Striptease", Value = 2, Operator = IsEqual},
	},
	Actions =
	{
		ChangeUnit {Unit = 2697, NpcId = 11434 },
		IncreaseNpcCounter{Name = "npc_Striptease"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_Mastergame_TuomiUndress"},
		IsNpcTimeElapsed{Name = "npc_OutcryCounter", Seconds = 12},
		IsNpcCounter{Name = "npc_Striptease", Value = 3, Operator = IsEqual},
	},
	Actions =
	{
		ChangeUnit {Unit = 2698, NpcId = 11434 },
		IncreaseNpcCounter{Name = "npc_Striptease"},
	}
}


OnIdleGoHome
{
	X = 431, Y = 360,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_Mastergame_AllGoHome"},
	},
	HomeActions =
	{
		SetNpcFlagTrue { Name = "npc_Despawn"},
	}
}

Despawn
{
	Conditions =
	{
		IsNpcFlagTrue { Name = "npc_Despawn"},
	},
}


EndDefinition()

end
