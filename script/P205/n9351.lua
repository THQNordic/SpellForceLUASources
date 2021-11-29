function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 202, Y = 345, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 217, Y = 341, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 227, Y = 352, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 211, Y = 353, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
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
