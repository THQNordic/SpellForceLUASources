function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)


-- WICHTIG FUER DIE CUTSCENE MIT URIAS -------------------------
SpawnOnlyWhen
{
	X = _X , Y = _Y,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "UriasSpawns"},
	},
}


Despawn
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "SkeletonsDespawn"},
	},
}
----------------------------------------------------------------


EndDefinition()

end
