function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
--Respawn{WaitTime=400, Chief = {1716} }
--!EDS RESPAWN END

OnIdleGoHome{
	WalkMode = Run, X = 88, Y = 90, Direction = West}

OnIdleGoHome{
	Conditions = {
		FigureInRange{Range = 0, X = 88, Y = 90},
		IsGlobalCounter{Name = "GoblinHatFischGefangen", Value = 7, UpdateInterval = 350},
	},
	Actions = {
		ResetGlobalCounter{Name = "GoblinHatFischGefangen"},
	},

	WalkMode = Run,
	X = 63, Y = 129, Direction = North
}

EndDefinition()

end
