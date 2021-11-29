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
		IsNpcTimeElapsed {  Name = "MyTurnTimer", Seconds = 5 },
		IsGlobalCounter { Name = "g_P210_Room8Head1Counter", Value = 0, Operator = IsEqual},
		IsGlobalFlagFalse{ Name = "g_P210_Room8PlayerInHead1Trap"},
	},
	Actions =
	{
		ChangeObject{ X = _X, Y = _Y, Object = 3143, Angle = 205}, -- Kopf schaut nach links oben
		--RemoveObject{ X = _X, Y = _Y, Object = 3143},
		--PlaceObject{ X = _X, Y = _Y, Object = 3143, Angle = 205},
		SetNpcTimeStamp { Name = "MyTurnTimer" },
		IncreaseGlobalCounter { Name = "g_P210_Room8Head1Counter"},
		StopEffect { X = 222, Y = 180, TargetType = World },
		SetEffect { Effect = "Lightning", X = 217, Y = 180, Length = 0, TargetType = World}, 
	}
}

OnEvent
{
	Conditions =
	{
		IsNpcTimeElapsed {  Name = "MyTurnTimer", Seconds = 5 },
		IsGlobalCounter { Name = "g_P210_Room8Head1Counter", Value = 1, Operator = IsEqual},
		IsGlobalFlagFalse{ Name = "g_P210_Room8PlayerInHead1Trap"},
	},
	Actions =
	{
		ChangeObject{ X = _X, Y = _Y, Object = 3143, Angle = 180}, -- Kopf schaut nach oben
		--RemoveObject{ X = _X, Y = _Y, Object = 3143},
		--PlaceObject{ X = _X, Y = _Y, Object = 3143, Angle = 180},
		SetNpcTimeStamp { Name = "MyTurnTimer" },
		IncreaseGlobalCounter { Name = "g_P210_Room8Head1Counter"},
		StopEffect { X = 217, Y = 180, TargetType = World },
		SetEffect { Effect = "Lightning", X = 222, Y = 180, Length = 0, TargetType = World},
	}
}

OnEvent
{
	Conditions =
	{
		IsNpcTimeElapsed {  Name = "MyTurnTimer", Seconds = 5 },
		IsGlobalCounter { Name = "g_P210_Room8Head1Counter", Value = 2, Operator = IsEqual},
		IsGlobalFlagFalse{ Name = "g_P210_Room8PlayerInHead1Trap"},
	},
	Actions =
	{
		ChangeObject{ X = _X, Y = _Y, Object = 3143, Angle = 135}, -- Kopf schaut nach rechts oben
		--RemoveObject{ X = _X, Y = _Y, Object = 3143},
		--PlaceObject{ X = _X, Y = _Y, Object = 3143, Angle = 135},
		SetNpcTimeStamp { Name = "MyTurnTimer" },
		IncreaseGlobalCounter { Name = "g_P210_Room8Head1Counter"},
		StopEffect { X = 222, Y = 180, TargetType = World },
		SetEffect { Effect = "Lightning", X = 227, Y = 180, Length = 0, TargetType = World},
	}
}

OnEvent
{
	Conditions =
	{
		IsNpcTimeElapsed {  Name = "MyTurnTimer", Seconds = 5 },
		IsGlobalCounter { Name = "g_P210_Room8Head1Counter", Value = 3, Operator = IsEqual},
		IsGlobalFlagFalse{ Name = "g_P210_Room8PlayerInHead1Trap"},
	},
	Actions =
	{
		ChangeObject{ X = _X, Y = _Y, Object = 3143, Angle = 180}, -- Kopf schaut oben
		--RemoveObject{ X = _X, Y = _Y, Object = 3143},
		--PlaceObject{ X = _X, Y = _Y, Object = 3143, Angle = 180},
		SetNpcTimeStamp { Name = "MyTurnTimer" },
		ResetGlobalCounter { Name = "g_P210_Room8Head1Counter"},
		StopEffect { X = 227, Y = 180, TargetType = World },
		SetEffect { Effect = "Lightning", X = 222, Y = 180, Length = 0, TargetType = World},
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{ Name = "g_P210_Room8PlayerInHead1Trap"},
	},
	Actions =
	{
		StopEffect { X = 227, Y = 180, TargetType = World },
		StopEffect { X = 222, Y = 180, TargetType = World },
		StopEffect { X = 217, Y = 180, TargetType = World },
	},
}

EndDefinition()

end
