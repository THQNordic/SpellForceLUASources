function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--	SpawnOnlyWhen
--	{
--		X = _X, 
--		Y = _Y, 
--		NoSpawnEffect = TRUE,
--		Conditions = 
--		{
--			IsGlobalFlagTrue {Name = "g_p207_Diese_Flag_Wird_Niemals_Wahr_Werden"},
--		},
--		Actions = 
--		{
--		},
--	}

Despawn
{
	Conditions = 
	{
	},
	Actions = 
	{
	},
}

EndDefinition()

end
