-->INFO: GoblinHaendler
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--Wenn das Rennen vorbei ist, despawnen die Goblins.
Despawn
{
	Conditions = 
	{
		FigureInRange { X = 72, Y = 128, NpcId = self , Range = 1},
	},
	Actions = 
	{
		
	}
}


--Outcries Obstverkäufer.
OnPlatformOneTimeEvent
{
	Conditions = 
	{ 
		AvatarInRange {X = 90, Y = 111, Range = 10},
	},
	Actions = 
	{ 
		Outcry {NpcId = 11416, String = "Eine neue Lieferung ist eingetroffen!" , Tag = "oca2racemasterP200_001" , Delay = TRUE , Color = ColorWhite},
	}
}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P200\n11416_GoblinHaendler.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsNpcFlagTrue{Name = "known"},
		},
		Actions = {
			Say{Tag = "racemasterP200_001", String = "Habt Ihr Euch entschieden?"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "known"}),
		},
		Actions = {
			Say{Tag = "racemasterP200_002", String = "Tretet näher, Freund, immer heran!"},
			Answer{Tag = "", String = "", AnswerId = 4},
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
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
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
			Say{Tag = "racemasterP200_003", String = "Hier erlebt Ihr etwas, dass habt Ihr noch nicht gesehen! Das Rennen der schnellsten Goblins der Welt!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "racemasterP200_004", String = "Seien sie dabei, wenn die besten Läufer diesen flinken Volkes hier gegeneinander antreten! Erleben sie unglaubliche Siege! Erlangen sie Reichtümer bei todsicheren Wetten!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "racemasterP200_005", String = "Werft nur einen Blick auf unsere Favoriten! Sind das nicht prachtvolle Kerlchen! Und Ihr solltet sie mal laufen sehen!"},
			Answer{Tag = "racemasterP200_006PC", String = "Wann findet dieses Rennen statt?", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "racemasterP200_007", String = "Sobald Ihr auf einen unserer Goblinläufer gewettet habt, Freund! Setzt 500 Gold, wenn Ihr gewinnt erhaltet Ihr das Zehnfache zurück!"},
			Answer{Tag = "racemasterP200_008PC", String = "Auf wen sollte ich denn setzen?", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "racemasterP200_009", String = "Tja, das müsst Ihr selbst entschteiden! Es gibt die gelbe, die rote, die braune und die grüne Fraktion! Entscheidet Euch!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "racemasterP200_010", String = "Oder werft erst einen Blick auf die Läufer!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
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
			SetNpcFlagTrue{Name="known"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(PlayerHasMoney {Gold = 500, Silver = 0, Copper = 0}),
		},
		Actions = {
			Say{Tag = "oca2racemasterP200_004", String = "Ihr habt nicht genug Geld!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(Negated(PlayerHasMoney {Gold = 500, Silver = 0, Copper = 0})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "racemasterP200_011PC", String = "Ich setze 500 Gold auf die gelbe Fraktion.", AnswerId = 15},
			OfferAnswer{Tag = "racemasterP200_013PC", String = "Ich setze 500 Gold auf die grüne Fraktion.", AnswerId = 18},
			OfferAnswer{Tag = "racemasterP200_014PC", String = "Ich setze 500 Gold auf die braune Fraktion.", AnswerId = 21},
			OfferAnswer{Tag = "racemasterP200_015PC", String = "Ich setze 500 Gold auf die rote Fraktion", AnswerId = 24},
			OfferAnswer{Tag = "racemasterP200_017PC", String = "Ich will mir die Läufer erst einmal ansehen, bevor ich mich entscheide.", AnswerId = 27},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "racemasterP200_012", String = "Vielen Dank für Euren Einsatz! Das Rennen wird in Kürze beginnen!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name="g_sP200GelberGoblinKaufen"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "racemasterP200_012", String = "Vielen Dank für Euren Einsatz! Das Rennen wird in Kürze beginnen!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name="g_sP200GruenerGoblinKaufen"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "racemasterP200_012", String = "Vielen Dank für Euren Einsatz! Das Rennen wird in Kürze beginnen!"},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name="g_sP200BraunerGoblinKaufen"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "racemasterP200_016", String = "Vielen Dank für euren Einsatz! Das Rennen wird in Kürze beginnen!"},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name="g_sP200RoterGoblinKaufen"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "racemasterP200_018", String = "Ganz wie Ihr wollt mein Freund! Sie sind gleich hier drüben in ihren Kabinen untergebracht!"},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end