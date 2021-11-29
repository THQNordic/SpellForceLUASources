--> Round 8

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	Conditions = 
	{
		IsGlobalTimeElapsed { Name = "Round8TimerP116", Seconds = Round2Timer},
		IsGlobalFlagTrue { Name = "Round8P116"},	
		
	} , 
	Actions = 
	{
		Goto{ X = 129, Y = 96, NpcId = self , Range = 5 , WalkMode = Run , GotoMode = GotoContinous},
		SetGlobalFlagTrue { Name = "KriegerRound8Bereit"},
	}
} 


EndDefinition()

end