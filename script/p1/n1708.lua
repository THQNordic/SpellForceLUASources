function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
--Respawn{WaitTime=200, Chief = {1716} }
--!EDS RESPAWN END

OnIdleGoHome{
	WalkMode = Run, X = 83, Y = 95, Direction = South}

OnIdleGoHome{
	Conditions = {
		FigureInRange{Range = 0, X = 83, Y = 95},
		IsGlobalCounter{Name = "GoblinHatFischGefangen", Value = 2, UpdateInterval = 350},
	},
	Actions = {
		IncreaseGlobalCounter{Name = "GoblinHatFischGefangen"},
	},

	WalkMode = Run,
	X = 63, Y = 129, Direction = North
}

EndDefinition()

end
