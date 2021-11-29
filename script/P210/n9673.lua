function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 2}
--!EDS ONIDLEGOHOME END

SpawnOnlyWhen
{
	X = _X, Y = _Y, NoSpawnEffect = FALSE,
	Conditions =
	{
		IsGlobalCounter{Name = "P210_Room2WrongTorchesLit", Value = 10, Operator = IsEqual},
	},
}

EndDefinition()

end
