--Spectre

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)



--Spawn, wenn Punkt nicht besetzt und Avatar in Range des Tempelarms kommt
SpawnOnlyWhen
{
	X = 295, Y = 278 , Clan = 0 , UnitId = 0 , NoSpawnEffect = FALSE ,
	Conditions = 
	{ 
		--IsGlobalFlagFalse{Name = "g_P202Spawnpunktebesetzt", UpdateInterval = 30},
		IsGlobalFlagFalse {Name = "g_P202Punkt2Besetzt", UpdateInterval = 10},
		--FigureInRange {X = 357, Y = 258, NpcId = Avatar , Range = 3},
		--IsGlobalTimeElapsed { Name = "g_nP202_TimerEckenSpawning", Seconds = 85, UpdateInterval = 10 },
	} , 
	Actions = 
	{ 
		Goto { X = _X, Y = _Y, NpcId = self , Range = 5 , WalkMode = Walk , GotoMode = GotoContinuous},
	} 
}

--Respawn, solange Punkt nicht mit Held besetzt
Respawn
{
	WaitTime = 20, UnitId = self , Clan = 0 , Target = none , X = 295, Y = 278, Chief = none, NoSpawnEffect = FALSE , 
	Conditions = 
	{ 
		
		--IsGlobalFlagFalse{Name = "g_P202Spawnpunktebesetzt", UpdateInterval = 30},
		IsGlobalFlagFalse {Name = "g_P202Punkt2Besetzt", UpdateInterval = 10},
	} , 
	Actions = 
	{
		Goto { X = _X, Y = _Y, NpcId = self , Range = 5 , WalkMode = Walk , GotoMode = GotoContinuous},
	} , 
	DeathActions = {} 
}


---- wenn in Mitte angekommen
--OnEvent
--{
--	Conditions =
--	{
--		FigureInRange {X = 367, Y = 256, NpcId = self , Range = 5},
--		
--	},
--	Actions = 
--	{
--		SetGlobalFlagTrue = {Name = "g_P202SpectreInMitte"},
--	},
--}



EndDefinition()
end
