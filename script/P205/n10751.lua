function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 339, Y = 208, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 340, Y = 215, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 337, Y = 220, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 337, Y = 225, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 337, Y = 220, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 340, Y = 215, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 340, Y = 210, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 339, Y = 201, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 336, Y = 195, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk}
AddControlPoint{Name = "007", Location = "Point007",WalkMode = Walk}
AddControlPoint{Name = "008", Location = "Point008",WalkMode = Walk}
AddControlPoint{Name = "009", Location = "Point009",WalkMode = Walk}
--!EDS PATROL END


OnToggleEvent
{
	OnConditions = 
	{
		IsGlobalFlagTrue {Name = "g_P205_CutsceneGartentor", UpdateInterval = 10},
	},
	OnActions = 
	{
		SetNoFightFlagTrue{NpcId = self},	
	},
	OffConditions = 
	{
		IsGlobalFlagFalse {Name = "g_P205_CutsceneGartentor", UpdateInterval = 10},
	},
	OffActions = 
	{
		SetNoFightFlagFalse{NpcId = self},
	}
}



EndDefinition()

end
