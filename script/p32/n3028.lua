-- Raith
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnIdleGoHome
{
	WalkMode = Walk, X = 395, Y = 388, Direction = 4, Conditions =
	{
		IsGlobalFlagTrue {Name = "RaithIdleOn"},
	},
}

--------- Cutscene ---------------------------------------------------------------------
Despawn
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "RaithDespawn", UpdateInterval = 5},
	},
	Actions = 
	{
		SetGlobalFlagFalse {Name = "RaithDespawn"},
	},
}

Respawn
{
	X = 400, Y = 383, WaitTime = 10, Conditions =
	{
		IsGlobalFlagTrue {Name = "RaithRespawn", UpdateInterval = 5},
	},
	Actions =
	{
		SetGlobalFlagFalse {Name = "RaithRespawn"}
	},
}
----------------------------------------------------------------------------------------

OnOneTimeEvent
{
	Conditions = {
		IsGlobalFlagTrue{Name = "SoulForgerStageThree", UpdateInterval = 10},
		FigureDead{NpcId = 4202},
	},
	Actions = {
		Outcry{ Tag = "outcryRohenSwd001"        , NpcId = 3028, String = "Nein! Nicht! Verflucht sollt Ihr sein!"                                                       , Color = ColorWhite },
	},
}

EndDefinition()

end
