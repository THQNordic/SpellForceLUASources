--> KAISER KILLABLE KAISERCUTSCENE

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen 
{
	X = 207, 
	Y = 319,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209CutszeneKaiserStart", UpdateInterval = 10},
		Negated(EnemyUnitInRange {X = 225, Y = 300, NpcId = Avatar, Range = 20, UnitId = 0, UpdateInterval = 10}),
	},
	Actions = 
	{
	
	}
} 

Despawn
{
	PlayDeathAnim = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209KaiserStirbtInCutszene", UpdateInterval = 10},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_sP209KaiserTot"},
	}
}
EndDefinition()

end
