-->INFO: ZwergenChef
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome
{
	WalkMode = Walk, X = _X, Y = _Y, Direction = 0,
	Conditions =
	{
		IsGlobalFlagFalse {Name = "ZwergeBefreitP108"},
	}
}
--!EDS ONIDLEGOHOME END

Respawn
{
	X = PortalX, Y = PortalY, NoSpawnEffect = TRUE, WaitTime = 120,
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "ZwergeBefreitP108"},
		IsGlobalCounter {Name = "ZwergenDeadCounter", Value = 1, Operator = IsGreaterOrEqual}, 
		IsGlobalFlagFalse {Name = "P109_DunkelElfenTorZerstört"},
	},
	Actions =
	{

		EnableDialog {},
		
		ChangeRace {Race = 135},
		ChangeOwner {Owner = OwnerPlayer},
		
		SetGlobalFlagFalse {Name = "EventSperre"},
	},
	DeathActions = 
	{
		--IncreaseGlobalCounter{Name = "ZwergenDeadCounter"},
		
		SetGlobalFlagFalse {Name = "P109_Zwergenchef_DialogBlocker"},
		SetGlobalFlagFalse {Name = "P109_Chef_SchonGewechselt"},
	},
}


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "ZwergeMachtDasFickendeTorAuf"},
	},
	Actions =
	{
		EnableDialog {},
	}
}

OnEvent
{
	Conditions =
	{
		IsGlobalFlagFalse {Name = "P109_Chef_SchonGewechselt"},
		IsGlobalFlagTrue {Name = "TruppSpawn"},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "P109_Chef_SchonGewechselt"},
		ChangeRace {Race = 135},
		ChangeOwner {Owner = OwnerPlayer},
	},	
} 


OnEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name ="FlagVerzoegerung", Seconds = 10},
		IsGlobalFlagFalse {Name = "EventSperre"},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "EventSperre"},
		SetGlobalFlagFalse {Name = "TruppSpawn"},
	}
}

