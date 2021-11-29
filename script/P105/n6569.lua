-->INFO: Mordquest_Fennair
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "P105_MordquestOn" },
	},
	Actions = 
	{
	},
}




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\Project\main\mission\dialoge\P105\n6569_Mordquest_Fennair.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "MordQuestAngenommen"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "fennair105_005PC", String = "Grüße Fennair.", AnswerId = 4},
		}}

	OnAnswer{1;
		Conditions = {
			IsPlayerFlagFalse{Name = "MordQuestAngenommen"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "fennair105_001PC", String = "Grüße.", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fennair105_002", String = "Grüße. Geht weiter, hier gibt es nichts zu sehen."},
			Answer{Tag = "fennair105_003PC", String = "Ihr seht recht mitgenommen aus. Stimmt etwas nicht?", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fennair105_004", String = "Es ist alles in Ordnung, geht bitte weiter, Bürger. Lasst uns allein."},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fennair105_006", String = "Ihr kennt meinen Namen?"},
			Answer{Tag = "fennair105_007PC", String = "Ich weiß von Aedales Tod. Aileen schickt mich, um herauszufinden, was hier geschah.", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fennair105_008", String = "Dann schickt Aileen also einen Fremden? Wie es scheint, traut sie keinem von uns."},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fennair105_009", String = "Wie kann ich Euch helfen?"},
			OfferAnswer{Tag = "fennair105_010PC", String = "Erzählt mir, was sich zugetragen hat.", AnswerId = 8},
			OfferAnswer{Tag = "fennair105_015PC", String = "Erzählt mir etwas über Baetha.", AnswerId = 12},
			OfferAnswer{Tag = "fennair105_018PC", String = "Erzählt mir etwas über Lithere.", AnswerId = 14},
			OfferAnswer{Tag = "fennair105_021PC", String = "Erzählt mir etwas über Euch.", AnswerId = 16},
			OfferAnswer{Tag = "fennair105_027PC", String = "Wen haltet Ihr für die Schuldige?", AnswerId = 20},
			OfferAnswer{Tag = "fennair105_029PC", String = "Danke. Vielleicht komme ich später zurück.", AnswerId = 21},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fennair105_011", String = "Mir wurde befohlen, Baetha und die Hohe Priesterin bei einem Ritual zu schützen. Ich glaube, es ging darum, einen entweihten Ort zu reinigen."},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fennair105_012", String = "Wir gingen also auf den Ostberg, Lithere kam mit uns. Aedale scholt Baetha wegen irgendeines Kelches, da hörte ich Schritte oberhalb des Weges."},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fennair105_013", String = "Ich ging hinauf, um nachzusehen ... fand aber nichts. Als ich zurückkehrte, standen Lithere und Baetha an der Klippe und die Hohe Priesterin lag tot im Tal."},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fennair105_014", String = "Lithere entsandte mich in die Stadt, um die Wachen zu holen. Ich hörte noch, wie sie Baetha beschuldigte, Aedale in den Abgrund gestoßen zu haben."},
			OfferAnswer{Tag = "fennair105_010PC", String = "Erzählt mir, was sich zugetragen hat.", AnswerId = 8},
			OfferAnswer{Tag = "fennair105_015PC", String = "Erzählt mir etwas über Baetha.", AnswerId = 12},
			OfferAnswer{Tag = "fennair105_018PC", String = "Erzählt mir etwas über Lithere.", AnswerId = 14},
			OfferAnswer{Tag = "fennair105_021PC", String = "Erzählt mir etwas über Euch.", AnswerId = 16},
			OfferAnswer{Tag = "fennair105_027PC", String = "Wen haltet Ihr für die Schuldige?", AnswerId = 20},
			OfferAnswer{Tag = "fennair105_029PC", String = "Danke. Vielleicht komme ich später zurück.", AnswerId = 21},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fennair105_016", String = "Baetha ist eine Novizin in Aryns Orden. Sie ist ein gutes Wesen, niemandem würde sie etwas zu Leide tun."},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fennair105_017", String = "Sie hat Aedale nicht getötet, das kann einfach nicht sein!"},
			OfferAnswer{Tag = "fennair105_010PC", String = "Erzählt mir, was sich zugetragen hat.", AnswerId = 8},
			OfferAnswer{Tag = "fennair105_015PC", String = "Erzählt mir etwas über Baetha.", AnswerId = 12},
			OfferAnswer{Tag = "fennair105_018PC", String = "Erzählt mir etwas über Lithere.", AnswerId = 14},
			OfferAnswer{Tag = "fennair105_021PC", String = "Erzählt mir etwas über Euch.", AnswerId = 16},
			OfferAnswer{Tag = "fennair105_027PC", String = "Wen haltet Ihr für die Schuldige?", AnswerId = 20},
			OfferAnswer{Tag = "fennair105_029PC", String = "Danke. Vielleicht komme ich später zurück.", AnswerId = 21},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fennair105_019", String = "Lithere ist aus dem gleichen Holz geschnitzt wie Aedale. Oder besser gesagt, aus dem gleichen Eis. Aedale war eine ... schwierige Frau."},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fennair105_020", String = "Sie ist eine gebieterische Frau, aber sie arbeitet hart. Ich glaube, sie wäre gern die Hohe Priesterin."},
			OfferAnswer{Tag = "fennair105_010PC", String = "Erzählt mir, was sich zugetragen hat.", AnswerId = 8},
			OfferAnswer{Tag = "fennair105_015PC", String = "Erzählt mir etwas über Baetha.", AnswerId = 12},
			OfferAnswer{Tag = "fennair105_018PC", String = "Erzählt mir etwas über Lithere.", AnswerId = 14},
			OfferAnswer{Tag = "fennair105_021PC", String = "Erzählt mir etwas über Euch.", AnswerId = 16},
			OfferAnswer{Tag = "fennair105_027PC", String = "Wen haltet Ihr für die Schuldige?", AnswerId = 20},
			OfferAnswer{Tag = "fennair105_029PC", String = "Danke. Vielleicht komme ich später zurück.", AnswerId = 21},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fennair105_022", String = "Ich? Ich bin Wachmann."},
			Answer{Tag = "fennair105_023PC", String = "Aber wie kommt Ihr hierher?", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fennair105_024", String = "Ich war Begleiter eines Botschafters der Utraner. Wir kamen hier herauf, als die Frostmarschen noch offen waren."},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fennair105_025", String = "Ich ... war gebannt von den Elfen, ihrem Wissen und ihrer Ergebenheit. Mein Herr erlaubte mir, zu bleiben und schließlich willigten auch die Elfen ein. Seitdem diene ich bei den Wachen unter Aileens Befehl."},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fennair105_026", String = "Sie schätzen meine Dienste, weil ich schwere Rüstungen tragen kann! Und diese gepanzerten Fäuste haben schon manches Eisen aus dem Feuer geholt, das ihnen zu heiß war!"},
			OfferAnswer{Tag = "fennair105_010PC", String = "Erzählt mir, was sich zugetragen hat.", AnswerId = 8},
			OfferAnswer{Tag = "fennair105_015PC", String = "Erzählt mir etwas über Baetha.", AnswerId = 12},
			OfferAnswer{Tag = "fennair105_018PC", String = "Erzählt mir etwas über Lithere.", AnswerId = 14},
			OfferAnswer{Tag = "fennair105_021PC", String = "Erzählt mir etwas über Euch.", AnswerId = 16},
			OfferAnswer{Tag = "fennair105_027PC", String = "Wen haltet Ihr für die Schuldige?", AnswerId = 20},
			OfferAnswer{Tag = "fennair105_029PC", String = "Danke. Vielleicht komme ich später zurück.", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fennair105_028", String = "lch würde Lithere verdächtigen. Sie wollte schon immer Hohe Priesterin werden! Und Baetha würde so etwas nie tun."},
			OfferAnswer{Tag = "fennair105_010PC", String = "Erzählt mir, was sich zugetragen hat.", AnswerId = 8},
			OfferAnswer{Tag = "fennair105_015PC", String = "Erzählt mir etwas über Baetha.", AnswerId = 12},
			OfferAnswer{Tag = "fennair105_018PC", String = "Erzählt mir etwas über Lithere.", AnswerId = 14},
			OfferAnswer{Tag = "fennair105_021PC", String = "Erzählt mir etwas über Euch.", AnswerId = 16},
			OfferAnswer{Tag = "fennair105_027PC", String = "Wen haltet Ihr für die Schuldige?", AnswerId = 20},
			OfferAnswer{Tag = "fennair105_029PC", String = "Danke. Vielleicht komme ich später zurück.", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end