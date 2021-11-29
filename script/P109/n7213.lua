function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

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
X = 49,
Y = 339,
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
