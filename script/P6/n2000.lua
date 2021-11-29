function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
OnIdleGoHome{WalkMode = Run, X = _X, Y = _Y, Direction = 1 ,
Conditions = {IsGlobalFlagTrue{Name = "Q107SpiderAttack" , UpdateInterval = 15}}
}
OnIdleGoHome{WalkMode = Run, X = 242, Y = 276, Direction = 1 ,
Conditions = {IsGlobalFlagTrue{Name = "Q104SpidersGo"}}
}
SpawnOnlyWhen
{
X = 109 , Y = 261 ,
Conditions = {
			ODER(IsGlobalFlagTrue{Name = "Q104SpidersGetReady"} , IsGlobalFlagTrue{Name = "Q107SpiderkingAgressive"})
			},
}
Respawn
{
X = 109 , Y = 261 , WaitTime = 1,
Conditions = {
			ODER(IsGlobalFlagTrue{Name = "Q104SpidersGetReady"} , IsGlobalFlagTrue{Name = "Q107SpiderkingAgressive"})
			},
}

EndDefinition()

end
