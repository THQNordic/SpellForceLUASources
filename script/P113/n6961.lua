function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- For Cutscene Final Battle Entry
Despawn 
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "CutAnfangGelaufen", UpdateInterval = 20},
	},
	Actions = 
	{
		ChangeRace {NpcId = self, Race = 190},
	},	
}

EndDefinition()

end
