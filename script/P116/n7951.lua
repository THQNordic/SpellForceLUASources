--> Round1

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	Conditions = 
	{
		IsGlobalTimeElapsed { Name = "Round1TimerP116", Seconds = Round1Timer},
		IsGlobalFlagTrue { Name = "Round1P116"},	
		
	} , 
	Actions = 
	{
		Goto{ X = 118, Y = 108, NpcId = self , Range = 5 , WalkMode = Run , GotoMode = GotoContinous},

	}
} 





EndDefinition()

end
