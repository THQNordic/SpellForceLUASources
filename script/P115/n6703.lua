--INFO WÄCHTERDRACHE 6

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

Respawn 
{
	WaitTime = 300 ,
	UnitId = self ,
	Clan = 0 ,
	NoSpawnEffect = FALSE ,
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "DrachenstartP115" },
		IsGlobalFlagFalse { Name = "P115_FifthStoneOff" }, 
	},
	Actions =
	{
		ResetGlobalCounter { Name = "DracheWache6P115"},
	} ,
	
} 

OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{ Name = "DrachenstartP115"},
		IsGlobalCounter { Name = "DracheWache6P115", Operator = IsEqual, Value = 0, UpdateInterval = 60},
		
    },
	Actions =
	{
		IncreaseGlobalCounter { Name = "DracheWache6P115"},
		Goto { X = 200 , Y = 174, NpcId = self , Range = 3 , WalkMode = Run, GotoMode = GotoContinous},
		
	}
}

OnEvent
{
	Conditions =
	{
		
		FigureInRange { X = 200 , Y = 174, NpcId = self , Range = 3},
		IsGlobalCounter { Name = "DracheWache6P115", Operator = IsEqual, Value = 1, UpdateInterval = 60},
		
    },
	Actions =
	{
		ResetGlobalCounter { Name = "DracheWache6P115"},		
	}
}



EndDefinition()

end
