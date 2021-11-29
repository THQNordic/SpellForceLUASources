function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--------- Despawn nach 1. Cutscene und wenn alle Blades weg sind ---------------------------------------
Despawn
{
	Conditions =
	{
		Negated (EnemyUnitInRange{X = 376, Y = 344, NpcId = 1984, Range = 20, UpdateInterval = 30}),
		IsGlobalFlagTrue {Name = "RohenWins"},
	},
}
-----------------------------------------------------------------------------------------------------



EndDefinition()

end
