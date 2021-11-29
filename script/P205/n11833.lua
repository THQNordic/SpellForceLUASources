function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{ 
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
			IsGlobalFlagTrue {Name = "g_P205_DariusLiestBrief"},
	},
	Actions = 
	{

	},
}

Despawn
{
	PlayDeathAnim = FALSE,

	Conditions =
	{
			IsGlobalFlagTrue {Name = "g_P205_DariusLiestBriefDespawn"},
	}
}

EndDefinition()

end