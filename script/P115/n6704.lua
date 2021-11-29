--INFO WÄCHTERDRACHE 7

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
		IsGlobalFlagFalse { Name = "P115_SixthStoneOff" }, 
	},
	Actions =
	{
		ResetGlobalCounter { Name = "DracheWache7P115"},
	} ,
	
} 

OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{ Name = "DrachenstartP115"},
		IsGlobalCounter { Name = "DracheWache7P115", Operator = IsEqual, Value = 0, UpdateInterval = 60},
		
    },
	Actions =
	{
		IncreaseGlobalCounter { Name = "DracheWache7P115"},
		Goto { X = 159 , Y = 212, NpcId = self , Range = 3 , WalkMode = Run, GotoMode = GotoContinous},
		
	}
}

OnEvent
{
	Conditions =
	{
		
		FigureInRange { X = 159 , Y = 212, NpcId = self , Range = 3},
		IsGlobalCounter { Name = "DracheWache7P115", Operator = IsEqual, Value = 1, UpdateInterval = 60},
		
    },
	Actions =
	{
		ResetGlobalCounter { Name = "DracheWache7P115"},		
	}
}

EndDefinition()

end
