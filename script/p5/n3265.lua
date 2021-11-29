function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

SpawnOnlyWhen
{
	X = _X, Y = _Y,
	Conditions =
	{
		IsGlobalFlagTrue {Name =  "UtranSpawns"},
	},
	Actions =
	{
	}
}

EndDefinition()

end
