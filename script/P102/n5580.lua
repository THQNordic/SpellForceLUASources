function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)



SpawnOnlyWhen
{
	
	NoSpawnEffect = FALSE , 
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "DialogSetriusEnded"},	
	} ,
	Actions = 
	{
	 	SetGlobalTimeStamp{ Name = "WaitKitharSpawn"  }, --Wartet bis alle Kithar gespawned wurden
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
