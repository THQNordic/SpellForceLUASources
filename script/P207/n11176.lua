function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X, 
	Y = _Y, 
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P207_Undead_Rohens_Geist_Spawn", UpdateInterval = 10},
	},
	Actions = 
	{	
		SetEffect {Effect = "OccludeWhite", Length = 3000},		
	},
}

Despawn
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P207_Undead_Rohens_Geist_Despawn", UpdateInterval = 10},
	},
	Actions = 
	{	
	},
}

EndDefinition()

end
