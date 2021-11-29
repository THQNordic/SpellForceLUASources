--> INFO SCHATTENKRIEGER 3_3 SPAWN 1

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
WaitTime = 120,
UnitId = self ,
NoSpawnEffect = FALSE , 
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "MenschenMonumentGeclaimedP111" },
		IsGlobalFlagFalse { Name = "Spawnpoint1ZerstoertP111" },
	} , 
	Actions = 
	{
		SetGlobalFlagTrue { Name = "SchattenKrieger3_3Spawn1Bereit"},

	} , 
	DeathActions = 
	{
	
	}
}


EndDefinition()

end
