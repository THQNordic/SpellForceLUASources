--AngriffsDrache bei 7 intakten Drachensteinen

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
		
Despawn
{
	PlayDeathAnim = FALSE ,
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "DrachenstartP115"},
		IsNpcFlagFalse { Name = "DespawnOnlyOnce"},
	} ,
	Actions = 
	{
		SetNpcFlagTrue { Name = "DespawnOnlyOnce"},
	}
}
--Drachenhort1


Respawn 
{
	
	WaitTime = 150 ,
	UnitId = self ,
	Clan = 0 ,
	X = 58 ,
 	Y = 73 , 
	NoSpawnEffect = FALSE ,
	Conditions = 
	{
		IsGlobalCounter { Name = "DrachensteinZaehlerP115", Operator = IsGreaterOrEqual, Value = 2, UpdateInterval = 60},
		IsGlobalFlagTrue { Name = "ArbeiterStartP115" },
		IsGlobalFlagFalse { Name = "P115_FirstStoneOff" }, 	
	},
	Actions =
	{
		
	} ,
	
} 


--Drachenhort4


Respawn 
{
	
	WaitTime = 150 ,
	UnitId = self ,
	Clan = 0 ,
	X = 231,
 	Y = 175, 
	NoSpawnEffect = FALSE ,
	Conditions = 
	{
		IsGlobalCounter { Name = "DrachensteinZaehlerP115", Operator = IsGreaterOrEqual, Value = 2, UpdateInterval = 60},
		IsGlobalFlagTrue { Name = "ArbeiterStartP115" },
		IsGlobalFlagTrue { Name = "P115_FirstStoneOff" }, 
		IsGlobalFlagFalse { Name = "P115_FourthStoneOff" }, 	
	},
	Actions =
	{
		
	} ,
	
} 

--Drachenhort6
SpawnOnlyWhen
{
	X = 190,
 	Y = 203,  
	UnitId = self , 
	NoSpawnEffect = FALSE , 

	Conditions = 
		{	
			IsGlobalCounter { Name = "DrachensteinZaehlerP115", Operator = IsGreaterOrEqual, Value = 2, UpdateInterval = 60},
			IsGlobalFlagTrue { Name = "ArbeiterStartP115" },
			IsGlobalFlagTrue { Name = "P115_FirstStoneOff" }, 
			IsGlobalFlagTrue { Name = "P115_FourthStoneOff" }, 
			IsGlobalFlagFalse { Name = "P115_SixthStoneOff" }, 		
		} , 
	Actions = 
		{	

		} ,

}


Respawn 
{
	
	WaitTime = 150 ,
	UnitId = self ,
	Clan = 0 ,
	X = 190,
 	Y = 203, 
	NoSpawnEffect = FALSE ,
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "ArbeiterStartP115" },
		IsGlobalFlagTrue { Name = "P115_FirstStoneOff" }, 
		IsGlobalFlagTrue { Name = "P115_FourthStoneOff" }, 
		IsGlobalFlagFalse { Name = "P115_SixthStoneOff" }, 		
	},
	Actions =
	{
		
	} ,
	
} 


OnEvent
{
	Conditions = 
	{
		IsNpcCounter { Name = "AngriffsZaehlerBei7DrachensteinenP115", Operator = IsEqual, Value = 0, UpdateInterval = 60},
		IsGlobalFlagTrue { Name = "ArbeiterStartP115" },
		
	},
	Actions =
	{
		SetNpcTimeStamp { Name = "AngriffsTimerBei7DrachensteinenP115"},
		IncreaseNpcCounter {Name = "AngriffsZaehlerBei7DrachensteinenP115"},
		
	},
}

OnEvent
{
	Conditions = 
	{
		IsNpcCounter { Name = "AngriffsZaehlerBei7DrachensteinenP115", Operator = IsEqual, Value = 1, UpdateInterval = 60},
		IsNpcTimeElapsed { Name = "AngriffsTimerBei7DrachensteinenP115" , Seconds = 180, UpdateInterval = 60}, 

	},
	Actions =
	{
		Goto { X = 118 , Y = 159, NpcId = self , Range = 5 , WalkMode = Run , GotoMode = GotoContinous},
		ClearNpcTimeStamp{ Name = "AngriffsTimerBei7DrachensteinenP115"},
		ResetNpcCounter {Name = "AngriffsZaehlerBei7DrachensteinenP115"},
	},
}



EndDefinition()

end
