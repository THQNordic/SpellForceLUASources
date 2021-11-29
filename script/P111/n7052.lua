function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 243, Y = 207, Radius = 6}
DefineLocationCircle{Name = "Point002", X = 198, Y = 224, Radius = 6}
DefineLocationCircle{Name = "Point003", X = 152, Y = 217, Radius = 6}
DefineLocationCircle{Name = "Point004", X = 126, Y = 247, Radius = 6}
DefineLocationCircle{Name = "Point005", X = 110, Y = 207, Radius = 6}
DefineLocationCircle{Name = "Point006", X = 157, Y = 201, Radius = 6}
DefineLocationCircle{Name = "Point007", X = 199, Y = 209, Radius = 6}
DefineLocationCircle{Name = "Point008", X = 238, Y = 219, Radius = 6}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
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
		ChangeUnit { Unit = 1340, NpcId = self},
	}
}



EndDefinition()

end
