--AngriffsDrache bei 8 intakten Drachensteinen

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
		IsGlobalCounter { Name = "DrachensteinZaehlerP115", Operator = IsGreaterOrEqual, Value = 1, UpdateInterval = 60},
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
		IsGlobalCounter { Name = "DrachensteinZaehlerP115", Operator = IsGreaterOrEqual, Value = 1, UpdateInterval = 60},
		IsGlobalFlagTrue { Name = "ArbeiterStartP115" },
		IsGlobalFlagTrue { Name = "P115_FirstStoneOff" }, 
		IsGlobalFlagFalse { Name = "P115_FourthStoneOff" }, 	
	},
	Actions =
	{
		
	} ,
	
} 



OnEvent
{
	Conditions = 
	{
		IsNpcCounter { Name = "AngriffsZaehlerBei8DrachensteinenP115", Operator = IsEqual, Value = 0, UpdateInterval = 60},
		IsGlobalFlagTrue { Name = "ArbeiterStartP115" },
		
	},
	Actions =
	{
		SetNpcTimeStamp { Name = "AngriffsTimerBei8DrachensteinenP115"},
		IncreaseNpcCounter {Name = "AngriffsZaehlerBei8DrachensteinenP115"},
		
	},
}

OnEvent
{
	Conditions = 
	{
		IsNpcCounter { Name = "AngriffsZaehlerBei8DrachensteinenP115", Operator = IsEqual, Value = 1, UpdateInterval = 60},
		IsNpcTimeElapsed { Name = "AngriffsTimerBei8DrachensteinenP115" , Seconds = 180, UpdateInterval = 60}, 

	},
	Actions =
	{
		Goto { X = 118 , Y = 159, NpcId = self , Range = 5 , WalkMode = Run , GotoMode = GotoContinous},
		ClearNpcTimeStamp{ Name = "AngriffsTimerBei8DrachensteinenP115"},
		ResetNpcCounter {Name = "AngriffsZaehlerBei8DrachensteinenP115"},
	},
}



EndDefinition()

end
