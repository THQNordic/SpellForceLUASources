function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 162, Y = 201, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 155, Y = 209, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 163, Y = 210, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 157, Y = 203, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001", TimeToLeave = hms(5,0,0),
 WalkMode = Walk, Actions = {LookAtDirection{Direction = West}} }
AddControlPoint{Name = "002", Location = "Point002", TimeToLeave = hms(12,0,0),
 WalkMode = Walk, Actions = {LookAtDirection{Direction = SouthEast}} }
AddControlPoint{Name = "003", Location = "Point003", TimeToLeave = hms(19,0,0),
 WalkMode = Walk, Actions = {LookAtDirection{Direction = SouthWest}} }
AddControlPoint{Name = "004", Location = "Point004", TimeToLeave = hms(23,59,0),
 WalkMode = Walk, Actions = {LookAtDirection{Direction = East}} }
--!EDS PATROL END

EndDefinition()

end
