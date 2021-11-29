function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnPortalEvent
{
	X = 260, Y = 129, StayOpen = TRUE , Type = ElfenTor, 
	OpenConditions = 
	{ 
		--FigureInRange{X = 260, Y = 129, NpcId = self , Range = 2},
		IsGlobalFlagTrue{Name = "p101Grim÷ffnetElfentor", UpdateInterval = 20},
	
	} ,
	OpenActions = 
	{  
	},
}



EndDefinition()

end
