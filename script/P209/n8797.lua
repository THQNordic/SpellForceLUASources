-->INFO ArtefaktRäuber1 

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
		FigureInRange {X = 377, Y = 335, NpcId = 0, Range = 10},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_sP209Artefakt1Gespawned"},
	}
} 

Despawn
{
	PlayDeathAnim = FALSE ,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209XalabarErscheintTempel1"},	
	},
	Actions =
	{

	}
}
EndDefinition()

end
