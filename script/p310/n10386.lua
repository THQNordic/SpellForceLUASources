-->INFO: CoopQuestgeberLight3
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Erst wenn der Spieler die Tasche hat wird  der Typ gespawnt
SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	
	Conditions =
	{
		ODER9
		{
			PlayerHasItem {ItemId = 7251},
			PlayerHasItem {ItemId = 7227},
		}
	},
}

-- Defaultmaessig ist der Dialog aus
OnOneTimeEvent
{
	Actions =
	{
		RemoveDialog {},
	}
}

-- Wenn der Spieler die Items von Auftrag 2,3 oder 5 hat Dialog anschalten
OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasItem {ItemId = 7251},
		UND9
		{
			Negated( PlayerHasItem {ItemId = 7240}),
			Negated( PlayerHasItem {ItemId = 7228}),
			Negated( PlayerHasItem {ItemId = 7252})
		}
	},
	Actions =
	{
		EnableDialog {},
	}
}




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\Project\main\mission\dialoge\p310\n10386_CoopQuestgeberLight3.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			UND9{Negated (PlayerHasItem {ItemId = 7240}), PlayerHasItem {ItemId = 7251}, Negated(PlayerHasItem {ItemId = 7252})},
		},
		Actions = {
			Say{Tag = "castagirP310_001", String = "Was? Nein, lasst mich! Geht weg!"},
			Answer{Tag = "castagirP310_002PC", String = "Nicht so schreckhaft guter Mann, seid Ihr Castagir?", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND9{Negated (PlayerHasItem {ItemId = 7240}), PlayerHasItem {ItemId = 7251}, Negated(PlayerHasItem {ItemId = 7252})}),
		},
		Actions = {
			Say{Tag = "castagirP310_004", String = "Was ist?"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "castagirP310_003", String = "Ja, das bin ich. Entschuldigt, ich sah in Euch für einen Moment ... einen Schatten, der nach mir greift ... ich muss mich geirrt haben ..."},
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
			UND( UND9{Negated (PlayerHasItem {ItemId = 7240}), PlayerHasItem {ItemId = 7251}, Negated(PlayerHasItem {ItemId = 7252})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagirP310_005PC", String = "Ich soll Euch dieses Buch geben, Castagir.", AnswerId = 7},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7240}), PlayerHasItem {ItemId = 7251}, Negated(PlayerHasItem {ItemId = 7252})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
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
			UND( UND9{Negated (PlayerHasItem {ItemId = 7240}), PlayerHasItem {ItemId = 7251}, Negated(PlayerHasItem {ItemId = 7252})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagirP310_005PC", String = "Ich soll Euch dieses Buch geben, Castagir.", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7240}), PlayerHasItem {ItemId = 7251}, Negated(PlayerHasItem {ItemId = 7252})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "castagirP310_006", String = "Das ... das Schattenmanifest ... dann ist Rigour ...?"},
			Answer{Tag = "castagirP310_007PC", String = "Tot.", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "castagirP310_008", String = "Es hat begonnen! Was ich jahrelang gefürchtet haben! Die Schatten haben endgültig einen Weg in unsere Welt gefunden!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "castagirP310_009", String = "Jemand wird Ihnen ein Tor schaffen! Und sie werden sich mit einem der Völker verbünden und mit seiner Hilfe unsere Welt in die lange Nacht stürzen!"},
			Answer{Tag = "castagirP310_010PC", String = "Aber die Wächtergötter! Werden sie nicht eingreifen? Die Schatten kommen doch von einer anderen Welt, das ist gegen die Gesetze Aonirs! Sollen die Wächter uns nicht davor schützen?", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "castagirP310_011", String = "Die Wächter .... hm, hm ... ja, ich denke, Ihr habt recht ...hm. Irgend etwas ... wird die Wächter aufhalten ... oder  ...ablenken ... sonst könnte sich die Prophezeiung der langen Nacht nicht erfüllen!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "castagirP310_012", String = "Irgendwo muss noch ein Hinweis sein ... nein, es war nichts in den Liedern, verdammt ... es sei denn ..."},
			Answer{Tag = "castagirP310_013PC", String = "Es gibt noch ein Lied!", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "castagirP310_014", String = "Richtig, richtig! Noch ein Lied! Wir müssen es finden! Erfahren, warum die Wächter nicht eingreifen werden!"},
			Answer{Tag = "castagirP310_015PC", String = "Wo soll ich suchen?", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "castagirP310_016", String = "Hm, hm ... nehmt diese Pergamente, sie werden Euch helfen die Melodie zu finden ...hm ... sucht in ...hm .. an dem Ort an dem Angar Arandir starb!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "castagirP310_017", String = "In Lordraine! Dort fand er sein Ende! Sucht dort nach der Melodie des fehlenden Lieds!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			TransferItem {GiveItem = 7240, Flag = Give},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[7]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
			UND( UND9{Negated (PlayerHasItem {ItemId = 7240}), PlayerHasItem {ItemId = 7251}, Negated(PlayerHasItem {ItemId = 7252})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "castagirP310_005PC", String = "Ich soll Euch dieses Buch geben, Castagir.", AnswerId = 7},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(UND( UND9{Negated (PlayerHasItem {ItemId = 7240}), PlayerHasItem {ItemId = 7251}, Negated(PlayerHasItem {ItemId = 7252})}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[7]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end