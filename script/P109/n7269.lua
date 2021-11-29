function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = 0 ,
	Y = 0 ,
	Clan = 0 ,
	UnitId = 0 ,
	NoSpawnEffect = FALSE , 
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "Kerze_nicht_geschafftP109"},	
	} , 
	Actions = 
	{
	
	} 
}

EndDefinition()

end
