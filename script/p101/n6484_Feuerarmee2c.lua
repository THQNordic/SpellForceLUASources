--Feuerarmee 2c
-- spawnt, um Spieler von Map zu vetreiben

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--Feuerarmee2, Truppe3 Angriff Stadt Troll (6484-6492)
SpawnOnlyWhen
{
	X = 403 , Y = 248 , Clan = 0 , UnitId = 0 , NoSpawnEffect = FALSE , 
	Conditions = 
	{
		
		IsGlobalTimeElapsed{Name = "CounterFeuerarmee2" , Seconds = 8, UpdateInterval = 20 },
		
	} , 
	Actions = 
	{ 
		Goto {X = _X, Y = _Y,  NpcId = 6484 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = _X, Y = _Y,  NpcId = 6485 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = _X, Y = _Y,  NpcId = 6486 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = _X, Y = _Y,  NpcId = 6487 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = _X, Y = _Y,  NpcId = 6488 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = _X, Y = _Y,  NpcId = 6489 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = _X, Y = _Y,  NpcId = 6490 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = _X, Y = _Y,  NpcId = 6491 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto {X = _X, Y = _Y,  NpcId = 6492 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous},
	} ,
}      
             
OnIdleGoHome
{
	X = _X, Y = _Y, Direction = 6, Range = 2 , WalkRange = 10 , WaitTime = 0 , WalkMode = Run , GotoMode = GotoNormal,
	Conditions = { },
	Actions = {  },
	HomeActions = {  },
}

--Flucht: Wenn Statthalter tot 
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 60 ,
	Conditions = 
	{ 
		IsGlobalFlagTrue{ Name = "P101_DunkelElfBossKilled", UpdateInterval = 10}
	},
	Actions = 
	{ 
		Goto {X = 402, Y = 248, NpcId = self , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous , XRand = 0 , YRand = 0},
	},
}	


Despawn
{
	PlayDeathAnim = FALSE ,
	Conditions =
	{ 
		FigureInRange{X = 402, Y = 248, NpcId = self , Range = 2},
	} , 
	Actions = {}
}
EndDefinition()

end
     
        
