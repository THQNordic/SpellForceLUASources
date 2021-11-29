--INFO ZWERGENARBEITER 2

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{
	UnitId = self ,
	NoSpawnEffect = FALSE , 
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "ArbeiterStartP115" },	
	} ,
	Actions = 
	{
	
	}
} 



Respawn 
{
	WaitTime = 60 ,
	UnitId = self ,
	Clan = 0 ,
	NoSpawnEffect = FALSE ,
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "ArbeiterStartP115" },
		
	},
	Actions =
	{
		ResetGlobalCounter { Name = "Arbeiter2P115"},
	} ,
	
} 



-------------------------------------------------------------
--	StartIdleGoHome wenn Zwerg das Licht der Welt erblickt --
--  Zwerg1 begibt sich in Richtung Mine4(Immer bei Respawn)-- 
-------------------------------------------------------------
OnIdleGoHome
{
X = 146,
Y = 73,
Direction = North,
Range = 3 ,
WalkRange = 5 ,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoForced,

	Conditions = 
	{
		IsGlobalFlagTrue { Name = "ArbeiterStartP115" },
		IsGlobalCounter { Name = "Arbeiter1P115", Operator = IsEqual, Value = 0, UpdateInterval = 10},
		FigureInRange { X = 223 , Y = 38, NpcId = self , Range = 3},
	},
	Actions = 
	{
		IncreaseGlobalCounter { Name = "Arbeiter2P115" }, 
	},

	HomeActions = 
	{
		SetGlobalTimeStamp { Name = "Zwegenarbeiter2WarteZeitP115"},
		ResetGlobalCounter { Name = "Arbeiter2P115"},
		
	},

}




---------------------------------------------------------
-- Zwerg ist in Mine 0 								   --
-- Auf Zum Monument. Zwerg findet einen Feuerkristall! --
---------------------------------------------------------


OnIdleGoHome
{
X = 124,
Y = 162,
Direction = North,
Range = 3 ,
WalkRange = 5 ,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoForced,

	Conditions = 
	{
		FigureInRange { X = 146 , Y = 73, NpcId = self , Range = 3},
		IsGlobalTimeElapsed {Name = "Zwegenarbeiter2WarteZeitP115", Seconds = 30},
		IsGlobalCounter { Name = "Arbeiter2P115", Operator = IsEqual, Value = 0, UpdateInterval = 10},
		ODER (ODER (IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 2, UpdateInterval = 10}, IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 6, UpdateInterval = 10}),
			 ODER (IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 10, UpdateInterval = 10}, IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 14, UpdateInterval = 10}))
	},
	Actions = 
	{
		IncreaseGlobalCounter { Name = "KristalllisteP115" }, 
		IncreaseGlobalCounter { Name = "Arbeiter2P115" }, 
		ChangeUnit {Unit = 1735 , NpcId = self},
		SetGlobalTimeStamp { Name = "SicherheitsabfrageChangeUnit404Arbeiter2P115"}, --Zeitnahme ob Figur hängt
		ClearGlobalTimeStamp { Name = "Zwegenarbeiter2WarteZeitP115"},
		Outcry { NpcId = 6657, String = "Ich habe einen Feuerkristall gefunden!" , Tag = "osZwergenarbeiter_P115_003" , Color = ColorWhite},
		SetEffect {Effect = "Spawnboss"},
		SetMinimapAlert{ X = 146, Y = 73, Type = 6},
	},

	HomeActions = 
	{
		ResetGlobalCounter { Name = "Arbeiter2P115"},
		SetGlobalTimeStamp { Name = "Zwegenarbeiter2WarteZeit2P115"},
		IncreaseGlobalCounter { Name = "MineArbeiter2P115" },  --setzt den Minencounter 1 hoch, damit Zwerg zu einer anderen Mine läuft
		TransferItem { TakeItem = 0, GiveItem = 4096, Amount = 1, Flag = Give},
		StopEffect { NpcId = self},
	},

}

--Auf Zum Monument. Zwerg findet keinen Feuerkristall!

