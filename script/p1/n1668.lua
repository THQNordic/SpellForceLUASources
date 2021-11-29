-->INFO: WestAusgang Dorf - Fackel AUS Guard
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
Respawn{WaitTime=60}
--!EDS RESPAWN END



AddGotoLocation{X = 152, Y = 109, Radius = 1}
AddGotoLocation{X = 143, Y = 106, Radius = 1}
AddGotoLocation{X = 143, Y = 110, Radius = 1}
AddGotoLocation{X = 122, Y = 114, Radius = 1}
AddGotoLocation{X = 122, Y = 109, Radius = 1}


OnIdleDoTorchJob
{
	Name = "WestAusgang", X = _X, Y = _Y, Direction = 4,
	TurnOff = TRUE , WaitForIdle = TRUE , UpdateInterval = 60
}


EndDefinition()

end
