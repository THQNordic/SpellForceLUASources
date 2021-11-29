-->INFO: Tworsnik
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnIdleGoHome{X = _X, Y = _Y, Direction = 1}

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
-- Source: C:\project\main\mission\dialoge\p11\n2680_Tworsnik.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagTrue{Name = "FlagTworsnikKnown"},
		},
		Actions = {
			Say{Tag = "tworsnik001", String = "Ach, Ihr schon wieder! Was gibt es?"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "FlagTworsnikKnown"}),
		},
		Actions = {
			Say{Tag = "tworsnik002", String = "Geht weiter! Hier gibt es nichts zu sehen!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2694}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tworsnik001PC", String = "Sagt mir noch einmal, welche Pilze ich Euch bringen soll!", AnswerId = 2},
			OfferAnswer{Tag = "tworsnik001PCa", String = "Ich habe jetzt alle Pilze gefunden!", AnswerId = 4},
			OfferAnswer{Tag = "tworsnik001PCb", String = "Ich benötige Hilfe bei der Suche nach den Pilzen!", AnswerId = 6},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 2694})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tworsnik001PC", String = "Sagt mir noch einmal, welche Pilze ich Euch bringen soll!", AnswerId = 2},
			OfferAnswer{Tag = "tworsnik001PCa", String = "Ich habe jetzt alle Pilze gefunden!", AnswerId = 4},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tworsnik002PC", String = "Seid Ihr Tworsnik? Ich hörte, Ihr besitzt ein gutes Schild?", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tworsnik003", String = "Nein, tue ich nicht! Und wenn es so wäre... was geht es Euch an? Ich habe ganz andere Probleme..."},
			OfferAnswer{Tag = "tworsnik003PC", String = "Und die wären?", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tworsnik004", String = "Seit Tagen versuche ich, einen wirksamen Gifttrank zu brauen! Doch mir fehlen die wichtigsten Zutaten! Wenn Ihr sie mir allerdings besorgen könntet ..."},
			OfferAnswer{Tag = "tworsnik004PC", String = "Nennt mir die Zutaten und ich werde sie Euch bringen!", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagTworsnikKnown"},
			QuestBegin{QuestId = 270},
				QuestBegin{QuestId = 271},
				QuestBegin{QuestId = 500},
				QuestBegin{QuestId = 501},
				QuestBegin{QuestId = 502},
				QuestBegin{QuestId = 503},
				QuestBegin{QuestId = 504},
				QuestBegin{QuestId = 505},
				QuestBegin{QuestId = 508},
				QuestBegin{QuestId = 509}
				,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2694}),
		},
		Actions = {
			Say{Tag = "tworsnik005", String = "Es sind sieben der stärksten Giftpilze: Schwefelkopf, Giftstacheling, Roter Waldling, Weißer Röhrling, Gelber Speiling,  Magenkrempling und Elfenspreizling!"},
			OfferAnswer{Tag = "tworsnik005PC", String = "Ich benötige Hilfe bei der Suche nach den Pilzen!", AnswerId = 14},
			OfferAnswer{Tag = "tworsnik010PC", String = "Ich habe all diese Pilze bereits!", AnswerId = 35},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 2694})),
		},
		Actions = {
			Say{Tag = "tworsnik005", String = "Es sind sieben der stärksten Giftpilze: Schwefelkopf, Giftstacheling, Roter Waldling, Weißer Röhrling, Gelber Speiling,  Magenkrempling und Elfenspreizling!"},
			OfferAnswer{Tag = "tworsnik010PC", String = "Ich habe all diese Pilze bereits!", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
			PlayerHasItem{ItemId = 2698},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2698}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2696}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{16;
		Conditions = {
			PlayerHasItem{ItemId = 2696},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
			PlayerHasItem{ItemId = 2693},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2693}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2695}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{18;
		Conditions = {
			PlayerHasItem{ItemId = 2695},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2697}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{19;
		Conditions = {
			PlayerHasItem{ItemId = 2697},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
			PlayerHasItem{ItemId = 2692},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2692}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{21;
		Conditions = {
			IsPlayerFlagTrue{Name = "FlagTworsnikKeyGiven"},
		},
		Actions = {
			Say{Tag = "tworsnik006", String = "Ich gab Euch bereits meinen Schlüssel Seht zu, dass Ihr die gestohlene Kiste findet!"},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "FlagTworsnikKeyGiven"}),
		},
		Actions = {
			Say{Tag = "tworsnik007", String = "Ihr habt schon eine beachtliche Anzahl Pilze gefunden!"},
			Answer{Tag = "tworsnik007PC", String = "Alle bis auf den Magenkrempling!", AnswerId = 24},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tworsnik008", String = "Hm ... ich hatte bereits viele Kremplinge gesammelt. Sie waren in einer Kiste zum Trocknen aufbewahrt. Doch die Kiste wurde mir von einem verfluchten Tiermenschen gestohlen!"},
			Answer{Tag = "tworsnik008PC", String = "Vielleicht kann ich sie wiederfinden?", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tworsnik009", String = "Hier, diesen Schlüssel werdet Ihr brauchen, um sie zu öffnen! Aber nehmt Euch vor dem Tiermenschen in Acht! Das ist eine blutrünstige Bestie!"},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 0 , GiveItem = 2739 , Flag = Give},
					QuestSolve{QuestId = 506},
					QuestBegin{QuestId = 507}
					,
			SetPlayerFlagTrue{Name = "FlagTworsnikKeyGiven"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tworsnik010", String = "Habt Ihr überhaupt schon gesucht? Kommt erst wieder, wenn Ihr mehr Pilze habt! Vielleicht werde ich Euch dann helfen..."},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tworsnik011", String = "So? Dann lasst mal sehen!"},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2698}),
		},
		Actions = {
			Say{Tag = "tworsnik013", String = "Lug und Trug! Wo ist der Giftstacheling?"},
			Answer{Tag = "tworsnik018PC", String = "Nun...", AnswerId = 51},
		}}

	OnAnswer{36;
		Conditions = {
			PlayerHasItem{ItemId = 2698},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2696}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 53},
		}}

	OnAnswer{37;
		Conditions = {
			PlayerHasItem{ItemId = 2696},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 38},
		}}

	OnAnswer{38;
		Conditions = {
			PlayerHasItem{ItemId = 2693},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 39},
		}}

	OnAnswer{38;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2693}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 56},
		}}

	OnAnswer{39;
		Conditions = {
			PlayerHasItem{ItemId = 2692},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 40},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2692}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 59},
		}}

	OnAnswer{40;
		Conditions = {
			PlayerHasItem{ItemId = 2695},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 41},
		}}

	OnAnswer{40;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2695}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 62},
		}}

	OnAnswer{41;
		Conditions = {
			PlayerHasItem{ItemId = 2697},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 42},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2697}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 65},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2694}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 68},
		}}

	OnAnswer{42;
		Conditions = {
			PlayerHasItem{ItemId = 2694},
		},
		Actions = {
			Say{Tag = "tworsnik012", String = "Tatsächlich! Ihr habt alle Pilze gefunden! Also gut! Nehmt das Schild hier dafür! Mehr habe ich nicht!"},
			Answer{Tag = "", String = "", AnswerId = 43},
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 2698 , GiveItem = 0 , Flag = Take},
				TransferItem{TakeItem = 2695 , GiveItem = 0 , Flag = Take}, 
				TransferItem{TakeItem = 2693 , GiveItem = 0 , Flag = Take}, 
				TransferItem{TakeItem = 2697 , GiveItem = 0 , Flag = Take}, 
				TransferItem{TakeItem = 2696 , GiveItem = 0 , Flag = Take}, 
				TransferItem{TakeItem = 2692 , GiveItem = 0 , Flag = Take},
				TransferItem{TakeItem = 2694 , GiveItem = 0 , Flag = Take}, 
				TransferItem{TakeItem = 0 , GiveItem = 2740 , Flag = Give},
				QuestSolve{QuestId = 509},
				QuestSolve{QuestId = 271},
				QuestSolve{QuestId = 270},
				RemoveDialogFromNpc{NpcId = 2680},
				SetRewardFlagTrue{ Name = "Giftzwerg"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{44;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{51;
		Conditions = {
			PlayerHasItem{ItemId = 2696},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 54},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2696}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 53},
		}}

	OnAnswer{53;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tworsnik014", String = "Ohne den Weißen Röhrling wird das Gift nicht gelingen!"},
			Answer{Tag = "tworsnik014PC", String = "Den muß ich vergessen haben!", AnswerId = 54},
		}}

	OnAnswer{54;
		Conditions = {
			PlayerHasItem{ItemId = 2693},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 57},
		}}

	OnAnswer{54;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2693}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 56},
		}}

	OnAnswer{56;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tworsnik015", String = "Der Schwefelkopf fehlt!"},
			Answer{Tag = "tworsnik015PC", String = "Gut, ich werde ihn suchen!", AnswerId = 57},
		}}

	OnAnswer{57;
		Conditions = {
			PlayerHasItem{ItemId = 2692},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 60},
		}}

	OnAnswer{57;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2692}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 59},
		}}

	OnAnswer{59;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tworsnik016", String = "Und wo ist der Rote Waldling?"},
			Answer{Tag = "tworsnik016PC", String = "Der Rote Waldling? Hmm...", AnswerId = 60},
		}}

	OnAnswer{60;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2695}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 62},
		}}

	OnAnswer{60;
		Conditions = {
			PlayerHasItem{ItemId = 2695},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 63},
		}}

	OnAnswer{62;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tworsnik017", String = "Sagte ich nicht, dass Ihr auch den Gelben Speiling bringen sollt?"},
			Answer{Tag = "tworsnik017PC", String = "Stimmt, den muss ich noch suchen ...", AnswerId = 63},
		}}

	OnAnswer{63;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2697}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 65},
		}}

	OnAnswer{63;
		Conditions = {
			PlayerHasItem{ItemId = 2697},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 66},
		}}

	OnAnswer{65;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tworsnik018", String = "Wie soll der Trank ohne den Elfenspreizling gelingen? Wo habt Ihr ihn?"},
			Answer{Tag = "tworsnik018PC", String = "Nun...", AnswerId = 66},
		}}

	OnAnswer{66;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2694}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 68},
		}}

	OnAnswer{66;
		Conditions = {
			PlayerHasItem{ItemId = 2694},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 69},
		}}

	OnAnswer{68;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tworsnik019", String = "Der Magenkrempling ist die wichtigste Zutat! Er fehlt!"},
			Answer{Tag = "tworsnik019PC", String = "Hm ...", AnswerId = 69},
		}}

	OnAnswer{69;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tworsnik020", String = "Kommt erst wieder, wenn Ihr mehr Pilze habt!"},
			Answer{Tag = "", String = "", AnswerId = 70},
		}}

	OnAnswer{70;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 71},
		}}

	OnAnswer{71;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end