OnIdleGoHome
{
X = 124,
Y = 162,
Direction = South,
Range = 3 ,
WalkRange = 5 ,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoForced,

	Conditions = 
	{
		FigureInRange { X = 146 , Y = 73, NpcId = self , Range = 3},
		IsGlobalTimeElapsed {Name = "Zwegenarbeiter2WarteZeitP115", Seconds = 30},
		IsGlobalCounter { Name = "Arbeiter2P115", Operator = IsEqual, Value = 0, UpdateInterval = 10},
		Negated  (IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 2, UpdateInterval = 10}), 
		Negated  (IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 6, UpdateInterval = 10}),
		Negated  (IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 10, UpdateInterval = 10}),
		Negated  (IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 14, UpdateInterval = 10})
	},
	Actions = 
	{
		IncreaseGlobalCounter { Name = "KristalllisteP115" }, 
		IncreaseGlobalCounter { Name = "Arbeiter2P115" }, 
		ChangeUnit {Unit = 1734 , NpcId = self},
		SetGlobalTimeStamp { Name = "SicherheitsabfrageChangeUnit396Arbeiter2P115"}, --Zeitnahme ob Figur hängt
		ClearGlobalTimeStamp { Name = "Zwegenarbeiter2WarteZeitP115"},
		
	},

	HomeActions = 
	{
		ResetGlobalCounter { Name = "Arbeiter2P115"},
		SetGlobalTimeStamp { Name = "Zwegenarbeiter2WarteZeit2P115"},
		IncreaseGlobalCounter { Name = "MineArbeiter2P115" },  --setzt den Minencounter 1 hoch, damit Zwerg zu einer anderen Mine läuft
		TransferResource { Resource = GoodStone, Side = SideLight, Amount = 75, Flag = Give},
		TransferResource { Resource = GoodIron, Side = SideLight, Amount = 75, Flag = Give},
		TransferResource { Resource = GoodMithril, Side = SideLight, Amount = 50, Flag = Give},
	},

}

---------------------------------------------------------
-- Zwerg ist in Mine 1 								   --
-- Auf Zum Monument. Zwerg findet einen Feuerkristall! --
---------------------------------------------------------


OnIdleGoHome
{
X = 124,
Y = 162,
Direction = North,
Range = 3 ,
WalkRange = 5 ,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoForced,

	Conditions = 
	{
		FigureInRange { X = 176 , Y = 227, NpcId = self , Range = 3},
		IsGlobalTimeElapsed {Name = "Zwegenarbeiter2WarteZeitP115", Seconds = 30},
		IsGlobalCounter { Name = "Arbeiter2P115", Operator = IsEqual, Value = 0, UpdateInterval = 10},
		ODER (ODER (IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 2, UpdateInterval = 10}, IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 6, UpdateInterval = 10}),
			 ODER (IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 10, UpdateInterval = 10}, IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 14, UpdateInterval = 10}))
	},
	Actions = 
	{
		IncreaseGlobalCounter { Name = "KristalllisteP115" }, 
		IncreaseGlobalCounter { Name = "Arbeiter2P115" }, 
		ChangeUnit {Unit = 1735 , NpcId = self},
		SetGlobalTimeStamp { Name = "SicherheitsabfrageChangeUnit404Arbeiter2P115"}, --Zeitnahme ob Figur hängt
		ClearGlobalTimeStamp { Name = "Zwegenarbeiter2WarteZeitP115"},
		Outcry { NpcId = 6657, String = "Ich habe einen Feuerkristall gefunden!" , Tag = "osZwergenarbeiter_P115_003" , Color = ColorWhite},
		SetEffect {Effect = "Spawnboss"},
		SetMinimapAlert{ X = 176, Y = 227, Type = 6},
	},

	HomeActions = 
	{
		ResetGlobalCounter { Name = "Arbeiter2P115"},
		SetGlobalTimeStamp { Name = "Zwegenarbeiter2WarteZeit2P115"},
		IncreaseGlobalCounter { Name = "MineArbeiter2P115" },  --setzt den Minencounter 1 hoch, damit Zwerg zu einer anderen Mine läuft
		TransferItem { TakeItem = 0, GiveItem = 4096, Amount = 1, Flag = Give},
		StopEffect { NpcId = self},
	},

}

