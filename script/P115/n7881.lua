--AngriffsDrache bei 2 intakten Drachensteinen

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
		IsGlobalCounter { Name = "DrachensteinZaehlerP115", Operator = IsGreaterOrEqual, Value = 7, UpdateInterval = 60},
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
		IsGlobalCounter { Name = "DrachensteinZaehlerP115", Operator = IsGreaterOrEqual, Value = 7, UpdateInterval = 60},
		IsGlobalFlagTrue { Name = "ArbeiterStartP115" },
		IsGlobalFlagTrue { Name = "P115_FirstStoneOff" }, 
		IsGlobalFlagFalse { Name = "P115_FourthStoneOff" }, 	
	},
	Actions =
	{
		
	} ,
	
} 

--Drachenhort6


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
		IsGlobalCounter { Name = "DrachensteinZaehlerP115", Operator = IsGreaterOrEqual, Value = 7, UpdateInterval = 60},
		IsGlobalFlagTrue { Name = "ArbeiterStartP115" },
		IsGlobalFlagTrue { Name = "P115_FirstStoneOff" }, 
		IsGlobalFlagTrue { Name = "P115_FourthStoneOff" }, 
		IsGlobalFlagFalse { Name = "P115_SixthStoneOff" }, 			
	},
	Actions =
	{
		
	} ,
	
} 

--Drachenhort2


Respawn 
{
	
	WaitTime = 150 ,
	UnitId = self ,
	Clan = 0 ,
	X = 70,
 	Y = 30, 
	NoSpawnEffect = FALSE ,
	Conditions = 
	{
		IsGlobalCounter { Name = "DrachensteinZaehlerP115", Operator = IsGreaterOrEqual, Value = 7, UpdateInterval = 60},
		IsGlobalFlagTrue { Name = "ArbeiterStartP115" },
		IsGlobalFlagTrue { Name = "P115_FirstStoneOff" }, 
		IsGlobalFlagTrue { Name = "P115_FourthStoneOff" }, 
		IsGlobalFlagTrue { Name = "P115_SixthStoneOff" }, 	
		IsGlobalFlagFalse { Name = "P115_SecondStoneOff" }, 
	},
	Actions =
	{
		
	} ,
	
} 

--Drachenhort5


Respawn 
{
	
	WaitTime = 150 ,
	UnitId = self ,
	Clan = 0 ,
	X = 230,
 	Y = 208, 
	NoSpawnEffect = FALSE ,
	Conditions = 
	{
		IsGlobalCounter { Name = "DrachensteinZaehlerP115", Operator = IsGreaterOrEqual, Value = 7, UpdateInterval = 60},
		IsGlobalFlagTrue { Name = "ArbeiterStartP115" },
		IsGlobalFlagTrue { Name = "P115_FirstStoneOff" }, 
		IsGlobalFlagTrue { Name = "P115_FourthStoneOff" }, 
		IsGlobalFlagTrue { Name = "P115_SixthStoneOff" }, 	
		IsGlobalFlagTrue { Name = "P115_SecondStoneOff" }, 	
		IsGlobalFlagFalse { Name = "P115_FifthStoneOff" }, 	
	},
	Actions =
	{
		
	} ,
	
} 

--Drachenhort3


Respawn 
{
	
	WaitTime = 150 ,
	UnitId = self ,
	Clan = 0 ,
	X = 107,
 	Y = 23, 
	NoSpawnEffect = FALSE ,
	Conditions = 
	{
		IsGlobalCounter { Name = "DrachensteinZaehlerP115", Operator = IsGreaterOrEqual, Value = 7, UpdateInterval = 60},
		IsGlobalFlagTrue { Name = "ArbeiterStartP115" },
		IsGlobalFlagTrue { Name = "P115_FirstStoneOff" }, 
		IsGlobalFlagTrue { Name = "P115_FourthStoneOff" }, 
		IsGlobalFlagTrue { Name = "P115_SixthStoneOff" }, 	
		IsGlobalFlagTrue { Name = "P115_SecondStoneOff" }, 	
		IsGlobalFlagTrue { Name = "P115_FifthStoneOff" }, 
		IsGlobalFlagFalse { Name = "P115_ThirdStoneOff" }, 		
	},
	Actions =
	{
		
	} ,
	
} 


