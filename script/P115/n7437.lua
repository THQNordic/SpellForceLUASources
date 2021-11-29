--> INFO ANGRIFFSOBERDRACHE3

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






Respawn 
{
	WaitTime = 300 ,
	UnitId = self ,
	Clan = 0 ,
	NoSpawnEffect = FALSE ,
	Conditions = 
	{
		IsGlobalFlagFalse {Name = "P115_SeventhStoneOff" },
		
	},
	Actions =
	{
	
	} ,
	
} 



EndDefinition()

end