--Auf Zum Monument. Zwerg findet keinen Feuerkristall!

OnIdleGoHome
{
X = 124,
Y = 162,
Direction = South,
Range = 3 ,
WalkRange = 5 ,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoForced,

	Conditions = 
	{
		FigureInRange { X = 176 , Y = 227, NpcId = self , Range = 3},
		IsGlobalTimeElapsed {Name = "Zwegenarbeiter2WarteZeitP115", Seconds = 30},
		IsGlobalCounter { Name = "Arbeiter2P115", Operator = IsEqual, Value = 0, UpdateInterval = 10},
		Negated  (IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 2, UpdateInterval = 10}), 
		Negated  (IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 6, UpdateInterval = 10}),
		Negated  (IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 10, UpdateInterval = 10}),
		Negated  (IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 14, UpdateInterval = 10})
	},
	Actions = 
	{
		IncreaseGlobalCounter { Name = "KristalllisteP115" }, 
		IncreaseGlobalCounter { Name = "Arbeiter2P115" }, 
		ChangeUnit {Unit = 1734 , NpcId = self},
		SetGlobalTimeStamp { Name = "SicherheitsabfrageChangeUnit396Arbeiter2P115"}, --Zeitnahme ob Figur hängt
		ClearGlobalTimeStamp { Name = "Zwegenarbeiter2WarteZeitP115"},
		
	},

	HomeActions = 
	{
		ResetGlobalCounter { Name = "Arbeiter2P115"},
		SetGlobalTimeStamp { Name = "Zwegenarbeiter2WarteZeit2P115"},
		IncreaseGlobalCounter { Name = "MineArbeiter2P115" },  --setzt den Minencounter 1 hoch, damit Zwerg zu einer anderen Mine läuft
		TransferResource { Resource = GoodStone, Side = SideLight, Amount = 75, Flag = Give},
		TransferResource { Resource = GoodIron, Side = SideLight, Amount = 75, Flag = Give},
		TransferResource { Resource = GoodMithril, Side = SideLight, Amount = 50, Flag = Give},
	},

}

---------------------------------------------------------
-- Zwerg ist in Mine 2 								   --
-- Auf Zum Monument. Zwerg findet einen Feuerkristall! --
---------------------------------------------------------


OnIdleGoHome
{
X = 124,
Y = 162,
Direction = North,
Range = 3 ,
WalkRange = 5 ,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoForced,

	Conditions = 
	{
		FigureInRange { X = 176 , Y = 97, NpcId = self , Range = 3},
		IsGlobalTimeElapsed {Name = "Zwegenarbeiter2WarteZeitP115", Seconds = 30},
		IsGlobalCounter { Name = "Arbeiter2P115", Operator = IsEqual, Value = 0, UpdateInterval = 10},
		ODER (ODER (IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 2, UpdateInterval = 10}, IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 6, UpdateInterval = 10}),
			 ODER (IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 10, UpdateInterval = 10}, IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 14, UpdateInterval = 10}))
	},
	Actions = 
	{
		IncreaseGlobalCounter { Name = "KristalllisteP115" }, 
		IncreaseGlobalCounter { Name = "Arbeiter2P115" }, 
		ChangeUnit {Unit = 1735 , NpcId = self},
		SetGlobalTimeStamp { Name = "SicherheitsabfrageChangeUnit404Arbeiter1P115"}, --Zeitnahme ob Figur hängt
		ClearGlobalTimeStamp { Name = "Zwegenarbeiter2WarteZeitP115"},
		Outcry { NpcId = 6657, String = "Ich habe einen Feuerkristall gefunden!" , Tag = "osZwergenarbeiter_P115_003" , Color = ColorWhite},
		SetEffect {Effect = "Spawnboss"},
		SetMinimapAlert{ X = 176, Y = 97, Type = 6},
	},

	HomeActions = 
	{
		ResetGlobalCounter { Name = "Arbeiter2P115"},
		SetGlobalTimeStamp { Name = "Zwegenarbeiter2WarteZeit2P115"},
		IncreaseGlobalCounter { Name = "MineArbeiter2P115" },  --setzt den Minencounter 1 hoch, damit Zwerg zu einer anderen Mine läuft
		TransferItem { TakeItem = 0, GiveItem = 4096, Amount = 1, Flag = Give},
		StopEffect { NpcId = self},
	},

}

