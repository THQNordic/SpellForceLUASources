
--Succubus
--Beschwörer

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)



--Spawn, wenn Punkt nicht besetzt 
SpawnOnlyWhen
{
	X = 373, Y = 337, Clan = 0, UnitId = 0, NoSpawnEffect = FALSE,
	Conditions = 
	{ 
		IsGlobalFlagFalse {Name = "g_P202Punkt1Besetzt", UpdateInterval = 10},
		--FigureInRange {X = 373, Y = 277, NpcId = Avatar , Range = 3},
		--IsGlobalTimeElapsed { Name = "g_nP202_TimerEckenSpawning", Seconds = 3, UpdateInterval = 10 },
	} , 
	Actions = 
	{ 
		Goto {X = 371, Y = 324, NpcId = self, Range = 0, WalkMode = Walk, GotoMode = GotoContinuous},
	} 
}

--Respawn, solange Punkt nicht mit Held besetzt
Respawn
{
	WaitTime = 20, UnitId = self , Clan = 0 , Target = none , X = 373, Y = 337 , Chief = none, NoSpawnEffect = FALSE , 
	Conditions = 
	{ 
		IsGlobalFlagFalse {Name = "g_P202Punkt1Besetzt", UpdateInterval = 10},
	} , 
	Actions = 
	{
		Goto {X = 371, Y = 324, NpcId = self, Range = 0, WalkMode = Walk, GotoMode = GotoContinuous},
	} , 
	DeathActions = {} 
}


-- zum Beschwörerpunkt, wenn Fial tot
OnIdleGoHome
{
	X = _X, Y = _Y, Direction = 1, Range = 0, WalkRange = 2, WaitTime = 0, WalkMode = Run, GotoMode = GotoNormal,
	Conditions = 
	{
		IsGlobalFlagFalse  {Name = "g_P202SuccubusInMitte", UpdateInterval = 20},
		--IsGlobalFlagFalse {Name = "g_P202FialDargSpawn", UpdateInterval = 20},
		FigureDead {NpcId = 9038}
	},
	Actions = {},
	HomeActions = 
	{
		SetGlobalFlagTrue  {Name = "g_P202SuccubusInMitte"},
		SetNpcFlagFalse {Name = "P202Eventblocker"}
	},
	AbortConditions = 
	{
		--IsGlobalFlagTrue {Name = "g_P202FialDargSpawn", UpdateInterval = 20},
	},
	AbortActions = {},
}

--wenn nicht in Mitte
OnEvent
{
	NotInDialog = FALSE,
	Conditions = 
	{  
		Negated(FigureInRange {X = _X, Y = _Y, NpcId = self, Range = 0}),
		IsNpcFlagFalse {Name = "P202Eventblocker", UpdateInterval = 30}
	},
	Actions = 
	{  
		SetGlobalFlagFalse {Name = "g_P202SuccubusInMitte"},
		SetNpcFlagTrue {Name = "P202Eventblocker"}
	},
}

--wenn in Mitte geblieben
OnEvent
{
	NotInDialog = FALSE,
	Conditions = 
	{  
		FigureInRange {X = _X, Y = _Y, NpcId = self, Range = 0},
		IsGlobalFlagFalse {Name = "g_P202SuccubusInMitte"}
	},
	Actions = 
	{  
		SetGlobalFlagTrue {Name = "g_P202SuccubusInMitte"}
	},
}

EndDefinition()

end