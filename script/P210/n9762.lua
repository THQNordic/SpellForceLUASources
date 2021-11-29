function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 6}
--!EDS ONIDLEGOHOME END

SpawnOnlyWhen
{
	Conditions =
	{
		IsGlobalCounter{Name = "g_P210_MajorMistakesMade", Value = 4, Operator = IsGreaterOrEqual},
	},
}

EndDefinition()

end