--Auf Zum Monument. Zwerg findet keinen Feuerkristall!

OnIdleGoHome
{
X = 124,
Y = 162,
Direction = South,
Range = 3 ,
WalkRange = 5 ,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoForced,

	Conditions = 
	{
		FigureInRange { X = 176 , Y = 97, NpcId = self , Range = 3},
		IsGlobalTimeElapsed {Name = "Zwegenarbeiter2WarteZeitP115", Seconds = 30},
		IsGlobalCounter { Name = "Arbeiter2P115", Operator = IsEqual, Value = 0, UpdateInterval = 10},
		Negated  (IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 2, UpdateInterval = 10}), 
		Negated  (IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 6, UpdateInterval = 10}),
		Negated  (IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 10, UpdateInterval = 10}),
		Negated  (IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 14, UpdateInterval = 10})
	},
	Actions = 
	{
		IncreaseGlobalCounter { Name = "KristalllisteP115" }, 
		IncreaseGlobalCounter { Name = "Arbeiter2P115" }, 
		ChangeUnit {Unit = 1734 , NpcId = self},
		SetGlobalTimeStamp { Name = "SicherheitsabfrageChangeUnit396Arbeiter2P115"}, --Zeitnahme ob Figur hängt
		ClearGlobalTimeStamp { Name = "Zwegenarbeiter2WarteZeitP115"},
		
	},

	HomeActions = 
	{
		ResetGlobalCounter { Name = "Arbeiter2P115"},
		SetGlobalTimeStamp { Name = "Zwegenarbeiter2WarteZeit2P115"},
		IncreaseGlobalCounter { Name = "MineArbeiter2P115" },  --setzt den Minencounter 1 hoch, damit Zwerg zu einer anderen Mine läuft
		TransferResource { Resource = GoodStone, Side = SideLight, Amount = 75, Flag = Give},
		TransferResource { Resource = GoodIron, Side = SideLight, Amount = 75, Flag = Give},
		TransferResource { Resource = GoodMithril, Side = SideLight, Amount = 50, Flag = Give},
	},

}

---------------------------------------------------------
-- Zwerg ist in Mine 3 								   --
-- Auf Zum Monument. Zwerg findet einen Feuerkristall! --
---------------------------------------------------------


OnIdleGoHome
{
X = 124,
Y = 162,
Direction = North,
Range = 3 ,
WalkRange = 5 ,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoForced,

	Conditions = 
	{
		FigureInRange { X = 187 , Y = 181, NpcId = self , Range = 3},
		IsGlobalTimeElapsed {Name = "Zwegenarbeiter2WarteZeitP115", Seconds = 30},
		IsGlobalCounter { Name = "Arbeiter2P115", Operator = IsEqual, Value = 0, UpdateInterval = 10},
		ODER (ODER (IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 2, UpdateInterval = 10}, IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 6, UpdateInterval = 10}),
			 ODER (IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 10, UpdateInterval = 10}, IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 14, UpdateInterval = 10}))
	},
	Actions = 
	{
		IncreaseGlobalCounter { Name = "KristalllisteP115" }, 
		IncreaseGlobalCounter { Name = "Arbeiter2P115" }, 
		ChangeUnit {Unit = 1735 , NpcId = self},
		SetGlobalTimeStamp { Name = "SicherheitsabfrageChangeUnit404Arbeiter2P115"}, --Zeitnahme ob Figur hängt
		ClearGlobalTimeStamp { Name = "Zwegenarbeiter2WarteZeitP115"},
		Outcry { NpcId = 6657, String = "Ich habe einen Feuerkristall gefunden!" , Tag = "osZwergenarbeiter_P115_003" , Color = ColorWhite},
		SetEffect {Effect = "Spawnboss"},
		SetMinimapAlert{ X = 187, Y = 181, Type = 6},
	},

	HomeActions = 
	{
		ResetGlobalCounter { Name = "Arbeiter2P115"},
		SetGlobalTimeStamp { Name = "Zwegenarbeiter2WarteZeit2P115"},
		IncreaseGlobalCounter { Name = "MineArbeiter2P115" },  --setzt den Minencounter 1 hoch, damit Zwerg zu einer anderen Mine läuft
		TransferItem { TakeItem = 0, GiveItem = 4096, Amount = 1, Flag = Give},
		StopEffect { NpcId = self},
	},

}

