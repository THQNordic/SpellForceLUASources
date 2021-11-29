function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Actions =
	{
		SetNpcTimeStamp { Name = "MyTurnTimer" },
	},
}

OnEvent
{
	Conditions =
	{
		IsNpcTimeElapsed {  Name = "MyTurnTimer", Seconds = 6 },
		IsGlobalCounter { Name = "g_P210_Room8Head8Counter", Value = 0, Operator = IsEqual},
		IsGlobalFlagFalse{ Name = "g_P210_Room8PlayerInHead8Trap"},
	},
	Actions =
	{
		ChangeObject{ X = _X, Y = _Y, Object = 3143, Angle = 135}, -- Kopf schaut rechts oben
		--RemoveObject{ X = _X, Y = _Y, Object = 3143},
		--PlaceObject{ X = _X, Y = _Y, Object = 3143, Angle = 135},
		SetNpcTimeStamp { Name = "MyTurnTimer" },
		IncreaseGlobalCounter { Name = "g_P210_Room8Head8Counter"},
		StopEffect { X = 252, Y = 175, TargetType = World },
		SetEffect { Effect = "Lightning", X = 257, Y = 175, Length = 0, TargetType = World},
	}
}

OnEvent
{
	Conditions =
	{
		IsNpcTimeElapsed {  Name = "MyTurnTimer", Seconds = 6 },
		IsGlobalCounter { Name = "g_P210_Room8Head8Counter", Value = 1, Operator = IsEqual},
		IsGlobalFlagFalse{ Name = "g_P210_Room8PlayerInHead8Trap"},
	},
	Actions =
	{
		ChangeObject{ X = _X, Y = _Y, Object = 3143, Angle = 90}, -- Kopf schaut nach rechts
		--RemoveObject{ X = _X, Y = _Y, Object = 3143},
		--PlaceObject{ X = _X, Y = _Y, Object = 3143, Angle = 90},
		SetNpcTimeStamp { Name = "MyTurnTimer" },
		IncreaseGlobalCounter { Name = "g_P210_Room8Head8Counter"},
		StopEffect { X = 257, Y = 175, TargetType = World },
		SetEffect { Effect = "Lightning", X = 257, Y = 170, Length = 0, TargetType = World},
	}
}

OnEvent
{
	Conditions =
	{
		IsNpcTimeElapsed {  Name = "MyTurnTimer", Seconds = 6 },
		IsGlobalCounter { Name = "g_P210_Room8Head8Counter", Value = 2, Operator = IsEqual},
		IsGlobalFlagFalse{ Name = "g_P210_Room8PlayerInHead8Trap"},
	},
	Actions =
	{
		ChangeObject{ X = _X, Y = _Y, Object = 3143, Angle = 45}, -- Kopf schaut nach rechts unten
		--RemoveObject{ X = _X, Y = _Y, Object = 3143},
		--PlaceObject{ X = _X, Y = _Y, Object = 3143, Angle = 45},
		SetNpcTimeStamp { Name = "MyTurnTimer" },
		IncreaseGlobalCounter { Name = "g_P210_Room8Head8Counter"},
		StopEffect { X = 257, Y = 170, TargetType = World },
		SetEffect { Effect = "Lightning", X = 257, Y = 165, Length = 0, TargetType = World},
	}
}

OnEvent
{
	Conditions =
	{
		IsNpcTimeElapsed {  Name = "MyTurnTimer", Seconds = 6 },
		IsGlobalCounter { Name = "g_P210_Room8Head8Counter", Value = 3, Operator = IsEqual},
		IsGlobalFlagFalse{ Name = "g_P210_Room8PlayerInHead8Trap"},
	},
	Actions =
	{
		ChangeObject{ X = _X, Y = _Y, Object = 3143, Angle = 0}, -- Kopf schaut unten
		--RemoveObject{ X = _X, Y = _Y, Object = 3143},
		--PlaceObject{ X = _X, Y = _Y, Object = 3143, Angle = 0},
		SetNpcTimeStamp { Name = "MyTurnTimer" },
		IncreaseGlobalCounter { Name = "g_P210_Room8Head8Counter"},
		StopEffect { X = 257, Y = 165, TargetType = World },
		SetEffect { Effect = "Lightning", X = 252, Y = 165, Length = 0, TargetType = World},
	}
}


