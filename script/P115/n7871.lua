--AngriffsDrache bei 9 intakten Drachensteinen

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)



SpawnOnlyWhen
{
	X = 58 ,
 	Y = 73 ,  
	UnitId = self , 
	NoSpawnEffect = FALSE , 

	Conditions = 
		{	
			IsGlobalCounter { Name = "DrachensteinZaehlerP115", Operator = IsEqual, Value = 0, UpdateInterval = 60},
			IsGlobalFlagTrue { Name = "ArbeiterStartP115" },
			IsGlobalFlagFalse { Name = "P115_FirstStoneOff" }, 	
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
	X = 58 ,
 	Y = 73 , 
	NoSpawnEffect = FALSE ,
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "ArbeiterStartP115" },
		IsGlobalFlagFalse { Name = "P115_FirstStoneOff" }, 	
	},
	Actions =
	{
		
	} ,
	
} 

OnEvent
{
	Conditions = 
	{
		
		IsNpcCounter { Name = "AngriffsZaehlerBei9DrachensteinenP115", Operator = IsEqual, Value = 0, UpdateInterval = 60},
		IsGlobalFlagTrue { Name = "ArbeiterStartP115" },
		
	},
	Actions =
	{
		SetNpcTimeStamp { Name = "AngriffsTimerBei9DrachensteinenP115"},
		IncreaseNpcCounter {Name = "AngriffsZaehlerBei9DrachensteinenP115"},
		
	},
}

OnEvent
{
	Conditions = 
	{
		IsNpcCounter { Name = "AngriffsZaehlerBei9DrachensteinenP115", Operator = IsEqual, Value = 1, UpdateInterval = 60},
		IsNpcTimeElapsed { Name = "AngriffsTimerBei9DrachensteinenP115" , Seconds = 180, UpdateInterval = 60}, 

	},
	Actions =
	{
		Goto { X = 118 , Y = 159, NpcId = self , Range = 5 , WalkMode = Run , GotoMode = GotoContinous},
		ClearNpcTimeStamp{ Name = "AngriffsTimerBei9DrachensteinenP115"},
		ResetNpcCounter {Name = "AngriffsZaehlerBei9DrachensteinenP115"},
	},
}



EndDefinition()

end
