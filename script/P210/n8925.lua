function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnToggleEvent 
{
	UpdateInterval = 15,
	OnConditions =
	{
		IsGlobalFlagTrue{Name = "P210Room8Torch11On", UpdateInterval = 15},
	},
	OnActions	=
	{
		SetEffect { Effect = "Torch",  Length = 0, TargetType = Object, NpcId = self},
		IncreaseGlobalCounter {Name = "g_P210_Room8TorchRiddle2Lit"},
	},
	OffConditions =
	{
		IsGlobalFlagFalse{Name = "P210Room8Torch11On", UpdateInterval = 15},
	},
	OffActions	=
	{
		StopEffect { X = _X, Y = _Y, TargetType = World },
		DecreaseGlobalCounter {Name = "g_P210_Room8TorchRiddle2Lit"},
	}
}

EndDefinition()

end
