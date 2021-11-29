function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

OnMulandirMedusa
{
	Path = {
		[1] = {X = _X, Y = _Y},
		[2] = {X = 190, Y = 193},
		[3] = {X = 155, Y = 225},
		[4] = {X = 190, Y = 211},
	},
}
	

EndDefinition()
end
