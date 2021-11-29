--> FackelFeuer Obelisk4

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--Das Feuer wird entzündet und damit der Obelisk ausgeschaltet
OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		FigureInRange { X = 90 , Y = 125, NpcId = 6948 , Range = 3}, --Wenn Feuerelementar in Reichweite ist 6948
		IsGlobalCounter { Name = "TorchCounter4P111", Operator = IsEqual, Value = 0, UpdateInterval = 10}, 
		IsItemFlagTrue { Name = "PlayerHasItemSchattenring" , UpdateInterval = 10},
		IsGlobalFlagFalse { Name = "SpawnCampsZerstoertP111"},
	},
	Actions =	
	{
		SetGlobalFlagFalse { Name = "ObeliskOn4P111"},
		IncreaseGlobalCounter { Name = "TorchCounter4P111"},
		SetEffect { Effect = "Torch", X = 90, Y = 125, Length = 0}, --Fackel beim Obelisken2
		SetEffect { Effect = "Torch", X = 285, Y = 45, Length = 0}, --Fackel beim Schattenschwert
		SetGlobalFlagTrue { Name = "Torch4ElementarVerschwindenP111"},
		SetGlobalFlagTrue { Name = "Fackel4ANP111"},
	}
	
}

--Das Feuer wird gelöscht der Obelisk wird wieder angeschaltet
OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		Negated(PlayerUnitInRange { X = 90, Y = 125, Range = 3 , FigureType = FigureAll}),
		EnemyUnitInRange { X = 90, Y = 125, NpcId = Avatar, Range = 3 , UnitId = 0},
		IsGlobalCounter { Name = "TorchCounter4P111", Operator = IsEqual, Value = 1, UpdateInterval = 10}, 
		IsItemFlagTrue { Name = "PlayerHasItemSchattenring" , UpdateInterval = 10},
		IsGlobalFlagFalse { Name = "SpawnCampsZerstoertP111"},
	},
	Actions =	
	{
		StopEffect {X = 90, Y = 125},
		StopEffect {X = 285, Y = 45},
		SetEffect { Effect = "TorchOff", X = 90, Y = 125, Length = 2000},
		SetEffect { Effect = "TorchOff", X = 285, Y = 45, Length = 2000},
		SetGlobalFlagTrue { Name = "ObeliskOn4P111"},
		ResetGlobalCounter { Name = "TorchCounter4P111"},
		SetGlobalFlagFalse { Name = "Fackel4ANP111"},
	}
	
}
EndDefinition()

end
