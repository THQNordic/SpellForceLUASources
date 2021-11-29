function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

dofile("script/p310/n66666_CutsceneEndfightEins.lua")
dofile("script/p310/n66666_CutsceneEndfightDark.lua")
dofile("script/p310/n66666_CutsceneEndfightHell.lua")


-- Items 7224-7229 sind für die Light Seite
-- Items 7230-7235 sind für Dark

-- Items 7236-7241 sind für Light QuestGiverItems
-- Items 7242-7247 sind für Dark QuestGiverItems

-- Items 7248-7253 sind für Light QuestSolverItems
-- Items 7254-7259 sind für Dark QuestSolverItems

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

-- Wenn der Spieler Items hat, die er aus den Lootkisten hat und die zu den Aufträgen gehören,
-- er aber nicht Auftragsinhaber war werden die Items wieder gelöscht

-- Light 1-6
OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasItem {ItemId = 7224},
		Negated (PlayerHasItem {ItemId = 7236})
	},
	Actions =
	{
		TransferItem {TakeItem = 7224, Flag = Take},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasItem {ItemId = 7225},
		Negated (PlayerHasItem {ItemId = 7237})
	},
	Actions =
	{
		TransferItem {TakeItem = 7225, Flag = Take},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasItem {ItemId = 7226},
		Negated (PlayerHasItem {ItemId = 7238})
	},
	Actions =
	{
		TransferItem {TakeItem = 7226, Flag = Take},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasItem {ItemId = 7227},
		Negated (PlayerHasItem {ItemId = 7239})
	},
	Actions =
	{
		TransferItem {TakeItem = 7227, Flag = Take},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasItem {ItemId = 7228},
		Negated (PlayerHasItem {ItemId = 7240})
	},
	Actions =
	{
		TransferItem {TakeItem = 7228, Flag = Take},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasItem {ItemId = 7229},
		Negated (PlayerHasItem {ItemId = 7241})
	},
	Actions =
	{
		TransferItem {TakeItem = 7229, Flag = Take},
	}
}

-- Dark 1-6
OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasItem {ItemId = 7230},
		Negated (PlayerHasItem {ItemId = 7242})
	},
	Actions =
	{
		TransferItem {TakeItem = 7230, Flag = Take},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasItem {ItemId = 7231},
		Negated (PlayerHasItem {ItemId = 7243})
	},
	Actions =
	{
		TransferItem {TakeItem = 7231, Flag = Take},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasItem {ItemId = 7232},
		Negated (PlayerHasItem {ItemId = 7244})
	},
	Actions =
	{
		TransferItem {TakeItem = 7232, Flag = Take},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasItem {ItemId = 7233},
		Negated (PlayerHasItem {ItemId = 7245})
	},
	Actions =
	{
		TransferItem {TakeItem = 7233, Flag = Take},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasItem {ItemId = 7234},
		Negated (PlayerHasItem {ItemId = 7246})
	},
	Actions =
	{
		TransferItem {TakeItem = 7234, Flag = Take},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasItem {ItemId = 7235},
		Negated (PlayerHasItem {ItemId = 7247})
	},
	Actions =
	{
		TransferItem {TakeItem = 7235, Flag = Take},
	}
}

-- Der Spieler hat beide Questen erfüllt, also soll er zum Portal kommen
OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasItem {ItemId = 7253},
		PlayerHasItem {ItemId = 7259},
		Negated
		(
			ODER9 
			{
				PlayerHasItem {ItemId = 7298},
				PlayerHasItem {ItemId = 7299}
			}
		)
	},
	Actions =
	{
		Outcry {Tag = "oca2nightsongP310_001", NpcId = 10048, String = "Runenkrieger! Triff mich beim Portal! Es ist wichtig!"},
		QuestBegin {QuestId = 954},
		QuestBegin {QuestId = 955},
		Goto {NpcId = 10366, X = 35, Y = 139, WalkMode = Run},
		Goto {NpcId = 10048, X = 62, Y = 169, WalkMode = Run},
	}
}

-- wenn eine Figur der Superquest tot ist bekommt der SPieler ein Item um diesen Zustand zu speichern
-- Plus Timer zum verzögern, weil bei Mapstart ja sowieso alle tot sind
OnOneTimeEvent
{
	Actions =
	{
		SetGlobalTimeStamp {Name = "ScheissCoop"},
		RevealUnExplored {X = 113, Y = 103, Range = 125},
		RevealUnExplored {X = 65, Y = 75, Range = 69},
		RevealUnExplored {X = 73, Y = 132, Range = 69},
		RevealUnExplored {X = 137, Y = 160, Range = 30},
		RevealUnExplored {X = 140, Y = 103, Range = 15},
		RevealUnExplored {X = 69, Y = 38, Range = 15},
		RevealUnExplored {X = 42, Y = 66, Range = 15},
		
	}
}

-- dunkel One
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "ScheissCoop", Seconds = 5},
		FigureDead {NpcId = 10366},
		PlayerHasItem {ItemId = 7259},
		Negated (
		ODER9
		{
			PlayerHasItem {ItemId = 7292},
			PlayerHasItem {ItemId = 7298}
		})
	},                                         
	Actions =                                  
	{                                          
		TransferItem {GiveItem = 7292, Flag = Give},
		QuestSolve {QuestId = 954},            
		QuestSolve {QuestId = 955},
	}
}

-- dunkel One
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "ScheissCoop", Seconds = 5},
		FigureDead {NpcId = 10366},
		PlayerHasItem {ItemId = 7259},
	},
	Actions =
	{
		QuestSolve {QuestId = 954},
		QuestSolve {QuestId = 955},
	}
}

-- Hell One
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "ScheissCoop", Seconds = 5},
		FigureDead {NpcId = 10048},
		PlayerHasItem {ItemId = 7253},
		Negated (
		ODER9
		{
			PlayerHasItem {ItemId = 7291},
			PlayerHasItem {ItemId = 7299}
		})
	},
	Actions =
	{
		TransferItem {GiveItem = 7291, Flag = Give},
		QuestSolve {QuestId = 954},
		QuestSolve {QuestId = 955},
	}
}

-- Hell One
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "ScheissCoop", Seconds = 5},
		FigureDead {NpcId = 10048},
		PlayerHasItem {ItemId = 7253},
	},
	Actions =
	{
		QuestSolve {QuestId = 954},
		QuestSolve {QuestId = 955},
	}
}

-- Dialoge aus, wenn all Done
OnOneTimeEvent
{
	Conditions =
	{
		ODER9 
		{
			PlayerHasItem {ItemId = 7298},
			PlayerHasItem {ItemId = 7299}
		}
	},
	Actions =
	{
		RemoveDialog {NpcId = 10366},
		RemoveDialog {NpcId = 10048},
	}
}
EndDefinition()
end