--Auf Zum Monument. Zwerg findet keinen Feuerkristall!

OnIdleGoHome
{
X = 124,
Y = 162,
Direction = South,
Range = 3 ,
WalkRange = 5 ,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoForced,

	Conditions = 
	{
		FigureInRange { X = 187 , Y = 181, NpcId = self , Range = 3},
		IsGlobalTimeElapsed {Name = "Zwegenarbeiter2WarteZeitP115", Seconds = 30},
		IsGlobalCounter { Name = "Arbeiter2P115", Operator = IsEqual, Value = 0, UpdateInterval = 10},
		Negated  (IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 2, UpdateInterval = 10}), 
		Negated  (IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 6, UpdateInterval = 10}),
		Negated  (IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 10, UpdateInterval = 10}),
		Negated  (IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 14, UpdateInterval = 10})
	},
	Actions = 
	{
		IncreaseGlobalCounter { Name = "KristalllisteP115" }, 
		IncreaseGlobalCounter { Name = "Arbeiter2P115" }, 
		ChangeUnit {Unit = 1734 , NpcId = self},
		SetGlobalTimeStamp { Name = "SicherheitsabfrageChangeUnit396Arbeiter2P115"}, --Zeitnahme ob Figur hängt
		ClearGlobalTimeStamp { Name = "Zwegenarbeiter2WarteZeitP115"},
		
	},

	HomeActions = 
	{
		ResetGlobalCounter { Name = "Arbeiter2P115"},
		SetGlobalTimeStamp { Name = "Zwegenarbeiter2WarteZeit2P115"},
		IncreaseGlobalCounter { Name = "MineArbeiter2P115" },  --setzt den Minencounter 1 hoch, damit Zwerg zu einer anderen Mine läuft
		TransferResource { Resource = GoodStone, Side = SideLight, Amount = 75, Flag = Give},
		TransferResource { Resource = GoodIron, Side = SideLight, Amount = 75, Flag = Give},
		TransferResource { Resource = GoodMithril, Side = SideLight, Amount = 50, Flag = Give},
	},

}

---------------------------------------------------------
-- Zwerg ist in Mine 4 								   --
-- Auf Zum Monument. Zwerg findet einen Feuerkristall! --
---------------------------------------------------------


OnIdleGoHome
{
X = 124,
Y = 162,
Direction = North,
Range = 3 ,
WalkRange = 5 ,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoForced,

	Conditions = 
	{
		FigureInRange { X = 104 , Y = 73, NpcId = self , Range = 3},
		IsGlobalTimeElapsed {Name = "Zwegenarbeiter2WarteZeitP115", Seconds = 30},
		IsGlobalCounter { Name = "Arbeiter2P115", Operator = IsEqual, Value = 0, UpdateInterval = 10},
		ODER (ODER (IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 2, UpdateInterval = 10}, IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 6, UpdateInterval = 10}),
			 ODER (IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 10, UpdateInterval = 10}, IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 14, UpdateInterval = 10}))
	},
	Actions = 
	{
		IncreaseGlobalCounter { Name = "KristalllisteP115" }, 
		IncreaseGlobalCounter { Name = "Arbeiter2P115" }, 
		ChangeUnit {Unit = 1735 , NpcId = self},
		SetGlobalTimeStamp { Name = "SicherheitsabfrageChangeUnit404Arbeiter2P115"}, --Zeitnahme ob Figur hängt
		ClearGlobalTimeStamp { Name = "Zwegenarbeiter2WarteZeitP115"},
		Outcry { NpcId = 6657, String = "Ich habe einen Feuerkristall gefunden!" , Tag = "osZwergenarbeiter_P115_003" , Color = ColorWhite},
		SetEffect {Effect = "Spawnboss"},
		SetMinimapAlert{ X = 104, Y = 73, Type = 6},
	},

	HomeActions = 
	{
		ResetGlobalCounter { Name = "Arbeiter2P115"},
		SetGlobalTimeStamp { Name = "Zwegenarbeiter2WarteZeit2P115"},
		IncreaseGlobalCounter { Name = "MineArbeiter2P115" },  --setzt den Minencounter 1 hoch, damit Zwerg zu einer anderen Mine läuft
		TransferItem { TakeItem = 0, GiveItem = 4096, Amount = 1, Flag = Give},
		StopEffect { NpcId = self},
	},

}

