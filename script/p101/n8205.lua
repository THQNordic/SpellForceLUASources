function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = 0 , Y = 0 , Clan = 0 , UnitId = 0 , NoSpawnEffect = FALSE ,
	Conditions = 
	{ 
		FigureInRange{X = 171, Y = 236, NpcId = Avatar , Range = 5},
	} , 
	Actions = 
	{
		AttackTarget{Target = Avatar, NpcId = self, FriendlyFire = FALSE},
	} 
}
	
	
EndDefinition()

end
