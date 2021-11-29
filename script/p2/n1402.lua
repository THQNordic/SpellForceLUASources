-->INFO: Ashawe
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--Dialogsteuerung
--initial
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
-- Source: C:\project\main\mission\dialoge\p2\n1402_Ashawe.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "FlagAshaweKnown"},
		},
		Actions = {
			Say{Tag = "ashawe001", String = "Tiaras Feuer erleuchte Euch, Mensch! Möge Euch das Glück holder sein als mir!"},
			Answer{Tag = "ashawe001PC", String = "Ihr seid verletzt!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagAshaweKnown"}),
			PlayerHasItem{ItemId = 2320},
			PlayerHasNotItem{ItemId = 2320},
		},
		Actions = {
			Say{Tag = "ashawe005", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "ashawe005PC", String = "Ich bringe Euch eine Mähne!", AnswerId = 5},
			OfferAnswer{Tag = "ashawe006PC", String = "Wo finde ich die Tiermenschen?", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagAshaweKnown"}),
			PlayerHasItem{ItemId = 2320},
			Negated(PlayerHasNotItem{ItemId = 2320}),
		},
		Actions = {
			Say{Tag = "ashawe005", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "ashawe005PC", String = "Ich bringe Euch eine Mähne!", AnswerId = 5},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagAshaweKnown"}),
			Negated(PlayerHasItem{ItemId = 2320}),
			PlayerHasNotItem{ItemId = 2320},
		},
		Actions = {
			Say{Tag = "ashawe005", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "ashawe006PC", String = "Wo finde ich die Tiermenschen?", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagAshaweKnown"}),
			Negated(PlayerHasItem{ItemId = 2320}),
			Negated(PlayerHasNotItem{ItemId = 2320}),
		},
		Actions = {
			Say{Tag = "ashawe005", String = "Ah, Ihr seid es!"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ashawe002", String = "Die Wunde eines Speers! Es wird viele Monde dauern, bis ich wieder einen Bogen halten kann... Verflucht seien diese Bestien! Sie werden die Tore der Heimstatt überrennen!"},
			Answer{Tag = "ashawe002PC", String = "Sprecht Ihr von den Orks?", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ashawe003", String = "Nein, von den Tiermenschen! Sie haben bereits ein befestigtes Lager im Südwesten errichtet! Sie dringen ständig weiter vor! Es war meine Aufgabe, unsere Grenzen dort zu schützen!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ashawe004", String = "Doch sie sind wie Kakerlaken! Für jeden, den Ihr zertretet, kommen drei neue! Bitte, findet sie! Jagt sie! Bringt mir ihre Mähnen - und ich werde Euch fürstlich entlohnen!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
			PlayerHasItem{ItemId = 2320},
			PlayerHasNotItem{ItemId = 2320},
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagAshaweKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ashawe005PC", String = "Ich bringe Euch eine Mähne!", AnswerId = 5},
			OfferAnswer{Tag = "ashawe006PC", String = "Wo finde ich die Tiermenschen?", AnswerId = 7},
		}}

	OnAnswer{4;
		Conditions = {
			PlayerHasItem{ItemId = 2320},
			Negated(PlayerHasNotItem{ItemId = 2320}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagAshaweKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ashawe005PC", String = "Ich bringe Euch eine Mähne!", AnswerId = 5},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2320}),
			PlayerHasNotItem{ItemId = 2320},
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagAshaweKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ashawe006PC", String = "Wo finde ich die Tiermenschen?", AnswerId = 7},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2320}),
			Negated(PlayerHasNotItem{ItemId = 2320}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagAshaweKnown"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 2320 , Flag = Take},
			TransferXP{XP = 5 , Flag = Give}, TransferMoney{Copper = 100 , Flag = Give},
			Say{Tag = "ashawe006", String = "Hervorragende Arbeit, Krieger! Hier ist Eure Entlohnung! Rastet nicht, ehe nicht jeder einzelne von ihnen zur Strecke gebracht ist!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
			PlayerHasItem{ItemId = 2320},
			PlayerHasNotItem{ItemId = 2320},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ashawe005PC", String = "Ich bringe Euch eine Mähne!", AnswerId = 5},
			OfferAnswer{Tag = "ashawe006PC", String = "Wo finde ich die Tiermenschen?", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			PlayerHasItem{ItemId = 2320},
			Negated(PlayerHasNotItem{ItemId = 2320}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ashawe005PC", String = "Ich bringe Euch eine Mähne!", AnswerId = 5},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2320}),
			PlayerHasNotItem{ItemId = 2320},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ashawe006PC", String = "Wo finde ich die Tiermenschen?", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2320}),
			Negated(PlayerHasNotItem{ItemId = 2320}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ashawe007", String = "Sie kamen von den Sturmfelsen zu uns herab! Sie haben sich im Südwesten angesiedelt, nahe dem Portal, das dorthin führt!"},
			Answer{Tag = "ashawe007PC", String = "Warum habt Ihr sie nie vertrieben?", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ashawe008", String = "Sie finden immer wieder ein Versteck! Verkriechen sich unter irgend einem Stein und mehren sich dort von neuem! Sie wuchern wie ein Geschwür!"},
			Answer{Tag = "ashawe008PC", String = "Wie stark sind sie im Kampf?", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
			PlayerHasItem{ItemId = 2320},
			PlayerHasNotItem{ItemId = 2320},
		},
		Actions = {
			Say{Tag = "ashawe009", String = "Sie sind wild und zäh - aber dumm! In ihrer Kampfkraft ähneln sie den Orks!"},
			OfferAnswer{Tag = "ashawe005PC", String = "Ich bringe Euch eine Mähne!", AnswerId = 5},
			OfferAnswer{Tag = "ashawe006PC", String = "Wo finde ich die Tiermenschen?", AnswerId = 7},
		}}

	OnAnswer{9;
		Conditions = {
			PlayerHasItem{ItemId = 2320},
			Negated(PlayerHasNotItem{ItemId = 2320}),
		},
		Actions = {
			Say{Tag = "ashawe009", String = "Sie sind wild und zäh - aber dumm! In ihrer Kampfkraft ähneln sie den Orks!"},
			OfferAnswer{Tag = "ashawe005PC", String = "Ich bringe Euch eine Mähne!", AnswerId = 5},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2320}),
			PlayerHasNotItem{ItemId = 2320},
		},
		Actions = {
			Say{Tag = "ashawe009", String = "Sie sind wild und zäh - aber dumm! In ihrer Kampfkraft ähneln sie den Orks!"},
			OfferAnswer{Tag = "ashawe006PC", String = "Wo finde ich die Tiermenschen?", AnswerId = 7},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2320}),
			Negated(PlayerHasNotItem{ItemId = 2320}),
		},
		Actions = {
			Say{Tag = "ashawe009", String = "Sie sind wild und zäh - aber dumm! In ihrer Kampfkraft ähneln sie den Orks!"},
		}}


	EndDefinition()
end