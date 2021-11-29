function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 5}
--!EDS ONIDLEGOHOME END

OnOneTimeEvent
{
Conditions = {
		IsGlobalFlagTrue{Name = "Q164WelpIsHome" , UpdateInterval = 10}
			},
Actions = {
	LookAtFigure{Target = 2263}
	}
}

--!EDS RESPAWN BEGIN
Respawn{WaitTime=360}
--!EDS RESPAWN END





EndDefinition()

end
