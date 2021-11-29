function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--!EDS RESPAWN BEGIN
Respawn{WaitTime=30}
--!EDS RESPAWN END

--OnIdleGoHome
--{
--X = 106 , Y = 300 , Direction = 1 , Range = 0 , WalkMode = Run , UpdateInterval = 10 ,
--Conditions = 	{
--		IsGlobalFlagTrue{Name = "Q103KnightsFormUp"},
--		},
--Actions = 	{ }
--}

EndDefinition()

end
