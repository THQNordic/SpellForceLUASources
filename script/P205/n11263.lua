function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 189, Y = 314, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 175, Y = 315, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 175, Y = 334, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 188, Y = 331, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 190, Y = 324, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
--!EDS PATROL END


OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P205_StopSpinnen"},
	},
	
	Actions =
	{
		SetNoFightFlagTrue{NpcId = self},
	}
}

EndDefinition()

end
