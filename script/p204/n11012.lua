function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 306, Y = 322, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 310, Y = 326, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 310, Y = 332, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 305, Y = 334, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 301, Y = 333, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 297, Y = 330, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 298, Y = 323, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk}
AddControlPoint{Name = "007", Location = "Point007",WalkMode = Walk}
--!EDS PATROL END

--- Wache wird lieb wenn Alyah Kaiserin ---
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P204_AlyahKaiserin"},
	},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = self},
	}
}

EndDefinition()

end
