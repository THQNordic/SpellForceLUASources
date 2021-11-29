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
	WalkMode = Run, X = 242, Y = 99, Direction = North
	}

OnIdleGoHome
{
	Conditions = 
	{
		FigureInRange{Range = 0, X = 242, Y = 99},
		IsGlobalCounter{Name = "GoblinHatFischGefangen", Value = 6, UpdateInterval = 490},
	},
	Actions = 
	{
		ResetGlobalCounter{Name = "GoblinHatFischGefangen"},
	},

	WalkMode = Run,
	X = 230, Y = 133, Direction = North
}

EndDefinition()

end
