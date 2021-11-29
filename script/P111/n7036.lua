function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 181, Y = 280, Radius = 6}
DefineLocationCircle{Name = "Point002", X = 201, Y = 261, Radius = 6}
DefineLocationCircle{Name = "Point003", X = 230, Y = 275, Radius = 6}
DefineLocationCircle{Name = "Point004", X = 239, Y = 289, Radius = 6}
DefineLocationCircle{Name = "Point005", X = 213, Y = 294, Radius = 6}
DefineLocationCircle{Name = "Point006", X = 181, Y = 301, Radius = 6}
DefineLocationCircle{Name = "Point007", X = 162, Y = 286, Radius = 6}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk}
AddControlPoint{Name = "007", Location = "Point007",WalkMode = Walk}
--!EDS PATROL END


OneTimeInitAction (ChangeRace {Race = 152, NpcId = self})

Respawn
{
WaitTime = 25,
UnitId = self ,
NoSpawnEffect = FALSE , 
	Conditions = 
	{
		IsGlobalFlagFalse { Name = "GeisterDespawnP111" , UpdateInterval = 10},
		
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
		ChangeUnit { Unit = 1339, NpcId = self},
	}
}



EndDefinition()

end
