function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnToggleEvent 
{
	UpdateInterval = 10,
	OnConditions =
	{
		PlayerUnitInRange{ X = _X, Y = _Y, Range = 5, FigureType = FigureAll},
	},
	OnActions	=
	{
		--SetEffect { Effect = "Lightning",  Length = 0, TargetType = Object, NpcId = self},
		SetEffect { Effect = "Head",  Length = 0, TargetType = Object, NpcId = self},
		SetGlobalFlagTrue { Name = "g_210_Room3Head4On" },
	},
	OffConditions =
	{
		Negated(PlayerUnitInRange{ X = _X, Y = _Y,  Range = 5, FigureType = FigureAll}),
	},
	OffActions	=
	{
		StopEffect { X = _X, Y = _Y, TargetType = World },
		SetGlobalFlagFalse { Name = "g_210_Room3Head4On" },
	}
}

EndDefinition()

end
