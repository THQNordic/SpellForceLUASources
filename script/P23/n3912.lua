function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

-- versuch den grafikfehler zu beseitigen
OnDeath
{
	Actions = { Vanish{} }
}

EndDefinition()

end
