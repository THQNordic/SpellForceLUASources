function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


-- Ist die Verfolgung erledigt wird wieder zurück gegenagen
OnIdleGoHome
{
	X = _X, Y = _Y, WalkMode = Run, Direction = 6,
	Actions =
	{
	}
}

EndDefinition()

end
