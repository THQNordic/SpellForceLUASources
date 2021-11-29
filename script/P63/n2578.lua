-->INFO: Hinrik
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = 439, Y = 180, Direction = East}
--!EDS ONIDLEGOHOME END

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p63\n2578_Hinrik.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagTrue{Name = "FlagHinrikKnown"},
		},
		Actions = {
			Say{Tag = "hinrik001", String = "Sagt mal, hab ich Euch nicht schon mal gesehen? Ihr wolltet mir doch... Schnaps bringen... Schnaps aus meiner Heimat...!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "FlagHinrikKnown"}),
		},
		Actions = {
			Say{Tag = "hinrik002", String = "Auf ihr Krieger! Nie verzagt! ... Hick ... Oh, wen haben wir denn... hier?"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			PlayerHasItem{ItemId = 2699},
			PlayerHasItem{ItemId = 2662},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hinrik003PC", String = "Ich habe hier eine Flasche Liannoner Früchtebrand.", AnswerId = 4},
			OfferAnswer{Tag = "hinrik004PC", String = "Vielleicht diese Flasche Zwergenweinbrand?", AnswerId = 6},
			OfferAnswer{Tag = "hinrik009PC", String = "Denkt Ihr nicht, dass Ihr genug habt?", AnswerId = 13},
		}}

	OnAnswer{1;
		Conditions = {
			PlayerHasItem{ItemId = 2699},
			Negated(PlayerHasItem{ItemId = 2662}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hinrik003PC", String = "Ich habe hier eine Flasche Liannoner Früchtebrand.", AnswerId = 4},
			OfferAnswer{Tag = "hinrik009PC", String = "Denkt Ihr nicht, dass Ihr genug habt?", AnswerId = 13},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2699}),
			PlayerHasItem{ItemId = 2662},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hinrik004PC", String = "Vielleicht diese Flasche Zwergenweinbrand?", AnswerId = 6},
			OfferAnswer{Tag = "hinrik009PC", String = "Denkt Ihr nicht, dass Ihr genug habt?", AnswerId = 13},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2699}),
			Negated(PlayerHasItem{ItemId = 2662}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hinrik009PC", String = "Denkt Ihr nicht, dass Ihr genug habt?", AnswerId = 13},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hinrik003", String = "Verzeiht... Ihr... Ihr habt nicht zufällig etwas guten Schnaps... aus meiner Heimat? Das Gesöff hier taugt nichts! ... Hick ..."},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
			PlayerHasItem{ItemId = 2699},
			PlayerHasItem{ItemId = 2662},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagHinrikKnown"},
			QuestBegin{QuestId = 489},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hinrik003PC", String = "Ich habe hier eine Flasche Liannoner Früchtebrand.", AnswerId = 4},
			OfferAnswer{Tag = "hinrik004PC", String = "Vielleicht diese Flasche Zwergenweinbrand?", AnswerId = 6},
			OfferAnswer{Tag = "hinrik009PC", String = "Denkt Ihr nicht, dass Ihr genug habt?", AnswerId = 13},
		}}

	OnAnswer{3;
		Conditions = {
			PlayerHasItem{ItemId = 2699},
			Negated(PlayerHasItem{ItemId = 2662}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagHinrikKnown"},
			QuestBegin{QuestId = 489},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hinrik003PC", String = "Ich habe hier eine Flasche Liannoner Früchtebrand.", AnswerId = 4},
			OfferAnswer{Tag = "hinrik009PC", String = "Denkt Ihr nicht, dass Ihr genug habt?", AnswerId = 13},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2699}),
			PlayerHasItem{ItemId = 2662},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagHinrikKnown"},
			QuestBegin{QuestId = 489},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hinrik004PC", String = "Vielleicht diese Flasche Zwergenweinbrand?", AnswerId = 6},
			OfferAnswer{Tag = "hinrik009PC", String = "Denkt Ihr nicht, dass Ihr genug habt?", AnswerId = 13},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2699}),
			Negated(PlayerHasItem{ItemId = 2662}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagHinrikKnown"},
			QuestBegin{QuestId = 489},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hinrik009PC", String = "Denkt Ihr nicht, dass Ihr genug habt?", AnswerId = 13},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hinrik004", String = "Bleibt mir mit dieser Blörre vom Leib! Ich sagte... Schnaps aus meiner Heimat! ... Hick ..."},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
			PlayerHasItem{ItemId = 2699},
			PlayerHasItem{ItemId = 2662},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hinrik003PC", String = "Ich habe hier eine Flasche Liannoner Früchtebrand.", AnswerId = 4},
			OfferAnswer{Tag = "hinrik004PC", String = "Vielleicht diese Flasche Zwergenweinbrand?", AnswerId = 6},
			OfferAnswer{Tag = "hinrik009PC", String = "Denkt Ihr nicht, dass Ihr genug habt?", AnswerId = 13},
		}}

	OnAnswer{5;
		Conditions = {
			PlayerHasItem{ItemId = 2699},
			Negated(PlayerHasItem{ItemId = 2662}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hinrik003PC", String = "Ich habe hier eine Flasche Liannoner Früchtebrand.", AnswerId = 4},
			OfferAnswer{Tag = "hinrik009PC", String = "Denkt Ihr nicht, dass Ihr genug habt?", AnswerId = 13},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2699}),
			PlayerHasItem{ItemId = 2662},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hinrik004PC", String = "Vielleicht diese Flasche Zwergenweinbrand?", AnswerId = 6},
			OfferAnswer{Tag = "hinrik009PC", String = "Denkt Ihr nicht, dass Ihr genug habt?", AnswerId = 13},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2699}),
			Negated(PlayerHasItem{ItemId = 2662}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hinrik009PC", String = "Denkt Ihr nicht, dass Ihr genug habt?", AnswerId = 13},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hinrik005", String = "Zwergenweinbrand?! Zeigt her... bei... Hick... tatsächlich..."},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hinrik006", String = "Gebt ihn mir! Gebt ihn mir! Ich schenke Euch auch... diese bronzene Statu... Hick... dafür?"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hinrik007", String = "Wollte ich... eigentlich... verkaufen... aber kein Händler gab mir Geld dafür..."},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hinrik008", String = "Dann habe ich... auch noch ein paar Augengläser... irgendwo mitgehen... Hick... ach nein... die sind mir ja auf Liannon... weg... Hick... gekommen..."},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hinrik009", String = "Hier nehmt die Statu... Hick... ...ette."},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 489},
			  TransferItem{TakeItem = 2662 , GiveItem = 3247 , Flag = Exchange},
			  SetRewardFlagTrue{ Name = "Zwergendienste1Hinrik"},
			  RemoveDialogFromNpc{NpcId = 2578},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
			PlayerHasItem{ItemId = 2699},
			PlayerHasItem{ItemId = 2662},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hinrik003PC", String = "Ich habe hier eine Flasche Liannoner Früchtebrand.", AnswerId = 4},
			OfferAnswer{Tag = "hinrik004PC", String = "Vielleicht diese Flasche Zwergenweinbrand?", AnswerId = 6},
			OfferAnswer{Tag = "hinrik009PC", String = "Denkt Ihr nicht, dass Ihr genug habt?", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			PlayerHasItem{ItemId = 2699},
			Negated(PlayerHasItem{ItemId = 2662}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hinrik003PC", String = "Ich habe hier eine Flasche Liannoner Früchtebrand.", AnswerId = 4},
			OfferAnswer{Tag = "hinrik009PC", String = "Denkt Ihr nicht, dass Ihr genug habt?", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2699}),
			PlayerHasItem{ItemId = 2662},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hinrik004PC", String = "Vielleicht diese Flasche Zwergenweinbrand?", AnswerId = 6},
			OfferAnswer{Tag = "hinrik009PC", String = "Denkt Ihr nicht, dass Ihr genug habt?", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2699}),
			Negated(PlayerHasItem{ItemId = 2662}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hinrik009PC", String = "Denkt Ihr nicht, dass Ihr genug habt?", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hinrik010", String = "Mehr Schnaps... mehr Schnaps aus meiner Heimat! ... Hick ..."},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end