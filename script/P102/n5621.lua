function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	
	  
	NoSpawnEffect = FALSE, 
	
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "DialogWasserquelleEnded"}, --Wenn der Dialog mit Setrius beendet wurde
	} ,
	Actions = 
	{
	  
	}
} 
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "TorGeoeffnetWaldlaeufer"}, --Wenn das Haupttor vom Avatar geöffnet wurde 
		
	},
	Actions =
	{
		 ChangeFigureOwner {NpcId = self},
	}
}

EndDefinition()

end