--Auf Zum Monument. Zwerg findet keinen Feuerkristall!

OnIdleGoHome
{
X = 124,
Y = 162,
Direction = South,
Range = 3 ,
WalkRange = 5 ,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoForced,

	Conditions = 
	{
		FigureInRange { X = 104 , Y = 73, NpcId = self , Range = 3},
		IsGlobalTimeElapsed {Name = "Zwegenarbeiter2WarteZeitP115", Seconds = 30},
		IsGlobalCounter { Name = "Arbeiter2P115", Operator = IsEqual, Value = 0, UpdateInterval = 10},
		Negated  (IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 2, UpdateInterval = 10}), 
		Negated  (IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 6, UpdateInterval = 10}),
		Negated  (IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 10, UpdateInterval = 10}),
		Negated  (IsGlobalCounter { Name = "KristalllisteP115", Operator = IsEqual, Value = 14, UpdateInterval = 10})
	},
	Actions = 
	{
		IncreaseGlobalCounter { Name = "KristalllisteP115" }, 
		IncreaseGlobalCounter { Name = "Arbeiter2P115" }, 
		ChangeUnit {Unit = 1734 , NpcId = self},
		SetGlobalTimeStamp { Name = "SicherheitsabfrageChangeUnit396Arbeiter2P115"}, --Zeitnahme ob Figur hängt
		ClearGlobalTimeStamp { Name = "Zwegenarbeiter2WarteZeitP115"},
		
	},

	HomeActions = 
	{
		ResetGlobalCounter { Name = "Arbeiter2P115"},
		SetGlobalTimeStamp { Name = "Zwegenarbeiter2WarteZeit2P115"},
		IncreaseGlobalCounter { Name = "MineArbeiter2P115" },  --setzt den Minencounter 1 hoch, damit Zwerg zu einer anderen Mine läuft
		TransferResource { Resource = GoodStone, Side = SideLight, Amount = 75, Flag = Give},
		TransferResource { Resource = GoodIron, Side = SideLight, Amount = 75, Flag = Give},
		TransferResource { Resource = GoodMithril, Side = SideLight, Amount = 50, Flag = Give},
	},

}


--Auf Zur Mine mit Abfrage zu welcher Mine
------------------------------------------
--             MINE 0                   --
------------------------------------------

OnIdleGoHome
{
X = 146,
Y = 73,
Direction = South,
Range = 3 ,
WalkRange = 5 ,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoForced,

	Conditions = 
	{
		FigureInRange { X = 124 , Y = 162, NpcId = self , Range = 3},
		IsGlobalCounter { Name = "Arbeiter2P115", Operator = IsEqual, Value = 0, UpdateInterval = 10},
		IsGlobalTimeElapsed {Name = "Zwegenarbeiter2WarteZeit2P115", Seconds = 30},
		IsGlobalCounter { Name = "MineArbeiter2P115", Operator = IsEqual, Value = 0, UpdateInterval = 10},
	},
	Actions = 
	{
		
		IncreaseGlobalCounter { Name = "Arbeiter2P115" }, 
		ClearGlobalTimeStamp { Name = "Zwegenarbeiter2WarteZeit2P115"},
		ChangeUnit {Unit = 395 , NpcId = self},
		SetGlobalTimeStamp { Name = "SicherheitsabfrageChangeUnit395Arbeiter2P115"}, --Zeitnahme ob Figur hängt
	},

	HomeActions = 
	{
		SetGlobalTimeStamp { Name = "Zwegenarbeiter2WarteZeitP115"},
		ResetGlobalCounter { Name = "Arbeiter2P115"},
		
	},

}

