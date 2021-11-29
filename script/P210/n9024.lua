function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 396, Y = 355, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 395, Y = 318, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 384, Y = 314, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 385, Y = 253, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 384, Y = 313, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 394, Y = 319, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 396, Y = 356, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 412, Y = 358, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk}
AddControlPoint{Name = "007", Location = "Point007",WalkMode = Walk}
AddControlPoint{Name = "008", Location = "Point008",WalkMode = Walk}
--!EDS PATROL END


SpawnOnlyWhen
{
	X = _X, Y = _Y, NoSpawnEffect = FALSE,
	Conditions = 
	{ 
		IsGlobalFlagTrue { Name = "P210_Gate_C_Open" },
	},
	Actions = 
	{
	},
}


EndDefinition()

end
