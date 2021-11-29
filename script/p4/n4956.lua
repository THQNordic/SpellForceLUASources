function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 176, Y = 192, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 205, Y = 183, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 221, Y = 163, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 201, Y = 143, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 182, Y = 144, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 162, Y = 167, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 144, Y = 191, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 165, Y = 201, Radius = 2}

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
Conditions = {QuestState{QuestId = 528 , State = StateActive}}
}


EndDefinition()

end
