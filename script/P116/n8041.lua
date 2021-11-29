--> Round 9

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	Conditions = 
	{
		IsGlobalTimeElapsed { Name = "Round9TimerP116", Seconds = Round2Timer},
		IsGlobalFlagTrue { Name = "Round9P116"},	
		
	} , 
	Actions = 
	{
		Goto{ X = 129, Y = 130, NpcId = self , Range = 5 , WalkMode = Run , GotoMode = GotoContinous},
		
	}
} 


EndDefinition()

end