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
		IsNpcTimeElapsed {  Name = "MyTurnTimer", Seconds = 10 },
		IsGlobalCounter { Name = "g_P210_Room8Head4Counter", Value = 0, Operator = IsEqual},
		IsGlobalFlagFalse{ Name = "g_P210_Room8PlayerInHead4Trap"},
	},
	Actions =
	{
		ChangeObject{ X = _X, Y = _Y, Object = 3143, Angle = 180}, -- Kopf schaut oben
		--RemoveObject{ X = _X, Y = _Y, Object = 3143},
		--PlaceObject{ X = _X, Y = _Y, Object = 3143, Angle = 180},
		SetNpcTimeStamp { Name = "MyTurnTimer" },
		IncreaseGlobalCounter { Name = "g_P210_Room8Head4Counter"},
		StopEffect { X = 197, Y = 165, TargetType = World },
		SetEffect { Effect = "Lightning", X = 192, Y = 170, Length = 0, TargetType = World},
	}
}

OnEvent
{
	Conditions =
	{
		IsNpcTimeElapsed {  Name = "MyTurnTimer", Seconds = 10 },
		IsGlobalCounter { Name = "g_P210_Room8Head4Counter", Value = 1, Operator = IsEqual},
		IsGlobalFlagFalse{ Name = "g_P210_Room8PlayerInHead4Trap"},
	},
	Actions =
	{
		ChangeObject{ X = _X, Y = _Y, Object = 3143, Angle = 90}, -- Kopf schaut nach rechts
		--RemoveObject{ X = _X, Y = _Y, Object = 3143},
		--PlaceObject{ X = _X, Y = _Y, Object = 3143, Angle = 90},
		SetNpcTimeStamp { Name = "MyTurnTimer" },
		IncreaseGlobalCounter { Name = "g_P210_Room8Head4Counter"},
		StopEffect { X = 192, Y = 170, TargetType = World },
		SetEffect { Effect = "Lightning", X = 197, Y = 165, Length = 0, TargetType = World},
	}
}

OnEvent
{
	Conditions =
	{
		IsNpcTimeElapsed {  Name = "MyTurnTimer", Seconds = 10 },
		IsGlobalCounter { Name = "g_P210_Room8Head4Counter", Value = 2, Operator = IsEqual},
		IsGlobalFlagFalse{ Name = "g_P210_Room8PlayerInHead4Trap"},
	},
	Actions =
	{
		ChangeObject{ X = _X, Y = _Y, Object = 3143, Angle = 0}, -- Kopf schaut nach unten
		--RemoveObject{ X = _X, Y = _Y, Object = 3143},
		--PlaceObject{ X = _X, Y = _Y, Object = 3143, Angle = 0},
		SetNpcTimeStamp { Name = "MyTurnTimer" },
		IncreaseGlobalCounter { Name = "g_P210_Room8Head4Counter"},
		StopEffect { X = 197, Y = 165, TargetType = World },
		SetEffect { Effect = "Lightning", X = 192, Y = 160, Length = 0, TargetType = World},
	}
}

OnEvent
{
	Conditions =
	{
		IsNpcTimeElapsed {  Name = "MyTurnTimer", Seconds = 10 },
		IsGlobalCounter { Name = "g_P210_Room8Head4Counter", Value = 3, Operator = IsEqual},
		IsGlobalFlagFalse{ Name = "g_P210_Room8PlayerInHead4Trap"},
	},
	Actions =
	{
		ChangeObject{ X = _X, Y = _Y, Object = 3143, Angle = 90}, -- Kopf schaut rechts
		--RemoveObject{ X = _X, Y = _Y, Object = 3143},
		--PlaceObject{ X = _X, Y = _Y, Object = 3143, Angle = 90},
		SetNpcTimeStamp { Name = "MyTurnTimer" },
		ResetGlobalCounter { Name = "g_P210_Room8Head4Counter"},
		StopEffect { X = 192, Y = 160, TargetType = World },
		SetEffect { Effect = "Lightning", X = 197, Y = 165, Length = 0, TargetType = World},
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{ Name = "g_P210_Room8PlayerInHead5Trap"},
	},
	Actions =
	{
		StopEffect { X = 192, Y = 160, TargetType = World },
		StopEffect { X = 197, Y = 165, TargetType = World },
		StopEffect { X = 192, Y = 170, TargetType = World },
	},
}

EndDefinition()

end
