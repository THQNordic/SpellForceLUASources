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


EndDefinition()

end
