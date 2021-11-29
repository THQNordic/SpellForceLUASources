function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{ 
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
			IsGlobalFlagTrue {Name = "g_P205_DariusUndDerMaskierte"},
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
			IsGlobalFlagTrue {Name = "g_P205_DariusUndDerMaskierteDespawn"},
	}
}

EndDefinition()

end
