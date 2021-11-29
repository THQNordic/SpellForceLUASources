-->INFO: Flann_Gondersen
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	Conditions =
	{
		IsNpcFlagFalse {Name = "OneTimeSpawn"},
		QuestState {QuestId = 352, State = StateActive},
	},
	Actions =
	{
		SetNpcFlagTrue {Name = "OneTimeSpawn"},
	}
}


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
-- Source: C:\project\main\mission\dialoge\p6\n2634_Flann_Gondersen.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagGondersenKnown"},
		},
		Actions = {
			Say{Tag = "FlannGond001", String = "Aonirs Licht mit Euch, Fremder!"},
			Answer{Tag = "FlannGond001PC", String = "Wer seid Ihr? Warum versteckt Ihr Euch hier?", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagGondersenKnown"}),
		},
		Actions = {
			Say{Tag = "FlannGond019", String = "Ah, Ihr seid es!"},
			Answer{Tag = "FlannGond019PC", String = "Seid gegrüßt.", AnswerId = 26},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "FlannGond002", String = "Mein Name ist Flann Gondersen! Ich bin Händler aus Liannon!"},
			Answer{Tag = "FlannGond002PC", String = "Ihr seht furchtbar aus! Wer hat Euch so übel zugerichtet?", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "FlannGond003", String = "Ich war mit einer großen Lieferung Waren auf dem Weg nach Graufurt! In Shiel wurde ich plötzlich von Banditen überfallen! Doch mir gelang es, zu fliehen!"},
			OfferAnswer{Tag = "FlannGond003PC", String = "Und was geschah mit Euren Waren?", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "FlannGond004", String = "Meine Warenkiste musste ich zurücklassen! Doch diese Banditen werden nicht viel Freude damit haben!"},
			OfferAnswer{Tag = "FlannGond004PC", String = "Weshalb nicht?", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 354}, QuestBegin{QuestId = 355},
			SetPlayerFlagTrue{Name = "FlagGondersenKnown"},
			Say{Tag = "FlannGond005", String = "Die Kiste ist mit einem raffinierten Schloss versehen! Nur wer die drei Knöpfe in der richtigen Reihenfolge dreht, vermag sie zu öffnen!"},
			OfferAnswer{Tag = "FlannGond005PC", String = "Wie lautet die Reihenfolge?", AnswerId = 5},
			OfferAnswer{Tag = "FlannGond016PC", String = "Die Reihenfolge interessiert mich nicht!", AnswerId = 21},
		}}

	OnAnswer{5;
		Conditions = {
			PlayerHasItem{ItemId = 2476},
		},
		Actions = {
			Say{Tag = "FlannGond006", String = "Ihr beliebt zu scherzen! Ich bin Händler! Für eine solche Information müsst Ihr mir schon etwas von vergleichbarem Gegenwert geben! Einen Malachit zum Beispiel!"},
			OfferAnswer{Tag = "FlannGond006PC", String = "Hm... hier, nehmt! Ein Malachit!", AnswerId = 6},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2476}),
		},
		Actions = {
			Say{Tag = "FlannGond006", String = "Ihr beliebt zu scherzen! Ich bin Händler! Für eine solche Information müsst Ihr mir schon etwas von vergleichbarem Gegenwert geben! Einen Malachit zum Beispiel!"},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 2476 , GiveItem = 0 , Flag = Take}, SetPlayerFlagTrue{Name = "FlagMalachitGiven"},
			Say{Tag = "FlannGond007", String = "Tatsächlich! Dann habe ich mich nicht in Euch getäuscht! Ihr seid wohlhabender als es äußerlich den Anschein hat! Nun denn, die richtige Reihenfolge lautet..."},
			OfferAnswer{Tag = "FlannGond007PC", String = "Ja?", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 354},
			Say{Tag = "FlannGond008", String = "Rechter Knopf..."},
			OfferAnswer{Tag = "FlannGond008PC", String = "Und dann?", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "FlannGond009", String = "Linker Knopf..."},
			OfferAnswer{Tag = "FlannGond009PC", String = "Weiter?", AnswerId = 10},
			OfferAnswer{Tag = "FlannGond015PC", String = "Könnt Ihr das noch einmal wiederholen?", AnswerId = 20},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "FlannGond010", String = "Knopf in der Mitte... Linker Knopf..."},
			OfferAnswer{Tag = "FlannGond010PC", String = "Ja?", AnswerId = 11},
			OfferAnswer{Tag = "FlannGond014PC", String = "Könnt Ihr das noch einmal wiederholen?", AnswerId = 19},
		}}

	OnAnswer{11;
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagGreyChestkeyGiven"},
		},
		Actions = {
			Say{Tag = "FlannGond011", String = "Und zuletzt noch einmal den Knopf in der Mitte!"},
			OfferAnswer{Tag = "FlannGond011PC", String = "In Ordnung! Ich weiß genug!", AnswerId = 12},
			OfferAnswer{Tag = "FlannGond011PCa", String = "Könnt Ihr das noch einmal wiederholen?", AnswerId = 14},
			OfferAnswer{Tag = "FlannGond012PC", String = "Gibt es noch etwas, das ich wissen muss?", AnswerId = 15},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagGreyChestkeyGiven"}),
		},
		Actions = {
			Say{Tag = "FlannGond011", String = "Und zuletzt noch einmal den Knopf in der Mitte!"},
			OfferAnswer{Tag = "FlannGond011PC", String = "In Ordnung! Ich weiß genug!", AnswerId = 12},
			OfferAnswer{Tag = "FlannGond011PCa", String = "Könnt Ihr das noch einmal wiederholen?", AnswerId = 14},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
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
			Say{Tag = "FlannGond012", String = "Na gut, dann nochmal von vorn! Also..."},
			OfferAnswer{Tag = "FlannGond007PC", String = "Ja?", AnswerId = 8},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "FlannGond013", String = "Ja, die Kombination allein genügt nicht! Um die Kiste zu öffnen, braucht man noch einen Schlüssel!"},
			Answer{Tag = "FlannGond013PC", String = "Könnt Ihr mir den Schlüssel geben?", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "FlannGond014", String = "Natürlich! Hier habt Ihr ihn!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 0 , GiveItem = 2691 , Flag = Give}, SetPlayerFlagTrue{Name = "FlagGreyChestkeyGiven"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "FlannGond015", String = "Na gut, dann nochmal von vorn! Also..."},
			OfferAnswer{Tag = "FlannGond007PC", String = "Ja?", AnswerId = 8},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "FlannGond016", String = "Na gut, dann nochmal von vorn! Also..."},
			OfferAnswer{Tag = "FlannGond007PC", String = "Ja?", AnswerId = 8},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "FlannGond017", String = "Ich hätte sie Euch ohnehin nicht verraten!"},
			OfferAnswer{Tag = "FlannGond017PC", String = "Könnt Ihr mir sonst noch etwas über die Kiste sagen?", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem{ItemId = 2476},
		},
		Actions = {
			Say{Tag = "FlannGond018", String = "Ihr beliebt zu scherzen! Ich bin Händler! Für eine solche Information müsst Ihr mir schon etwas von vergleichbarem Gegenwert geben! Einen Malachit zum Beispiel!"},
			OfferAnswer{Tag = "FlannGond018PC", String = "Hm... hier, nehmt! Ein Malachit!", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2476}),
		},
		Actions = {
			Say{Tag = "FlannGond018", String = "Ihr beliebt zu scherzen! Ich bin Händler! Für eine solche Information müsst Ihr mir schon etwas von vergleichbarem Gegenwert geben! Einen Malachit zum Beispiel!"},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 2476 , GiveItem = 0 , Flag = Take}, SetPlayerFlagTrue{Name = "FlagMalachitGiven"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{26;
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagMalachitGiven"},
		},
		Actions = {
			Say{Tag = "FlannGond020", String = "Was wollt Ihr?"},
			Answer{Tag = "FlannGond020PC", String = "Erzählt mir noch einmal von der Kiste!", AnswerId = 4},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMalachitGiven"}),
			IsPlayerFlagFalse{Name = "FlagGreyChestkeyGiven"},
		},
		Actions = {
			Say{Tag = "FlannGond021", String = "Was wollt Ihr?"},
			OfferAnswer{Tag = "FlannGond021PC", String = "Sagt mir, wie man die Knöpfe der Kiste drehen muss!", AnswerId = 28},
			OfferAnswer{Tag = "FlannGond022PC", String = "Könnt Ihr mir sonst noch etwas über die Kiste sagen?", AnswerId = 29},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMalachitGiven"}),
			Negated(IsPlayerFlagFalse{Name = "FlagGreyChestkeyGiven"}),
		},
		Actions = {
			Say{Tag = "FlannGond021", String = "Was wollt Ihr?"},
			OfferAnswer{Tag = "FlannGond021PC", String = "Sagt mir, wie man die Knöpfe der Kiste drehen muss!", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "FlannGond022", String = "Schön, die richtige Reihenfolge lautet..."},
			OfferAnswer{Tag = "FlannGond007PC", String = "Ja?", AnswerId = 8},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}


	EndDefinition()
end