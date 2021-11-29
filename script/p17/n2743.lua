function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--SpawnOnlyWhen
--{
--	X = _X , Y = _Y ,
--	Conditions = {
--			 IsGlobalFlagTrue{Name = "GodwallDemoCutsceneToggle"}
--		}
--}

OnIdleGoHome{WalkMode = Run, X = 351, Y = 165, Direction = 5 , Conditions = {IsGlobalFlagTrue{Name = "GodwallDemoCutsceneMoveTroops"}}}

EndDefinition()

end
