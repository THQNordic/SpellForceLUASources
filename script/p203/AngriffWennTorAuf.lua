function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

if NpcId == 8599 then
	VersatzX = 0
	VersatzY = 1
elseif NpcId == 8600 then
	VersatzX = 0  
	VersatzY = 2
elseif NpcId == 8601 then
	VersatzX = 0 
	VersatzY = 3
elseif NpcId == 8602 then
	VersatzX = 1 
	VersatzY = 0
elseif NpcId == 8603 then
	VersatzX = 1 
	VersatzY = 1
elseif NpcId == 8604 then
	VersatzX = 1 
	VersatzY = 2
elseif NpcId == 8605 then
	VersatzX = 2 
	VersatzY = 2
elseif NpcId == 8606 then
	VersatzX = 2
	VersatzY = 3
end


-- Wenn die Blockade vom Gefangenen geöffnet wurde kommen mal ein paar Einheiten gucken, was da so los ist
OnIdleGoHome
{
	WalkMode = Run, X = 403+VersatzX, Y = 226+VersatzY, Direction = 0,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P203SteineWeg"}
	}
}

EndDefinition()

end
