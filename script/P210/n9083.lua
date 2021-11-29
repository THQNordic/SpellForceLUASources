-->INFO: Xalaban
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 7}
--!EDS ONIDLEGOHOME END


KillOnDominate{NpcId = self}



OnOneTimeEvent
{
	Actions =
	{
		ChangeRace{ Race = 152 , NpcId = self }, -- Kathaikrieger sind zu Beginn TestNeutral 
	}
}

OnToggleEvent 
{
	UpdateInterval = 20,
	OnConditions =
	{
		IsGlobalFlagTrue{Name = "g_P210_AtWarWithKathai", UpdateInterval = 20},
	},
	OnActions	=
	{
		ChangeRace{ Race = 105 , NpcId = self }, -- die Kathaikrieger kriegen Orc-Race     
	},
	OffConditions =
	{
		IsGlobalFlagFalse{Name = "g_P210_AtWarWithKathai", UpdateInterval = 20},
	},
	OffActions	=
	{
		ChangeRace{ Race = 152 , NpcId = self }, -- die Kathaikrieger werden TestNeutral
	}
}

----OnToggleEvent 
----{
----	UpdateInterval = 60,
----	OnConditions =
----	{
----	  IsGlobalFlagTrue{Name = "g_P210_AtWarWithKathai"},
----      FigureHasAggro{NpcId = self},   
----	},
----	OnActions	=
----	{
----		
----	},
----	OffConditions =
----	{
----	  IsGlobalFlagTrue{Name = "g_P210_AtWarWithKathai"},
----      Negated(FigureHasAggro{NpcId = self}),  
----	},
----	OffActions	=
----	{
----		SetNpcTimeStamp {Name = "npc_P210_AggroTimeStamp"},  
----		SetNpcFlagTrue {Name = "npc_P210_SecurityFlag"},
----	}
----}

