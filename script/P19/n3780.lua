function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

OnMulandirMedusa
{
	Path = {
		[1] = {X = _X, Y = _Y},
		[2] = {X = 283, Y = 90},
		[3] = {X = 264, Y = 99},
		[4] = {X = 293, Y = 93},
	},
}

EndDefinition()

end
