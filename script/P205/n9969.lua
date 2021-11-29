function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 231, Y = 326, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 241, Y = 328, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 239, Y = 345, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 225, Y = 340, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 217, Y = 332, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
--!EDS PATROL END

OnToggleEvent
{
	OnConditions = 
	{
		IsGlobalFlagTrue {Name = "g_P205_CutsceneSpinnenkoenigKaiserStart", UpdateInterval = 10},
	},
	OnActions = 
	{
		SetNoFightFlagTrue{NpcId = self},	
	},
	OffConditions = 
	{
		IsGlobalFlagFalse {Name = "g_P205_CutsceneSpinnenkoenigKaiserStart", UpdateInterval = 10},
	},
	OffActions = 
	{
		SetNoFightFlagFalse{NpcId = self},
	}
}


EndDefinition()

end