OnEvent
{
	Conditions =
	{
		IsNpcTimeElapsed {  Name = "MyTurnTimer", Seconds = 6 },
		IsGlobalCounter { Name = "g_P210_Room8Head8Counter", Value = 4, Operator = IsEqual},
		IsGlobalFlagFalse{ Name = "g_P210_Room8PlayerInHead8Trap"},
	},
	Actions =
	{
		ChangeObject{ X = _X, Y = _Y, Object = 3143, Angle = 315}, -- Kopf schaut unten links
		--RemoveObject{ X = _X, Y = _Y, Object = 3143},
		--PlaceObject{ X = _X, Y = _Y, Object = 3143, Angle = 315},
		SetNpcTimeStamp { Name = "MyTurnTimer" },
		IncreaseGlobalCounter { Name = "g_P210_Room8Head8Counter"},
		StopEffect { X = 252, Y = 165, TargetType = World },
		SetEffect { Effect = "Lightning", X = 247, Y = 165, Length = 0, TargetType = World},
	}
}

OnEvent
{
	Conditions =
	{
		IsNpcTimeElapsed {  Name = "MyTurnTimer", Seconds = 6 },
		IsGlobalCounter { Name = "g_P210_Room8Head8Counter", Value = 5, Operator = IsEqual},
		IsGlobalFlagFalse{ Name = "g_P210_Room8PlayerInHead8Trap"},
	},
	Actions =
	{
		ChangeObject{ X = _X, Y = _Y, Object = 3143, Angle = 270}, -- Kopf schaut links
		--RemoveObject{ X = _X, Y = _Y, Object = 3143},
		--PlaceObject{ X = _X, Y = _Y, Object = 3143, Angle = 270},
		SetNpcTimeStamp { Name = "MyTurnTimer" },
		IncreaseGlobalCounter { Name = "g_P210_Room8Head8Counter"},
		StopEffect { X = 247, Y = 165, TargetType = World },
		SetEffect { Effect = "Lightning", X = 247, Y = 170, Length = 0, TargetType = World},
	}
}

OnEvent
{
	Conditions =
	{
		IsNpcTimeElapsed {  Name = "MyTurnTimer", Seconds = 6 },
		IsGlobalCounter { Name = "g_P210_Room8Head8Counter", Value = 6, Operator = IsEqual},
		IsGlobalFlagFalse{ Name = "g_P210_Room8PlayerInHead8Trap"},
	},
	Actions =
	{
		ChangeObject{ X = _X, Y = _Y, Object = 3143, Angle = 225}, -- Kopf schaut links oben
		--RemoveObject{ X = _X, Y = _Y, Object = 3143},
		--PlaceObject{ X = _X, Y = _Y, Object = 3143, Angle = 225},
		SetNpcTimeStamp { Name = "MyTurnTimer" },
		IncreaseGlobalCounter { Name = "g_P210_Room8Head8Counter"},
		StopEffect { X = 247, Y = 170, TargetType = World },
		SetEffect { Effect = "Lightning", X = 247, Y = 175, Length = 0, TargetType = World},
	}
}

OnEvent
{
	Conditions =
	{
		IsNpcTimeElapsed {  Name = "MyTurnTimer", Seconds = 6 },
		IsGlobalCounter { Name = "g_P210_Room8Head8Counter", Value = 7, Operator = IsEqual},
		IsGlobalFlagFalse{ Name = "g_P210_Room8PlayerInHead8Trap"},
	},
	Actions =
	{
		ChangeObject{ X = _X, Y = _Y, Object = 3143, Angle = 180}, -- Kopf schaut oben
		--RemoveObject{ X = _X, Y = _Y, Object = 3143},
		--PlaceObject{ X = _X, Y = _Y, Object = 3143, Angle = 180},
		SetNpcTimeStamp { Name = "MyTurnTimer" },
		ResetGlobalCounter { Name = "g_P210_Room8Head8Counter"},
		StopEffect { X = 247, Y = 175, TargetType = World },
		SetEffect { Effect = "Lightning", X = 252, Y = 175, Length = 0, TargetType = World},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{ Name = "g_P210_Room8PlayerInHead8Trap"},
	},
	Actions =
	{
		StopEffect { X = 252, Y = 175, TargetType = World },
		StopEffect { X = 257, Y = 165, TargetType = World },
		StopEffect { X = 257, Y = 170, TargetType = World },
		StopEffect { X = 257, Y = 165, TargetType = World },
		StopEffect { X = 252, Y = 165, TargetType = World },
		StopEffect { X = 247, Y = 165, TargetType = World },
		StopEffect { X = 247, Y = 170, TargetType = World },
		StopEffect { X = 247, Y = 175, TargetType = World },
	},
}

EndDefinition()

end
