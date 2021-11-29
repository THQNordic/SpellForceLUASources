function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP201ZandarhAmLeben"}, 
		PlayerUnitInRange {X = 170, Y = 159, Range = 20, FigureType = FigureAll},
	},
	Actions = 
	{
		ChangeRace {Race = 107, NpcId = self},	
		SetGlobalFlagTrue {Name = "g_sP201ZandarhFeueerelementar5"},
	}
} 
EndDefinition()

end
