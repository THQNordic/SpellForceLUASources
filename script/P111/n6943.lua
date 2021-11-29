function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
SpawnOnlyWhen
{
 
	Conditions = 
	{
			IsGlobalFlagTrue { Name = "Torch2ElementarVerschwindenP111"},
			IsGlobalFlagFalse { Name = "SpawnCampsZerstoertP111"},
	} , 
	Actions = 
	{
			SetGlobalFlagFalse { Name = "3AngriffFackel2P111" }, 
			
	} 
}

Respawn
{
WaitTime = 60,
UnitId = self ,
NoSpawnEffect = FALSE , 
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "Fackel2ANP111"},
		IsGlobalFlagFalse { Name = "SpawnCampsZerstoertP111"},
		
	} , 
	Actions = 
	{
			SetGlobalFlagFalse { Name = "3AngriffFackel2P111" }, 
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
		IsGlobalFlagTrue { Name = "3AngriffFackel2P111" },
		
    },
	Actions =
	{
		Goto{ X = 387, Y = 376, NpcId = self , Range = 3 , WalkMode = Run , GotoMode = GotoContinuous},
		SetGlobalFlagFalse { Name = "3AngriffFackel2P111" }, 
	},
}






EndDefinition()

end
