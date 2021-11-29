--Feuerarmee 1c
--NpcId 5980-5986

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
--gehen in die Stadt (Teil HQ)
--Feuerarmee1, Truppe3
SpawnOnlyWhen
{
	X = 403 , Y = 248 , Clan = 0 , UnitId = 0 , NoSpawnEffect = TRUE , 
	Conditions = 
	{
		--IsGlobalFlagTrue{Name = "FeuerArmeeFälltEin", UpdateInterval = 30},
		IsGlobalTimeElapsed{Name = "CounterFeuerarmee1" , Seconds = 200, UpdateInterval = 20 },
		
	} , 
	Actions = 
	{ 
		Goto {X = 256, Y = 276, NpcId = 5980 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = 256, Y = 278, NpcId = 5981 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = 255, Y = 276, NpcId = 5982 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = 255, Y = 278, NpcId = 5983 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = 254, Y = 276, NpcId = 5984 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = 254, Y = 278, NpcId = 5985 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = 258, Y = 276, NpcId = 5986 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		
	} 
}


EndDefinition()

end