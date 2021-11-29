function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--OnOneTimeEvent{ 
--	Conditions = { FigureAlive{NpcId = _NpcId} }, 
--	Actions = { ChangeGoal{Clan = 1, Goal = 1} }
--}

EndDefinition()

end
