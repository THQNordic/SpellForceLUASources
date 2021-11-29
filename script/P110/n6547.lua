--INFO SONNENELEMENTAL

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
		SetGlobalFlagTrue { Name = "RespawnElementSonneP110" },
		--ChangeFigureOwner{ NpcId = self},
	} ,
	
} 

--Das Elemental kann nun vom Spieler verwendet werden.

OnPlatformOneTimeEvent								
{
	Conditions = 
	{ 
		
		IsGlobalFlagTrue { Name = "P110_ElementalGateTwoOpen" }, 
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
		
		IsGlobalFlagTrue { Name = "RespawnElementSonneP110" }, 
	},
	Actions = 
	{
		ChangeFigureOwner{ NpcId = self},
		ChangeRace { Race = 0, NpcId = self},
		SetGlobalFlagFalse { Name = "RespawnElementSonneP110" },
	},											
}	


EndDefinition()

end
