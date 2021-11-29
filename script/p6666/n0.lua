function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

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
		QuestSolve {QuestId = 924},
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
		QuestSolve {QuestId = 924},
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
		QuestSolve {QuestId = 924},
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
		QuestSolve {QuestId = 924},
		QuestSolve {QuestId = 923},
		QuestSolve {QuestId = 922},
		QuestSolve {QuestId = 921},
	}        
}

-- Die Kisten auf Coop 33 löschen, so lange der Auftrag dafür nicht besteht

OnOneTimeEvent
{
	Conditions =
	{
		ODER9
		{
			Negated(PlayerHasItem {ItemId = 7242}),
			PlayerHasItem {ItemId = 7230}
		}
	},
	Actions =
	{
		RemoveObject {X = 388, Y = 85, Object = 3187},
	}
	
	
}

-- Die Kisten auf Coop 36 löschen, so lange der Auftrag dafür nicht besteht

OnOneTimeEvent
{
	Conditions =
	{
		ODER9
		{
			Negated(PlayerHasItem {ItemId = 7243}),
			PlayerHasItem {ItemId = 7231}
		}
	},
	Actions =
	{
		RemoveObject {X = 186, Y = 55, Object = 3188},
		RemoveObject {X = 186, Y = 56, Object = 3188}
	}
}

-- Die Kisten auf Coop 38 löschen, so lange der Auftrag dafür nicht besteht

OnOneTimeEvent
{
	Conditions =
	{
		ODER9
		{
			Negated(PlayerHasItem {ItemId = 7244}),
			PlayerHasItem {ItemId = 7232}
		}
	},
	Actions =
	{
		RemoveObject {X = 168, Y = 356, Object = 3189}
	}
}

-- Die Kisten auf Coop 40 löschen, so lange der Auftrag dafür nicht besteht

OnOneTimeEvent
{
	Conditions =
	{
		ODER9
		{
			Negated(PlayerHasItem {ItemId = 7245}),
			PlayerHasItem {ItemId = 7233}
		}
	},
	Actions =
	{
		RemoveObject {X = 443, Y = 140, Object = 3190},
		RemoveObject {X = 441, Y = 140, Object = 3190}
	}
	
	
}

-- Die Kisten auf Coop 43 löschen, so lange der Auftrag dafür nicht besteht

OnOneTimeEvent
{
	Conditions =
	{
		ODER9
		{
			Negated(PlayerHasItem {ItemId = 7246}),
			PlayerHasItem {ItemId = 7234}
		}
	},
	Actions =
	{
		RemoveObject {X = 256, Y = 140, Object = 3191}
	}
	
	
}

-- Die Kisten auf Coop 45 löschen, so lange der Auftrag dafür nicht besteht

OnOneTimeEvent
{
	Conditions =
	{
		ODER9
		{
			Negated(PlayerHasItem {ItemId = 7247}),
			PlayerHasItem {ItemId = 7235}
		}
	},
	Actions =
	{
		RemoveObject {X = 149, Y = 179, Object = 3192}
	}
	
	
}


-- Ab hier werden die Gegner auf den Karten gespawnt
Help33Spawn = CGdsFigureSpawn:new(1000000, 387, 76)
Help33Spawn:AddUnit(2551)
-- Unit und Ort OK
OnOneTimeEvent
{            
	Conditions =
	{   
		PlayerHasItem {ItemId = 7242},
		ObjectExists {X = 388, Y = 85, ObjectId = 3187}
	},       
	Actions =
	{        
		Help33Spawn
	}        
} 

Help36Spawn = CGdsFigureSpawn:new(1000000, 184, 54)
Help36Spawn:AddUnit(2552)
-- Unit und Ort OK
OnOneTimeEvent
{            
	Conditions =
	{   
		PlayerHasItem {ItemId = 7243},
		ODER9
		{
			ObjectExists {X = 186, Y = 56, ObjectId = 3188},
			ObjectExists {X = 186, Y = 55, ObjectId = 3188}
		},
	},       
	Actions =
	{        
		Help36Spawn
	}        
}

Help38Spawn = CGdsFigureSpawn:new(1000000, 161, 363)
Help38Spawn:AddUnit(2556)
-- Unit und Ort OK
OnOneTimeEvent
{            
	Conditions =
	{   
		PlayerHasItem {ItemId = 7244},
		ObjectExists {X = 168, Y = 356, ObjectId = 3189}
	},       
	Actions =
	{        
		Help38Spawn
	}        
} 

Help40Spawn = CGdsFigureSpawn:new(1000000, 439, 140)
Help40Spawn:AddUnit(2558)
-- Unit und Ort OK
OnOneTimeEvent
{            
	Conditions =
	{   
		PlayerHasItem {ItemId = 7245},
		ODER9
		{
			ObjectExists {X = 443,	Y = 140, ObjectId = 3190},
			ObjectExists {X = 441,	Y = 140, ObjectId = 3190}
		}
	},       
	Actions =
	{        
		Help40Spawn
	}        
}

Help43Spawn = CGdsFigureSpawn:new(1000000, 258, 142)
Help43Spawn:AddUnit(2559)
-- Unit und Ort OK
OnOneTimeEvent
{            
	Conditions =
	{   
		PlayerHasItem {ItemId = 7246},
		ObjectExists {X = 256,	Y = 140, ObjectId = 3191}
	},       
	Actions =
	{        
		Help43Spawn
	}        
}

Help45Spawn = CGdsFigureSpawn:new(1000000, 152, 177)
Help45Spawn:AddUnit(2560)
-- Unit und Ort OK
OnOneTimeEvent
{            
	Conditions =
	{   
		PlayerHasItem {ItemId = 7247},
		ObjectExists {X = 149,	Y = 179, ObjectId = 3192}
	},       
	Actions =
	{        
		Help45Spawn
	}        
}

