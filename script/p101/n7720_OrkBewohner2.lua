--Orkbewohner2
--NpcId  7720 - 7748, 7750


function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--Orkbewohner neu
SpawnOnlyWhen
{
	X = 249 , Y = 153 , Clan = 0 , UnitId = 0 , NoSpawnEffect = TRUE ,
	Conditions = 
	{
		IsGlobalFlagTrue{ Name = "P101_DunkelElfBossKilled", UpdateInterval = 30}
	},
	Actions = 
	{
		--Orks verteilen sich
		Goto {X = _X , Y = _Y , NpcId = self , Range = 1 , WalkMode = Walk , GotoMode = GotoContinuous}, 
	} 
}


EndDefinition()

end