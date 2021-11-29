-->INFO Bronzeritter

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen 
{
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209SpawnKaiserGarde"},
	},
	Actions = 
	{
		ChangeRace {Race = 208},
		SetGlobalFlagTrue {Name = "g_sP209Bronzeriesengesetzt"},
	
	}
} 

OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209CutszeneBoteEnded"},
	},
	Actions = 
	{ 
		Goto { X = 239, Y = 291, NpcId = self, Range = 3, WalkMode = Walk, GotoMode = GotoForced},
	}
}


EndDefinition()

end
