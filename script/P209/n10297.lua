function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen 
{
	NoSpawnEffect = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209CutszeneKathaiBefreitStart"},	
	},
	Actions = 
	{
		
	}
} 

Respawn
{
	WaitTime = 5,
	UnitId = self,
	X = _X,
	Y = _Y,
	Conditions = 
	{
		IsGlobalFlagFalse {Name = "g_sP209Artefakt1Gespawned"},
		IsGlobalFlagFalse {Name = "g_sP209XalabarErscheintTempel1"},
		IsGlobalFlagFalse {Name = "g_sP209XalabarGeschlagen"},
	},
	Actions = 
	{
		
	},
	DeathActions = 
	{
	
	}
} 
EndDefinition()

end
