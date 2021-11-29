--Feuerarmee 1d
--NpcId 6035-6041

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--Feuerarmee1, Truppe4
SpawnOnlyWhen
{
	X = 403 , Y = 248 , Clan = 0 , UnitId = 0 , NoSpawnEffect = TRUE , 
	Conditions = 
	{
		--IsGlobalFlagTrue{Name = "FeuerArmeeFälltEin", UpdateInterval = 30},
		IsGlobalTimeElapsed{Name = "CounterFeuerarmee1" , Seconds = 180, UpdateInterval = 20 },
		
	} , 
	Actions = 
	{ 
		Goto {X = 283, Y = 287, NpcId = 6035 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = 284, Y = 288, NpcId = 6036 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = 284, Y = 286, NpcId = 6037 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = 285, Y = 287, NpcId = 6038 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = 285, Y = 285, NpcId = 6039 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = 286, Y = 286, NpcId = 6040 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = 283, Y = 287, NpcId = 6041 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
	
	} ,
}




EndDefinition()

end