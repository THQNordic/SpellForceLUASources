function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
 
	Conditions = 
	{
			IsGlobalFlagTrue { Name = "Torch1ElementarVerschwindenP111"},
			IsGlobalFlagFalse { Name = "SpawnCampsZerstoertP111"},
	} , 
	Actions = 
	{
			SetGlobalFlagTrue { Name = "3AngriffFackel1P111" }, 

	} 
}

Respawn
{
WaitTime = 60,
UnitId = self ,
NoSpawnEffect = FALSE , 
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "Fackel1ANP111"},
		IsGlobalFlagFalse { Name = "SpawnCampsZerstoertP111"},
	} , 
	Actions = 
	{
		SetGlobalFlagTrue { Name = "3AngriffFackel1P111" }, 

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
		IsGlobalFlagTrue { Name = "3AngriffFackel1P111" },
		
    },
	Actions =
	{
		Goto{ X = 113, Y = 451, NpcId = self , Range = 3 , WalkMode = Run , GotoMode = GotoContinuous},
		SetGlobalFlagFalse { Name = "3AngriffFackel1P111" }, 
	},
}

EndDefinition()

end
