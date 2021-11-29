-->INFO: Warentruhe
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p5\n2627_Warentruhe.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "waffentruhe001", String = "(Ein Verriegelungsmechanismus hält die Kiste verschlossen. An der Vorderseite sind drei Drehknöpfe angebracht.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "waffentruhe001PC", String = "(Den linken Knopf drehen.)", AnswerId = 2},
			OfferAnswer{Tag = "waffentruhe002PC", String = "(Den mittleren Knopf drehen.)", AnswerId = 3},
			OfferAnswer{Tag = "waffentruhe003PC", String = "(Den rechten Knopf drehen.)", AnswerId = 4},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waffentruhe002", String = "(Im Innern der Kiste ertönt ein Klicken.)"},
			OfferAnswer{Tag = "waffentruhe001PC", String = "(Den linken Knopf drehen.)", AnswerId = 2},
			OfferAnswer{Tag = "waffentruhe002PC", String = "(Den mittleren Knopf drehen.)", AnswerId = 3},
			OfferAnswer{Tag = "waffentruhe003PC", String = "(Den rechten Knopf drehen.)", AnswerId = 4},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waffentruhe003", String = "(Im Innern der Kiste ertönt ein Klicken.)"},
			OfferAnswer{Tag = "waffentruhe001PC", String = "(Den linken Knopf drehen.)", AnswerId = 2},
			OfferAnswer{Tag = "waffentruhe002PC", String = "(Den mittleren Knopf drehen.)", AnswerId = 3},
			OfferAnswer{Tag = "waffentruhe003PC", String = "(Den rechten Knopf drehen.)", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waffentruhe004", String = "(Im Innern der Kiste ertönt ein Klicken.)"},
			OfferAnswer{Tag = "waffentruhe004PC", String = "(Den linken Knopf drehen.)", AnswerId = 5},
			OfferAnswer{Tag = "waffentruhe016PC", String = "(Den mittleren Knopf drehen.)", AnswerId = 19},
			OfferAnswer{Tag = "waffentruhe017PC", String = "(Den rechten Knopf drehen.)", AnswerId = 20},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waffentruhe005", String = "(Im Innern der Kiste ertönt ein Klicken.)"},
			OfferAnswer{Tag = "waffentruhe005PC", String = "(Den linken Knopf drehen.)", AnswerId = 6},
			OfferAnswer{Tag = "waffentruhe006PC", String = "(Den mittleren Knopf drehen.)", AnswerId = 7},
			OfferAnswer{Tag = "waffentruhe015PC", String = "(Den rechten Knopf drehen.)", AnswerId = 18},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waffentruhe006", String = "(Im Innern der Kiste ertönt ein Klicken.)"},
			OfferAnswer{Tag = "waffentruhe001PC", String = "(Den linken Knopf drehen.)", AnswerId = 2},
			OfferAnswer{Tag = "waffentruhe002PC", String = "(Den mittleren Knopf drehen.)", AnswerId = 3},
			OfferAnswer{Tag = "waffentruhe003PC", String = "(Den rechten Knopf drehen.)", AnswerId = 4},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waffentruhe007", String = "(Im Innern der Kiste ertönt ein Klicken.)"},
			OfferAnswer{Tag = "waffentruhe007PC", String = "(Den linken Knopf drehen.)", AnswerId = 8},
			OfferAnswer{Tag = "waffentruhe013PC", String = "(Den mittleren Knopf drehen.)", AnswerId = 16},
			OfferAnswer{Tag = "waffentruhe014PC", String = "(Den rechten Knopf drehen.)", AnswerId = 17},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waffentruhe008", String = "(Im Innern der Kiste ertönt ein Klicken.)"},
			OfferAnswer{Tag = "waffentruhe008PC", String = "(Den linken Knopf drehen.)", AnswerId = 9},
			OfferAnswer{Tag = "waffentruhe009PC", String = "(Den mittleren Knopf drehen.)", AnswerId = 10},
			OfferAnswer{Tag = "waffentruhe012PC", String = "(Den rechten Knopf drehen.)", AnswerId = 15},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waffentruhe009", String = "(Im Innern der Kiste ertönt ein Klicken.)"},
			OfferAnswer{Tag = "waffentruhe001PC", String = "(Den linken Knopf drehen.)", AnswerId = 2},
			OfferAnswer{Tag = "waffentruhe002PC", String = "(Den mittleren Knopf drehen.)", AnswerId = 3},
			OfferAnswer{Tag = "waffentruhe003PC", String = "(Den rechten Knopf drehen.)", AnswerId = 4},
		}}

	OnAnswer{10;
		Conditions = {
			PlayerHasItem{ItemId = 2691},
		},
		Actions = {
			Say{Tag = "waffentruhe010", String = "(Im Innern der Kiste ertönt ein Klacken. Sie ist jetzt entriegelt.)"},
			OfferAnswer{Tag = "waffentruhe010PC", String = "(Den grauen Schlüssel einführen.)", AnswerId = 11},
			OfferAnswer{Tag = "waffentruhe011PC", String = "(Den Deckel der Kiste öffnen.)", AnswerId = 14},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2691}),
		},
		Actions = {
			Say{Tag = "waffentruhe010", String = "(Im Innern der Kiste ertönt ein Klacken. Sie ist jetzt entriegelt.)"},
			OfferAnswer{Tag = "waffentruhe011PC", String = "(Den Deckel der Kiste öffnen.)", AnswerId = 14},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waffentruhe011", String = "(Ein weiteres Klacken. Die Kiste kann jetzt geöffnet werden.)"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 2691 , GiveItem = 0 , Flag = Take}, QuestSolve{QuestId = 355}, RemoveDialogFromNpc{NpcId = 2627},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waffentruhe012", String = "(Etwas hält den Deckel geschlossen. Im Innern der Kiste ertönt erneut ein Klacken. Sie ist wieder verriegelt.)"},
			OfferAnswer{Tag = "waffentruhe001PC", String = "(Den linken Knopf drehen.)", AnswerId = 2},
			OfferAnswer{Tag = "waffentruhe002PC", String = "(Den mittleren Knopf drehen.)", AnswerId = 3},
			OfferAnswer{Tag = "waffentruhe003PC", String = "(Den rechten Knopf drehen.)", AnswerId = 4},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waffentruhe013", String = "(Im Innern der Kiste ertönt ein Klicken.)"},
			OfferAnswer{Tag = "waffentruhe001PC", String = "(Den linken Knopf drehen.)", AnswerId = 2},
			OfferAnswer{Tag = "waffentruhe002PC", String = "(Den mittleren Knopf drehen.)", AnswerId = 3},
			OfferAnswer{Tag = "waffentruhe003PC", String = "(Den rechten Knopf drehen.)", AnswerId = 4},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waffentruhe014", String = "(Im Innern der Kiste ertönt ein Klicken.)"},
			OfferAnswer{Tag = "waffentruhe001PC", String = "(Den linken Knopf drehen.)", AnswerId = 2},
			OfferAnswer{Tag = "waffentruhe002PC", String = "(Den mittleren Knopf drehen.)", AnswerId = 3},
			OfferAnswer{Tag = "waffentruhe003PC", String = "(Den rechten Knopf drehen.)", AnswerId = 4},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waffentruhe015", String = "(Im Innern der Kiste ertönt ein Klicken.)"},
			OfferAnswer{Tag = "waffentruhe001PC", String = "(Den linken Knopf drehen.)", AnswerId = 2},
			OfferAnswer{Tag = "waffentruhe002PC", String = "(Den mittleren Knopf drehen.)", AnswerId = 3},
			OfferAnswer{Tag = "waffentruhe003PC", String = "(Den rechten Knopf drehen.)", AnswerId = 4},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waffentruhe016", String = "(Im Innern der Kiste ertönt ein Klicken.)"},
			OfferAnswer{Tag = "waffentruhe001PC", String = "(Den linken Knopf drehen.)", AnswerId = 2},
			OfferAnswer{Tag = "waffentruhe002PC", String = "(Den mittleren Knopf drehen.)", AnswerId = 3},
			OfferAnswer{Tag = "waffentruhe003PC", String = "(Den rechten Knopf drehen.)", AnswerId = 4},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waffentruhe017", String = "(Im Innern der Kiste ertönt ein Klicken.)"},
			OfferAnswer{Tag = "waffentruhe001PC", String = "(Den linken Knopf drehen.)", AnswerId = 2},
			OfferAnswer{Tag = "waffentruhe002PC", String = "(Den mittleren Knopf drehen.)", AnswerId = 3},
			OfferAnswer{Tag = "waffentruhe003PC", String = "(Den rechten Knopf drehen.)", AnswerId = 4},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "waffentruhe018", String = "(Im Innern der Kiste ertönt ein Klicken.)"},
			OfferAnswer{Tag = "waffentruhe001PC", String = "(Den linken Knopf drehen.)", AnswerId = 2},
			OfferAnswer{Tag = "waffentruhe002PC", String = "(Den mittleren Knopf drehen.)", AnswerId = 3},
			OfferAnswer{Tag = "waffentruhe003PC", String = "(Den rechten Knopf drehen.)", AnswerId = 4},
		}}


	EndDefinition()
end