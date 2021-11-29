function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OneTimeInitAction( SetEffect{Effect = "HeroMonumentActive", NpcId = _NpcId} )

EndDefinition()

end
