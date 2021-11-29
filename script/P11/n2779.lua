function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X , Y = _Y ,
	Conditions = {
			IsGlobalFlagTrue{Name = "Q184TrollsSpawning"},
		}
}

OnIdleGoHome{WalkMode = Run, X = 408, Y = 368, Range = 4 ,Direction = 0, Conditions = {IsGlobalFlagTrue{Name = "Q184TrollsRunToTreasure"}}}

EndDefinition()

end
