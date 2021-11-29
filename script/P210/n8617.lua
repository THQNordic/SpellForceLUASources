function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = 121, Y = 195, Direction = 4}
--!EDS ONIDLEGOHOME END

SpawnOnlyWhen
{
	X = 121, Y = 195, NoSpawnEffect = FALSE,
	Conditions =
	{
		PlayerUnitInRange {X = 121, Y = 195, Range = 2, FigureType = FigureAll},
	},
	Actions =
	{
		IncreaseGlobalCounter{Name = "g_P210_MajorMistakesMade"},
	},
}

EndDefinition()

end
