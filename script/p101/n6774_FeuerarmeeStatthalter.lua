--Feuerarmee Statthalter



function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)      

--Dracon Sohan Za'hal und Wachen
SpawnOnlyWhen
{
	X = _X , Y = _Y , Clan = 0 , UnitId = 0 , NoSpawnEffect = FALSE , 
	Conditions = 
	{
		
		IsGlobalFlagTrue{Name = "PlayerWarAufFleeToIce" ,  UpdateInterval = 50 },
		
	} , 
	Actions = {}, 
}


OnIdleGoHome
{
	WalkMode = Walk, X = _X, Y = _Y, Direction = 0,
	Conditions = {},
	Actions = {},
	HomeActions = {}
}


EndDefinition()

end

        
        
