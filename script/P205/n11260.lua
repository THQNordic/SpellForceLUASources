function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 169, Y = 255, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 167, Y = 243, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 173, Y = 235, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 178, Y = 238, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 183, Y = 249, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 174, Y = 262, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk}
--!EDS PATROL END

OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P205_CutsceneSpinnenkoenigAvatarStart", UpdateInterval = 10},
	},
	
	Actions =
	{
		SetNoFightFlagTrue{NpcId = self},
	}
}

EndDefinition()

end
