function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnMulandirMedusa
{
	Path = {
		[1] = {X = _X, Y = _Y},
	},
}

EndDefinition()

end
