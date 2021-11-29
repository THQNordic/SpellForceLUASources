--> info: grim killable
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


-- For Final Cutscene
SpawnOnlyWhen
{
	X = 438, Y = 284, NoSpawnEffect = TRUE,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "KillableGrimRespawn", UpdateInterval = 10},
	},
	Actions =
	{
		SetNoFightFlagTrue {NpcId = _NpcId},
		SetGlobalFlagFalse {Name = "KillableGrimRespawn"},
	},
}

EndDefinition()

end
