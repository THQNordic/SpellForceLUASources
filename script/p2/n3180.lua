function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

OnIdleGoHome 
{
	X = 194, Y = 294,  Direction = 1, WalkMode = Run,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "OrcAttackEloni"},
	}
}


EndDefinition()

end
