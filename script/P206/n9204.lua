function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Gespawnt wird in der Cutscene, damit die Wachen zum killen laufen können
SpawnOnlyWhen
{
	X = _X, Y = _Y, 
	NoSpawnEffect = TRUE,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P206_SpawnPalastwachen", UpdateInterval = 2},
	},
	Actions =
	{
		SetNpcFlagTrue {Name = "c_P206_WacheSterben"}
	}
}

EndDefinition()

end