----OnEvent
----{
----	Conditions =
----	{
----		IsNpcFlagTrue {Name = "npc_P210_SecurityFlag", UpdateInterval = 10},
----		IsGlobalFlagTrue{Name = "g_P210_AtWarWithKathai"},
----		IsNpcTimeElapsed {Name = "npc_P210_AggroTimeStamp", Seconds = 60 }, -- wenn Xalaban 60 Sekunden lang nicht aggro war, wird er evtl. wieder neutral
----		IsGlobalFlagFalse {Name = "g_P210_XalabanGaveLabKey"}, -- Xal wird nur dann evtl. wieder neutral, wenn er dem Spieler noch nicht den Keystone gegeben hat
----	},
----	
----	Actions =
----	{
----		SetNpcFlagFalse {Name = "npc_P210_SecurityFlag"},
----		SetGlobalFlagFalse{Name = "g_P210_AtWarWithKathai"},
----		EnableDialog {NpcId = self},
----		QuestChangeState{QuestId = 912, State = StateUnknown}, -- Unterquest "Töte Xalabar"
----		QuestBegin {QuestId = 914}, -- Unterquest "Die Auseinandersetzung mit Xalabar"
----		QuestBegin {QuestId = 911}, -- Unterquest "Entscheide, ob du für Xalabar das Szepter der Winde suchen willst"
----	},
----	
----}

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p210\n9083_Xalaban.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsGlobalFlagTrue {Name = "g_P210_PlayerStartedKathaiFight"},
		},
		Actions = {
			Say{Tag = "xalabarP210_001", String = "Ich wusste Ihr würdet wiederkommen, Runenknecht! Wollt Ihr noch eine Lektion?"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_P210_PlayerStartedKathaiFight"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "xalabarP210_002", String = "Oder bringt Ihr mir das Szepter?"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
			IsGlobalFlagFalse {Name = "npc_P210_PlayerSpokenWithXalabar"},
		},
		Actions = {
			Say{Tag = "xalabarP210_003", String = "Da seid Ihr ja!"},
			Answer{Tag = "xalabarP210_004PC", String = "Xalabar! Was wollt ihr?", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsGlobalFlagFalse {Name = "npc_P210_PlayerSpokenWithXalabar"}),
		},
		Actions = {
			Say{Tag = "xalabarP210_026", String = "Nun, habt Ihr das Szepter gefunden?"},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "xalabarP210_005", String = "Meint Ihr, ich sehe zu, wie Ihr mein Volk mit in den Untergang zieht?"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "xalabarP210_006", String = "Ihr werdet hier sterben und mit Euch Euer unseliger Krieg!"},
			Answer{Tag = "xalabarP210_007PC", String = "Mein Ziel ist es nur, Eurer Volk zu retten! Versteht Ihr denn nicht?", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "xalabarP210_008", String = "Ich habe den Rat der Kathai gehört ... sie wollen Euch HELFEN! Helfen, gegen einen Feind der unbezwingbar ist!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "xalabarP210_009", String = "DIese Narren wollen mit Euch nach Süden, sobald Ihr die Wachfeste öffnet. Wenn Ihr aber hier oben sterbt ... dann werden sich diese Tölpel vielleicht besinnen!"},
			Answer{Tag = "xalabarP210_010PC", String = "Ihr seid ein Dummkopf, Xalabar! Was muss ich tun, um Euch zu überzeugen?", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "xalabarP210_011", String = "Gut, das Ihr fragt, Runenknecht! Ich habe Euch noch nicht getötet, weil Ich Euch einen ahndel anbieten will."},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "xalabarP210_012", String = "Hier oben in den Uhrwerkhallen ist das Szepter der Winde verborgen ist! Wenn Ihr es mir bringt, dann gestatte ich Euch, Eure Reise fortzusetzen!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "xalabarP210_013", String = "Dieses Szepter ist ein altes Heiligtum der Kathai, gestohlen von den Zerbiten! Es ist das Zeichen der großen Khals! Wenn ich es führe, erhalte ich die Macht und Weisheit der Winde!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "xalabarP210_014", String = "Damit werde ich die Kathai anführen! Dann kann selbst der maskierte Tod uns nicht mehr schrecken! Und diese Uru und ihre weibischen Visionen sind dann Vergangenheit!"},
			Answer{Tag = "xalabarP210_015PC", String = "Euer Gerede hält mich nur auf!", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "xalabarP210_016", String = "Ach ja? Seht Ihr das Tor da? Ihr habt vielleicht Schätze gefunden, aber ich habe den Schlüssel für den Durchgang zur Festung! Bringt mir das Szepter und Ihr bekommt ihn!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "npc_P210_PlayerSpokenWithXalabar"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "xalabarP210_017PC", String = "Aus Euch spricht der Wahnsinn, Kathai! Zur Seite!", AnswerId = 18},
			OfferAnswer{Tag = "xalabarP210_023PC", String = "Nun gut, ich werde nach Eurem vermaledeiten Szepter suchen, Xalabar!", AnswerId = 28},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "xalabarP210_018", String = "Ihr wollt kämpfen? Ich warne Euch, dies sind meine besten Männer und jeder steht mit seinem Leben für mich!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "xalabarP210_019PC", String = "Ihr seid nur ein Prahler! Sterbt!", AnswerId = 21},
			OfferAnswer{Tag = "xalabarP210_021PC", String = "Es wäre ein sinnloses Blutvergießen.", AnswerId = 25},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "xalabarP210_020", String = "Ich werde Euch mit Vergnügen aufschlitzen! Los Männer, schließt den Kreis!"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			RemoveDialog {NpcId = self},
						SetGlobalFlagTrue{Name = "g_P210_AtWarWithKathai"},
						SetGlobalFlagTrue {Name = "g_P210_PlayerStartedKathaiFight"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "xalabarP210_022", String = "Dann bringt mir das Szepter! Oder diese Stätte wird Euer Grab!"},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "xalabarP210_024", String = "Nehmt diesen Stein! Mein Volk nennt ihn den Zerbitenschlüssel! Man berichtet, er öffnet ein Tor in den Osten der Uhrwerkhallen, zu einem Felslabyrinth."},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "xalabarP210_025", String = "Wenn Ihr das Szepter sonst nirgendwo findet, sucht es dort!"},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 4636 , Flag = Give},
				SetGlobalFlagTrue {Name = "g_P210_XalabanGaveLabKey"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
			PlayerHasItem {ItemId = 4637},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "xalabarP210_027PC", String = "Ich bin nicht Euer Lakai. Macht endlich den Weg frei!!", AnswerId = 35},
			OfferAnswer{Tag = "xalabarP210_032PC", String = "Noch nicht. Aber ich werde weitersuchen.", AnswerId = 41},
			OfferAnswer{Tag = "xalabarP210_033PC", String = "Ja. Hier ist das Szepter der Winde!", AnswerId = 47},
		}}

	OnAnswer{34;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 4637}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "xalabarP210_027PC", String = "Ich bin nicht Euer Lakai. Macht endlich den Weg frei!!", AnswerId = 35},
			OfferAnswer{Tag = "xalabarP210_032PC", String = "Noch nicht. Aber ich werde weitersuchen.", AnswerId = 41},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "xalabarP210_028", String = "Ihr wollt wirklich den Kampf? Gegen uns alle?"},
			OfferAnswer{Tag = "xalabarP210_029PC", String = "Jederzeit! Sterbt!", AnswerId = 36},
			OfferAnswer{Tag = "xalabarP210_030PC", String = "Nein!", AnswerId = 39},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 38},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{39;
		Conditions = {
		},
		Actions = {
			Say{Tag = "xalabarP210_031", String = "Dann sucht nach dem Szepter, oder Ihr könnt hier verfaulen!"},
			Answer{Tag = "", String = "", AnswerId = 40},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{41;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 42},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_P210_XalabanGaveLabKey"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{42;
		Conditions = {
			IsGlobalFlagTrue {Name = "g_P210_XalabanGaveLabKey"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 43},
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{44;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 45},
		}}

	OnAnswer{45;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 46},
		}}

	OnAnswer{46;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{47;
		Conditions = {
		},
		Actions = {
			Say{Tag = "xalabarP210_034", String = "Das Szepter! Wind und Weite! Da seht, hier an seinem Griff, das sind die Locken des ersten Khals! Aberhundert Generationen alt ..."},
			Answer{Tag = "", String = "", AnswerId = 48},
		}}

	OnAnswer{48;
		Conditions = {
		},
		Actions = {
			Say{Tag = "xalabarP210_035", String = "Aus den Höhlen in diesem Stein wispern die Stimmen der Winde ... wir sind wieder eins mit unserern Göttern! Brüder, es ist geschafft! Kathai gehört mir!"},
			Answer{Tag = "", String = "", AnswerId = 49},
		}}

	OnAnswer{49;
		Conditions = {
		},
		Actions = {
			QuestSolve {QuestId = 910},
					   TransferItem{TakeItem = 4637 , Flag = Take},
			SetGlobalFlagTrue{Name = "g_P210_StartEndFightXalabarCutscene"},
			RemoveDialog{Npc = self},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 50},
		}}

	OnAnswer{50;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{50;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end