function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = 167, Y = 167, Direction = 0}
--!EDS ONIDLEGOHOME END


SpawnOnlyWhen
{
	X = 167, Y = 167, NoSpawnEffect = FALSE,
	Conditions =
	{
		PlayerUnitInRange {X = 167, Y = 167, Range = 2, FigureType = FigureAll},
	},
	Actions =
	{
		IncreaseGlobalCounter{Name = "g_P210_MajorMistakesMade"},
	},
}


EndDefinition()

end