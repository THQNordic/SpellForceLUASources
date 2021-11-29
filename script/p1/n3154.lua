function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
--Respawn{WaitTime=300, Chief = {1365}}
--!EDS RESPAWN END

OnIdleGoHome{
	WalkMode = Run, X = 130, Y = 141, Direction = West}

OnIdleGoHome{
	Conditions = {
		FigureInRange{Range = 0, X = 130, Y = 141},
		IsGlobalCounter{Name = "GoblinHatFischGefangen", Value = 3, UpdateInterval = 390},
	},
	Actions = {
		IncreaseGlobalCounter{Name = "GoblinHatFischGefangen"},
	},

	WalkMode = Run,
	X = _X, Y = _Y, Direction = North
}

EndDefinition()

end