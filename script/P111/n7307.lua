--> FackelFeuer Obelisk2

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--Das Feuer wird entzündet und damit der Obelisk ausgeschaltet
OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		FigureInRange { X = 387 , Y = 376, NpcId = 6948 , Range = 3}, --Wenn Feuerelementar in Reichweite ist 6948
		IsGlobalCounter { Name = "TorchCounter2P111", Operator = IsEqual, Value = 0, UpdateInterval = 10}, 
		IsItemFlagTrue { Name = "PlayerHasItemSchattenring" , UpdateInterval = 10},
		IsGlobalFlagFalse { Name = "SpawnCampsZerstoertP111"},
	},
	Actions =	
	{
		SetGlobalFlagFalse { Name = "ObeliskOn2P111"},
		IncreaseGlobalCounter { Name = "TorchCounter2P111"},
		SetEffect { Effect = "Torch", X = 387, Y = 376, Length = 0}, --Fackel beim Obelisken2
		SetEffect { Effect = "Torch", X = 293, Y = 53, Length = 0}, --Fackel beim Schattenschwert
		SetGlobalFlagTrue { Name = "Torch2ElementarVerschwindenP111"},
		SetGlobalFlagTrue { Name = "Fackel2ANP111"},
	}
	
}

--Das Feuer wird gelöscht der Obelisk wird wieder angeschaltet
OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		Negated(PlayerUnitInRange { X = 387, Y = 376, Range = 3 , FigureType = FigureAll}),
		EnemyUnitInRange { X = 387, Y = 376, NpcId = Avatar, Range = 3 , UnitId = 0},
		IsGlobalCounter { Name = "TorchCounter2P111", Operator = IsEqual, Value = 1, UpdateInterval = 10}, 
		IsItemFlagTrue { Name = "PlayerHasItemSchattenring" , UpdateInterval = 10},
		IsGlobalFlagFalse { Name = "SpawnCampsZerstoertP111"},
	},
	Actions =	
	{
		StopEffect {X = 387, Y = 376},
		StopEffect {X = 293, Y = 53},
		SetEffect { Effect = "TorchOff", X = 387, Y = 376, Length = 2000},
		SetEffect { Effect = "TorchOff", X = 293, Y = 53, Length = 2000},
		SetGlobalFlagTrue { Name = "ObeliskOn2P111"},
		ResetGlobalCounter { Name = "TorchCounter2P111"},
		SetGlobalFlagFalse { Name = "Fackel2ANP111"},
	}
	
}



EndDefinition()

end

