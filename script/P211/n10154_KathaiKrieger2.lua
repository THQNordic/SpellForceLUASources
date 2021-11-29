-- Kathai2 Sammelscript

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{
	X = 269, Y = 455, Clan = 0, UnitId = 0, NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P211_Kathai2FallenEin", UpdateInterval = 20},
		IsGlobalTimeElapsed {Name = "gt_P211_Kathai2Timer", Seconds = random(15)+5, UpdateInterval = 10 } 
	}, 
	Actions = {} 
}

OnIdleGoHome
{
	X = _X, Y = _Y, Direction = 2, Range = 0, WalkRange = 2, WaitTime = 0, WalkMode = Run, GotoMode = GotoContinuous,
	Conditions = 
	{ 
		IsRewardFlagTrue {Name = "TorJenquaiGeoeffnet", UpdateInterval = 60},
	},
	Actions = {},
	HomeActions = 
	{ 
		SetGlobalFlagTrue {Name = "g_P211Kathai2AufPosition"},
	},
	AbortConditions = { },
	AbortActions = { },
}


EndDefinition()

end










