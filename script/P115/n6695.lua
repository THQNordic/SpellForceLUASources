--INFO RIESENWÄCHTERDRACHE 1

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

Respawn 
{
	WaitTime = 30 ,
	UnitId = self ,
	Clan = 0 ,
	NoSpawnEffect = FALSE ,
	Conditions = 
	{
		IsGlobalFlagFalse {Name = "P115_NinthStoneOff" },
		
	},
	Actions =
	{
		--ResetGlobalCounter { Name = "DracheWache5P115"},
	} ,
	
} 


OnPlatformOneTimeEvent								
{
	Conditions = 
	{ 
		IsGlobalFlagTrue { Name = "AngriffOberdrachen2P115" }, 
		
	},
	Actions = 
	{
		Goto { X = 114 , Y = 158, NpcId = self , Range = 2 , WalkMode = Run , GotoMode = GotoForced},

	},											
}							




EndDefinition()

end
