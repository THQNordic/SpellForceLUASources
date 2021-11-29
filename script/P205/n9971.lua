function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 165, Y = 210, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 160, Y = 217, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 150, Y = 221, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 158, Y = 228, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 166, Y = 219, Radius = 2}

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
		IsGlobalFlagTrue {Name = "g_P205_CutsceneSpinnenkoenigAvatarStart", UpdateInterval = 10},
	},
	
	Actions =
	{
		SetNoFightFlagTrue{NpcId = 9971},
	}
}

EndDefinition()

end
