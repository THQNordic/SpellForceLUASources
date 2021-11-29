function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = 163, Y = 159, Direction = 2}
--!EDS ONIDLEGOHOME END


SpawnOnlyWhen
{
	X = 163, Y = 159, NoSpawnEffect = FALSE,
	Conditions =
	{
		PlayerUnitInRange {X = 163, Y = 159, Range = 2, FigureType = FigureAll},
	},
	Actions =
	{
		IncreaseGlobalCounter{Name = "g_P210_MajorMistakesMade"},
	},
}


EndDefinition()

end
