function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = 113, Y = 191, Direction = 4}
--!EDS ONIDLEGOHOME END

SpawnOnlyWhen
{
	X = 113, Y = 191, NoSpawnEffect = FALSE,
	Conditions =
	{
		PlayerUnitInRange {X = 113, Y = 191, Range = 2, FigureType = FigureAll},
	},
	Actions =
	{
		IncreaseGlobalCounter{Name = "g_P210_MajorMistakesMade"},
	},
}

EndDefinition()

end
