--> FackelFeuer Obelisk3

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--Das Feuer wird entzündet und damit der Obelisk ausgeschaltet
OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		FigureInRange { X = 304 , Y = 127, NpcId = 6948 , Range = 3}, --Wenn Feuerelementar in Reichweite ist 6948
		IsGlobalCounter { Name = "TorchCounter3P111", Operator = IsEqual, Value = 0, UpdateInterval = 10}, 
		IsItemFlagTrue { Name = "PlayerHasItemSchattenring" , UpdateInterval = 10},
		IsGlobalFlagFalse { Name = "SpawnCampsZerstoertP111"},
	},
	Actions =	
	{
		SetGlobalFlagFalse { Name = "ObeliskOn3P111"},
		IncreaseGlobalCounter { Name = "TorchCounter3P111"},
		SetEffect { Effect = "Torch", X = 304, Y = 127, Length = 0}, --Fackel beim Obelisken2
		SetEffect { Effect = "Torch", X = 293, Y = 45, Length = 0}, --Fackel beim Schattenschwert
		SetGlobalFlagTrue { Name = "Torch3ElementarVerschwindenP111"},
		SetGlobalFlagTrue { Name = "Fackel3ANP111"},
		
	}
	
}

--Das Feuer wird gelöscht der Obelisk wird wieder angeschaltet
OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		Negated(PlayerUnitInRange { X = 304, Y = 127, Range = 3 , FigureType = FigureAll}),
		EnemyUnitInRange { X = 304, Y = 127, NpcId = Avatar, Range = 3 , UnitId = 0},
		IsGlobalCounter { Name = "TorchCounter3P111", Operator = IsEqual, Value = 1, UpdateInterval = 10}, 
		IsItemFlagTrue { Name = "PlayerHasItemSchattenring" , UpdateInterval = 10},
		IsGlobalFlagFalse { Name = "SpawnCampsZerstoertP111"},
	},
	Actions =	
	{
		StopEffect {X = 304, Y = 127},
		StopEffect {X = 293, Y = 45},
		SetEffect { Effect = "TorchOff", X = 304, Y = 127, Length = 2000},
		SetEffect { Effect = "TorchOff", X = 293, Y = 45, Length = 2000},
		SetGlobalFlagTrue { Name = "ObeliskOn3P111"},
		ResetGlobalCounter { Name = "TorchCounter3P111"},
		SetGlobalFlagFalse { Name = "Fackel3ANP111"},
	}
	
}

EndDefinition()

end