function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
-- Wave of Ice Blade
SpawnOnlyWhen
{
	X = _X, Y = _Y, 
	NoSpawnEffect = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P203_BladesSpawnen", UpdateInterval = 2}
	},
}

Despawn
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P203_RohenNachHause"},
	}
}
EndDefinition()

end
