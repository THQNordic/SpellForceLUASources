--> INFO SCHATTENKRIEGER 2_1 SPAWN 2

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--Erscheint erst wenn der Schattenring gefunden wurde

SpawnOnlyWhen
{
	X = 0 ,
	Y = 0 , 
	Clan = 0 , 
	UnitId = 0 , 
	NoSpawnEffect = FALSE , 
	Conditions = 
	{ 
		IsItemFlagTrue { Name = "PlayerHasItemSchattenring" , UpdateInterval = 10},		
	} , 
	Actions = 
	{

	} 
}

Respawn
{
WaitTime = 180,
UnitId = self ,
NoSpawnEffect = FALSE , 
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "MenschenMonumentGeclaimedP111" },
		IsGlobalFlagFalse { Name = "Spawnpoint2ZerstoertP111" },
	} , 
	Actions = 
	{
		SetGlobalFlagTrue { Name = "SchattenKrieger2_1Spawn2Bereit"},

	} , 
	DeathActions = 
	{
	
	}
}

 


EndDefinition()

end