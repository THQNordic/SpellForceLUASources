function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 336, Y = 176, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 335, Y = 185, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 341, Y = 192, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 335, Y = 189, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 336, Y = 184, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 331, Y = 184, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 329, Y = 176, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk}
AddControlPoint{Name = "007", Location = "Point007",WalkMode = Walk}
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