------------------------------------------
--             MINE 1                   --
------------------------------------------



OnIdleGoHome
{
X = 176,
Y = 227,
Direction = South,
Range = 3 ,
WalkRange = 5 ,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoForced,

	Conditions = 
	{
		FigureInRange { X = 124 , Y = 162, NpcId = self , Range = 3},
		IsGlobalCounter { Name = "Arbeiter2P115", Operator = IsEqual, Value = 0, UpdateInterval = 10},
		IsGlobalTimeElapsed {Name = "Zwegenarbeiter2WarteZeit2P115", Seconds = 30},
		IsGlobalCounter { Name = "MineArbeiter2P115", Operator = IsEqual, Value = 1, UpdateInterval = 10},
	},
	Actions = 
	{
		
		IncreaseGlobalCounter { Name = "Arbeiter2P115" }, 
		ClearGlobalTimeStamp { Name = "Zwegenarbeiter2WarteZeit2P115"},
		ChangeUnit {Unit = 395 , NpcId = self},
		SetGlobalTimeStamp { Name = "SicherheitsabfrageChangeUnit395Arbeiter2P115"}, --Zeitnahme ob Figur hängt
	},

	HomeActions = 
	{
		SetGlobalTimeStamp { Name = "Zwegenarbeiter2WarteZeitP115"},
		ResetGlobalCounter { Name = "Arbeiter2P115"},
		
	},

}

------------------------------------------
--             MINE 2                   --
------------------------------------------

OnIdleGoHome
{
X = 176,
Y = 97,
Direction = South,
Range = 3 ,
WalkRange = 5 ,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoForced,

	Conditions = 
	{
		FigureInRange { X = 124 , Y = 162, NpcId = self , Range = 3},
		IsGlobalCounter { Name = "Arbeiter2P115", Operator = IsEqual, Value = 0, UpdateInterval = 10},
		IsGlobalTimeElapsed {Name = "Zwegenarbeiter2WarteZeit2P115", Seconds = 30},
		IsGlobalCounter { Name = "MineArbeiter2P115", Operator = IsEqual, Value = 2, UpdateInterval = 10},
	},
	Actions = 
	{
		
		IncreaseGlobalCounter { Name = "Arbeiter2P115" }, 
		ClearGlobalTimeStamp { Name = "Zwegenarbeiter2WarteZeit2P115"},
		ChangeUnit {Unit = 395 , NpcId = self},
		SetGlobalTimeStamp { Name = "SicherheitsabfrageChangeUnit395Arbeiter2P115"}, --Zeitnahme ob Figur hängt
	},

	HomeActions = 
	{
		SetGlobalTimeStamp { Name = "Zwegenarbeiter2WarteZeitP115"},
		ResetGlobalCounter { Name = "Arbeiter2P115"},
		
	},

}

------------------------------------------
--             MINE 3                   --
------------------------------------------


OnIdleGoHome
{
X = 187,
Y = 181,
Direction = South,
Range = 3 ,
WalkRange = 5 ,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoForced,

	Conditions = 
	{
		FigureInRange { X = 124 , Y = 162, NpcId = self , Range = 3},
		IsGlobalCounter { Name = "Arbeiter2P115", Operator = IsEqual, Value = 0, UpdateInterval = 10},
		IsGlobalTimeElapsed {Name = "Zwegenarbeiter2WarteZeit2P115", Seconds = 30},
		IsGlobalCounter { Name = "MineArbeiter2P115", Operator = IsEqual, Value = 3, UpdateInterval = 10},
	},
	Actions = 
	{
		
		IncreaseGlobalCounter { Name = "Arbeiter2P115" }, 
		ClearGlobalTimeStamp { Name = "Zwegenarbeiter2WarteZeit2P115"},
		ChangeUnit {Unit = 395 , NpcId = self},
		SetGlobalTimeStamp { Name = "SicherheitsabfrageChangeUnit395Arbeiter2P115"}, --Zeitnahme ob Figur hängt
	},

	HomeActions = 
	{
		SetGlobalTimeStamp { Name = "Zwegenarbeiter2WarteZeitP115"},
		ResetGlobalCounter { Name = "Arbeiter2P115"},
	
	},

}

