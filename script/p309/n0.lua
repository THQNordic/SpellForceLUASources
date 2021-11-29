function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Coop/Händlerplattform

---- oberer Stadteil revealed
--OnPlatformOneTimeEvent()
--OnPlatformOneTimeEvent()
--OnPlatformOneTimeEvent()
--OnPlatformOneTimeEvent()
--OnPlatformOneTimeEvent()
--OnPlatformOneTimeEvent()
--
---- mittlerer Stadtteil 
--OnPlatformOneTimeEvent()
--OnPlatformOneTimeEvent()
--OnPlatformOneTimeEvent()
--OnPlatformOneTimeEvent()
--OnPlatformOneTimeEvent()
--OnPlatformOneTimeEvent()
--
---- unterer Stadteil rev
--OnPlatformOneTimeEvent()
--OnPlatformOneTimeEvent()
--OnPlatformOneTimeEvent()
--OnPlatformOneTimeEvent()
--OnPlatformOneTimeEvent()


OnOneTimeEvent
{
	Conditions =
	{
	},
	Actions =
	{
	RevealUnExplored{X = 422, Y = 215, Range = 100},
	RevealUnExplored{X = 392, Y = 291, Range = 100},
	RevealUnExplored{X = 450, Y = 287, Range = 100},
	RevealUnExplored{X = 430, Y = 271, Range = 100},	
	RevealUnExplored{X = 414, Y = 293, Range = 100},
	RevealUnExplored{X = 423, Y = 280, Range = 100},
                                                   
                                                   
	RevealUnExplored{X = 404, Y = 240, Range = 100},
	RevealUnExplored{X = 423, Y = 221, Range = 100},
	RevealUnExplored{X = 449, Y = 235, Range = 100},
	RevealUnExplored{X = 416, Y = 252, Range = 100},
	RevealUnExplored{X = 428, Y = 230, Range = 100},
	RevealUnExplored{X = 433, Y = 257, Range = 100},
                                                   
                                                   
	RevealUnExplored{X = 412, Y = 204, Range = 100},
	RevealUnExplored{X = 433, Y = 203, Range = 100},
	RevealUnExplored{X = 398, Y = 198, Range = 100},
	RevealUnExplored{X = 419, Y = 165, Range = 100},
	RevealUnExplored{X = 418, Y = 181, Range = 100},

	}
}

-- Questbdingungen für Coopquesten auch hier
-- Die gute Seite
-- Das erste gute Item
OnOneTimeEvent
{            
	Conditions =
	{   
		PlayerHasItem {ItemId = 7236}
	},       
	Actions =
	{   
		QuestBegin {QuestId = 953},     
		QuestBegin {QuestId = 915},
	}        
}            
             
OnOneTimeEvent
{            
	Conditions =
	{        
		PlayerHasItem {ItemId = 7248}
	},       
	Actions =
	{        
		QuestBegin {QuestId = 953},
		QuestSolve {QuestId = 915},
	}        
}

-- Das zweite Item
OnOneTimeEvent
{            
	Conditions =
	{   
		PlayerHasItem {ItemId = 7237}
	},       
	Actions =
	{        
		QuestBegin {QuestId = 953},
		QuestBegin {QuestId = 916},
		QuestSolve {QuestId = 915},
	}        
}            
             
OnOneTimeEvent
{            
	Conditions =
	{        
		PlayerHasItem {ItemId = 7249}
	},       
	Actions =
	{        
		QuestBegin {QuestId = 953},
		QuestSolve {QuestId = 916},
		QuestSolve {QuestId = 915},
	}        
}

-- Das dritte Item
OnOneTimeEvent
{            
	Conditions =
	{   
		PlayerHasItem {ItemId = 7238}
	},       
	Actions =
	{        
		QuestBegin {QuestId = 953},
		QuestBegin {QuestId = 917},
		QuestSolve {QuestId = 916},
		QuestSolve {QuestId = 915},
	}        
}            
             
OnOneTimeEvent
{            
	Conditions =
	{        
		PlayerHasItem {ItemId = 7250}
	},       
	Actions =
	{        
		QuestBegin {QuestId = 953},
		QuestSolve {QuestId = 917},
		QuestSolve {QuestId = 916},
		QuestSolve {QuestId = 915},
	}        
}

-- Das vierte gute Item
OnOneTimeEvent
{            
	Conditions =
	{   
		PlayerHasItem {ItemId = 7239}
	},       
	Actions =
	{        
		QuestBegin {QuestId = 953},
		QuestBegin {QuestId = 927},
		QuestSolve {QuestId = 917},
		QuestSolve {QuestId = 916},
		QuestSolve {QuestId = 915},
	}        
}            
             
OnOneTimeEvent
{            
	Conditions =
	{        
		PlayerHasItem {ItemId = 7251}
	},       
	Actions =
	{        
		QuestBegin {QuestId = 953},
		QuestSolve {QuestId = 927},
		QuestSolve {QuestId = 917},
		QuestSolve {QuestId = 916},
		QuestSolve {QuestId = 915},
	}        
}

-- Das fuenfte gute Item
OnOneTimeEvent
{            
	Conditions =
	{   
		PlayerHasItem {ItemId = 7240}
	},       
	Actions =
	{        
		QuestBegin {QuestId = 953},
		QuestBegin {QuestId = 919},
		QuestSolve {QuestId = 927},
		QuestSolve {QuestId = 917},
		QuestSolve {QuestId = 916},
		QuestSolve {QuestId = 915},
	}        
}            
             
