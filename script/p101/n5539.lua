-->INFO: Aedar
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


dofile ("script/p101/n5538_FlüchtlingeGerettet.lua")  --  gerettete Flüchtlinge

-------------------------------------
-- Dialog Manager
-------------------------------------
-- Dialog aus am Anfang der Map
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 60 ,
	Conditions = { },
	Actions = 
	{
		RemoveDialog{NpcId = self},
	},
}


--Dialog Teil1 an, wenn Cutscene Sklavenlager gelaufen; aus, wenn Dialog Thread1 und 2 geführt
OnToggleEvent
{
NotInDialog = FALSE , UpdateInterval = 60 ,
	OnConditions = 
	{ 
		IsGlobalFlagTrue{Name = "P101AedarDialogAn", UpdateInterval = 20}, --  
	},
	OnActions = 
	{
		EnableDialog{NpcId = self , Important = TRUE},
	},
	OffConditions = 
	{  
		IsGlobalFlagTrue{Name = "P101DialogAedarEnded", UpdateInterval = 30}
	
	},
	OffActions = 
	{ 
		RemoveDialog{NpcId = self },
		SetGlobalFlagFalse{Name = "P101AedarDialogAn"},
	},
}

--Dialog Teil2 an, wenn im Westen
OnToggleEvent
{
NotInDialog = FALSE , UpdateInterval = 10 ,
	OnConditions = 
	{ 
		 IsGlobalFlagTrue {Name = "AedarIstImWesten"},
		
	},
	OnActions = 
	{
		EnableDialog{NpcId = self , Important = FALSE},
		SetDialogType {NpcId = self , Type = SideQuest},
		
	},
	OffConditions = 
	{  
		IsGlobalFlagTrue{Name = "QuestionGrimLenaDurch", UpdateInterval = 30},
		IsGlobalFlagTrue{Name = "QuestionWinterdragonDurch", UpdateInterval = 30},
		IsGlobalFlagTrue{Name = "QuestionLandDurch", UpdateInterval = 30},
		IsGlobalFlagTrue{Name = "QuestionTirganachDurch", UpdateInterval = 30},
		IsGlobalFlagTrue{Name = "QuestionCrimsonEmpireDurch", UpdateInterval = 30},
	},
	OffActions = 
	{ 
		RemoveDialog{NpcId = self },
		SetGlobalFlagFalse{Name = "P101AedarDialog2An"},
		SetGlobalFlagFalse {Name = "AedarIstImWesten"},
		
	},
}

--Restdialog remove, falls nicht vollständig geführt und schon auf Rune 1 gewesen
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 60 ,
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "IchWarAufRune1", UpdateInterval = 30},
		--IsGlobalFlagTrue {Name = "AedarIstImWesten", UpdateInterval = 30}
		
	},
	Actions = 
	{ 
		SetGlobalFlagTrue{Name = "P101DialogAedarEnded"},
		SetGlobalFlagFalse{Name = "P101AedarDialogAn"},
		SetNpcFlagTrue{Name = "QuestionGrimLena"},
		SetNpcFlagTrue{Name = "QuestionWinterdragon"},
		SetNpcFlagTrue{Name = "QuestionLand"},
		SetNpcFlagTrue{Name = "QuestionResistance"},
		SetGlobalFlagTrue{Name  = "P101AedarDialog2An"},
		--SetGlobalFlagTrue {Name = "P101DialogWillitEnded"}, --Willit Quest solve
		--QuestBegin{QuestId = 569 }, --Suche Dunhan Quest begin
		--QuestSolve{QuestId = 572, ActivateNextQuest = FALSE }, --der Weg nach Rune1 Quest solve
	},
}


--Restdialog2 remove, falls nicht vollständig geführt und CS Gefängnis gelaufen
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 60 ,
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "CutsceneGefängnisIstGelaufen", UpdateInterval = 30},
		--IsGlobalFlagTrue {Name = "AedarIstImWesten", UpdateInterval = 30}
		
	},
	Actions = 
	{ 
		RemoveDialog{NpcId = self },
		SetGlobalFlagFalse{Name = "P101AedarDialog2An"},
		SetGlobalFlagFalse {Name = "AedarIstImWesten"},
	},
}


