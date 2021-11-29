-->INFO: "Fackel Aus" Guard am Westausgang
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
Respawn{WaitTime=60}
--!EDS RESPAWN END

AddGotoLocation{X = 163, Y = 109, Radius = 1}
AddGotoLocation{X = 168, Y = 104, Radius = 1}
AddGotoLocation{X = 180, Y = 96, Radius = 1}
AddGotoLocation{X = 183, Y = 99, Radius = 1}
AddGotoLocation{X = 189, Y = 93, Radius = 1}
AddGotoLocation{X = 186, Y = 90, Radius = 1}



OnIdleDoTorchJob
{
	Name = "OstAusgang", X = _X, Y = _Y, Direction = 1,
	TurnOff = TRUE , WaitForIdle = TRUE , UpdateInterval = 60
}

EndDefinition()

end
