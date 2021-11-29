function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 153, Y = 186, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 163, Y = 167, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 184, Y = 143, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 218, Y = 113, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 265, Y = 139, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 246, Y = 172, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 199, Y = 187, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 174, Y = 197, Radius = 2}

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
