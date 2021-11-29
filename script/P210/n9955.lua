function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 5}
--!EDS ONIDLEGOHOME END

SpawnOnlyWhen
{
	Conditions = 
	{
		IsGlobalCounter { Name = "g_P210_Room8Head8Counter", Value = 4, Operator = IsEqual, UpdateInterval = 20},
		IsGlobalFlagFalse{ Name = "g_P210_Room8PlayerInHead8Trap"},
		PlayerUnitInRange {X = _X, Y = _Y, Range = 2, FigureType = FigureAll},
	},
	Actions =
	{
		SetGlobalFlagTrue{ Name = "g_P210_Room8PlayerInHead8Trap"},
		IncreaseGlobalCounter{Name = "g_P210_MajorMistakesMade"},
	},
}

EndDefinition()

end
