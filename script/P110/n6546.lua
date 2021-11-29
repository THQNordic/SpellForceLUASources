--INFO MONDELEMENTAL

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
		
		
	},
	Actions =
	{
		SetGlobalFlagTrue { Name = "RespawnElementMondP110" },
		--ChangeFigureOwner{ NpcId = self},
	} ,
	
} 

--Das Elemental kann nun vom Spieler verwendet werden.

OnPlatformOneTimeEvent								
{
	Conditions = 
	{ 
		
		IsGlobalFlagTrue { Name = "P110_ElementalGateOneOpen" }, 
	},
	Actions = 
	{
		ChangeFigureOwner{ NpcId = self},
		ChangeRace { Race = 0, NpcId = self},

	},											
}	

--Das Elemental kann nun vom Spieler verwendet werden.

OnEvent
{
	Conditions = 
	{ 
		
		IsGlobalFlagTrue { Name = "RespawnElementMondP110" }, 
	},
	Actions = 
	{
		ChangeFigureOwner{ NpcId = self},
		ChangeRace { Race = 0, NpcId = self},
		SetGlobalFlagFalse { Name = "RespawnElementMondP110" },
	},											
}	


EndDefinition()

end