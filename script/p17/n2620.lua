function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Run, X = 349, Y = 171, Direction = 5 , Conditions = {IsGlobalFlagTrue{Name = "GodwallDemoCutsceneKiarFollowTroops"}}}                                                         
--!EDS ONIDLEGOHOME END


EndDefinition()

end
