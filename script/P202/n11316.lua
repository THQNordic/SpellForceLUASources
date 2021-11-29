-- Aschetänzer 2b

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

KillOnDominate{NpcId = self}

SpawnOnlyWhen
{
 	X = 0, Y = 0, Clan = 0, UnitId = 0, NoSpawnEffect = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "P202Aschetaenzer2KopienSpawnInit", UpdateInterval = 20}
	} , 
	Actions = 
	{
		SetHealth {HitPoints = 154, NpcId = self, Decrease = FALSE}, --health auf 5%
	} 
}


EndDefinition()

end
