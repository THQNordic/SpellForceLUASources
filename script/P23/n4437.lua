function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = 287, Y = 331,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "RiftBackGateOpen"},
	},
}

OnIdleGoHome
{
	X = _X, Y = _Y, Direction = random (0,7),
	Conditions =
	{
	},
	HomeActions =
	{
		HoldPosition{},
	}
}

EndDefinition()

end
