-->INFO ArtefaktRäuber3 

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
		FigureInRange {X = 405, Y = 156, NpcId = 0, Range = 10},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_sP209Artefakt3Gespawned"},
	}
} 

Despawn
{
	PlayDeathAnim = FALSE ,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209XalabarErscheintTempel3"},	
	},
	Actions =
	{

	}
}

EndDefinition()

end
