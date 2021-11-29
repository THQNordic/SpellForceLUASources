function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)



-- Kithar erscheinen vor dem Haupttor, wird für CutSzene verwendet

SpawnOnlyWhen
{
	
	NoSpawnEffect = FALSE , 
	
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "DialogSetriusEnded"},		
	} ,
	Actions = 
	{
	 	
	}
} 

OnOneTimeEvent
{
	Conditions = 
	{
		FigureAlive{ NpcId = 5575},
		IsGlobalTimeElapsed {Name = "WaitKitharSpawn", Seconds = 1, UpdateInterval = 10}, --Wenn alle kithar gespawned wurden
	},
	Actions = 
	{
		Follow{ Target = 5575 , NpcId = self},
	},
}

EndDefinition()

end
