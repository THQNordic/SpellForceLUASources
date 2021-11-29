function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


-- Kithar erscheinen vor dem Haupttor, wird für CutSzene verwendet

SpawnOnlyWhen
{
	 --Kitharboss 
	NoSpawnEffect = FALSE, 
	
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "DialogSetriusEnded"},	
	},
	Actions = 
	{
	 	

	}
} 

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "WaitKitharSpawn", Seconds = 1, UpdateInterval = 10}, --Wenn alle kithar gespawned wurden
	},
	Actions =
	{
		Goto {X = 358, Y = 109, NpcId = self , Range = 5 , WalkMode = Run , GotoMode = GotoNormal , XRand = 0 , YRand = 0}, --Kitharanführer
	}
} 

EndDefinition()

end
