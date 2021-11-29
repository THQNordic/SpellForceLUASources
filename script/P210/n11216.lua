function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P210_StartCutsceneVermaechtnis"},
	},
	Actions =
	{
		SetGlobalFlagTrue{Name ="g_P210_TuomiIsSpawned"},
	},
}

Despawn
{
	Conditions =
	{
		ODER9
		{
			UND9
			{
			IsGlobalFlagTrue{Name = "g_P210_EndeCutsceneVermaechtnis"},
			IsGlobalTimeElapsed{Name = "g_P210_TuomiDespawn", Seconds = 5}, 
			IsNpcFlagFalse{Name = "npc_P210_TuomiDespawned"}
			},
		IsGlobalFlagTrue{Name = "g_Mastergame_AllGoHome"}
		}
	},
	Actions =
	{
		SetNpcFlagTrue{Name = "npc_P210_TuomiDespawned"},
	}
}

Respawn
{
	WaitTime = 5, X = 245, Y = 440, 
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P210_EndeCutsceneVermaechtnis"},
		IsGlobalFlagFalse{Name = "g_Mastergame_AllGoHome"}
	},
}

EndDefinition()

end