--Gute Kisten

-- Die Kisten auf Coop 31 löschen, so lange der Auftrag dafür nicht besteht

OnOneTimeEvent
{
	Conditions =
	{
		ODER9
		{
			Negated(PlayerHasItem {ItemId = 7236}),
			PlayerHasItem {ItemId = 7224}
		}
	},
	Actions =
	{
		RemoveObject {X = 418, Y = 217, Object = 3181},
	}
	
	
}

-- Die Kisten auf Coop 34 löschen, so lange der Auftrag dafür nicht besteht

OnOneTimeEvent
{
	Conditions =
	{
		ODER9
		{	
			Negated(PlayerHasItem {ItemId = 7237}),
			PlayerHasItem {ItemId = 7225}
		}
	},
	Actions =
	{
		RemoveObject {X = 438, Y = 398, Object = 3182}
	}
}

-- Die Kisten auf Coop 37 löschen, so lange der Auftrag dafür nicht besteht
OnOneTimeEvent
{
	Conditions =
	{
		ODER9
		{
			Negated(PlayerHasItem {ItemId = 7238}),
			PlayerHasItem {ItemId = 7226}
		}
	},
	Actions =
	{
		RemoveObject {X = 451, Y = 272, Object = 3183}
	}
}

-- Die Kisten auf Coop 39 löschen, so lange der Auftrag dafür nicht besteht

OnOneTimeEvent
{
	Conditions =
	{
		ODER9
		{
			Negated(PlayerHasItem {ItemId = 7239}),
			PlayerHasItem {ItemId = 7227}
		}
	},
	Actions =
	{
		RemoveObject {X = 255, Y = 131, Object = 3184}
	}
	
	
}

-- Die Kisten auf Coop 42 löschen, so lange der Auftrag dafür nicht besteht
OnOneTimeEvent
{
	Conditions =
	{
		ODER9
		{
			Negated(PlayerHasItem {ItemId = 7240}),
			PlayerHasItem {ItemId = 7228}
		}
	},
	Actions =
	{
		RemoveObject {X = 316, Y = 413, Object = 3185}
	}
	
	
}

-- Die Kisten auf Coop 44 löschen, so lange der Auftrag dafür nicht besteht
OnOneTimeEvent
{
	Conditions =
	{
		ODER9
		{
			Negated(PlayerHasItem {ItemId = 7241}),
			PlayerHasItem {ItemId = 7229}
		}
	},
	Actions =
	{
		RemoveObject {X = 393, Y = 274, Object = 3186}
	}
	
	
}

-- Ab hier werden die Gegner auf den Karten gespawnt
Help31Spawn = CGdsFigureSpawn:new(1000000, 420, 217)
Help31Spawn:AddUnit(2566)
-- Unit und Ort OK
OnOneTimeEvent
{            
	Conditions =
	{   
		PlayerHasItem {ItemId = 7236},
		-- Und MarkerItem für Coop 33
		ObjectExists {X = 418, Y = 217, ObjectId = 3181}
	},       
	Actions =
	{        
		Help31Spawn
	}        
} 

Help34Spawn = CGdsFigureSpawn:new(1000000, 440, 400)
Help34Spawn:AddUnit(2567)
-- Unit und Ort OK
OnOneTimeEvent
{            
	Conditions =
	{   
		PlayerHasItem {ItemId = 7237},
		ObjectExists {X = 438, Y = 398, ObjectId = 3182}
	},       
	Actions =
	{        
		Help34Spawn
	}        
}

Help37Spawn = CGdsFigureSpawn:new(1000000, 450, 270)
Help37Spawn:AddUnit(2568)
-- Unit und Ort OK
OnOneTimeEvent
{            
	Conditions =
	{   
		PlayerHasItem {ItemId = 7238},
		ObjectExists {X = 451, Y = 272, ObjectId = 3183}
	},       
	Actions =
	{        
		Help37Spawn
	}        
} 

Help39Spawn = CGdsFigureSpawn:new(1000000, 250, 130)
Help39Spawn:AddUnit(2569)
-- Unit und Ort OK
OnOneTimeEvent
{            
	Conditions =
	{   
		PlayerHasItem {ItemId = 7239},
		ObjectExists {X = 255, Y = 131, ObjectId = 3184}
	},       
	Actions =
	{        
		Help39Spawn
	}        
}

Help42Spawn = CGdsFigureSpawn:new(1000000, 310, 410)
Help42Spawn:AddUnit(2570)
-- Unit und Ort OK
OnOneTimeEvent
{            
	Conditions =
	{   
		PlayerHasItem {ItemId = 7240},
		ObjectExists {X = 316, Y = 413, ObjectId = 3185}
	},       
	Actions =
	{        
		Help42Spawn
	}        
}

Help44Spawn = CGdsFigureSpawn:new(1000000, 390, 270)
Help44Spawn:AddUnit(2571)
-- Unit und Ort OK
OnOneTimeEvent
{            
	Conditions =
	{   
		PlayerHasItem {ItemId = 7241},
		ObjectExists {X = 393, Y = 274, ObjectId = 3186}
	},       
	Actions =
	{        
		Help44Spawn
	}        
}

-- Spieler hat alle Questen gelöst
OnOneTimeEvent
{
	Conditions =
	{
		ODER9
		{
			PlayerHasItem {ItemId= 7301},
			PlayerHasItem {ItemId= 7300},
		},
	},
	Actions =
	{
		QuestSolve {QuestId = 954},
		QuestSolve {QuestId = 955},
	}
	
}
EndDefinition()
end











