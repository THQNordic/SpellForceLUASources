function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
--Respawn{WaitTime=300, Chief = {1365}}
--!EDS RESPAWN END

OnIdleGoHome
{
	WalkMode = Run, X = 135, Y = 138, Direction = SouthWest
}

OnIdleGoHome
{
	Conditions = 
	{
		FigureInRange{Range = 0, X = 135, Y = 138},
		IsGlobalCounter{Name = "GoblinHatFischGefangen", Value = 0, UpdateInterval = 390},
	},
	Actions = 
	{
		IncreaseGlobalCounter{Name = "GoblinHatFischGefangen"},
	},

	WalkMode = Run,
	X = _X, Y = _Y, Direction = North
}

EndDefinition()

end
