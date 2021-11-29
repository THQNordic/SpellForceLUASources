--> Round 5

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	Conditions = 
	{
		IsGlobalTimeElapsed { Name = "Round5TimerP116", Seconds = Round2Timer},
		IsGlobalFlagTrue { Name = "Round5P116"},	
		
	} , 
	Actions = 
	{
		Goto{ X = 129, Y = 130, NpcId = self , Range = 5 , WalkMode = Run , GotoMode = GotoContinous},
		
	}
} 


EndDefinition()

end

