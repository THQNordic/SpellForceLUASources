function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = 0, Y = 0, Clan = 0, UnitId = 0, NoSpawnEffect = FALSE, Target = none,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "202CSTestFlag"}
	} , 
	Actions = { } 
}

EndDefinition()

end