--------------------------------------------------------
--Umspawnen in Lager West, wenn auf Rune1 gewesen
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 60 ,
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "IchWarAufRune1", UpdateInterval = 30},
		
	},
	Actions = 
	{ 
		
		Goto {X = 225, Y = 98, NpcId = self , Range = 1 , WalkMode = Walk , GotoMode = GotoNormal , XRand = 0 , YRand = 0},
	},
}	


Umspawn
{
	UnitId = self , Clan = 0 , X = 283 , Y = 104 , Target = none , NoSpawnEffect = FALSE , OnlyOnce = TRUE ,
	Conditions = 
	{ 
		FigureInRange{X = 225, Y = 98, NpcId = self , Range = 1},
	} , 
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "AedarIstImWesten"},
		Goto {X = 294, Y = 126, NpcId = self , Range = 10 , WalkMode = Walk , GotoMode = GotoNormal , XRand = 0 , YRand = 0},
	},
}



---------------------------------------------------
-- Cutscene Init Rekrutierung
Umspawn
{
	UnitId = self, Clan = 0, X = 294, Y = 126, Target = None, NoSpawnEffect = TRUE, OnlyOnce = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "CutsceneInitRekrutierungAedar", UpdateInterval = 1},
		Negated(FigureInRange{NpcId = self, X = 294, Y = 126, Range = 5}),		
	}, 
	Actions = 
	{
		SetNoFightFlagTrue {NpcId = self},
		SetGlobalFlagFalse {Name = "CutsceneInitRekrutierungAedar"},
	},
}


