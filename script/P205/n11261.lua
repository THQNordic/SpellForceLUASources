function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 231, Y = 329, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 215, Y = 337, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 215, Y = 347, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 221, Y = 349, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 234, Y = 346, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 241, Y = 333, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk}
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
