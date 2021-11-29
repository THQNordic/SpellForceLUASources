--AngriffsDrache2 bei 2 Drachensteinen

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{

UnitId = self , 
NoSpawnEffect = FALSE , 

	Conditions = 
		{	
			IsGlobalCounter { Name = "DrachensteinZaehlerP115", Operator = IsGreaterOrEqual, Value = 4, UpdateInterval = 60},
			IsGlobalFlagTrue { Name = "ArbeiterStartP115" },
			IsGlobalFlagFalse { Name = "P115_FifthStoneOff" }, 	
		} , 
	Actions = 
		{	

		} ,

}

Respawn 
{
	WaitTime = 300 ,
	UnitId = self ,
	Clan = 0 ,
	NoSpawnEffect = FALSE ,
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "ArbeiterStartP115" },
		IsGlobalFlagFalse { Name = "P115_FifthStoneOff" }, 	
	},
	Actions =
	{
		
	} ,
	
} 

OnEvent
{
	Conditions = 
	{
		IsGlobalCounter { Name = "AngriffsZaehlerBei2DrachensteinenP115", Operator = IsEqual, Value = 0, UpdateInterval = 60},
		IsGlobalFlagTrue { Name = "ArbeiterStartP115" },
		IsGlobalFlagFalse { Name = "P115_FifthStoneOff" }, 	
	},
	Actions =
	{
		SetGlobalTimeStamp { Name = "AngriffsTimerBei2DrachensteinenP115"},
		IncreaseGlobalCounter {Name = "AngriffsZaehlerBei2DrachensteinenP115"},
		
	},
}

OnEvent
{
	Conditions = 
	{
		IsGlobalCounter { Name = "AngriffsZaehlerBei2DrachensteinenP115", Operator = IsEqual, Value = 1, UpdateInterval = 60},
		IsGlobalTimeElapsed { Name = "AngriffsTimerBei2DrachensteinenP115" , Seconds = 420, UpdateInterval = 60}, 

	},
	Actions =
	{
		Goto { X = 105 , Y = 165, NpcId = self , Range = 5 , WalkMode = Run , GotoMode = GotoContinous},
		ClearGlobalTimeStamp{ Name = "AngriffsTimerBei2DrachensteinenP115"},
		ResetGlobalCounter {Name = "AngriffsZaehlerBei2DrachensteinenP115"},
	},
}



EndDefinition()

end

