function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnIdleGoHome
{
	X = 66,
	Y = 325,
	Direction = North,
	Range = 5 ,
	WalkRange = 10 ,
	WaitTime = 0 ,
	WalkMode = Walk ,
	GotoMode = GotoNormal,
	Conditions = 
	{
		ODER(TimeDay(),QuestState {QuestId = 652, State = StateSolved}),
		FigureInRange{ X = 46, Y = 326, NpcId = self , Range = 5},

	},
	Actions = 
	{
		
	},
	HomeActions = 
	{

	}

}

OnIdleGoHome
{
	X = 46,
	Y = 326,
	Direction = North,
	Range = 5 ,
	WalkRange = 10 ,
	WaitTime = 0 ,
	WalkMode = Walk ,
	GotoMode = GotoNormal,
	Conditions = 
	{
		ODER(TimeDay(),QuestState {QuestId = 652, State = StateSolved}),
		FigureInRange{ X = 66, Y = 325, NpcId = self , Range = 5},

	},
	Actions = 
	{
		
	},
	HomeActions = 
	{

	}

}

OnIdleGoHome
{
	X = 46,
	Y = 326,
	Direction = North,
	Range = 5 ,
	WalkRange = 10 ,
	WaitTime = 0 ,
	WalkMode = Walk ,
	GotoMode = GotoNormal,
	Conditions = 
	{
		ODER(TimeDay(),QuestState {QuestId = 652, State = StateSolved}),
		Negated(FigureInRange{ X = 46, Y = 326, NpcId = self , Range = 5}),
		Negated(FigureInRange{ X = 66, Y = 325, NpcId = self , Range = 5}),
	},
	Actions = 
	{
		
	},
	HomeActions = 
	{

	}

}


Respawn
{
	WaitTime = 1, 
	UnitId = self , 
	NoSpawnEffect = FALSE ,
	Conditions = 
	{
		ODER(TimeDay(),QuestState {QuestId = 652, State = StateSolved}),
	} , 
	Actions = 
	{
		
	} ,
	DeathActions = 
	{
	
	}
} 

OnIdleGoHome
{
X = 46,
Y = 326,
Direction = North,
Range = 3 ,
WalkRange = 10 ,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoContinous,

	Conditions = 
	{
		ODER(TimeDay(),QuestState {QuestId = 652, State = StateSolved}),
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		
		
	},

}

EndDefinition()

end
