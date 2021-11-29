function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 239, Y = 337, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 238, Y = 344, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 235, Y = 344, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 233, Y = 337, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
--!EDS PATROL END

comment = [[

OnIdleGoHome
{
	X = 239, Y = 344, Direction = 3,
	UpdateInterval = 1000,
	Conditions =
	{
		IsGlobalFlagFalse
	},
	Actions
	{
	}
	
}


OnIdleGoHome
{
	X = 238, Y = 337, Direction = 3,
	UpdateInterval = 1000,
	
}

]]

comment = nil



EndDefinition()

end
