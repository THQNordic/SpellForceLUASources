function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
 
	Conditions = 
	{
			IsGlobalFlagTrue { Name = "Torch4ElementarVerschwindenP111"},
			IsGlobalFlagFalse { Name = "SpawnCampsZerstoertP111"},
	} , 
	Actions = 
	{
			SetGlobalFlagTrue { Name = "1AngriffFackel4P111" }, 

	} 
}

Respawn
{
WaitTime = 60,
UnitId = self ,
NoSpawnEffect = FALSE , 
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "Fackel4ANP111"},
		IsGlobalFlagFalse { Name = "SpawnCampsZerstoertP111"},
	} , 
	Actions = 
	{
		SetGlobalFlagTrue { Name = "1AngriffFackel4P111" }, 

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
		IsGlobalFlagTrue { Name = "1AngriffFackel4P111" },
		
    },
	Actions =
	{
		Goto{ X = 90, Y = 125, NpcId = self , Range = 3 , WalkMode = Run , GotoMode = GotoContinuous},
		SetGlobalFlagFalse { Name = "1AngriffFackel4P111" }, 
	},
}


EndDefinition()

end
