function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 173, Y = 277, Radius = 6}
DefineLocationCircle{Name = "Point002", X = 154, Y = 292, Radius = 6}
DefineLocationCircle{Name = "Point003", X = 172, Y = 308, Radius = 6}
DefineLocationCircle{Name = "Point004", X = 195, Y = 292, Radius = 6}
DefineLocationCircle{Name = "Point005", X = 222, Y = 288, Radius = 6}
DefineLocationCircle{Name = "Point006", X = 245, Y = 290, Radius = 6}
DefineLocationCircle{Name = "Point007", X = 214, Y = 269, Radius = 6}
DefineLocationCircle{Name = "Point008", X = 185, Y = 271, Radius = 6}

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
