function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnIdleGoHome
{
	X = _X, Y = _Y, Direction = 7, Range = 1 , WalkRange = 5 , WaitTime = 0 , WalkMode = Walk , GotoMode = GotoNormal,
	Conditions = { },
	Actions = { },
	HomeActions = {  }
}

--Respawn
--{
-- 	WaitTime = 20, UnitId = self , Clan = 0 , Target = none , X = startX , Y = startY , Chief = none, NoSpawnEffect = FALSE , 
-- 	Conditions = 
-- 	{ 
-- 		BuildingInRange = {X = 186, Y = 196, Range = 4 , Owner = OwnerNpc , BuildingId = 0 , UpdateInterval = 30 }
-- 	} , 
-- 	Actions = {} , 
-- 	DeathActions = {} 
--}

EndDefinition()

end
