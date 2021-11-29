function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
 
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "DemonenErscheintP111", UpdateInterval = 1},

	} , 
	Actions = 
	{

	} 
}

Respawn
{
	WaitTime = 15,
	Conditions = 
	{
		FigureAlive {NpcId = 6991}, 

	} ,
	Actions = 
	{
	
	} 
}

EndDefinition()

end
