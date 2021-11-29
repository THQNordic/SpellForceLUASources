function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

REM = [[
--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 158, Y = 157, Radius = 4}
DefineLocationCircle{Name = "Point002", X = 158, Y = 148, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 150, Y = 143, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 140, Y = 140, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 153, Y = 145, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 165, Y = 150, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 156, Y = 157, Radius = 2}

AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk}
AddControlPoint{Name = "007", Location = "Point007",WalkMode = Walk}
AddControlPoint{Name = "001", Location = "Point001", TimeToLeave = hms(4,0,0), WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004", TimeToLeave = hms(18,0,0), WalkMode = Walk}
--!EDS PATROL END
]]

--!EDS RESPAWN BEGIN
--Respawn{WaitTime=350, Chief = {1365} }
--!EDS RESPAWN END


EndDefinition()

end
