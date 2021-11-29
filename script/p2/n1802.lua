function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
Respawn
{
	WaitTime=600, 
	Conditions = 
	{
		IsGlobalFlagFalse {Name = "FishGobHomeDestroyed"},
	}
}
--!EDS RESPAWN END

OnIdleGoHome
{
	WalkMode = Run, X = 258, Y = 90, Direction = NorthEast
	}

OnIdleGoHome
{
	Conditions =
	{
		FigureInRange{Range = 0, X = 258, Y = 90},
		IsGlobalCounter{Name = "GoblinHatFischGefangen", Value = 3, UpdateInterval = 490},
	},
	Actions = 
	{
		IncreaseGlobalCounter{Name = "GoblinHatFischGefangen"},
	},

	WalkMode = Run,
	X = 230, Y = 133, Direction = North
}

EndDefinition()

end
