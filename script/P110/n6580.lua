-->INFO: MenhirMondstadt
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P110\n6580_MenhirMondstadt.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "menhirmondstadt110_001", String = "(Ein gewaltiger Menhir.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemKlopfstein"},
		},
		Actions = {
			Say{Tag = "menhirmondstadt110_002", String = "(Darauf eine Inschrift: 'Nur des Meisters Klopfen wird die Pforte öffnen.')"},
			OfferAnswer{Tag = "menhirmondstadt110_003PC", String = "(Gegen den Menhir klopfen.)", AnswerId = 2},
			OfferAnswer{Tag = "menhirmondstadt110_007PC", String = "(Kahns Faust gegen den Menhir schlagen.)", AnswerId = 8},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemKlopfstein"}),
		},
		Actions = {
			Say{Tag = "menhirmondstadt110_002", String = "(Darauf eine Inschrift: 'Nur des Meisters Klopfen wird die Pforte öffnen.')"},
			OfferAnswer{Tag = "menhirmondstadt110_003PC", String = "(Gegen den Menhir klopfen.)", AnswerId = 2},
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
			Negated(IsGlobalFlagTrue{Name = "P110_MoonHandBurned"}),
		},
		Actions = {
			Say{Tag = "menhirmondstadt110_005", String = "('NARR! Nimm deine Hand von dem Stein!')"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{3;
		Conditions = {
			IsGlobalFlagTrue{Name = "P110_MoonHandBurned"},
		},
		Actions = {
			Say{Tag = "menhirmondstadt110_004", String = "(Nichts geschieht.)"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "menhirmondstadt110_006", String = "(Die Inschrift verändert sich: 'Falsche Hand, falsches Herz.' ... Der Boden erzittert.)"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "P110_MoonHandBurned"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "menhirmondstadt110_008", String = "(Die Faust zerbricht bei der Berührung und zerfällt zu feinem Staub.)"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "menhirmondstadt110_009", String = "(Der Durchgang öffnet sich.)"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			SetItemFlagFalse{Name = "PlayerHasItemKlopfstein"},
							SetGlobalFlagTrue{Name = "P110_MoonGateOpened"},
							RemoveDialog{NpcId = 6580},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end