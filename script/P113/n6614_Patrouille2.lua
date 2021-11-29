
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--Patrouille2
--Chef ist 6622


 --basepoint1
OnIdleGoHome
{
	X = 219, Y = 253, Direction = 5, Range = 5 , WalkRange = 10 , WaitTime = 0 , WalkMode = Walk , GotoMode = GotoNormal,
	Conditions = 
	{  
		IsGlobalCounter{Name = "P113PatrolCounter", Value = 0, Operator = IsEqual, UpdateInterval = 10},
		
	},
	Actions = { },
	HomeActions = 
	{
		--SetEffect{Effect = "GlowingTube",  Length = 100 , TargetType = Figure , NpcId = self},
	}
}



--basepoint2
OnIdleGoHome
{
	X = 359, Y = 200, Direction = 3, Range = 5 , WalkRange = 10 , WaitTime = 0 , WalkMode = Walk , GotoMode = GotoNormal,
	Conditions = 
	{ 
		IsGlobalCounter{Name = "P113PatrolCounter", Value = 1, Operator = IsEqual, UpdateInterval = 30},
		
	},
	Actions = {},
	HomeActions =
	{ 
		--SetEffect{Effect = "GlowingTube",  Length = 100 , TargetType = Figure , NpcId = self},
	}
}

--basepoint3
OnIdleGoHome
{
	X = 130, Y = 142, Direction = 3, Range = 5 , WalkRange = 10 , WaitTime = 0 , WalkMode = Walk , GotoMode = GotoNormal,
	Conditions = 
	{
		IsGlobalCounter{Name = "P113PatrolCounter", Value = 2, Operator = IsEqual, UpdateInterval = 30},
		
	},
	Actions = {},
	HomeActions = 
	{
		--SetEffect{Effect = "GlowingTube",  Length = 100 , TargetType = Figure , NpcId = self},
	}
}










--OnOneTimeEvent
--{
--	NotInDialog = FALSE , UpdateInterval = 60 ,
--	Conditions = { },
--	Actions = 
--	{
--		IncreaseGlobalCounter{Name = "P113CTruppePatrol2", Step = 1},
--	}
--}
-- 
-- 
-- --basepoint1
--OnIdleGoHome
--{
--	X = 219, Y = 253, Direction = 5, Range = 5 , WalkRange = 10 , WaitTime = 0 , WalkMode = Walk , GotoMode = GotoNormal,
--	Conditions = 
--	{  
--		IsGlobalCounter{Name = "P113CBasePatrol2", Value = 0, Operator = IsEqual, UpdateInterval = 30},
--		
--	},
--	Actions = { },
--	HomeActions = 
--	{
--		IncreaseGlobalCounter{Name = "P113CTruppePatrol2", Step = 1},
--		SetEffect{Effect = "GlowingTube",  Length = 100 , TargetType = Figure , NpcId = self},
--		
--	}
--}
--
----basepoint2
--OnIdleGoHome
--{
--	X = 359, Y = 200, Direction = 3, Range = 5 , WalkRange = 10 , WaitTime = 0 , WalkMode = Walk , GotoMode = GotoNormal,
--	Conditions = 
--	{ 
--		IsGlobalCounter{Name = "P113CBasePatrol2", Value = 1, Operator = IsEqual, UpdateInterval = 30},
--		
--	},
--	Actions = {},
--	HomeActions =
--	{ 
--		IncreaseGlobalCounter{Name = "P113CTruppePatrol2", Step = 1},
--		SetEffect{Effect = "GlowingTube",  Length = 100 , TargetType = Figure , NpcId = self},
--	}
--}
--
----basepoint3
--OnIdleGoHome
--{
--	X = 130, Y = 142, Direction = 3, Range = 5 , WalkRange = 10 , WaitTime = 0 , WalkMode = Walk , GotoMode = GotoNormal,
--	Conditions = 
--	{
--		IsGlobalCounter{Name = "P113CBasePatrol2", Value = 2, Operator = IsEqual, UpdateInterval = 30},
--		
--	},
--	Actions = {},
--	HomeActions = 
--	{
--		IncreaseGlobalCounter{Name = "P113CTruppePatrol2", Step = 1},
--		SetEffect{Effect = "GlowingTube",  Length = 100 , TargetType = Figure , NpcId = self},
--	}
--}
--
-- 
-- ---Respawn immer, wenn Patrouille in der N�he
--Respawn
--{
--	WaitTime = 1, UnitId = self , Clan = 0 , Target = none , X = startX , Y = startY , Chief = none, NoSpawnEffect = FALSE , 
--	Conditions = 
--		{
--		FigureInRange{X = _X, Y = _Y, NpcId = 6622 , Range = 7},
--		QuestState{QuestId = 622, State = StateActive, UpdateInterval = 30},
--		} , 
--	Actions = { } , 
--	DeathActions = { }, 
--
--}

EndDefinition()

end


