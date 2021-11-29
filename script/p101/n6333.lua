-->INFO: Kongar
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p101\n6333_Kongar.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagTrue{Name = "Q605_IsKongarKnown"},
		},
		Actions = {
			Say{Tag = "kongar101_001", String = "Habt Ihr den runzligen Riesenkriecher, das schleimige Scheusal schon getötet?"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q605_IsKongarKnown"}),
		},
		Actions = {
			Say{Tag = "kongar101_004", String = "Verwanzter Pestlurch! Widerliche Moderkröte!"},
			Answer{Tag = "kongar101_005PC", String = "Sprecht Ihr mit mir?", AnswerId = 6},
		}}

	OnAnswer{1;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemWumpusTongue"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kongar101_002PC", String = "Hier, ich bringe Euch die Zunge des Wumpus.", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemWumpusTongue"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kongar101_003", String = "Ha! Ihr habt die schmutzige Kröte geschlachtet und meinen Bruder gerächt! Nehmt dies als Ausdruck meines Dankes."},
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
			SetItemFlagFalse{Name = "PlayerHasItemWumpusTongue"},
							 QuestSolve{QuestId = 606},
							 QuestSolve{QuestId = 607},
							 QuestSolve{QuestId = 605},
							 SetRewardFlagTrue{Name = "WumpusKilled"},
							 RemoveDialog{NpcId = 6333},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
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
			Say{Tag = "kongar101_006", String = "Stinkender Schlammkraucher! Unfrosch, ekelhafter!"},
			Answer{Tag = "kongar101_007PC", String = "Wovon redet Ihr überhaupt?", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kongar101_008", String = "Der Wumpus, eine riesige Giftkröte, hat meinen Bruder verschlungen!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemWumpusTongue"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "kongar101_009PC", String = "Meint Ihr das Tier, von dem ich diese Zunge erbeutet habe?", AnswerId = 9},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemWumpusTongue"}),
		},
		Actions = {
			Say{Tag = "kongar101_011", String = "Die grausame Großkröte haust in den Sturmfelsen. Und mein lahmes Bein hält mich hier!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kongar101_010", String = "Die Zunge des Wumpus! Mein Bruder ist gerächt. Endlich! Hier, nehmt dies als Entlohnung."},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kongar101_012", String = "Möge Zarach sie vernichten! Wer die Kröte erschlägt und mir einen Beweis erbringt, dem soll gehören, was ich noch besitze!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 605},
							   QuestBegin{QuestId = 606},
							   SetPlayerFlagTrue{Name = "Q605_IsKongarKnown"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end