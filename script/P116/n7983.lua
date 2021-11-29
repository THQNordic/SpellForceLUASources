--> Round3

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	Conditions = 
	{
		IsGlobalTimeElapsed { Name = "Round3TimerP116", Seconds = Round1Timer},
		IsGlobalFlagTrue { Name = "Round3P116"},	
		
	} , 
	Actions = 
	{
		Goto{ X = 129, Y = 96, NpcId = self , Range = 5 , WalkMode = Run , GotoMode = GotoContinous},
		SetGlobalFlagTrue { Name = "KriegerRound3Bereit"},
	}
} 





EndDefinition()

end
