function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

Despawn
{
	PlayDeathAnim = FALSE ,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "EndCutsceneEntryP111"},
	} ,
	Actions = 
	{
		
	},
}

SpawnOnlyWhen
{
	X = 281, Y = 49, NoSpawnEffect = TRUE,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "CutsceneInitWeaponEntry", UpdateInterval = 30},
	},
	Actions = 
	{
		LookAtDirection {NpcId = self, Direction = East},
		SetGlobalFlagFalse {Name = "CutsceneInitWeaponEntry"},
	},
}

EndDefinition()

end
