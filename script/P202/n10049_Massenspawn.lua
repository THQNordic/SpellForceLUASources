function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{
	X = _X , Y = _Y , Clan = 0 , UnitId = 0 , NoSpawnEffect = TRUE , 
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "gt_P202SpawnwellenTimer", Seconds = 2, UpdateInterval = 10},
	} , 
	Actions = 
	{
	 	Goto {X = 431, Y = 341, NpcId = self, Range = 10, GotoMode = GotoContinuous},
	}
}

Respawn
{
	WaitTime = 5, UnitId = self , Clan = 0 , Target = none , X = startX , Y = startY , Chief = none, NoSpawnEffect = FALSE , 
	Conditions = {} , 
	Actions = 
	{
		Goto {X = 431, Y = 341, NpcId = self, Range = 10},
	} , 
	DeathActions = { }
}




EndDefinition()

end
