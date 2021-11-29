function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 6}
--!EDS ONIDLEGOHOME END

SpawnOnlyWhen
{
	Conditions =
	{
		QuestState{ QuestId = 1070, State = StateActive},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_Mastergame_AllGoHome"}
	},
	Actions =
	{
		SetEffect {Effect ="DeMaterialize", TargetType = Figure, NpcId = Self},
		SetNpcTimeStamp{Name = "npc_Despawn"}
	}
}

Despawn
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_Mastergame_AllGoHome"},
		IsNpcTimeElapsed{Name = "npc_Despawn", Seconds = 3}
	},
}

EndDefinition()

end
