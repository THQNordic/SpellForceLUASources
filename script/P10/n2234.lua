function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
Respawn{WaitTime=120}
--!EDS RESPAWN END



OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = NorthWest , 
Conditions = 	{
				IsGlobalFlagFalse{Name = "Q148BeginNightAttack"}
				}
}

OnIdleGoHome{WalkMode = Run, X = 270 , Y = 564, Direction = 3 , 
Conditions = 	{
				IsGlobalFlagTrue{Name = "Q148BeginNightAttack"}
				}
}
EndDefinition()

end
