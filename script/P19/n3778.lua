function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)


OnMulandirMedusa
{
	Path = {
		[1] = {X = _X, Y = _Y},
		[2] = {X = 243, Y = 159},
	},
}


EndDefinition()

end
