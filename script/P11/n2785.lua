-->INFO: Menhir
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p11\n2785_Menhir.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "menhir001", String = "(In die Oberfl�che des Menhirs sind drei Symbole eingeritzt: Ein Auge, eine Hand, ein Blutstropfen.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "menhir001PC", String = "(Das Auge ber�hren.)", AnswerId = 2},
			OfferAnswer{Tag = "menhir017PC", String = "(Die Hand ber�hren.)", AnswerId = 21},
			OfferAnswer{Tag = "menhir018PC", String = "(Den Blutstropfen ber�hren.)", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "menhir002", String = "(Das Symbol leuchtet unter der Ber�hrung kurz auf.)"},
			OfferAnswer{Tag = "menhir002PC", String = "(Das Auge ber�hren.)", AnswerId = 3},
			OfferAnswer{Tag = "menhir003PC", String = "(Die Hand ber�hren.)", AnswerId = 4},
			OfferAnswer{Tag = "menhir004PC", String = "(Den Blutstropfen ber�hren.)", AnswerId = 5},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "menhir003", String = "(Das Symbol leuchtet unter der Ber�hrung kurz auf.)"},
			OfferAnswer{Tag = "menhir001PC", String = "(Das Auge ber�hren.)", AnswerId = 2},
			OfferAnswer{Tag = "menhir017PC", String = "(Die Hand ber�hren.)", AnswerId = 21},
			OfferAnswer{Tag = "menhir018PC", String = "(Den Blutstropfen ber�hren.)", AnswerId = 22},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "menhir004", String = "(Das Symbol leuchtet unter der Ber�hrung kurz auf.)"},
			OfferAnswer{Tag = "menhir001PC", String = "(Das Auge ber�hren.)", AnswerId = 2},
			OfferAnswer{Tag = "menhir017PC", String = "(Die Hand ber�hren.)", AnswerId = 21},
			OfferAnswer{Tag = "menhir018PC", String = "(Den Blutstropfen ber�hren.)", AnswerId = 22},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "menhir005", String = "(Das Symbol leuchtet unter der Ber�hrung kurz auf.)"},
			OfferAnswer{Tag = "menhir005PC", String = "(Das Auge ber�hren.)", AnswerId = 6},
			OfferAnswer{Tag = "menhir006PC", String = "(Die Hand ber�hren.)", AnswerId = 7},
			OfferAnswer{Tag = "menhir016PC", String = "(Den Blutstropfen ber�hren.)", AnswerId = 20},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "menhir006", String = "(Das Symbol leuchtet unter der Ber�hrung kurz auf.)"},
			OfferAnswer{Tag = "menhir001PC", String = "(Das Auge ber�hren.)", AnswerId = 2},
			OfferAnswer{Tag = "menhir017PC", String = "(Die Hand ber�hren.)", AnswerId = 21},
			OfferAnswer{Tag = "menhir018PC", String = "(Den Blutstropfen ber�hren.)", AnswerId = 22},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "menhir007", String = "(Das Symbol leuchtet unter der Ber�hrung kurz auf.)"},
			OfferAnswer{Tag = "menhir007PC", String = "(Das Auge ber�hren.)", AnswerId = 8},
			OfferAnswer{Tag = "menhir008PC", String = "(Die Hand ber�hren.)", AnswerId = 9},
			OfferAnswer{Tag = "menhir015PC", String = "(Den Blutstropfen ber�hren.)", AnswerId = 19},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "menhir008", String = "(Das Symbol leuchtet unter der Ber�hrung kurz auf.)"},
			OfferAnswer{Tag = "menhir001PC", String = "(Das Auge ber�hren.)", AnswerId = 2},
			OfferAnswer{Tag = "menhir017PC", String = "(Die Hand ber�hren.)", AnswerId = 21},
			OfferAnswer{Tag = "menhir018PC", String = "(Den Blutstropfen ber�hren.)", AnswerId = 22},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "menhir009", String = "(Das Symbol leuchtet unter der Ber�hrung kurz auf.)"},
			OfferAnswer{Tag = "menhir009PC", String = "(Das Auge ber�hren.)", AnswerId = 10},
			OfferAnswer{Tag = "menhir010PC", String = "(Die Hand ber�hren.)", AnswerId = 11},
			OfferAnswer{Tag = "menhir011PC", String = "(Den Blutstropfen ber�hren.)", AnswerId = 12},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "menhir010", String = "(Das Symbol leuchtet unter der Ber�hrung kurz auf.)"},
			OfferAnswer{Tag = "menhir001PC", String = "(Das Auge ber�hren.)", AnswerId = 2},
			OfferAnswer{Tag = "menhir017PC", String = "(Die Hand ber�hren.)", AnswerId = 21},
			OfferAnswer{Tag = "menhir018PC", String = "(Den Blutstropfen ber�hren.)", AnswerId = 22},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "menhir011", String = "(Das Symbol leuchtet unter der Ber�hrung kurz auf.)"},
			OfferAnswer{Tag = "menhir001PC", String = "(Das Auge ber�hren.)", AnswerId = 2},
			OfferAnswer{Tag = "menhir017PC", String = "(Die Hand ber�hren.)", AnswerId = 21},
			OfferAnswer{Tag = "menhir018PC", String = "(Den Blutstropfen ber�hren.)", AnswerId = 22},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "menhir012", String = "(Das Symbol leuchtet unter der Ber�hrung kurz auf.)"},
			OfferAnswer{Tag = "menhir012PC", String = "(Das Auge ber�hren.)", AnswerId = 13},
			OfferAnswer{Tag = "menhir013PC", String = "(Die Hand ber�hren.)", AnswerId = 17},
			OfferAnswer{Tag = "menhir014PC", String = "(Den Blutstropfen ber�hren.)", AnswerId = 18},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "menhir013", String = "(Ein starkes Zittern durchl�uft den Boden. Die Erde �ffnet sich! Irgendetwas geschieht!)"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			TransferXP{XP = 30, Flag = Give},
			SetPlayerFlagTrue{Name = "FlagTouchedSymbols"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			RemoveDialogFromNpc{NpcId = 2785},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "menhir014", String = "(Das Symbol leuchtet unter der Ber�hrung kurz auf.)"},
			OfferAnswer{Tag = "menhir001PC", String = "(Das Auge ber�hren.)", AnswerId = 2},
			OfferAnswer{Tag = "menhir017PC", String = "(Die Hand ber�hren.)", AnswerId = 21},
			OfferAnswer{Tag = "menhir018PC", String = "(Den Blutstropfen ber�hren.)", AnswerId = 22},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "menhir015", String = "(Das Symbol leuchtet unter der Ber�hrung kurz auf.)"},
			OfferAnswer{Tag = "menhir001PC", String = "(Das Auge ber�hren.)", AnswerId = 2},
			OfferAnswer{Tag = "menhir017PC", String = "(Die Hand ber�hren.)", AnswerId = 21},
			OfferAnswer{Tag = "menhir018PC", String = "(Den Blutstropfen ber�hren.)", AnswerId = 22},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "menhir016", String = "(Das Symbol leuchtet unter der Ber�hrung kurz auf.)"},
			OfferAnswer{Tag = "menhir001PC", String = "(Das Auge ber�hren.)", AnswerId = 2},
			OfferAnswer{Tag = "menhir017PC", String = "(Die Hand ber�hren.)", AnswerId = 21},
			OfferAnswer{Tag = "menhir018PC", String = "(Den Blutstropfen ber�hren.)", AnswerId = 22},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "menhir017", String = "(Das Symbol leuchtet unter der Ber�hrung kurz auf.)"},
			OfferAnswer{Tag = "menhir001PC", String = "(Das Auge ber�hren.)", AnswerId = 2},
			OfferAnswer{Tag = "menhir017PC", String = "(Die Hand ber�hren.)", AnswerId = 21},
			OfferAnswer{Tag = "menhir018PC", String = "(Den Blutstropfen ber�hren.)", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "menhir018", String = "(Das Symbol leuchtet unter der Ber�hrung kurz auf.)"},
			OfferAnswer{Tag = "menhir001PC", String = "(Das Auge ber�hren.)", AnswerId = 2},
			OfferAnswer{Tag = "menhir017PC", String = "(Die Hand ber�hren.)", AnswerId = 21},
			OfferAnswer{Tag = "menhir018PC", String = "(Den Blutstropfen ber�hren.)", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "menhir019", String = "(Das Symbol leuchtet unter der Ber�hrung kurz auf.)"},
			OfferAnswer{Tag = "menhir001PC", String = "(Das Auge ber�hren.)", AnswerId = 2},
			OfferAnswer{Tag = "menhir017PC", String = "(Die Hand ber�hren.)", AnswerId = 21},
			OfferAnswer{Tag = "menhir018PC", String = "(Den Blutstropfen ber�hren.)", AnswerId = 22},
		}}


	EndDefinition()
end