-- Patch: Wenn Aedar auf Frostfall auftaucht kann er nicht mehr hier sein
Despawn
{
	Conditions =
	{
		QuestState {QuestId = 575, State = StateSolved}
	}
}




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p101\n5539_Aedar.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "Known"},
		},
		Actions = {
			Say{Tag = "aedar101_001", String = "Willkommen Runenkrieger! Leider kann ich Euch wenig Bequemlichkeit bieten, wir haben hier nur das Nötigste."},
			Answer{Tag = "aedar101_002PC", String = "Lasst gut sein. Grim sagte, Ihr führt diese Leute an?", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_005", String = "Immer willkommen, Freund."},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar101_003", String = "Sie hören manchmal auf mich, aber seit Grim hier aufgetaucht ist, immer weniger. Wer folgt nicht lieber einem jungen Krieger als einem alten Mann?"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "aedar101_004", String = "Früher folgten wir Leuten wie Euch. Runenkrieger haben uns befreit und Runenkrieger haben den Widerstand gegründet."},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar101_007", String = "Vor allem geflohene Sklaven, die sich vornahmen, andere zu befreien, die weniger Glück hatten."},
			Answer{Tag = "aedar101_008PC", String = "Sklaven von wem?", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar101_009", String = "Mirraw Thur war einer der Umschlagplätze für Sklaven in Urgath. Die Orks und Trolle der umliegenden Stämme kamen oft hierher, um frische Sklaven zu kaufen."},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar101_010", String = "Die meisten hier waren Sklaven ... Gefangene aus Fiara oder verschleppte Seeleute. Schuften für die Orks und ein früher Tod war das Schicksal, das uns erwartete."},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar101_011", String = "Aber nach der Schlacht um Fiara tauchten Dunhan und Reowys hier auf, freie Runenkrieger. Sie befreiten viele von uns und lehrten uns das Kämpfen. Damit war der Widerstand gegründet."},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar101_012", String = "Als Waldläufer kämpften wir aus dem Verborgenen gegen die Sklaventreiber ... bis die Runenkrieger sich zerstritten ... und der Widerstand zerbrach."},
			Answer{Tag = "aedar101_013PC", String = "Würden mir diese Leute folgen, weil ich ein Runenkrieger bin?", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar101_014", String = "Nein! Selbst Grim kann sie nicht zum Kampf überreden, sie würden nur Dunhan und Reowys folgen!"},
			Answer{Tag = "aedar101_015PC", String = "Also ist es meine Aufgabe, sie zurückzuholen?", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar101_016", String = "Ja! Nehmt Grim und Lena mit Euch und sucht nach Dunhan und Reowys. Willit war ein Getreuer Dunhans, er weiß, wohin Dunhan sich begeben hat."},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "P101WillitDialogAn"},
			Say{Tag = "", String = ""},
			Answer{Tag = "aedar101_017PC", String = "Gut, ich werde mit Willit sprechen.", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
				
		SetGlobalFlagTrue{Name = "P101DialogAedarEnded"},
		SetGlobalFlagFalse{Name = "P101AedarDialogAn"},
		SetNpcFlagTrue{Name = "QuestionGrimLena"},
		SetNpcFlagTrue{Name = "QuestionWinterdragon"},
		SetNpcFlagTrue{Name = "QuestionLand"},
		SetNpcFlagTrue{Name = "QuestionResistance"}
		,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar101_019", String = "Ich? Nichts, ich bin nur ein alter Mann, ich interessiere mich nicht mehr für so was."},
			Answer{Tag = "aedar101_020PC", String = "Ich meine über ihre Herkunft und Geschichte.", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar101_021", String = "Ach so!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar101_022", String = "Lena kam damals mit Dunhan und Reowys zu uns. Sie wurde in Tirganach von den Eiselfen in die Magie eingeführt und hat dort die beiden Runenkrieger kennen gelernt."},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar101_023", String = "Sie ist ein gutes Mädchen und trägt ihr Herz am rechten Fleck. Dieser Grim ist wohl ein alter Bekannter von ihr, so wie Ihr auch."},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar101_024", String = "Er kam einen Tag, nachdem die Eiselfen die Stadt eingenommen hatten, zu uns. Lena brachte ihn bei uns unter, und seit jenem Tag hat er mehr und mehr die Führung übernommen."},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar101_025", String = "Ich finde, er ist ein wenig zu hitzköpfig, aber Lena und den Leuten gefällt das."},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			SetNpcFlagFalse{Name = "QuestionGrimLena"},
				SetGlobalFlagTrue{Name = "QuestionGrimLenaDurch"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{21;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{21;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{21;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{21;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{21;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{21;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{21;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{21;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{21;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{21;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{21;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{21;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{21;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{21;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
		}}

	OnAnswer{21;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{21;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{21;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{21;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{21;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{21;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{21;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{21;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{21;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{21;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{21;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{21;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{21;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{21;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{21;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar101_027", String = "Ha! Wer kennt die nicht!"},
			Answer{Tag = "aedar101_028PC", String = "Erzählt sie mir noch einmal.", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar101_029", String = "Hmm ... der Winterdrache, das ist Aryn, auch genannt der Frostweber."},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar101_030", String = "Als die Lande noch jung waren und die ersten Kinder der Götter das Weltenrund beschritten, da herrschten in den Lüften die Drachen. Und der mächtigste von ihnen war Aryn."},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar101_031", String = "Er war die Essenz des Winters, wo er flog, gefror das Land zu Eis. Er zog über die Welt hinweg, suchend nach einem Gefährten, einem Geschöpf, das ihm ebenbürtig war, doch alles Leben floh vor seiner Kälte."},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar101_032", String = "Als sein eisiger Hauch Finon Mir, den großen Elfenwald, erreichte, da zog Cenwen, die letzte Königin der Elfen, aus, um ihn zu bitten, ihrem Volke Gnade widerfahren zu lassen."},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar101_033", String = "Allein in der gefrorenen Ebene sang sie zu sich selbst, um Mut zu finden. Der Drache vernahm hoch über den Wolken ihr Lied. Er stieg hinab und lauschte dem Gesang der Elfe."},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar101_034", String = "Diese Töne erwärmten zum ersten Mal sein immerkaltes Herz. Da bat er die Elfe, ihn zu begleiten und auf ewig an seiner Seite zu verweilen."},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar101_035", String = "So ergriff er Cenwen und flog mit ihr nach Norden in seine Heimat. Er webte einen dichten Panzer aus Eis um sie, den wir heute den Gletscher des Frostwebers nennen."},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar101_036", String = "Dort unter dem Eis singt sie für ihn seit jenem Tag, während der Drache schläft. Den Elfen wurde für ihr Opfer im Gegenzug die Eismagie geschenkt ... und die Welt hatte wieder einen Frühling."},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar101_037", String = "Ja, letzten Endes verdanken wir es Cenwen, dass die Völker und Reiche jemals existierten. Denn sonst wäre alles Leben im Winter des Drachen erfroren."},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			SetNpcFlagFalse{Name = "QuestionWinterdragon"},
					 SetGlobalFlagTrue{Name = "QuestionWinterdragonDurch"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{33;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{33;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{33;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{33;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{33;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{33;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{33;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
		}}

	OnAnswer{33;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{33;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{33;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{33;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{33;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{33;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{33;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{33;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
		}}

	OnAnswer{33;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{33;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{33;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{33;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{33;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{33;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{33;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{33;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
		}}

	OnAnswer{33;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{33;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{33;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{33;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{33;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{33;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{33;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{33;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar101_039", String = "Von Mirraw Thur habe ich ja bereits erzählt. Es gibt allerdings noch weitere Wege in andere Regionen."},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar101_040", String = "Im Nordosten geht es nach Frostfall, das eigentlich schon zu Fiara gehört. Erklimmt man dort die Berge, gelangt man nach Tirganach, ins Land der Eiselfen des Arynkultes."},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar101_041", String = "Im Osten der Stadt gibt es noch ein weiteres Portal, das gewöhnlich durch ein Tor verschlossen ist. Es führt in die Lande des roten Imperiums."},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar101_042", String = "Kein Ort, an dem Ihr Euch aufhalten wollt! Selbst die Orks hielten das Tor immer verschlossen."},
			Answer{Tag = "", String = "", AnswerId = 38},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			SetNpcFlagFalse{Name = "QuestionLand"} , 
			SetNpcFlagTrue{Name = "QuestionTirganach"},
			SetNpcFlagTrue{Name = "QuestionCrimsonEmpire"},
			SetGlobalFlagTrue{Name = "QuestionLandDurch"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 39},
		}}

	OnAnswer{39;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{39;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{39;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{39;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{39;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{39;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{39;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{39;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
		}}

	OnAnswer{39;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{39;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{39;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{39;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{39;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{39;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{39;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{39;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
		}}

	OnAnswer{39;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{39;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{39;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{39;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{39;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{39;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{39;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{39;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
		}}

	OnAnswer{39;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{39;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{39;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{39;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{39;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{39;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{39;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{39;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar101_044", String = "Das ist eine Stadt auf dem Frostwebergletscher, hoch in den Bergen von Fiara. Die Elfen, die dort leben, sind anders als die gewöhnlichen Waldelfen Fiaras."},
			Answer{Tag = "", String = "", AnswerId = 41},
		}}

	OnAnswer{41;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar101_045", String = "Sie sind Meister der Eismagie und leben nach strengen Regeln. Grimmig verteidigen sie den Gletscher und ihre Kultstätten. Viele glauben, sie seien keine wahren Diener des Lichtes mehr."},
			Answer{Tag = "", String = "", AnswerId = 42},
		}}

	OnAnswer{42;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar101_046", String = "Man berichtet, dass sie sich in der Schlacht um Fiara sogar gegen den Runenkrieger gestellt haben!"},
			Answer{Tag = "aedar101_047PC", String = "Ihr glaubt also, dass sie gefährlich sind?", AnswerId = 43},
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar101_048", String = "Ich glaube, dass Macht den Geist verderben kann. Aber ich kann mir keine bösartige Elfe vorstellen, wenn ihr das meint."},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{44;
		Conditions = {
		},
		Actions = {
			SetNpcFlagFalse{Name = "QuestionTirganach"},
				 SetGlobalFlagTrue{Name = "QuestionTirganachDurch"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 45},
		}}

	OnAnswer{45;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{45;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{45;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{45;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{45;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{45;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{45;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{45;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
		}}

	OnAnswer{45;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{45;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{45;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{45;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{45;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{45;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{45;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{45;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
		}}

	OnAnswer{45;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{45;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{45;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{45;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{45;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{45;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{45;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{45;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
		}}

	OnAnswer{45;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{45;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{45;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{45;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{45;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{45;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{45;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{45;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
		}}

	OnAnswer{45;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{45;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{45;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{45;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{45;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{45;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{45;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{45;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
		}}

	OnAnswer{45;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{45;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{45;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{45;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{45;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{45;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{45;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{45;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
		}}

	OnAnswer{45;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{45;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{45;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{45;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{45;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{45;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{45;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{45;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
		}}

	OnAnswer{45;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{45;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{45;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{45;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{45;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{45;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{45;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{45;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{46;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar101_050", String = "Shal´Dun, die brennende Stadt. Einst lag dort eine der größten Städte der Dunkelelfen, bis der Boden aufriss und einen Feuer speienden Berg gebar, der die halbe Stadt verschlang."},
			Answer{Tag = "", String = "", AnswerId = 47},
		}}

	OnAnswer{47;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar101_051", String = "Einige Dunkelelfen deuteten dies als Zeichen Zarachs, und so gilt ihnen die Stadt nun als sein heiligster Tempel."},
			Answer{Tag = "aedar101_052PC", String = "Die Dunkelelfen sind doch dem Nachtgott Nor verschworen?", AnswerId = 48},
		}}

	OnAnswer{48;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar101_053", String = "Diese Sekte aus Shal´Dun erkennt Nor zwar noch an, doch sie hält sich für auserwählt von Zarach. Sie studiert die Magie des Feuers und eifert danach, ihrem Herrn die anderen Lande in Flammen zu opfern."},
			Answer{Tag = "", String = "", AnswerId = 49},
		}}

	OnAnswer{49;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedar101_054", String = "Wollen wir hoffen, dass das Tor auf immer verschlossen bleibt."},
			Answer{Tag = "", String = "", AnswerId = 50},
		}}

	OnAnswer{50;
		Conditions = {
		},
		Actions = {
			SetNpcFlagFalse{Name = "QuestionCrimsonEmpire"},
					 SetGlobalFlagTrue{Name = "QuestionCrimsonEmpireDurch"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 51},
		}}

	OnAnswer{51;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{51;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{51;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{51;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{51;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{51;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{51;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{51;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
		}}

	OnAnswer{51;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{51;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{51;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{51;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{51;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{51;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{51;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{51;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
		}}

	OnAnswer{51;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{51;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{51;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{51;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{51;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{51;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{51;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{51;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
		}}

	OnAnswer{51;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{51;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{51;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{51;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{51;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{51;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{51;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{51;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_006PC", String = "Was ist dieser Widerstand?", AnswerId = 4},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_018PC", String = "Was wisst Ihr über Grim und Lena?", AnswerId = 14},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_026PC", String = "Kennt Ihr die Sage vom Winterdrachen?", AnswerId = 22},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_038PC", String = "Erzählt mir über dieses Land.", AnswerId = 34},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_043PC", String = "Wisst Ihr etwas über Tirganach?", AnswerId = 40},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedar101_049PC", String = "Berichtet über das rote Imperium.", AnswerId = 46},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "QuestionResistance"}, IsGlobalFlagFalse{Name = "IchWarAufRune1"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionGrimLena"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionWinterdragon"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionLand"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionTirganach"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
			Negated(UND(IsNpcFlagTrue{Name = "QuestionCrimsonEmpire"} , IsGlobalFlagTrue {Name = "AedarIstImWesten"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end