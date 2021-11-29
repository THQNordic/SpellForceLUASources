function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

Respawn 
{
	WaitTime = 30,
	UnitId = self ,
	Clan = 27 ,
	Target = none ,
	X = startX ,
	Y = startY ,
	Chief = none,
	NoSpawnEffect = FALSE ,
	Conditions = 
	{
		IsGlobalFlagFalse {Name = "StopRespawnStarP110"},
	} ,
	Actions = 
	{
	
	} ,
	DeathActions =
	{
	
	} 
}


EndDefinition()

end
