--INFO: Spieler

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--dofile("script/p101/n6973_Ork_Fuﬂball.lua")

SpawnOnlyWhen
{
	X = 248 , Y = 282 , Clan = 0 , UnitId = 0 , NoSpawnEffect = TRUE ,
	Conditions = 
	{
		IsGlobalFlagTrue{ Name = "P101_DunkelElfBossKilled", UpdateInterval = 30}
	},
	Actions = 
	{
		Goto {X = _X , Y = _Y , NpcId = self , Range = 1 , WalkMode = Run , GotoMode = GotoForced}, --Orks auf Fuﬂballfeld
	} 
}

Respawn
{
	WaitTime = 1, UnitId = self , Clan = 0 , Target = none , X = startX , Y = startY , Chief = none, NoSpawnEffect = TRUE , 
	Conditions = 
	{
		IsGlobalFlagFalse{Name = "P101GoblinsGewinnen", UpdateInterval = 10},
	}, 
	Actions = 
	{
		--SetGlobalFlagFalse{Name = "P101SpielLaeuft"},
		--IncreaseGlobalCounter{Name = "P101GoblinBallCounter", Step = 1},
		Goto {X = _X , Y = _Y , NpcId = self , Range = 0 , WalkMode = Run , GotoMode = GotoForced}, 
	}, 
	DeathActions = {}
}


OnIdleGoHome
{
	X = _X, Y = _Y, Direction = 2, Range = 0 , WalkRange = 10 , WaitTime = 0 , WalkMode = Walk , GotoMode = GotoNormal,
	Conditions = 
	{
		IsGlobalFlagFalse {Name = "P101GoblinsGewinnen", UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "P101OrksGewinnen", UpdateInterval = 10},
	},
	Actions = {},
	HomeActions = {},
	AbortConditions = 
	{
	ODER(
		IsGlobalFlagTrue {Name = "P101GoblinsGewinnen", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "P101OrksGewinnen", UpdateInterval = 10}
		)
	},
	AbortActions = { },
}


EndDefinition()

end