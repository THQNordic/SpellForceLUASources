-->INFO: Dialog_Vernichte_Goblins
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p84\n8343_Dialog_Vernichte_Goblins.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagTrue{Name = "AuftragVernichteGoblinsBeendet"},
		},
		Actions = {
			Say{Tag = "", String = "Lebt wohl!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "AuftragVernichteGoblinsBeendet"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "AuftragVernichteGoblinsErhalten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{2;
		Conditions = {
			IsPlayerFlagTrue{Name = "AuftragVernichteGoblinsErhalten"},
		},
		Actions = {
			Say{Tag = "", String = "Sucht auf der Lichtung im Westen nach den Goblins!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{4;
		Conditions = {
			IsPlayerFlagFalse{Name = "p84_goblins_defeated"},
		},
		Actions = {
			Say{Tag = "", String = "Seid gegrüßt!"},
			Answer{Tag = "", String = "Wer bist du?", AnswerId = 5},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "p84_goblins_defeated"}),
		},
		Actions = {
			Say{Tag = "", String = "Habt Dank! Ich rechnete zwar nicht mit einem solchen Blutbad, aber ich danke Euch das Ihr mir geholfen habt!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = "Ich bin die Hüterin über den Wald. Ich halte ihn im Gleichgewicht. Doch in letzter Zeit treiben einige Goblins hier ihr Unwesen. Vielleicht könnt ihr mir dabei helfen, dieses Problem zu lösen?"},
			Answer{Tag = "", String = "Gewiss. Fahrt fort!", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = "Ich bin eine friedliebende Elfe, und könnte niemals einem Geschöpf der Natur Leid zufügen. Vielleicht könntet ihr die Goblins aus dem Wald vertreiben?"},
			Answer{Tag = "", String = "Ich werde Euch helfen! Wo finde ich diese Goblins?", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = "Oh, habt vielen Dank. Begebt euch, hier durch die Bäume, nach Westen. Sucht auf der Lichtung nach den Goblins. Viel Glück!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "VernichteGoblins"},
			SetPlayerFlagTrue{Name = "AuftragVernichteGoblinsErhalten"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = "Lebt Wohl!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "AuftragVernichteGoblinsBeendet"},
			EndDialog(),
		}}


	EndDefinition()
end