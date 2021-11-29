-->INFO: "Fackel An" Guard im Osten bei Gelbbarth
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
Respawn{WaitTime=60}
--!EDS RESPAWN END

AddGotoLocation{X =  99, Y = 125, Radius = 1}
AddGotoLocation{X =  103, Y = 129, Radius = 1}

OnIdleDoTorchJob
{
	Name = "Gelbbarth", X = _X, Y = _Y, Direction = 5,
	TurnOff = FALSE , WaitForIdle = TRUE , UpdateInterval = 60
}

EndDefinition()

end
