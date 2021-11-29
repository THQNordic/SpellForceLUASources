--> INFO DRACHE1

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	
	NoSpawnEffect = FALSE , 
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "CastDrachenVerstaerkung1P115"},
	} , 
	Actions = 
	{
		SetGlobalFlagTrue {Name = "GotoArynDrache1P115"},
	} 
}



Respawn 
{
	WaitTime = 15 ,
	UnitId = self ,
	Clan = 0 ,
	NoSpawnEffect = FALSE ,
	Conditions = 
	{
		
		IsGlobalFlagTrue {Name = "ArynTorOeffnenP115" },
		FigureAlive { NpcId = 6629}, 

		
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "GotoArynDrache1P115"},
		ResetNpcCounter{ Name = "GotoDrachen1P115"},
	} ,
	
} 

OnEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "GotoArynDrache1P115" },
		IsNpcCounter { Name = "GotoDrachen1P115", Operator = IsGreaterOrEqual, Value = 0},
		
	},
	Actions =
	{
		Goto { X = 64 , Y = 194, NpcId = self , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		IncreaseNpcCounter { Name = "GotoDrachen1P115"},
	} ,
	
} 
EndDefinition()

end
