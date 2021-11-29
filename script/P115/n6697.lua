--INFO RIESENWÄCHTERDRACHE 3

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
		IsGlobalFlagFalse {Name = "P115_SeventhStoneOff" },
		
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
		IsGlobalFlagTrue { Name = "AngriffOberdrachen3P115" }, 
		
	},
	Actions = 
	{
		Goto { X = 114 , Y = 158, NpcId = self , Range = 2 , WalkMode = Run , GotoMode = GotoForced},

	},											
}		

		
EndDefinition()

end

