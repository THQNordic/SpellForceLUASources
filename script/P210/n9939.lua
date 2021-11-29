function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 0}
--!EDS ONIDLEGOHOME END

SpawnOnlyWhen
{
	Conditions = 
	{
		ODER9
		{
			IsGlobalCounter { Name = "g_P210_Room8Head5Counter", Value = 0, Operator = IsEqual, UpdateInterval = 20},
			IsGlobalCounter { Name = "g_P210_Room8Head5Counter", Value = 2, Operator = IsEqual, UpdateInterval = 20},
		},
		IsGlobalFlagFalse{ Name = "g_P210_Room8PlayerInHead5Trap"},
		PlayerUnitInRange {X = _X, Y = _Y, Range = 2, FigureType = FigureAll},
	},
	Actions =
	{
		SetGlobalFlagTrue{ Name = "g_P210_Room8PlayerInHead5Trap"},
		IncreaseGlobalCounter{Name = "g_P210_MajorMistakesMade"},
	},
}

EndDefinition()

end
