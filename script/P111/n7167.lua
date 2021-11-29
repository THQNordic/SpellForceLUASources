function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPlatformOneTimeEvent
{
	Conditions =
	{
		ODER(FigureHasAggro { NpcId = self, UpdateInterval = 10}, IsItemFlagTrue { Name = "PlayerHasItemSchattenring" , UpdateInterval = 10}),
    },
	Actions =
	{
		
		ChangeUnit { Unit = 1339, NpcId = self},

		
	
	}
}


EndDefinition()

end
