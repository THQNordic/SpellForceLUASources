function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

SpawnOnlyWhen
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "Hier kommt die Maus"},
	},
}

EndDefinition()

end
