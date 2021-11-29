function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
--Uram Zwei

SpawnOnlyWhen
{
	X = _X, Y = _Y,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_n_P203_UramII"},
	},
	Actions =
	{
		SetNoFightFlagTrue {NpcId = 11885},
	}
}

-- Wenn der Bursche frei ist und die Steine sind weg, geht er nach Hause
OnIdleGoHome
{
	X = 310, Y = 250, WalkMode = Run, Direction = 2,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_n_P203_UramNachHauseII"}
	},
}
EndDefinition()

end
