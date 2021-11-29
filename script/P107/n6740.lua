--INFO ZwergGeist1 Angriffswelle 1


function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

Respawn 
{
	WaitTime = 300,
	UnitId = self ,
	Clan = 27 ,
	Target = none ,
	X = startX ,
	Y = startY ,
	Chief = none,
	NoSpawnEffect = FALSE ,
	Conditions = 
	{
		IsGlobalFlagFalse {Name = "StopRespawnGeisterP107"},
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
