function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 82, Y = 380, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 79, Y = 388, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 69, Y = 397, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 64, Y = 400, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 62, Y = 391, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 62, Y = 380, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 61, Y = 366, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 74, Y = 368, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk}
AddControlPoint{Name = "007", Location = "Point007",WalkMode = Walk}
AddControlPoint{Name = "008", Location = "Point008",WalkMode = Walk}
--!EDS PATROL END




--!EDS RESPAWN BEGIN
Respawn{WaitTime=120}
--!EDS RESPAWN END


-- Utraner nach Hause
OnIdleGoHome
{
	X = 298, Y = 158, Direction = 1 ,
	Conditions =
	{
		QuestState{QuestId = 467 , State = StateSolved , UpdateInterval = 50}
	}
}


EndDefinition()

end
