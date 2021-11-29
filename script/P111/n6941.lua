function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
 
	Conditions = 
	{
			IsGlobalFlagTrue { Name = "Torch3ElementarVerschwindenP111"},
			IsGlobalFlagFalse { Name = "SpawnCampsZerstoertP111"},
	} , 
	Actions = 
	{
			SetGlobalFlagTrue { Name = "2AngriffFackel3P111" }, 

	} 
}

Respawn
{
WaitTime = 60,
UnitId = self ,
NoSpawnEffect = FALSE , 
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "Fackel3ANP111"},
		IsGlobalFlagFalse { Name = "SpawnCampsZerstoertP111"},
	} , 
	Actions = 
	{
		SetGlobalFlagTrue { Name = "2AngriffFackel3P111" }, 

	} , 
	DeathActions = 
	{
	
	}
}

--Fackelangriff
OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "2AngriffFackel3P111" },
		
    },
	Actions =
	{
		Goto{ X = 304, Y = 127, NpcId = self , Range = 3 , WalkMode = Run , GotoMode = GotoContinuous},
		SetGlobalFlagFalse { Name = "2AngriffFackel3P111" }, 
	},
}

EndDefinition()

end
