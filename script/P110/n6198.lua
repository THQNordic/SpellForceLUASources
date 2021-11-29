--INFO MOND-ELEMENTAR

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

Respawn 
{
	WaitTime = 600 ,
	UnitId = self ,
	Clan = 0 ,
	NoSpawnEffect = FALSE ,
	Conditions = 
	{
		
		
	},
	Actions =
	{
		SetGlobalFlagTrue { Name = "RespawnElementMond2P110" },
		--ChangeFigureOwner{ NpcId = self},
	} ,
	
} 

SpawnOnlyWhen
{
	
	
	NoSpawnEffect = FALSE, 
	
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "DialogZhaalTuorEnded"}, --Wenn der Dialog mit Setrius beendet wurde
	} ,
	Actions = 
	{
	  	SetEffect{ Effect =  "Materialize",  NpcId = self},
	}
} 

OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "DialogZhaalTuorEnded"}, --Wenn das Haupttor vom Avatar geöffnet wurde 
		
	},
	Actions =
	{
		 ChangeFigureOwner {NpcId = self},
		 ChangeRace { Race = 0, NpcId = self},
	}
}



--Das Elemental kann nun vom Spieler verwendet werden.

OnEvent
{
	Conditions = 
	{ 
		
		IsGlobalFlagTrue { Name = "RespawnElementMond2P110" }, 
	},
	Actions = 
	{
		ChangeFigureOwner{ NpcId = self},
		ChangeRace { Race = 0, NpcId = self},
		SetGlobalFlagFalse { Name = "RespawnElementMond2P110" }, 
	},											
}	

EndDefinition()

end