OnOneTimeEvent
{            
	Conditions =
	{        
		PlayerHasItem {ItemId = 7252}
	},       
	Actions =
	{        
		QuestBegin {QuestId = 953},
		QuestSolve {QuestId = 919},
		QuestSolve {QuestId = 927},
		QuestSolve {QuestId = 917},
		QuestSolve {QuestId = 916},
		QuestSolve {QuestId = 915},
	}        
}

-- Das sechste gute Item
OnOneTimeEvent
{            
	Conditions =
	{   
		PlayerHasItem {ItemId = 7241}
	},       
	Actions =
	{        
		QuestBegin {QuestId = 953},
		QuestBegin {QuestId = 920},
		QuestSolve {QuestId = 919},
		QuestSolve {QuestId = 927},
		QuestSolve {QuestId = 917},
		QuestSolve {QuestId = 916},
		QuestSolve {QuestId = 915},
	}        
}            
             
OnOneTimeEvent
{            
	Conditions =
	{        
		PlayerHasItem {ItemId = 7253}
	},       
	Actions =
	{        
		QuestSolve {QuestId = 953},
		QuestSolve {QuestId = 920},
		QuestSolve {QuestId = 919},
		QuestSolve {QuestId = 927},
		QuestSolve {QuestId = 917},
		QuestSolve {QuestId = 916},
		QuestSolve {QuestId = 915},
	}        
}

-- Die dunkle Seite
-- Das erste Item
OnOneTimeEvent
{            
	Conditions =
	{   
		PlayerHasItem {ItemId = 7242}
	},       
	Actions =
	{        
		QuestBegin {QuestId = 952},
		QuestBegin {QuestId = 921},
	}        
}            
             
OnOneTimeEvent
{            
	Conditions =
	{        
		PlayerHasItem {ItemId = 7254}
	},       
	Actions =
	{        
		QuestBegin {QuestId = 952},
		QuestSolve {QuestId = 921},
	}        
}

-- Das zweite Item
OnOneTimeEvent
{            
	Conditions =
	{   
		PlayerHasItem {ItemId = 7243}
	},       
	Actions =
	{        
		QuestBegin {QuestId = 952},
		QuestBegin {QuestId = 922},
		QuestSolve {QuestId = 921},
	}        
}            
             
OnOneTimeEvent
{            
	Conditions =
	{        
		PlayerHasItem {ItemId = 7255}
	},       
	Actions =
	{        
		QuestBegin {QuestId = 952},
		QuestSolve {QuestId = 922},
		QuestSolve {QuestId = 921},
	}        
}

-- Das dritte Item
OnOneTimeEvent
{            
	Conditions =
	{   
		PlayerHasItem {ItemId = 7244}
	},       
	Actions =
	{        
		QuestBegin {QuestId = 952},
		QuestBegin {QuestId = 923},
		QuestSolve {QuestId = 922},
		QuestSolve {QuestId = 921},
	}        
}            
             
OnOneTimeEvent
{            
	Conditions =
	{        
		PlayerHasItem {ItemId = 7256}
	},       
	Actions =
	{        
		QuestBegin {QuestId = 952},
		QuestSolve {QuestId = 923},
		QuestSolve {QuestId = 922},
		QuestSolve {QuestId = 921},
	}        
}

-- Das vierte dunkle Item
OnOneTimeEvent
{            
	Conditions =
	{   
		PlayerHasItem {ItemId = 7245}
	},       
	Actions =
	{        
		QuestBegin {QuestId = 952},
		QuestBegin {QuestId = 924},
		QuestSolve {QuestId = 923},
		QuestSolve {QuestId = 922},
		QuestSolve {QuestId = 921},
	}        
}            
             
OnOneTimeEvent
{            
	Conditions =
	{        
		PlayerHasItem {ItemId = 7257}
	},       
	Actions =
	{        
		QuestBegin {QuestId = 952},
		QuestSolve {QuestId = 924},
		QuestSolve {QuestId = 923},
		QuestSolve {QuestId = 922},
		QuestSolve {QuestId = 921},
	}        
}

-- Das fuenfte dunkle Item
OnOneTimeEvent
{            
	Conditions =
	{   
		PlayerHasItem {ItemId = 7246}
	},       
	Actions =
	{        
		QuestBegin {QuestId = 952},
		QuestBegin {QuestId = 925},
		QuestSolve {QuestId = 923},
		QuestSolve {QuestId = 922},
		QuestSolve {QuestId = 921},
	}        
}            
             
OnOneTimeEvent
{            
	Conditions =
	{        
		PlayerHasItem {ItemId = 7258}
	},       
	Actions =
	{        
		QuestBegin {QuestId = 952},
		QuestSolve {QuestId = 925},
		QuestSolve {QuestId = 923},
		QuestSolve {QuestId = 922},
		QuestSolve {QuestId = 921},
	}        
}

-- Das sechste dunkle Item
OnOneTimeEvent
{            
	Conditions =
	{   
		PlayerHasItem {ItemId = 7247}
	},       
	Actions =
	{        
		QuestBegin {QuestId = 952},
		QuestBegin {QuestId = 926},
		QuestSolve {QuestId = 925},
		QuestSolve {QuestId = 923},
		QuestSolve {QuestId = 922},
		QuestSolve {QuestId = 921},
	}        
}            
             
OnOneTimeEvent
{            
	Conditions =
	{        
		PlayerHasItem {ItemId = 7259}
	},       
	Actions =
	{        
		QuestSolve {QuestId = 952},
		QuestSolve {QuestId = 926},
		QuestSolve {QuestId = 925},
		QuestSolve {QuestId = 923},
		QuestSolve {QuestId = 922},
		QuestSolve {QuestId = 921},
	}        
}

EndDefinition()

end
