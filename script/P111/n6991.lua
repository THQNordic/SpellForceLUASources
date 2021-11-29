-->INFO WÄCHTER GHAZADDUGAN
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)



SpawnOnlyWhen
{
 	X = 281, 
 	Y = 49,
	Conditions = 
	{
			IsGlobalFlagTrue { Name = "EndCutsceneEntryP111"},
	} , 
	Actions = 
	{
			
			ChangeRace {Race = 152, NpcId = self},
			LookAtDirection{ Direction = East, NpcId = self},
			Outcry { NpcId = 6991, String = "Die Wachfeuer sind erloschen! Überall strömen sie hervor! Ihr müsst die Feuer wieder entzünden, sonst werden sie uns überrennen!" , Tag ="ocFeuerengelP111_001" , Color = ColorWhite},
		
	} 
}
	

OnPlatformOneTimeEvent
{
 
	Conditions = 
	{
		
		IsGlobalFlagTrue { Name = "EndKampfStartP111", UpdateInterval  = 1},
				
	} , 
	Actions = 
	{
		
		ChangeRace {Race = 121, NpcId = self},
		SetGlobalFlagTrue {Name = "DemonenErscheintP111"},
	} 
}



OnOneTimeEvent
{
 
	Conditions = 
	{
		IsGlobalFlagFalse { Name = "EndCutSceneEndP111"},
		IsItemFlagTrue { Name = "PlayerHasItemSchattenring" , UpdateInterval = 10},
	} , 
	Actions = 
	{
		Outcry { NpcId = 6991, String = "Nur die Flamme Zarachs kann die Wachfeuer wieder entzünden! Sucht den Schrein des unheiligen Feuers und ruft eine Flamme Zarachs!" , Tag ="ocFeuerengelP111_002" , Color = ColorWhite},
	} 
}

OnOneTimeEvent
{
 
	Conditions = 
	{
		IsGlobalFlagFalse { Name = "EndCutSceneEndP111"},
		IsGlobalFlagTrue {Name = "ElementarBeschwoertP111"},			
	} , 
	Actions = 
	{
		
		Outcry { NpcId = 6991, String = "Ihr habt eine Flamme gerufen! Schnell, bringt sie zu einem der erloschenen Feuer! Sie wird es wieder entzünden!" , Tag ="ocFeuerengelP111_003" , Color = ColorWhite},
	} 
}




OnEvent
{
 
	Conditions = 
	{
		PlayerUnitInRange { X = 291 , Y = 50, Range = 10 , FigureType = FigureAvatar , UpdateInterval = 60},
		IsGlobalFlagFalse {Name = "SpawnCampsZerstoertP111"},
		IsGlobalCounter { Name = "WaechterOutcryCounterP111", Operator = IsEqual, Value = 0, UpdateInterval = 60},
	
	} , 
	Actions = 
	{
		Outcry { NpcId = 6991, String = "Bleibt dem Schwert fern! Noch strömen die Schatten überall hervor!" , Tag ="ocFeuerengelP111_008" , Color = ColorWhite},
		IncreaseGlobalCounter { Name = "WaechterOutcryCounterP111"},
	} 
}

OnEvent
{
 
	Conditions = 
	{
		Negated(PlayerUnitInRange { X = 291 , Y = 50, Range = 10 , FigureType = FigureAvatar , UpdateInterval = 60}),
		IsGlobalFlagFalse {Name = "SpawnCampsZerstoertP111"},
		IsGlobalCounter { Name = "WaechterOutcryCounterP111", Operator = IsEqual, Value = 1, UpdateInterval = 60},
	
	} , 
	Actions = 
	{
		ResetGlobalCounter { Name = "WaechterOutcryCounterP111"},
	} 
}

EndDefinition()

end
