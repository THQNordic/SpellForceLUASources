--> Round2

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	Conditions = 
	{
		IsGlobalTimeElapsed { Name = "Round2TimerP116", Seconds = Round2Timer},
		IsGlobalFlagTrue { Name = "Round2P116"},	
		
	} , 
	Actions = 
	{
		Goto{ X = 118, Y = 108, NpcId = self , Range = 5 , WalkMode = Run , GotoMode = GotoContinous},
		SetGlobalFlagTrue { Name = "KriegerRound2Bereit"},
	}
} 




EndDefinition()

end