function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

OnMulandirMedusa
{
	Path = {
		[1] = {X = _X, Y = _Y},
		[2] = {X = 302, Y = 273},
		[3] = {X = 300, Y = 238},
		[4] = {X = 291, Y = 245},
	},
}

SpawnOnlyWhen
{
	X = _X, Y = _Y,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "MedusaSpawnEnd"},
	},
}

EndDefinition()

end
