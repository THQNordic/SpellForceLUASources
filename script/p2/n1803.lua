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
	WalkMode = Run,	X = 253, Y = 93, Direction = NorthEast
	}

OnIdleGoHome
{
	Conditions = 
	{
		FigureInRange{Range = 0, X = 253, Y = 93},
		IsGlobalCounter{Name = "GoblinHatFischGefangen", Value = 0, UpdateInterval = 500},
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
