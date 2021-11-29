function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = 143, Y = 167, Direction = 1}
--!EDS ONIDLEGOHOME END


SpawnOnlyWhen
{
	X = 143, Y = 167, NoSpawnEffect = FALSE,
	Conditions =
	{
		PlayerUnitInRange {X = 143, Y = 167, Range = 2, FigureType = FigureAll},
	},
	Actions =
	{
		IncreaseGlobalCounter{Name = "g_P210_MajorMistakesMade"},
	},
}


EndDefinition()

end
