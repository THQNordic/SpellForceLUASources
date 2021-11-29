--Spectre
--Beschwörer

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)



--Spawn, wenn Punkt nicht besetzt 
SpawnOnlyWhen
{
	X = 295, Y = 278, Clan = 0, UnitId = 0, NoSpawnEffect = FALSE ,
	Conditions = 
	{ 
		--IsGlobalFlagFalse{Name = "g_P202Spawnpunktebesetzt", UpdateInterval = 30},
		IsGlobalFlagFalse {Name = "g_P202Punkt2Besetzt", UpdateInterval = 10},
		
	} , 
	Actions = 
	{ 
		Goto { X = 303, Y = 275, NpcId = self, Range = 0, WalkMode = Walk, GotoMode = GotoContinuous},
	} 
}

--Respawn, solange Punkt nicht mit Held besetzt
Respawn
{
	WaitTime = 20, UnitId = self, Clan = 0, Target = none, X = 295, Y = 278 , Chief = none, NoSpawnEffect = FALSE , 
	Conditions = 
	{ 
		--IsGlobalFlagFalse{Name = "g_P202Spawnpunktebesetzt", UpdateInterval = 30},
		IsGlobalFlagFalse {Name = "g_P202Punkt2Besetzt", UpdateInterval = 10},
	} , 
	Actions = 
	{
		Goto { X = 303, Y = 275, NpcId = self, Range = 1, WalkMode = Walk, GotoMode = GotoContinuous},
	} , 
	DeathActions = {} 
}

-- zum Beschwörerpunkt, wenn Fial tot
OnIdleGoHome
{
	X = _X, Y = _Y, Direction = 0, Range = 0, WalkRange = 2, WaitTime = 0, WalkMode = Run, GotoMode = GotoNormal,
	Conditions = 
	{
		IsGlobalFlagFalse  {Name = "g_P202SpectreInMitte", UpdateInterval = 20},
		--IsGlobalFlagFalse {Name = "g_P202FialDargSpawn", UpdateInterval = 20},
		FigureDead {NpcId = 9038}
	},
	Actions = {},
	HomeActions = 
	{
		SetGlobalFlagTrue  {Name = "g_P202SpectreInMitte"},
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
		SetGlobalFlagFalse {Name = "g_P202SpectreInMitte"},
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
		IsGlobalFlagFalse {Name = "g_P202SpectreInMitte"}
	},
	Actions = 
	{  
		SetGlobalFlagTrue {Name = "g_P202SpectreInMitte"}
	},
}


EndDefinition()
end