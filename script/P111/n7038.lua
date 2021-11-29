function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 188, Y = 294, Radius = 6}
DefineLocationCircle{Name = "Point002", X = 165, Y = 297, Radius = 6}
DefineLocationCircle{Name = "Point003", X = 195, Y = 274, Radius = 6}
DefineLocationCircle{Name = "Point004", X = 225, Y = 278, Radius = 6}
DefineLocationCircle{Name = "Point005", X = 215, Y = 292, Radius = 6}
DefineLocationCircle{Name = "Point006", X = 198, Y = 282, Radius = 6}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk}
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
		ChangeUnit { Unit = 1338, NpcId = self},
	}
}


EndDefinition()

end
