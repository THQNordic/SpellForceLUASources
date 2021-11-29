function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

OnOneTimeEvent
{
	Conditions = {
		FigureHasAggro{NpcId = 3615, UpdateInterval = 10},
	},
	Actions = {
		Goto {X = 315, Y = 180, Range = 10 , WalkMode = Run , GotoMode = GotoContinous , XRand = 10 , YRand = 10},
	},
}

EndDefinition()

end
