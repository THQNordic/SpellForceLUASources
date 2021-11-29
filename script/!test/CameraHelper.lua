test = [[
kamera = CreateCameraFlightPath {
		CameraReset(),
		AddLookAt(duration,speed,x,y,z),
		AddLookAtRelative(duration,speed,xoff,yoff,zoff),
		AddLookAtFigure(duration,speed,npcid,x,y,z),
		AddLookAtFigureRelative(duration,speed,npcid,xoff,yoff,zoff),
		.. dasselbe mit MoveAt*
		CameraStart(),
	}
]]


---------------------------------------------------------------------------------------------------
-------------------------- LOOKING ----------------------------------------------------------------
---------------------------------------------------------------------------------------------------

LookX, LookY, LookZ = 0,0,0
LookXOff, LookYOff, LookZOff = 0,0,0
LookXOff2, LookYOff2, LookZOff2 = 0,0,0
LookSince, LookUntil, LookSpeed = 0,0,0

function AddLookAt(duration,speed,x,y,z)
	LookX = x
	LookY = y
	LookZ = z
	LookSince = LookUntil
	LookUntil = LookSince + duration
	LookSpeed = speed
	
	return "\tCamera:ScriptAddLookAt("..LookSince..","..LookUntil..","..LookSpeed..","..LookX..","..LookY..","..LookZ..")\n"
end

function AddLookAtRelative(duration,speed,xoff,yoff,zoff)
	LookXOff = LookX + xoff
	LookYOff = LookY + yoff
	LookZOff = LookZ + zoff
	LookSince = LookUntil
	LookUntil = LookSince + duration
	LookSpeed = speed
	
	return "\tCamera:ScriptAddLookAt("..LookSince..","..LookUntil..","..LookSpeed..","..LookXOff..","..LookYOff..","..LookZOff..")\n"
end

function AddLookAtFigure(duration,speed,npcid,x,y,z)
	LookXOff = x
	LookYOff = y
	LookZOff = z
	LookSince = LookUntil
	LookUntil = LookSince + duration
	LookSpeed = speed
	
	return "\tCamera:ScriptAddLookAtRelative("..LookSince..","..LookUntil..","..LookSpeed..","..npcid..","..LookXOff..","..LookYOff..","..LookZOff..")\n"
end

function AddLookAtFigureRelative(duration,speed,npcid,xoff,yoff,zoff)
	LookXOff2 = LookXOff + xoff
	LookYOff2 = LookYOff + yoff
	LookZOff2 = LookZOff + zoff
	LookSince = LookUntil
	LookUntil = LookSince + duration
	LookSpeed = speed
	
	return "\tCamera:ScriptAddLookAtRelative("..LookSince..","..LookUntil..","..LookSpeed..","..npcid..","..LookXOff2..","..LookYOff2..","..LookZOff2..")\n"
end


---------------------------------------------------------------------------------------------------
-------------------------- MOVING -----------------------------------------------------------------
---------------------------------------------------------------------------------------------------

MoveX, MoveY, MoveZ = 0,0,0
MoveXOff, MoveYOff, MoveZOff = 0,0,0
MoveXOff2, MoveYOff2, MoveZOff2 = 0,0,0
MoveSince, MoveUntil, MoveSpeed = 0,0,0


function AddMoveTo(duration,speed,x,y,z)
	MoveX = x
	MoveY = y
	MoveZ = z
	MoveSince = MoveUntil
	MoveUntil = MoveSince + duration
	MoveSpeed = speed
	
	return "\tCamera:ScriptAddMoveTo("..MoveSince..","..MoveUntil..","..MoveSpeed..","..MoveX..","..MoveY..","..MoveZ..")\n"
end

function AddMoveToRelative(duration,speed,xoff,yoff,zoff)
	MoveXOff = MoveX + xoff
	MoveYOff = MoveY + yoff
	MoveZOff = MoveZ + zoff
	MoveSince = MoveUntil
	MoveUntil = MoveSince + duration
	MoveSpeed = speed
	
	return "\tCamera:ScriptAddMoveTo("..MoveSince..","..MoveUntil..","..MoveSpeed..","..MoveXOff..","..MoveYOff..","..MoveZOff..")\n"
end

function AddMoveToFigure(duration,speed,npcid,x,y,z)
	MoveXOff = x
	MoveYOff = y
	MoveZOff = z
	MoveSince = MoveUntil
	MoveUntil = MoveSince + duration
	MoveSpeed = speed
	
	return "\tCamera:ScriptAddMoveToRelative("..MoveSince..","..MoveUntil..","..MoveSpeed..","..npcid..","..MoveXOff..","..MoveYOff..","..MoveZOff..")\n"
end

function AddMoveToFigureRelative(duration,speed,npcid,xoff,yoff,zoff)
	MoveXOff2 = MoveXOff + xoff
	MoveYOff2 = MoveYOff + yoff
	MoveZOff2 = MoveZOff + zoff
	MoveSince = MoveUntil
	MoveUntil = MoveSince + duration
	MoveSpeed = speed
	
	return "\tCamera:ScriptAddMoveToRelative("..MoveSince..","..MoveUntil..","..MoveSpeed..","..npcid..","..MoveXOff2..","..MoveYOff2..","..MoveZOff2..")\n"
end


---------------------------------------------------------------------------------------------------
-------------------------- RESET/START ------------------------------------------------------------
---------------------------------------------------------------------------------------------------

function CameraReset()
	LookX, LookY, LookZ = 0,0,0
	LookXOff, LookYOff, LookZOff = 0,0,0
	LookXOff2, LookYOff2, LookZOff2 = 0,0,0
	LookSince, LookUntil, LookSpeed = 0,0,0
	
	MoveX, MoveY, MoveZ = 0,0,0
	MoveXOff, MoveYOff, MoveZOff = 0,0,0
	MoveXOff2, MoveYOff2, MoveZOff2 = 0,0,0
	MoveSince, MoveUntil, MoveSpeed = 0,0,0
	
	return "\tCamera:ScriptReset()\n"
end

function CameraStart()
	return "\tCamera:ScriptStart()\n"
end


---------------------------------------------------------------------------------------------------
-------------------------- CREATE PATH ------------------------------------------------------------
---------------------------------------------------------------------------------------------------

function CreateCameraScript(params)
	local FuncName = "CreateCameraScript(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")

	local CamStr = ""

	for i = 1, getn(params) do
		CamStr = CamStr .. params[i]
	end
	
	print(FuncName .. "\n" .. tostring(CamStr))
	return CamStr
end
