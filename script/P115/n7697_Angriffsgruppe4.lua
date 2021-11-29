function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)



SpawnOnlyWhen
{ 
	Conditions = 
	{
		IsGlobalFlagTrue{ Name = "P115_FirstStoneOff"},
 		IsGlobalFlagTrue{ Name = "P115_SecondStoneOff"},
 		IsGlobalFlagTrue{ Name = "P115_ThirdStoneOff"},
 		IsGlobalFlagTrue{ Name = "P115_FourthStoneOff"},
 		IsGlobalFlagTrue{ Name = "P115_FifthStoneOff"},
 		IsGlobalFlagTrue{ Name = "P115_SixthStoneOff"},
 		IsGlobalFlagTrue{ Name = "P115_SeventhStoneOff"},
 		IsGlobalFlagTrue{ Name = "P115_EigthStoneOff"},
 		IsGlobalFlagTrue{ Name = "P115_NinthStoneOff"},	
 		IsGlobalTimeElapsed { Name = "StartSpawningFinaleGruppe4P115", Seconds = 300},
 		FigureDead{NpcId = 7660},
		FigureDead{NpcId = 7436},
		FigureDead{NpcId = 7437},
		FigureDead{NpcId = 7659},
		FigureDead{NpcId = 6697},
		FigureDead{NpcId = 7661},
 		
 		
 		
	} ,
	Actions = 
	{
		ChangeRace {Race = 105},
		Goto{ X = 113, Y = 155, NpcId = self , Range = 10 , WalkMode = Run , GotoMode = GotoContinous},
	}
} 


EndDefinition()

end
