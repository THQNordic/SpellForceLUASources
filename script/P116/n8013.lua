--> Round 6

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	Conditions = 
	{
		IsGlobalTimeElapsed { Name = "Round6TimerP116", Seconds = Round2Timer},
		IsGlobalFlagTrue { Name = "Round6P116"},	
		
	} , 
	Actions = 
	{
		Goto{ X = 129, Y = 130, NpcId = self , Range = 5 , WalkMode = Run , GotoMode = GotoContinous},
		
	}
} 


EndDefinition()

end
