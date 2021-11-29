function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = 117, Y = 211, Direction = 6}
--!EDS ONIDLEGOHOME END

SpawnOnlyWhen
{
	X = 117, Y = 211, NoSpawnEffect = FALSE,
	Conditions =
	{
		PlayerUnitInRange {X = 117, Y = 211, Range = 2, FigureType = FigureAll},
	},
	Actions =
	{
		IncreaseGlobalCounter{Name = "g_P210_MajorMistakesMade"},
	},
}

EndDefinition()

end
