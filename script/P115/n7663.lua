-->INFO DRACHENVERSTÄRKUNG2

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{ 
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "CastDrachenVerstaerkung2P115"},
	} , 
	Actions = 
	{
		SetNpcFlagTrue { Name = "Angriffstart2"},
	}
}

Respawn 
{
	WaitTime = 30 ,
	UnitId = self ,
	Clan = 0 ,
	NoSpawnEffect = FALSE ,
	Conditions = 
	{
		IsGlobalFlagFalse {Name = "DracheEndP115" },
		
	},
	Actions =
	{
		SetNpcFlagTrue { Name = "Angriffstart2"},	
	} ,
	
} 


OnEvent								
{
	Conditions = 
	{ 
		IsNpcFlagTrue { Name = "Angriffstart2" }, 
		
	},
	Actions = 
	{
		Goto { X = 66 , Y = 193, NpcId = self , Range = 3 , WalkMode = Run , GotoMode = GotoContinous},
		SetNpcFlagFalse {Name = "Angriffstart2" }, 
	},											
}		


EndDefinition()

end