--Drachenhort7



Respawn 
{
	
	WaitTime = 150 ,
	UnitId = self ,
	Clan = 0 ,
	X = 108,
 	Y = 215, 
	NoSpawnEffect = FALSE ,
	Conditions = 
	{
		IsGlobalCounter { Name = "DrachensteinZaehlerP115", Operator = IsGreaterOrEqual, Value = 7, UpdateInterval = 60},
		IsGlobalFlagTrue { Name = "ArbeiterStartP115" },
		IsGlobalFlagTrue { Name = "P115_FirstStoneOff" }, 
		IsGlobalFlagTrue { Name = "P115_FourthStoneOff" }, 
		IsGlobalFlagTrue { Name = "P115_SixthStoneOff" }, 	
		IsGlobalFlagTrue { Name = "P115_SecondStoneOff" }, 	
		IsGlobalFlagTrue { Name = "P115_FifthStoneOff" }, 
		IsGlobalFlagTrue { Name = "P115_ThirdStoneOff" }, 
		IsGlobalFlagFalse { Name = "P115_SeventhStoneOff" }, 	
	},
	Actions =
	{
		
	} ,
	
} 


--Drachenhort8



Respawn 
{
	
	WaitTime = 150 ,
	UnitId = self ,
	Clan = 0 ,
	X = 69,
 	Y = 150, 
	NoSpawnEffect = FALSE ,
	Conditions = 
	{
		IsGlobalCounter { Name = "DrachensteinZaehlerP115", Operator = IsGreaterOrEqual, Value = 7, UpdateInterval = 60},
		IsGlobalFlagTrue { Name = "ArbeiterStartP115" },
		IsGlobalFlagTrue { Name = "P115_FirstStoneOff" }, 
		IsGlobalFlagTrue { Name = "P115_FourthStoneOff" }, 
		IsGlobalFlagTrue { Name = "P115_SixthStoneOff" }, 	
		IsGlobalFlagTrue { Name = "P115_SecondStoneOff" }, 	
		IsGlobalFlagTrue { Name = "P115_FifthStoneOff" }, 
		IsGlobalFlagTrue { Name = "P115_ThirdStoneOff" }, 
		IsGlobalFlagTrue { Name = "P115_SeventhStoneOff" },
		IsGlobalFlagFalse { Name = "P115_EigthStoneOff" },
	},
	Actions =
	{
		
	} ,
	
} 




OnEvent
{
	Conditions = 
	{
		IsNpcCounter { Name = "AngriffsZaehlerBei2DrachensteinenP115", Operator = IsEqual, Value = 0, UpdateInterval = 60},
		IsGlobalFlagTrue { Name = "ArbeiterStartP115" },
		
	},
	Actions =
	{
		SetNpcTimeStamp { Name = "AngriffsTimerBei2DrachensteinenP115"},
		IncreaseNpcCounter {Name = "AngriffsZaehlerBei2DrachensteinenP115"},
		
	},
}

OnEvent
{
	Conditions = 
	{
		IsNpcCounter { Name = "AngriffsZaehlerBei2DrachensteinenP115", Operator = IsEqual, Value = 1, UpdateInterval = 60},
		IsNpcTimeElapsed { Name = "AngriffsTimerBei2DrachensteinenP115" , Seconds = 180, UpdateInterval = 60}, 

	},
	Actions =
	{
		Goto { X = 118 , Y = 159, NpcId = self , Range = 5 , WalkMode = Run , GotoMode = GotoContinous},
		ClearNpcTimeStamp{ Name = "AngriffsTimerBei2DrachensteinenP115"},
		ResetNpcCounter {Name = "AngriffsZaehlerBei2DrachensteinenP115"},
	},
}



EndDefinition()

end

