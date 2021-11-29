--Feuerarmee 1b
--NpcId 5973-5979

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
--Position im Sumpf Richtung Echosümpfe beziehen
--Feuerarmee1, Truppe 2 
SpawnOnlyWhen
{
	X = 403 , Y = 248 , Clan = 0 , UnitId = 0 , NoSpawnEffect = TRUE , 
	Conditions = 
	{
		--IsGlobalFlagTrue{Name = "FeuerArmeeFälltEin", UpdateInterval = 30},
		IsGlobalTimeElapsed{Name = "CounterFeuerarmee1" , Seconds = 10, UpdateInterval = 20 },
		
	} , 
	Actions = 
	{ 
		Goto {X = 325, Y = 135, NpcId = 5973 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = 326, Y = 136, NpcId = 5974 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = 327, Y = 137, NpcId = 5975 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = 323, Y = 135, NpcId = 5976 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = 324, Y = 136, NpcId = 5977 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = 325, Y = 137, NpcId = 5978 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = 326, Y = 138, NpcId = 5979 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		
	} 
}


--Respawn
Respawn
{
	WaitTime = 30, UnitId = self , Clan = 0 , Target = none , X = 403 , Y = 248 , Chief = none, NoSpawnEffect = FALSE , 
	Conditions = 
	{
		IsGlobalFlagFalse{Name = "PlayerWarAufFleeToIce", UpdateInterval = 20},
		IsGlobalFlagFalse{ Name = "P101_DunkelElfBossKilled", UpdateInterval = 10},
	} , 
	Actions = 
	{ 
		Goto {X = _X, Y = _Y, NpcId = self, Range = 1, WalkMode = Run, GotoMode = GotoContinuous},

		--Goto {X = 325, Y = 135, NpcId = 5973, Range = 1, WalkMode = Run, GotoMode = GotoContinuous}, 
		--Goto {X = 326, Y = 136, NpcId = 5974, Range = 1, WalkMode = Run, GotoMode = GotoContinuous}, 
		--Goto {X = 327, Y = 137, NpcId = 5975, Range = 1, WalkMode = Run, GotoMode = GotoContinuous}, 
		--Goto {X = 323, Y = 135, NpcId = 5976, Range = 1, WalkMode = Run, GotoMode = GotoContinuous}, 
		--Goto {X = 324, Y = 136, NpcId = 5977, Range = 1, WalkMode = Run, GotoMode = GotoContinuous}, 
		--Goto {X = 325, Y = 137, NpcId = 5978, Range = 1, WalkMode = Run, GotoMode = GotoContinuous}, 
		--Goto {X = 326, Y = 138, NpcId = 5979, Range = 1, WalkMode = Run, GotoMode = GotoContinuous}, 
		
	} , 
	DeathActions = { },
}




EndDefinition()

end