-->INFO ArtefaktRäuber2

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OneTimeInitAction (ChangeRace {Race = 114, NpcId = self})

SpawnOnlyWhen
{
	X = _X,
	Y = _Y,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209CutszeneKathaiBefreitStart"},	
		FigureInRange {X = 268, Y = 142, NpcId = 0, Range = 10},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_sP209Artefakt2Gespawned"},
	}
} 


EndDefinition()

end
