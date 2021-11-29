function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 2}
--!EDS ONIDLEGOHOME END

SpawnOnlyWhen
{
	Conditions = {
		FigureDead{NpcId = 4202},
	},
	Actions = {
		LookAtFigure{Target = Avatar},
		ChangeRace{Race = 152},
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
		IsGlobalTimeElapsed{Name = "StageTwoFreezeTimer", Seconds = 2.5, UpdateInterval = 2},
	},
	Actions = {
		ChangeRace{Race = 124},
	},
}

EndDefinition()

end
