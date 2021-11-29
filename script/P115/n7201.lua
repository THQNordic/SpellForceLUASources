--> INFO DRACHE2

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	
	NoSpawnEffect = FALSE , 
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "CastDrachenVerstaerkung2P115"},
	} , 
	Actions = 
	{
		SetGlobalFlagTrue {Name = "GotoArynDrache2P115"},
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
		SetGlobalFlagTrue {Name = "GotoArynDrache2P115"},
		ResetNpcCounter{ Name = "GotoDrachen2P115"},
	} ,
	
} 

OnEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "GotoArynDrache2P115" },
		IsNpcCounter { Name = "GotoDrachen2P115", Operator = IsGreaterOrEqual, Value = 0},
	},
	Actions =
	{
		Goto { X = 64 , Y = 194, NpcId = self , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		IncreaseNpcCounter { Name = "GotoDrachen2P115"},
	} ,
	
} 









EndDefinition()

end
