--INFO WÄCHTERDRACHE 1

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

Respawn 
{
	WaitTime = 200 ,
	UnitId = self ,
	Clan = 0 ,
	NoSpawnEffect = FALSE ,
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "DrachenstartP115" },
		IsGlobalFlagFalse { Name = "P115_FirstStoneOff" }, 	
	},
	Actions =
	{
		ResetGlobalCounter { Name = "DracheWache1P115"},
	} ,
	
} 

OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{ Name = "DrachenstartP115"},
		IsGlobalCounter { Name = "DracheWache1P115", Operator = IsEqual, Value = 0, UpdateInterval = 60},
		
    },
	Actions =
	{
		IncreaseGlobalCounter { Name = "DracheWache1P115"},
		Goto { X = 139 , Y = 103, NpcId = self , Range = 3 , WalkMode = Run, GotoMode = GotoContinous},
		
	}
}

OnEvent
{
	Conditions =
	{
		
		FigureInRange { X = 139 , Y = 103, NpcId = self , Range = 3},
		IsGlobalCounter { Name = "DracheWache1P115", Operator = IsEqual, Value = 1, UpdateInterval = 60},
		
    },
	Actions =
	{
		ResetGlobalCounter { Name = "DracheWache1P115"},		
	}
}




EndDefinition()

end
