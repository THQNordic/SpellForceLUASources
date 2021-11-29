function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnToggleEvent 
{
	UpdateInterval = 30,
	OnConditions =
	{
		IsGlobalFlagTrue { Name = "g_210_Room3Head2On" },
	},
	OnActions	=
	{
		--SetEffect { Effect = "Lightning",  Length = 0, TargetType = Object, NpcId = self},
		SetEffect { Effect = "Head",  Length = 0, TargetType = Object, NpcId = self},
	},
	OffConditions =
	{
		IsGlobalFlagFalse { Name = "g_210_Room3Head2On" },
	},
	OffActions	=
	{
		StopEffect { X = _X, Y = _Y, TargetType = World },
	}
}

EndDefinition()

end
