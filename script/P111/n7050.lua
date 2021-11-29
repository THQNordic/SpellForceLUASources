function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point006", X = 252, Y = 234, Radius = 6}
DefineLocationCircle{Name = "Point007", X = 247, Y = 205, Radius = 6}
DefineLocationCircle{Name = "Point008", X = 209, Y = 218, Radius = 6}

AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk}
AddControlPoint{Name = "007", Location = "Point007",WalkMode = Walk}
AddControlPoint{Name = "008", Location = "Point008",WalkMode = Walk}
--!EDS PATROL END




OneTimeInitAction (ChangeRace {Race = 152, NpcId = self})

Respawn
{
WaitTime = 25,
UnitId = self ,
NoSpawnEffect = FALSE , 
	Conditions = 
	{
		IsItemFlagFalse { Name = "PlayerHasItemSchattenring" , UpdateInterval = 10},
		
	} , 
	Actions = 
	{
		ChangeRace {Race = 152, NpcId = self},		

	} , 
	DeathActions = 
	{
	
	}
}

OnOneTimeEvent
{
	Conditions = 
	{
		IsItemFlagTrue { Name = "PlayerHasItemSchattenring" , UpdateInterval = 10},
	} ,
	Actions = 
	{
		ChangeRace { Race = 179, NpcId = self},
		ChangeUnit { Unit = 1338, NpcId = self},
	}
}


EndDefinition()

end
