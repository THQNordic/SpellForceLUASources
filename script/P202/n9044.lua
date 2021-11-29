--dofile("script/p202/n0_SpawnEcke1.lua")
--Succubus

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)



--Spawn, wenn Punkt nicht besetzt und Avatar in Range des Tempelarms kommt
SpawnOnlyWhen
{
	X = 373, Y = 337, Clan = 0, UnitId = 0, NoSpawnEffect = FALSE ,
	Conditions = 
	{ 
		IsGlobalFlagFalse {Name = "g_P202Punkt1Besetzt", UpdateInterval = 10},
		--FigureInRange {X = 373, Y = 277, NpcId = Avatar , Range = 3},
		--IsGlobalTimeElapsed { Name = "g_nP202_TimerEckenSpawning", Seconds = 55, UpdateInterval = 10 },
	} , 
	Actions = 
	{ 
		Goto { X = _X, Y = _Y, NpcId = self, Range = 5, WalkMode = Walk, GotoMode = GotoContinuous},
	} 
}

--Respawn, solange Punkt nicht mit Held besetzt
Respawn
{
	WaitTime = 200, UnitId = self, Clan = 0, Target = none, X = 373, Y = 337, Chief = none, NoSpawnEffect = FALSE, 
	Conditions = 
	{ 
		IsGlobalFlagFalse {Name = "g_P202Punkt1Besetzt", UpdateInterval = 10},
	} , 
	Actions = 
	{
		Goto { X = _X, Y = _Y, NpcId = self, Range = 5, WalkMode = Walk, GotoMode = GotoContinuous},
	} , 
	DeathActions = {} 
}


---- wenn in Mitte angekommen
--OnEvent
--{
--	Conditions =
--	{
--		FigureInRange {X = 375, Y = 265, NpcId = self , Range = 5},
--		
--	},
--	Actions = 
--	{
--		SetGlobalFlagTrue = {Name = "g_P202SuccubusInMitte"},
--	},
--}


EndDefinition()

end