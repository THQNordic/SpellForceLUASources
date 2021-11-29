--Skelett Heiler

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
 	X = 0, Y = 0, Clan = 0, UnitId = 0, NoSpawnEffect = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "P202Aschetaenzer2Gespawnt", UpdateInterval = 10},
		IsGlobalTimeElapsed {Name = "gt_P202Aschetaenzer2SkelettTimer", Seconds = 1}
	} , 
	Actions = {} 
}

Despawn
{
	PlayDeathAnim = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P202Aschetaenzer2Tot", UpdateInterval = 20},
	}, 
	Actions = {}
}

EndDefinition()

end
