function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

Respawn 
{
	WaitTime = 45,
	UnitId = self ,
	Clan = 24 ,
	Target = none ,
	X = startX ,
	Y = startY ,
	Chief = none,
	NoSpawnEffect = FALSE ,
	Conditions = 
	{
		IsGlobalFlagFalse {Name = "StopRespawnSunP110"},
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
