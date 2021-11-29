--Feuerarmee 2a
-- spawnt, um Spieler von Map zu vetreiben

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--Feuerarmee2, Truppe1 Angriff NO (6459-6478)
SpawnOnlyWhen
{
	X = 403 , Y = 248 , Clan = 0 , UnitId = 0 , NoSpawnEffect = FALSE , 
	Conditions = 
	{
		
		IsGlobalTimeElapsed{Name = "CounterFeuerarmee2" , Seconds = 1, UpdateInterval = 20 },
		
	} , 
	Actions = 
	{ 
		--Trupp1
		Goto {X = 420, Y = 443, NpcId = 6459, Range = 1, WalkMode = Run, GotoMode = GotoContinuous}, 
		Goto {X = 420, Y = 443, NpcId = 6460, Range = 1, WalkMode = Run, GotoMode = GotoContinuous}, 
		Goto {X = 420, Y = 443, NpcId = 6461, Range = 1, WalkMode = Run, GotoMode = GotoContinuous}, 
		Goto {X = 423, Y = 436, NpcId = 6462, Range = 1, WalkMode = Run, GotoMode = GotoContinuous}, 
		Goto {X = 423, Y = 436, NpcId = 6463, Range = 1, WalkMode = Run, GotoMode = GotoContinuous}, 
		Goto {X = 415, Y = 431, NpcId = 6464, Range = 1, WalkMode = Run, GotoMode = GotoContinuous}, 
		Goto {X = 415, Y = 431, NpcId = 6465, Range = 1, WalkMode = Run, GotoMode = GotoContinuous}, 
		Goto {X = 415, Y = 431, NpcId = 6466, Range = 1, WalkMode = Run, GotoMode = GotoContinuous}, 
		Goto {X = 415, Y = 431, NpcId = 6467, Range = 1, WalkMode = Run, GotoMode = GotoContinuous}, 
		Goto {X = 403, Y = 427, NpcId = 6468, Range = 1, WalkMode = Run, GotoMode = GotoContinuous}, 
		Goto {X = 403, Y = 427, NpcId = 6469, Range = 1, WalkMode = Run, GotoMode = GotoContinuous}, 
		Goto {X = 403, Y = 427, NpcId = 6470, Range = 1, WalkMode = Run, GotoMode = GotoContinuous}, 
		Goto {X = 394, Y = 476, NpcId = 6471, Range = 1, WalkMode = Run, GotoMode = GotoContinuous}, 
		Goto {X = 394, Y = 476, NpcId = 6472, Range = 1, WalkMode = Run, GotoMode = GotoContinuous}, 
		Goto {X = 394, Y = 476, NpcId = 6473, Range = 1, WalkMode = Run, GotoMode = GotoContinuous}, 
		Goto {X = 363, Y = 472, NpcId = 6474, Range = 1, WalkMode = Run, GotoMode = GotoContinuous}, 
		Goto {X = 363, Y = 472, NpcId = 6475, Range = 1, WalkMode = Run, GotoMode = GotoContinuous}, 
		Goto {X = 363, Y = 472, NpcId = 6476, Range = 1, WalkMode = Run, GotoMode = GotoContinuous}, 
		Goto {X = 359, Y = 456, NpcId = 6477, Range = 1, WalkMode = Run, GotoMode = GotoContinuous}, 
		Goto {X = 359, Y = 456, NpcId = 6478, Range = 1, WalkMode = Run, GotoMode = GotoContinuous}, 

		     
		     
	}        
}            


--Wenn alle Eiselfgebäude zerstört, ab in die Orkstadt         
OnIdleGoHome
{
	X = _X, Y = _Y, Direction = 2, Range = 2 , WalkRange = 5 , WaitTime = 0 , WalkMode = Run , GotoMode = GotoNormal,
	Conditions = 
	{
		Negated(BuildingInRange{X = 364, Y = 460, Range = 3 , Owner = OwnerNpc , BuildingId = 0 , UpdateInterval = 60}),
		Negated(BuildingInRange{X = 364, Y = 474, Range = 3 , Owner = OwnerNpc , BuildingId = 0 , UpdateInterval = 60}),
		Negated(BuildingInRange{X = 371, Y = 481, Range = 3 , Owner = OwnerNpc , BuildingId = 0 , UpdateInterval = 60}),
		Negated(BuildingInRange{X = 381, Y = 485, Range = 3 , Owner = OwnerNpc , BuildingId = 0 , UpdateInterval = 60}),
		Negated(BuildingInRange{X = 404, Y = 481, Range  = 3 , Owner = OwnerNpc , BuildingId = 0 , UpdateInterval = 60}),
		                                                  
		Negated(BuildingInRange{X = 432, Y = 435, Range = 3 , Owner = OwnerNpc , BuildingId = 0 , UpdateInterval = 60}),
		Negated(BuildingInRange{X = 434, Y = 446, Range = 3 , Owner = OwnerNpc , BuildingId = 0 , UpdateInterval = 60}),
		Negated(BuildingInRange{X = 429, Y = 419, Range = 3 , Owner = OwnerNpc , BuildingId = 0 , UpdateInterval = 60}),
		Negated(BuildingInRange{X = 411, Y = 420, Range = 3 , Owner = OwnerNpc , BuildingId = 0 , UpdateInterval = 60}),
		
		
	},
	Actions = {  },
	HomeActions = {  },
}



EndDefinition()

end