function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	
	  
	NoSpawnEffect = FALSE, 
	
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "DialogWasserquelleEnded"}, --Wenn der Dialog mit Setrius beendet wurde
		IsGlobalFlagTrue {Name = "UnterstuetzungstruppenP102"}, --wenn mehr als 10 Waldläufer getötet wurden
	} ,
	Actions = 
	{
	  	SetGlobalFlagTrue {Name = "AngriffUnterstuetzungseinheiten6P102"},
	}
} 



OnEvent
{
	
	Conditions = 
	{
		
		IsGlobalFlagTrue {Name = "AngriffUnterstuetzungseinheiten6P102"}, --wenn mehr als 10 Waldläufer getötet wurden
		IsGlobalCounter { Name = "AngriffUnterstuetzungseinheiten6P102", Operator = IsEqual, Value = 0, UpdateInterval = 10},
	} ,
	Actions = 
	{
	  	
		IncreaseGlobalCounter { Name = "AngriffUnterstuetzungseinheiten6P102" },
		ChangeFigureOwner {NpcId = self},
		Goto {X = 120 , Y = 302, NpcId = self , Range = 5 , WalkMode = Run , GotoMode = GotoNormal},

	}
} 



Respawn 
{
	WaitTime = 60 ,
	UnitId = self ,
	Clan = 0 ,
	NoSpawnEffect = FALSE ,
	Conditions = 
	{
		
		
	},
	Actions =
	{
		ResetGlobalCounter { Name = "AngriffUnterstuetzungseinheiten6P102"},
	} ,
	
} 

EndDefinition()

end