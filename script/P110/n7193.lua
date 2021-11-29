function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = 0 ,
	Y = 0 ,
	Clan = 0 ,
	 
	Conditions = 
	{
			IsGlobalFlagTrue {Name = "AngebotAngenommenP110" }, 
			IsGlobalFlagFalse {Name = "VertragsBruchP110" },
			IsItemFlagTrue { Name = "PlayerHasItemSchattenschwert" , UpdateInterval = 10},
	} ,
	Actions = 
	{
		ChangeRace {Race = 152},
	}
} 
OnOneTimeEvent

{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "MoonPriestGroupAggroP110" },		
	},
	Actions =
	{
		
		ChangeRace {Race = 137},
		
	}
}
EndDefinition()

end
