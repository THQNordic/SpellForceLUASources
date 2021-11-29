function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--Umspawn in der Boten Cutszene
SpawnOnlyWhen
{
	X = 231, 
	Y = 320,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209KillableUriasSpawn", UpdateInterval = 10},		
	}, 
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_sP209UriasKillableGesetzt"},
	}
}






EndDefinition()

end