OnEvent
{
	Conditions =
	{
		IsGlobalFlagFalse {Name = "CounterSperre"},
		IsGlobalCounter {Name = "ZwergenDeadCounter", Value = 1, Operator = IsGreaterOrEqual}, 
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "CounterSperre"},
		ResetGlobalCounter {Name = "ZwergenDeadCounter"},
		SetGlobalFlagTrue {Name = "OutcrySperre"},
		EnableDialog {},
	}
}
--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P109\n6396_ZwergenChef.txt


	

	OnBeginDialog{
		Conditions = {
			IsGlobalFlagTrue {Name = "ZwergeBefreitP108"},
			UND(UND(UND(UND(IsNpcFlagFalse {Name = "erfragt"}, IsGlobalCounter {Name = "ZwergenDeadCounter", Value = 1, Operator = IsGreaterOrEqual}), IsGlobalFlagTrue {Name = "ZwergeMindestensEinmalTot"}), IsGlobalFlagFalse {Name = "P109_DunkelElfenTorZerstört"}), IsGlobalFlagFalse {Name = "P109_DunkelElfenTorZerstört"}) ,
			UND(IsGlobalFlagTrue {Name = "ZwergeMachtDasFickendeTorAuf"}, IsGlobalFlagFalse {Name = "OpenSesame"}),
			UND(UND(UND(IsNpcFlagTrue {Name = "erfragt"}, IsGlobalCounter {Name = "ZwergenDeadCounter", Value = 1, Operator = IsGreaterOrEqual}), IsGlobalFlagFalse {Name = "P109_DunkelElfenTorZerstört"}), IsGlobalFlagFalse {Name = "P109_DunkelElfenTorZerstört"}) ,
		},
		Actions = {
			Say{Tag = "zwergenchef109_001", String = "Was gibt es?"},
			OfferAnswer{Tag = "zwergenchef109_002PC", String = "Ich brauche Eure Leute, um die Wehr einzureissen.", AnswerId = 1},
			OfferAnswer{Tag = "zwergenchef109_005PC", String = "Das Tor ist geschlossen, könnt Ihr es einreissen?", AnswerId = 3},
			OfferAnswer{Tag = "zwergenchef109_007PC", String = "Es war ein Fehlschlag!", AnswerId = 6},
		}}

	OnBeginDialog{
		Conditions = {
			IsGlobalFlagTrue {Name = "ZwergeBefreitP108"},
			UND(UND(UND(UND(IsNpcFlagFalse {Name = "erfragt"}, IsGlobalCounter {Name = "ZwergenDeadCounter", Value = 1, Operator = IsGreaterOrEqual}), IsGlobalFlagTrue {Name = "ZwergeMindestensEinmalTot"}), IsGlobalFlagFalse {Name = "P109_DunkelElfenTorZerstört"}), IsGlobalFlagFalse {Name = "P109_DunkelElfenTorZerstört"}) ,
			UND(IsGlobalFlagTrue {Name = "ZwergeMachtDasFickendeTorAuf"}, IsGlobalFlagFalse {Name = "OpenSesame"}),
			Negated(UND(UND(UND(IsNpcFlagTrue {Name = "erfragt"}, IsGlobalCounter {Name = "ZwergenDeadCounter", Value = 1, Operator = IsGreaterOrEqual}), IsGlobalFlagFalse {Name = "P109_DunkelElfenTorZerstört"}), IsGlobalFlagFalse {Name = "P109_DunkelElfenTorZerstört"}) ),
		},
		Actions = {
			Say{Tag = "zwergenchef109_001", String = "Was gibt es?"},
			OfferAnswer{Tag = "zwergenchef109_002PC", String = "Ich brauche Eure Leute, um die Wehr einzureissen.", AnswerId = 1},
			OfferAnswer{Tag = "zwergenchef109_005PC", String = "Das Tor ist geschlossen, könnt Ihr es einreissen?", AnswerId = 3},
		}}

	OnBeginDialog{
		Conditions = {
			IsGlobalFlagTrue {Name = "ZwergeBefreitP108"},
			UND(UND(UND(UND(IsNpcFlagFalse {Name = "erfragt"}, IsGlobalCounter {Name = "ZwergenDeadCounter", Value = 1, Operator = IsGreaterOrEqual}), IsGlobalFlagTrue {Name = "ZwergeMindestensEinmalTot"}), IsGlobalFlagFalse {Name = "P109_DunkelElfenTorZerstört"}), IsGlobalFlagFalse {Name = "P109_DunkelElfenTorZerstört"}) ,
			Negated(UND(IsGlobalFlagTrue {Name = "ZwergeMachtDasFickendeTorAuf"}, IsGlobalFlagFalse {Name = "OpenSesame"})),
			UND(UND(UND(IsNpcFlagTrue {Name = "erfragt"}, IsGlobalCounter {Name = "ZwergenDeadCounter", Value = 1, Operator = IsGreaterOrEqual}), IsGlobalFlagFalse {Name = "P109_DunkelElfenTorZerstört"}), IsGlobalFlagFalse {Name = "P109_DunkelElfenTorZerstört"}) ,
		},
		Actions = {
			Say{Tag = "zwergenchef109_001", String = "Was gibt es?"},
			OfferAnswer{Tag = "zwergenchef109_002PC", String = "Ich brauche Eure Leute, um die Wehr einzureissen.", AnswerId = 1},
			OfferAnswer{Tag = "zwergenchef109_007PC", String = "Es war ein Fehlschlag!", AnswerId = 6},
		}}

	OnBeginDialog{
		Conditions = {
			IsGlobalFlagTrue {Name = "ZwergeBefreitP108"},
			UND(UND(UND(UND(IsNpcFlagFalse {Name = "erfragt"}, IsGlobalCounter {Name = "ZwergenDeadCounter", Value = 1, Operator = IsGreaterOrEqual}), IsGlobalFlagTrue {Name = "ZwergeMindestensEinmalTot"}), IsGlobalFlagFalse {Name = "P109_DunkelElfenTorZerstört"}), IsGlobalFlagFalse {Name = "P109_DunkelElfenTorZerstört"}) ,
			Negated(UND(IsGlobalFlagTrue {Name = "ZwergeMachtDasFickendeTorAuf"}, IsGlobalFlagFalse {Name = "OpenSesame"})),
			Negated(UND(UND(UND(IsNpcFlagTrue {Name = "erfragt"}, IsGlobalCounter {Name = "ZwergenDeadCounter", Value = 1, Operator = IsGreaterOrEqual}), IsGlobalFlagFalse {Name = "P109_DunkelElfenTorZerstört"}), IsGlobalFlagFalse {Name = "P109_DunkelElfenTorZerstört"}) ),
		},
		Actions = {
			Say{Tag = "zwergenchef109_001", String = "Was gibt es?"},
			OfferAnswer{Tag = "zwergenchef109_002PC", String = "Ich brauche Eure Leute, um die Wehr einzureissen.", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			IsGlobalFlagTrue {Name = "ZwergeBefreitP108"},
			Negated(UND(UND(UND(UND(IsNpcFlagFalse {Name = "erfragt"}, IsGlobalCounter {Name = "ZwergenDeadCounter", Value = 1, Operator = IsGreaterOrEqual}), IsGlobalFlagTrue {Name = "ZwergeMindestensEinmalTot"}), IsGlobalFlagFalse {Name = "P109_DunkelElfenTorZerstört"}), IsGlobalFlagFalse {Name = "P109_DunkelElfenTorZerstört"}) ),
			UND(IsGlobalFlagTrue {Name = "ZwergeMachtDasFickendeTorAuf"}, IsGlobalFlagFalse {Name = "OpenSesame"}),
			UND(UND(UND(IsNpcFlagTrue {Name = "erfragt"}, IsGlobalCounter {Name = "ZwergenDeadCounter", Value = 1, Operator = IsGreaterOrEqual}), IsGlobalFlagFalse {Name = "P109_DunkelElfenTorZerstört"}), IsGlobalFlagFalse {Name = "P109_DunkelElfenTorZerstört"}) ,
		},
		Actions = {
			Say{Tag = "zwergenchef109_001", String = "Was gibt es?"},
			OfferAnswer{Tag = "zwergenchef109_005PC", String = "Das Tor ist geschlossen, könnt Ihr es einreissen?", AnswerId = 3},
			OfferAnswer{Tag = "zwergenchef109_007PC", String = "Es war ein Fehlschlag!", AnswerId = 6},
		}}

	OnBeginDialog{
		Conditions = {
			IsGlobalFlagTrue {Name = "ZwergeBefreitP108"},
			Negated(UND(UND(UND(UND(IsNpcFlagFalse {Name = "erfragt"}, IsGlobalCounter {Name = "ZwergenDeadCounter", Value = 1, Operator = IsGreaterOrEqual}), IsGlobalFlagTrue {Name = "ZwergeMindestensEinmalTot"}), IsGlobalFlagFalse {Name = "P109_DunkelElfenTorZerstört"}), IsGlobalFlagFalse {Name = "P109_DunkelElfenTorZerstört"}) ),
			UND(IsGlobalFlagTrue {Name = "ZwergeMachtDasFickendeTorAuf"}, IsGlobalFlagFalse {Name = "OpenSesame"}),
			Negated(UND(UND(UND(IsNpcFlagTrue {Name = "erfragt"}, IsGlobalCounter {Name = "ZwergenDeadCounter", Value = 1, Operator = IsGreaterOrEqual}), IsGlobalFlagFalse {Name = "P109_DunkelElfenTorZerstört"}), IsGlobalFlagFalse {Name = "P109_DunkelElfenTorZerstört"}) ),
		},
		Actions = {
			Say{Tag = "zwergenchef109_001", String = "Was gibt es?"},
			OfferAnswer{Tag = "zwergenchef109_005PC", String = "Das Tor ist geschlossen, könnt Ihr es einreissen?", AnswerId = 3},
		}}

	OnBeginDialog{
		Conditions = {
			IsGlobalFlagTrue {Name = "ZwergeBefreitP108"},
			Negated(UND(UND(UND(UND(IsNpcFlagFalse {Name = "erfragt"}, IsGlobalCounter {Name = "ZwergenDeadCounter", Value = 1, Operator = IsGreaterOrEqual}), IsGlobalFlagTrue {Name = "ZwergeMindestensEinmalTot"}), IsGlobalFlagFalse {Name = "P109_DunkelElfenTorZerstört"}), IsGlobalFlagFalse {Name = "P109_DunkelElfenTorZerstört"}) ),
			Negated(UND(IsGlobalFlagTrue {Name = "ZwergeMachtDasFickendeTorAuf"}, IsGlobalFlagFalse {Name = "OpenSesame"})),
			UND(UND(UND(IsNpcFlagTrue {Name = "erfragt"}, IsGlobalCounter {Name = "ZwergenDeadCounter", Value = 1, Operator = IsGreaterOrEqual}), IsGlobalFlagFalse {Name = "P109_DunkelElfenTorZerstört"}), IsGlobalFlagFalse {Name = "P109_DunkelElfenTorZerstört"}) ,
		},
		Actions = {
			Say{Tag = "zwergenchef109_001", String = "Was gibt es?"},
			OfferAnswer{Tag = "zwergenchef109_007PC", String = "Es war ein Fehlschlag!", AnswerId = 6},
		}}

	OnBeginDialog{
		Conditions = {
			IsGlobalFlagTrue {Name = "ZwergeBefreitP108"},
			Negated(UND(UND(UND(UND(IsNpcFlagFalse {Name = "erfragt"}, IsGlobalCounter {Name = "ZwergenDeadCounter", Value = 1, Operator = IsGreaterOrEqual}), IsGlobalFlagTrue {Name = "ZwergeMindestensEinmalTot"}), IsGlobalFlagFalse {Name = "P109_DunkelElfenTorZerstört"}), IsGlobalFlagFalse {Name = "P109_DunkelElfenTorZerstört"}) ),
			Negated(UND(IsGlobalFlagTrue {Name = "ZwergeMachtDasFickendeTorAuf"}, IsGlobalFlagFalse {Name = "OpenSesame"})),
			Negated(UND(UND(UND(IsNpcFlagTrue {Name = "erfragt"}, IsGlobalCounter {Name = "ZwergenDeadCounter", Value = 1, Operator = IsGreaterOrEqual}), IsGlobalFlagFalse {Name = "P109_DunkelElfenTorZerstört"}), IsGlobalFlagFalse {Name = "P109_DunkelElfenTorZerstört"}) ),
		},
		Actions = {
			Say{Tag = "zwergenchef109_001", String = "Was gibt es?"},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "ZwergeBefreitP108"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zwergenchef109_003", String = "Ihr braucht Männer? Ihr sollt sie haben!"},
			Answer{Tag = "zwergenchef109_004PC", String = "Habt dank.", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "erfragt"},
			SetGlobalFlagFalse {Name = "CounterSperre"}, SetGlobalFlagTrue {Name = "TruppSpawn"}, SetGlobalTimeStamp {Name = "FlagVerzoegerung"}, SetGlobalFlagFalse {Name = "EventSperre"},
			RemoveDialog{NpcId = self},
			EndDialog(),
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zwergenchef109_006", String = "Nein. Aber wir kennen den Weg, wie es zu öffnen ist! Diese Imperialen sind rechte Stümper, was Schlösser betrifft!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "OpenSesame"}, RemoveDialog {},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zwergenchef109_008", String = "Ihr benötigt mehr Leute? Gut! Ihr sollt sie bekommen."},
			Answer{Tag = "zwergenchef109_009PC", String = "Ich danke Euch. Diesmal wird es gelingen!", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagFalse {Name = "CounterSperre"}, SetGlobalFlagTrue {Name = "TruppSpawn"}, SetGlobalTimeStamp {Name = "FlagVerzoegerung"}, SetGlobalFlagFalse {Name = "EventSperre"},
			RemoveDialog{NpcId = self},
			EndDialog(),
		}}

	OnAnswer{8;
		Conditions = {
			IsNpcFlagFalse{Name = "known"},
			IsGlobalFlagFalse {Name = "WarzoneTrollLagerKaputt"},
			UND(IsGlobalFlagTrue {Name = "WarzoneTrollLagerKaputt"}, IsNpcFlagFalse {Name = "SchonBefreit"}),
		},
		Actions = {
			Say{Tag = "zwergenchef109_010", String = "Nun, wie ein Troll seht ihr mir nicht gerade aus! Was treibt Euch denn hierher, Mensch?"},
			OfferAnswer{Tag = "zwergenchef109_011PC", String = "Ich suche einen Weg, die Finsterwehr zu durchbrechen.", AnswerId = 9},
			OfferAnswer{Tag = "zwergenchef109_015PC", String = "Ich suche einen Weg, die Finsterwehr zu durchbrechen.", AnswerId = 12},
		}}

	OnAnswer{8;
		Conditions = {
			IsNpcFlagFalse{Name = "known"},
			IsGlobalFlagFalse {Name = "WarzoneTrollLagerKaputt"},
			Negated(UND(IsGlobalFlagTrue {Name = "WarzoneTrollLagerKaputt"}, IsNpcFlagFalse {Name = "SchonBefreit"})),
		},
		Actions = {
			Say{Tag = "zwergenchef109_010", String = "Nun, wie ein Troll seht ihr mir nicht gerade aus! Was treibt Euch denn hierher, Mensch?"},
			OfferAnswer{Tag = "zwergenchef109_011PC", String = "Ich suche einen Weg, die Finsterwehr zu durchbrechen.", AnswerId = 9},
		}}

	OnAnswer{8;
		Conditions = {
			IsNpcFlagFalse{Name = "known"},
			Negated(IsGlobalFlagFalse {Name = "WarzoneTrollLagerKaputt"}),
			UND(IsGlobalFlagTrue {Name = "WarzoneTrollLagerKaputt"}, IsNpcFlagFalse {Name = "SchonBefreit"}),
		},
		Actions = {
			Say{Tag = "zwergenchef109_010", String = "Nun, wie ein Troll seht ihr mir nicht gerade aus! Was treibt Euch denn hierher, Mensch?"},
			OfferAnswer{Tag = "zwergenchef109_015PC", String = "Ich suche einen Weg, die Finsterwehr zu durchbrechen.", AnswerId = 12},
		}}

	OnAnswer{8;
		Conditions = {
			IsNpcFlagFalse{Name = "known"},
			Negated(IsGlobalFlagFalse {Name = "WarzoneTrollLagerKaputt"}),
			Negated(UND(IsGlobalFlagTrue {Name = "WarzoneTrollLagerKaputt"}, IsNpcFlagFalse {Name = "SchonBefreit"})),
		},
		Actions = {
			Say{Tag = "zwergenchef109_010", String = "Nun, wie ein Troll seht ihr mir nicht gerade aus! Was treibt Euch denn hierher, Mensch?"},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zwergenchef109_012", String = "Von der Westseite aus ist das Ding uneinnehmbar! Aber vom Osten her kann es gebrochen werden!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zwergenchef109_013", String = "Wir können Euch helfen, aber da draussen wimmelt es von Trollen! Und ich habe schon zu viele Männer an sie verloren!"},
			Answer{Tag = "zwergenchef109_014PC", String = "Ich werde Euch den Weg frei machen. Ich gebe Euch Bescheid, sobald die Trolle vertrieben sind.", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			EndDialog(),
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zwergenchef109_016", String = "Vom Westen her unmöglich, aber vom Osten her ... habt Ihr denn eine Armee vor der Wehr liegen?"},
			Answer{Tag = "zwergenchef109_017PC", String = "Aye. Sobald die Wehr fällt, werde ich die Imperialen vernichten!", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zwergenchef109_018", String = "Das klingt doch nach einem Plan, Freund! Ha! Ich schicke Euch einige meiner Leute mit. Es gibt im Tal einen Druchgang mit dem Ihr zur Ostseite der Wehr kommt."},
			Answer{Tag = "zwergenchef109_019", String = "Seid bedankt. Wir werden versuchen, möglichst unbemerkt zu bleiben.", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "ZwergeBefreitP108"}, ChangeOwner {Owner = OwnerPlayer}, RemoveDialog{}, ChangeRace {Race = 135}, SetNpcFlagTrue {Name = "SchonBefreit"},
			RemoveDialog{NpcId = self},
			EndDialog(),
		}}

	OnAnswer{15;
		Conditions = {
			UND(IsGlobalFlagTrue {Name = "WarzoneTrollLagerKaputt"}, IsNpcFlagFalse {Name = "SchonBefreit"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "zwergenchef109_020PC", String = "Nun sollte Euch kein Troll mehr begegnen.", AnswerId = 16},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(UND(IsGlobalFlagTrue {Name = "WarzoneTrollLagerKaputt"}, IsNpcFlagFalse {Name = "SchonBefreit"})),
		},
		Actions = {
			Say{Tag = "zwergenchef109_025", String = "Überall nur Trolle! Niethalf möge sie zermalmen!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zwergenchef109_021", String = "Das nenne ich eine gute Nachricht! Dann wollen wir mal Euer Vorhaben mit der Wehrmauer angehen!"},
			Answer{Tag = "zwergenchef109_022PC", String = "Kommen wir von hier zur Ostseite der Wehr?", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zwergenchef109_023", String = "Aye! Es gibt einen Druchgang unten im Tal. Wenn wir unbemerkt an den Dunkelelfen vorbeikommen, haben wir die Wehr eingerissen, bevor die wissen was geschiet!"},
			Answer{Tag = "zwergenchef109_024", String = "Gut! Sobald die Wehr fällt wird meine Armee die Imperialen vernichten!", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "ZwergeBefreitP108"}, ChangeOwner {Owner = OwnerPlayer}, RemoveDialog{}, ChangeRace {Race = 135}, SetNpcFlagTrue {Name = "SchonBefreit"},
			RemoveDialog{NpcId = self},
			EndDialog(),
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end