------------------------------------------
--             MINE 4                   --
------------------------------------------



OnIdleGoHome
{
X = 104,
Y = 73,
Direction = South,
Range = 3 ,
WalkRange = 5 ,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoForced,

	Conditions = 
	{
		FigureInRange { X = 124 , Y = 162, NpcId = self , Range = 3},
		IsGlobalCounter { Name = "Arbeiter2P115", Operator = IsEqual, Value = 0, UpdateInterval = 10},
		IsGlobalTimeElapsed {Name = "Zwegenarbeiter2WarteZeit2P115", Seconds = 30},
		IsGlobalCounter { Name = "MineArbeiter2P115", Operator = IsEqual, Value = 4, UpdateInterval = 10},
	},
	Actions = 
	{
		
		IncreaseGlobalCounter { Name = "Arbeiter2P115" }, 
		ClearGlobalTimeStamp { Name = "Zwegenarbeiter2WarteZeit2P115"},
		ChangeUnit {Unit = 395 , NpcId = self},
		SetGlobalTimeStamp { Name = "SicherheitsabfrageChangeUnit395Arbeiter2P115"}, --Zeitnahme ob Figur hängt
	},

	HomeActions = 
	{
		SetGlobalTimeStamp { Name = "Zwegenarbeiter2WarteZeitP115"},
		ResetGlobalCounter { Name = "Arbeiter2P115"},
		
	},

}

--Überlaufschutz Zähler "MineArbeiter1P115"
OnEvent
{
	 Conditions = 
	{ 
		IsGlobalFlagTrue { Name = "ArbeiterStartP115" }, 
		IsGlobalCounter { Name = "MineArbeiter2P115", Operator = IsGreaterOrEqual, Value = 5, UpdateInterval = 10},
	 
	},
	Actions = 
	{
		ResetGlobalCounter { Name = "MineArbeiter2P115"},
			
	},											
}					




--Sicherheitsabfrage ob ZwergScript irgendwo stehen bleibt
--Auf Zur Mine
OnIdleGoHome
{
X = 223,
Y = 38,
Direction = North,
Range = 3 ,
WalkRange = 5 ,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoForced,

	Conditions = 
	{
		IsGlobalFlagTrue { Name = "ArbeiterStartP115" },
		ODER (ODER (IsGlobalTimeElapsed { Name = "SicherheitsabfrageChangeUnit395Arbeiter2P115",  Seconds = Sicherheitsabfrage},IsGlobalTimeElapsed { Name = "SicherheitsabfrageChangeUnit396Arbeiter2P115",  Seconds = Sicherheitsabfrage}),
				ODER (IsGlobalTimeElapsed { Name = "SicherheitsabfrageChangeUnit395Arbeiter2P115", Seconds = Sicherheitsabfrage},IsGlobalTimeElapsed { Name = "SicherheitsabfrageChangeUnit404Arbeiter2P115",  Seconds = Sicherheitsabfrage})),
	},
	Actions = 
	{
		--Outcry { NpcId = 6657, String = "Zwergenarbeiter2 wird zurückgesetzt" , Tag = "" , Color = ColorWhite},
	},

	HomeActions = 
	{
		
		ResetGlobalCounter { Name = "Arbeiter2P115"},
		ClearGlobalTimeStamp { Name = "SicherheitsabfrageChangeUnit395Arbeiter2P115"},
		ClearGlobalTimeStamp { Name = "SicherheitsabfrageChangeUnit396Arbeiter2P115"},
		ClearGlobalTimeStamp { Name = "SicherheitsabfrageChangeUnit404Arbeiter2P115"},	
		ResetGlobalCounter { Name = "MineArbeiter2P115" },	
	},

}	


EndDefinition()

end
