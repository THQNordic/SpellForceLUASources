function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 3 , 
Conditions = 	{
				IsGlobalFlagFalse{Name = "Q148BeginNightAttack"}
				}
}
OnIdleGoHome{WalkMode = Run, X = 272 , Y = 566, Direction = 3 , 
Conditions = 	{
				IsGlobalFlagTrue{Name = "Q148BeginNightAttack"}
				}
}

--!EDS RESPAWN BEGIN
Respawn{WaitTime=120}
--!EDS RESPAWN END






EndDefinition()

end
