function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{
	X = _X , Y = _Y , Clan = 0 , UnitId = 0 , NoSpawnEffect = FALSE , 
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "gt_P202SpawnwellenTimer", Seconds = 1, UpdateInterval = 20},
	} , 
	Actions = 
	{
	 	Goto {X = 362+random(6)-3, Y = 251+random(6)-3, NpcId = self, Range = 8},
	 	
	}
}

Respawn
{
	WaitTime = 5, UnitId = self , Clan = 0 , Target = none , X = startX , Y = startY , Chief = none, NoSpawnEffect = FALSE , 
	Conditions = {} , 
	Actions = 
	{
		Goto {X = 362+random(6)-3, Y = 251+random(6)-3, NpcId = self, Range = 8},
	} , 
	DeathActions = { }
}


EndDefinition()

end
