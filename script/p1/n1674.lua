-->INFO: "Fackel Aus" Guard im Ausgang Süd
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
Respawn{WaitTime=60}
--!EDS RESPAWN END


AddGotoLocation{X = 155, Y = 91, Radius = 1}
AddGotoLocation{X = 145, Y = 92, Radius = 1}
AddGotoLocation{X = 149, Y = 88, Radius = 1}
AddGotoLocation{X = 140, Y = 81, Radius = 1}
AddGotoLocation{X = 128, Y = 84, Radius = 1}

OnIdleDoTorchJob
{
	Name = "SuedAusgang", X = _X, Y = _Y, Direction = 3,
	TurnOff = TRUE , WaitForIdle = TRUE , UpdateInterval = 60
}

EndDefinition()

end
