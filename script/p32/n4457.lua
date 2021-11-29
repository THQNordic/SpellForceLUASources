function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 5}
--!EDS ONIDLEGOHOME END

SpawnOnlyWhen
{
	Conditions = {
		FigureDead{NpcId = 4449},
		IsGlobalFlagTrue{Name = "SoulForgerStageTwo", UpdateInterval = 5},
	},
	Actions = {
		LookAtFigure{Target = Avatar},
	},
}
OnOneTimeEvent
{
	Conditions = {
	},
	Actions = {
		ChangeRace{Race = 152},
		SetEffect{Effect = "Materialize", NpcId = _NpcId, Length = 1500},
		LookAtFigure{Target = Avatar},
	},
}
OnOneTimeEvent
{
	Conditions = {
		IsGlobalTimeElapsed{Name = "StageThreeFreezeTimer", Seconds = 2.5, UpdateInterval = 2},
	},
	Actions = {
		ChangeRace{Race = 124},
	},
}

EndDefinition()

end
