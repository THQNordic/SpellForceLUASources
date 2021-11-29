function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	Conditions =
	{
		IsNpcFlagFalse {Name = "OneTimeSpawn"},
		IsGlobalFlagTrue {Name = "P103_KnochenquestSpawn"},
	},
	Actions =
	{
		SetNpcFlagTrue {Name = "OneTimeSpawn"},
	}
}

Respawn
{
		WaitTime = 1,
		UnitId = self ,
		Target = none ,
		X = startX ,
		Y = startY ,
		Chief = none,
		NoSpawnEffect = TRUE ,
		Conditions =
		{ 
			IsGlobalFlagFalse {Name = "P103_PlayeInRangeBoneOrc"}, 
		},
		Actions = {} ,
		DeathActions = { }
}

EndDefinition()

end
