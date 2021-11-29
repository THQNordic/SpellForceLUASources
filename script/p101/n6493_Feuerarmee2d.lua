--Feuerarmee 2d
-- spawnt, um Spieler von Map zu vetreiben


function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)      

--Feuerarmee2, Truppe4 Angriff Stadt Orks (6493-6508)
SpawnOnlyWhen
{
	X = 403 , Y = 248 , Clan = 0 , UnitId = 0 , NoSpawnEffect = FALSE , 
	Conditions = 
	{
		
		IsGlobalTimeElapsed{Name = "CounterFeuerarmee2" , Seconds = 12, UpdateInterval = 20 },
		
	} , 
	Actions = 
	{ 
		Goto {X = _X, Y = _Y, NpcId = 6493 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = _X, Y = _Y, NpcId = 6494 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = _X, Y = _Y, NpcId = 6495 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = _X, Y = _Y, NpcId = 6496 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = _X, Y = _Y, NpcId = 6497 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = _X, Y = _Y, NpcId = 6498 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = _X, Y = _Y, NpcId = 6499 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto {X = _X, Y = _Y, NpcId = 6500 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = _X, Y = _Y, NpcId = 6501 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto {X = _X, Y = _Y, NpcId = 6502 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous},
	    Goto {X = _X, Y = _Y, NpcId = 6503 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous},
	    Goto {X = _X, Y = _Y, NpcId = 6504 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous},
        Goto {X = _X, Y = _Y, NpcId = 6505 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous},
        Goto {X = _X, Y = _Y, NpcId = 6506 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous},
        Goto {X = _X, Y = _Y, NpcId = 6507 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
        Goto {X = _X, Y = _Y, NpcId = 6508 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous},
        
       }, 
}

EndDefinition()

end

        
        
