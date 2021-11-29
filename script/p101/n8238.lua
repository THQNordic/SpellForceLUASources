--INFO: FakeErsatzball

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X , Y = _Y , Clan = 0 , UnitId = 0 , NoSpawnEffect = FALSE ,
	Conditions = 
	{
		IsGlobalFlagTrue{ Name = "P101_DunkelElfBossKilled", UpdateInterval = 30}
	},
	Actions = {} 
}

OnIdleGoHome
{
	X = _X, Y = _Y, Direction = 5, Range = 4 , WalkRange = 10 , WaitTime = 0 , WalkMode = Walk , GotoMode = GotoNormal,
	Conditions = 
	{ 
		IsGlobalFlagFalse{Name = "P101GoblinsGewinnen", UpdateInterval = 10},
	},
	Actions = { },
	HomeActions = { },
	AbortConditions = { },
	AbortActions = {},
}


----wenn gewonnen, dann ab in die Freiheit
--OnOneTimeEvent
--{
--	NotInDialog = FALSE , UpdateInterval = 10 ,
--	Conditions = 
--	{
--		IsGlobalTimeElapsed{ Name = "P101GoblinsGewonnen", Seconds = 90, UpdateInterval = 10 },
--	},
--	Actions = 
--	{
--		Goto {X = 283, Y = 178, NpcId = 6981, Range = 2, WalkMode = Run, GotoMode = GotoForced},
--	}
--}


EndDefinition()

end
