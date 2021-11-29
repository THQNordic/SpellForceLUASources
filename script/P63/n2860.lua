-->INFO: Gabar
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--Dialogsteuerung

OnOneTimeEvent
{
Conditions = {},
Actions = {
		SetDialogType{Type = SideQuest}
		}
}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p63\n2860_Gabar.txt


	

	OnBeginDialog{
		Conditions = {
			QuestState{QuestId = 335, State = StateSolved},
		},
		Actions = {
			Say{Tag = "gabar001", String = "Ah, Freund! Aonirs Licht!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(QuestState{QuestId = 335, State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 341 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "gabar002", String = "Habt Ihr die Robe flicken lassen?"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 341 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{4;
		Conditions = {
			UND(PlayerHasItem{ItemId = 2895},
					QuestState{QuestId = 347 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gabar024PC", String = "Hier, ich habe die Robe flicken lassen!", AnswerId = 38},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(PlayerHasItem{ItemId = 2895},
					QuestState{QuestId = 347 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
			QuestState{QuestId = 339 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "gabar003", String = "Habt Ihr die Beschwörerkreide gefunden?"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(QuestState{QuestId = 339 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			UND(PlayerHasItem{ItemId = 2896},
					QuestState{QuestId = 342 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gabar020PCa", String = "Hier ist Eure Beschwörerkreide!", AnswerId = 32},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND(PlayerHasItem{ItemId = 2896},
					QuestState{QuestId = 342 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 336 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 336 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "gabar004", String = "Habt Ihr den Federkiel dabei?"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
			UND(PlayerHasItem{ItemId = 2001},
					QuestState{QuestId = 340 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gabar017PC", String = "Hier, ich fand diesen merkwürdig leuchtenden Federkiel...", AnswerId = 27},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND(PlayerHasItem{ItemId = 2001},
					QuestState{QuestId = 340 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{9;
		Conditions = {
			IsPlayerFlagTrue{Name = "IsGabarKnown"},
		},
		Actions = {
			Say{Tag = "gabar005", String = "Habt Ihr die Augengläser gefunden?"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "IsGabarKnown"}),
		},
		Actions = {
			Say{Tag = "gabar006", String = "Was? Oh, seid gegrüßt! Entschuldigt, ich... bin sehr beschäftigt!"},
			Answer{Tag = "gabar006PC", String = "Ihr seht mir eher verängstigt aus!", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			UND(PlayerHasItem{ItemId = 2661},
					   QuestState{QuestId = 338 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 2893},
					  QuestState{QuestId = 338 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gabar011PC", String = "Diese Augengläser fand ich in Liannon!", AnswerId = 18},
			OfferAnswer{Tag = "gabar012PC", String = "Diese Augengläser fand ich bei einem Dieb in den Bergen!", AnswerId = 20},
		}}

	OnAnswer{10;
		Conditions = {
			UND(PlayerHasItem{ItemId = 2661},
					   QuestState{QuestId = 338 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2893},
					  QuestState{QuestId = 338 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gabar011PC", String = "Diese Augengläser fand ich in Liannon!", AnswerId = 18},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(UND(PlayerHasItem{ItemId = 2661},
					   QuestState{QuestId = 338 , State = StateActive})),
			UND(PlayerHasItem{ItemId = 2893},
					  QuestState{QuestId = 338 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gabar012PC", String = "Diese Augengläser fand ich bei einem Dieb in den Bergen!", AnswerId = 20},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(UND(PlayerHasItem{ItemId = 2661},
					   QuestState{QuestId = 338 , State = StateActive})),
			Negated(UND(PlayerHasItem{ItemId = 2893},
					  QuestState{QuestId = 338 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gabar007", String = "Was? Nein!... ja... vielleicht..."},
			Answer{Tag = "gabar007PC", String = "Kann ich Euch helfen?", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gabar008", String = "Was? Ja... nun... seht, mein Meister - der Magier Tanard - ist unzufrieden mit mir! Ständig schikaniert er mich mit unmöglichen Aufgaben und jetzt..."},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gabar009", String = "Und jetzt hat man mir auch noch des Meisters Augengläser gestohlen! Ich wollte sie zum Richten bringen, da wurden sie mir aus der Hand gerissen!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gabar010", String = "Ich verfolgte den Dieb! Doch er lief in die Berge! Dorthin, wo all die schrecklichen Kreaturen hausen! Was soll ich jetzt nur tun? Meister Tanard bringt mich um!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "IsGabarKnown"}, QuestBegin{QuestId = 335}, QuestBegin{QuestId = 336}, QuestBegin{QuestId = 337},
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
			UND(PlayerHasItem{ItemId = 2661},
					   QuestState{QuestId = 338 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 2893},
					  QuestState{QuestId = 338 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "gabar011", String = "Bitte, haltet Ausschau! Vielleicht findet Ihr den Dieb! Bringt die Augengläser zu mir, bevor der Meister etwas merkt! Bitte!"},
			OfferAnswer{Tag = "gabar011PC", String = "Diese Augengläser fand ich in Liannon!", AnswerId = 18},
			OfferAnswer{Tag = "gabar012PC", String = "Diese Augengläser fand ich bei einem Dieb in den Bergen!", AnswerId = 20},
		}}

	OnAnswer{17;
		Conditions = {
			UND(PlayerHasItem{ItemId = 2661},
					   QuestState{QuestId = 338 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2893},
					  QuestState{QuestId = 338 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "gabar011", String = "Bitte, haltet Ausschau! Vielleicht findet Ihr den Dieb! Bringt die Augengläser zu mir, bevor der Meister etwas merkt! Bitte!"},
			OfferAnswer{Tag = "gabar011PC", String = "Diese Augengläser fand ich in Liannon!", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(UND(PlayerHasItem{ItemId = 2661},
					   QuestState{QuestId = 338 , State = StateActive})),
			UND(PlayerHasItem{ItemId = 2893},
					  QuestState{QuestId = 338 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "gabar011", String = "Bitte, haltet Ausschau! Vielleicht findet Ihr den Dieb! Bringt die Augengläser zu mir, bevor der Meister etwas merkt! Bitte!"},
			OfferAnswer{Tag = "gabar012PC", String = "Diese Augengläser fand ich bei einem Dieb in den Bergen!", AnswerId = 20},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(UND(PlayerHasItem{ItemId = 2661},
					   QuestState{QuestId = 338 , State = StateActive})),
			Negated(UND(PlayerHasItem{ItemId = 2893},
					  QuestState{QuestId = 338 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "gabar011", String = "Bitte, haltet Ausschau! Vielleicht findet Ihr den Dieb! Bringt die Augengläser zu mir, bevor der Meister etwas merkt! Bitte!"},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gabar012", String = "Hm ... nein, das sind nicht die richtigen! Leider! Der Dieb lief nicht zum Portal nach Liannon, sondern hier in die Berge!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			UND(PlayerHasItem{ItemId = 2661},
					   QuestState{QuestId = 338 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 2893},
					  QuestState{QuestId = 338 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gabar011PC", String = "Diese Augengläser fand ich in Liannon!", AnswerId = 18},
			OfferAnswer{Tag = "gabar012PC", String = "Diese Augengläser fand ich bei einem Dieb in den Bergen!", AnswerId = 20},
		}}

	OnAnswer{19;
		Conditions = {
			UND(PlayerHasItem{ItemId = 2661},
					   QuestState{QuestId = 338 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 2893},
					  QuestState{QuestId = 338 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gabar011PC", String = "Diese Augengläser fand ich in Liannon!", AnswerId = 18},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(UND(PlayerHasItem{ItemId = 2661},
					   QuestState{QuestId = 338 , State = StateActive})),
			UND(PlayerHasItem{ItemId = 2893},
					  QuestState{QuestId = 338 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gabar012PC", String = "Diese Augengläser fand ich bei einem Dieb in den Bergen!", AnswerId = 20},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(UND(PlayerHasItem{ItemId = 2661},
					   QuestState{QuestId = 338 , State = StateActive})),
			Negated(UND(PlayerHasItem{ItemId = 2893},
					  QuestState{QuestId = 338 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gabar013", String = "Aonirs Gnade! Das sind sie! Jetzt kann ich endlich... nein, kann ich nicht! Ich vergaß...!"},
			Answer{Tag = "gabar013PC", String = "Was?", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gabar014", String = "Ich habe letzte Woche den magischen Federkiel des Meisters zerbrochen! Und vor lauter Aufregung hatte ich vergessen, dass ich noch Ersatz besorgen muss!"},
			Answer{Tag = "gabar014PC", String = "In Graufurt gibt es genügend Händler, denke ich!", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gabar015", String = "Nein! Nein! Solche Federkiele sind äußerst selten! Sie wurden nur vom Zirkel selbst und der talindischen Gilde gefertigt!"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gabar016", String = "Kein Händler hier führt so etwas, glaubt mir! Es ist zum Verzweifeln..."},
			Answer{Tag = "gabar016PC", String = "Ich weiß zwar nicht, ob ich auf meinen Reisen viel mit Federkielen zu tun bekomme, aber ich werde Euch im Gedächtnis behalten!", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 338},
					   QuestSolve{QuestId = 336},
					   TransferItem{TakeItem = 2893 , GiveItem = 0 , Flag = Take},
					   SetRewardFlagTrue{ Name = "Zauberwerk1Augenglas"},
					   QuestBegin{QuestId = 339}, QuestBegin{QuestId = 351},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
			UND(PlayerHasItem{ItemId = 2001},
					QuestState{QuestId = 340 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "gabar017", String = "Ja, bitte tut das, Krieger! Sollte Euch ein ungewöhnlicher Federkiel unterkommen, dann bringt ihn zu mir! Vielleicht habt Ihr ja Glück!"},
			OfferAnswer{Tag = "gabar017PC", String = "Hier, ich fand diesen merkwürdig leuchtenden Federkiel...", AnswerId = 27},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND(PlayerHasItem{ItemId = 2001},
					QuestState{QuestId = 340 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "gabar017", String = "Ja, bitte tut das, Krieger! Sollte Euch ein ungewöhnlicher Federkiel unterkommen, dann bringt ihn zu mir! Vielleicht habt Ihr ja Glück!"},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gabar018", String = "Ihr Götter, ein talindischer Schreibkiel! Danke! Ihr seid wirklich ungewöhnlich! Ich traue mich kaum, Euch danach zu fragen, aber..."},
			Answer{Tag = "gabar018PC", String = "Aber was?", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gabar019", String = "Wisst Ihr, es gibt eine da spezielle Kreide! Sie wird bei Beschwörungen und Ritualen eingesetzt! Meist wird sie von Schamanen oder Dämonologen verwendet..."},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gabar020", String = "Mein Meister verlangt, dass ich sie ihm besorge! Doch das ist völlig unmöglich! Niemand hier stellt so etwas her! Dazu müsste ich schon einen Orkschamanen ausrauben!"},
			Answer{Tag = "gabar020PC", String = "Die Orkschamenen, denen ich bislang begegnet bin, haben nicht lange genug gelebt, um mir etwas von ihrer Kreide zu erzählen! Aber den nächsten, den ich treffe, werde ich danach fragen!", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 340},
					 QuestSolve{QuestId = 339},
					 TransferItem{TakeItem = 2001 , GiveItem = 0 , Flag = Take},
					 SetRewardFlagTrue{ Name = "Zauberwerk2Feder"},
					 QuestBegin{QuestId = 341}, QuestBegin{QuestId = 350},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
			UND(PlayerHasItem{ItemId = 2896},
					QuestState{QuestId = 342 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gabar020PCa", String = "Hier ist Eure Beschwörerkreide!", AnswerId = 32},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(UND(PlayerHasItem{ItemId = 2896},
					QuestState{QuestId = 342 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gabar021", String = "Ich weiß nicht, wie ich Euch danken soll! Ohne Euch hätte ich mein Noviziat schon längst verloren!"},
			Answer{Tag = "gabar021PC", String = "Sonst nichts mehr? Alles in Ordnung jetzt?", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gabar022", String = "Nun... da... wäre..."},
			Answer{Tag = "gabar022PC", String = "Ja?", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gabar023", String = "Die Robe meines Meisters ist abgewetzt und verschlissen! Ich hätte sie längst flicken lassen sollen. Aber ich habe noch soviel andere Arbeit..."},
			Answer{Tag = "gabar023PC", String = "Eure anderen Probleme waren... anregender!", AnswerId = 35},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 342},
 					 QuestSolve{QuestId = 341},
 					 TransferItem{TakeItem = 2896 , GiveItem = 0 , Flag = Take},
 					 SetRewardFlagTrue{ Name = "Zauberwerk3Kreide"},
 					 SetGlobalFlagTrue {Name = "TanaraKannSprechen"},
					 QuestBegin{QuestId = 343},
					 QuestBegin{QuestId = 344},
					 TransferItem{TakeItem = 0 , GiveItem = 2894 , Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 36},
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
			UND(PlayerHasItem{ItemId = 2895},
					QuestState{QuestId = 347 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "gabar024", String = "Oh, mit Tanara zu verhandeln kann durchaus anregend sein, ärhm...! Hier ist die Robe! Bitte, bringt sie Tanara, der Näherin!"},
			OfferAnswer{Tag = "gabar024PC", String = "Hier, ich habe die Robe flicken lassen!", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(UND(PlayerHasItem{ItemId = 2895},
					QuestState{QuestId = 347 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "gabar024", String = "Oh, mit Tanara zu verhandeln kann durchaus anregend sein, ärhm...! Hier ist die Robe! Bitte, bringt sie Tanara, der Näherin!"},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 347},
					QuestSolve{QuestId = 343},
					QuestSolve{QuestId = 335},
					TransferItem{TakeItem = 2895 , GiveItem = 0 , Flag = Take},
					SetRewardFlagTrue{ Name = "Zauberwerk4Robe"},
			Say{Tag = "gabar025", String = "Vielen Dank! Ich wüsste nicht, was ich ohne Euch tun sollte!"},
			Answer{Tag = "", String = "", AnswerId = 39},
		}}

	OnAnswer{39;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gabar026", String = "Aber jetzt will ich Euch nicht länger behelligen, Ihr habt mir wahrhaftig genug geholfen! Viel Glück auf Euren Reisen!"},
			Answer{Tag = "", String = "", AnswerId = 40},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end