function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

KillOnDominate{NpcId = self}

SpawnOnlyWhen
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP201IridonAmLeben"}, 
		PlayerUnitInRange {X = 117, Y = 174, Range = 20, FigureType = FigureAll},
		
	},
	Actions = 
	{
		ChangeRace {Race = 107, NpcId = self},	
		SetGlobalFlagTrue {Name= "g_sP201GolemAmLeben"},
	}
} 
EndDefinition()

end
