-->INFO: Mordquest_Baetha

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--MordQuest wird erst aktiv, wenn der Spieler den Auftrag von Aileen erhalten hat!
OnOneTimeEvent
{
	Conditions = 
	{
		
		
	},
	Actions = 
	{
		
		RemoveDialog{NpcId = self},
		
	},
}






OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "StartMordquestP105"},
		
	},
	Actions = 
	{
		
		SetDialogType{ NpcId = self, Type = SideQuest},
		
	},
}

Despawn
{
	Conditions = 
	{
		IsGlobalFlagTrue{ Name = "BatheaDespawnP105"},	
	} , 
	Actions = 
	{
	}
}





--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P105\n8123_Mordquest_Baetha.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "known"},
		},
		Actions = {
			Say{Tag = "baetha105_001", String = "Ich war es nicht. Das müsst Ihr mir glauben."},
			Answer{Tag = "baetha105_002PC", String = "Beruhigt Euch. Ich bin nur hier, um Euch zu befragen.", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "known"}),
		},
		Actions = {
			Say{Tag = "baetha105_003", String = "Habt Ihr noch weitere Fragen an mich?"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "baetha105_004PC", String = "Erzählt mir, was sich zugetragen hat.", AnswerId = 3},
			OfferAnswer{Tag = "baetha105_012PC", String = "Erzählt mir etwas über Fennair.", AnswerId = 11},
			OfferAnswer{Tag = "baetha105_015PC", String = "Erzählt mir etwas über Lithere.", AnswerId = 14},
			OfferAnswer{Tag = "baetha105_018PC", String = "Erzählt mir etwas über Euch.", AnswerId = 17},
			OfferAnswer{Tag = "baetha105_021PC", String = "Ich habe keine Fragen mehr. Habt Dank.", AnswerId = 20},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "baetha105_004PC", String = "Erzählt mir, was sich zugetragen hat.", AnswerId = 3},
			OfferAnswer{Tag = "baetha105_012PC", String = "Erzählt mir etwas über Fennair.", AnswerId = 11},
			OfferAnswer{Tag = "baetha105_015PC", String = "Erzählt mir etwas über Lithere.", AnswerId = 14},
			OfferAnswer{Tag = "baetha105_018PC", String = "Erzählt mir etwas über Euch.", AnswerId = 17},
			OfferAnswer{Tag = "baetha105_021PC", String = "Ich habe keine Fragen mehr. Habt Dank.", AnswerId = 20},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "baetha105_005", String = "Aedale ...Ich meine, die Hohe Priesterin Aedale wies mich an, die Dinge zu tragen, die sie für ein rituelles Gebet vorbereitet hatte."},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "baetha105_006", String = "Gemeinsam mit Lithere, die ihr bei diesem Ritus zur Hand gehen sollte, und Fennair gingen wir an diese Stelle über der Klippe."},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "baetha105_007", String = "Ich weiß noch, wie Fennair fort ging, um ein Geräusch zu erkunden. Als ich der Hohen Priesterin die Artefakte gab, merkte sie, dass ich den Elenkelch vergessen hatte."},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "baetha105_008", String = "Sie war, wie so oft, sehr verärgert und schickte mich fort, den Kelch zu holen. Ich lief so schnell ich konnte ins Dorf, aber als ich zurückkam, war keiner mehr da."},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "baetha105_009", String = "Ich ging vor bis zur Klippe ... und da lag sie, tot. Ich fand sie so, wie sie jetzt liegt, das müsst Ihr mir glauben!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "baetha105_010", String = "Dann war plötzlich Lithere wieder da und beschuldigte mich! Fennair kehrte zurück und Lithere schickte ihn zu den anderen Wachen ... Ich ... ich war so verwirrt! "},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "baetha105_011", String = "Das ist alles, was ich weiß. Bitte, Ihr müsst mir glauben, das ist die Wahrheit!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "baetha105_004PC", String = "Erzählt mir, was sich zugetragen hat.", AnswerId = 3},
			OfferAnswer{Tag = "baetha105_012PC", String = "Erzählt mir etwas über Fennair.", AnswerId = 11},
			OfferAnswer{Tag = "baetha105_015PC", String = "Erzählt mir etwas über Lithere.", AnswerId = 14},
			OfferAnswer{Tag = "baetha105_018PC", String = "Erzählt mir etwas über Euch.", AnswerId = 17},
			OfferAnswer{Tag = "baetha105_021PC", String = "Ich habe keine Fragen mehr. Habt Dank.", AnswerId = 20},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "baetha105_013", String = "Oh, er ist ein guter Kerl. Einer der wenigen Menschen, die hier oben geduldet werden. Er hat sich uns freiwillig angeschlossen."},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "baetha105_014", String = "Er dient bei den Wachen. Ich war froh, dass er mit uns ging. Wer weiß, was hier noch so alles rumschleicht!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "baetha105_004PC", String = "Erzählt mir, was sich zugetragen hat.", AnswerId = 3},
			OfferAnswer{Tag = "baetha105_012PC", String = "Erzählt mir etwas über Fennair.", AnswerId = 11},
			OfferAnswer{Tag = "baetha105_015PC", String = "Erzählt mir etwas über Lithere.", AnswerId = 14},
			OfferAnswer{Tag = "baetha105_018PC", String = "Erzählt mir etwas über Euch.", AnswerId = 17},
			OfferAnswer{Tag = "baetha105_021PC", String = "Ich habe keine Fragen mehr. Habt Dank.", AnswerId = 20},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "baetha105_016", String = "Lithere ist sehr ... entschlossen. Ich ... ich mag sie nicht, sie macht mir Angst."},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "baetha105_017", String = "Sie hat hart gearbeitet, um zu Aedales rechter Hand zu werden, und lässt uns andere nicht minder zu Werke gehen."},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "baetha105_004PC", String = "Erzählt mir, was sich zugetragen hat.", AnswerId = 3},
			OfferAnswer{Tag = "baetha105_012PC", String = "Erzählt mir etwas über Fennair.", AnswerId = 11},
			OfferAnswer{Tag = "baetha105_015PC", String = "Erzählt mir etwas über Lithere.", AnswerId = 14},
			OfferAnswer{Tag = "baetha105_018PC", String = "Erzählt mir etwas über Euch.", AnswerId = 17},
			OfferAnswer{Tag = "baetha105_021PC", String = "Ich habe keine Fragen mehr. Habt Dank.", AnswerId = 20},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "baetha105_019", String = "Über mich? Da gibt es nicht viel zu erzählen. Ich versuche nur, Aryn und meinen Schwestern so gut zu dienen, wie ich es vermag."},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "baetha105_020", String = "Auch wenn es nicht immer einfach ist."},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "baetha105_004PC", String = "Erzählt mir, was sich zugetragen hat.", AnswerId = 3},
			OfferAnswer{Tag = "baetha105_012PC", String = "Erzählt mir etwas über Fennair.", AnswerId = 11},
			OfferAnswer{Tag = "baetha105_015PC", String = "Erzählt mir etwas über Lithere.", AnswerId = 14},
			OfferAnswer{Tag = "baetha105_018PC", String = "Erzählt mir etwas über Euch.", AnswerId = 17},
			OfferAnswer{Tag = "baetha105_021PC", String = "Ich habe keine Fragen mehr. Habt Dank.", AnswerId = 20},
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


	EndDefinition()
end