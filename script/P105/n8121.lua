-->INFO: Mordquest_Fennair

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

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

OnIdleGoHome
{
X = 203,
Y = 251,
Direction = West,
Range = 3 ,
WalkRange = 5 ,
WaitTime = 0, 
WalkMode = Walk , 
GotoMode = GotoForced,

	Conditions = 
	{
		IsGlobalFlagFalse{Name = "MordTeilnehmerSpawnenP105"},
		FigureInRange{ X = 238, Y = 288, NpcId = self , Range = 3},
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		
		
	},

}
OnIdleGoHome
{
X = 238,
Y = 215,
Direction = South,
Range = 3 ,
WalkRange = 5 ,
WaitTime = 0, 
WalkMode = Walk , 
GotoMode = GotoForced,

	Conditions = 
	{
		IsGlobalFlagFalse{Name = "MordTeilnehmerSpawnenP105"},
		FigureInRange{ X = 203, Y = 251, NpcId = self , Range = 3},
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		
		
	},

}
OnIdleGoHome
{
X = 278,
Y = 254,
Direction = North,
Range = 3 ,
WalkRange = 5 ,
WaitTime = 0, 
WalkMode = Walk , 
GotoMode = GotoForced,

	Conditions = 
	{
		IsGlobalFlagFalse{Name = "MordTeilnehmerSpawnenP105"},
		FigureInRange{ X = 238, Y = 215, NpcId = self , Range = 3},
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		
		
	},

}

OnIdleGoHome
{
X = 238,
Y = 288,
Direction = West,
Range = 3 ,
WalkRange = 5 ,
WaitTime = 0, 
WalkMode = Walk , 
GotoMode = GotoForced,

	Conditions = 
	{
		IsGlobalFlagFalse{Name = "MordTeilnehmerSpawnenP105"},
		FigureInRange{ X = 278, Y = 254, NpcId = self , Range = 3},
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		
		
	},

}



--MordQuest wird erst aktiv, wenn der Spieler den Auftrag von Aileen erhalten hat!
Umspawn
{
	X =  359,
	Y =  302,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "MordTeilnehmerSpawnenP105"},
	} ,
	Actions = 
	{
		SetNpcFlagTrue{Name = "StartDialogFennairP105"},
	}
}

OnOneTimeEvent
{
	Conditions = 
	{
		IsNpcFlagTrue{Name = "StartDialogFennairP105"},		
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
		IsGlobalFlagTrue{ Name = "FennairDespawnP105"},	
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
-- Source: C:\project\main\mission\dialoge\P105\n8121_Mordquest_Fennair.txt


	

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
			Negated(IsGlobalFlagFalse{Name = "StartMordquestP105"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "fennair105_005PC", String = "Gr��e Fennair.", AnswerId = 4},
		}}

	OnAnswer{1;
		Conditions = {
			IsGlobalFlagFalse{Name = "StartMordquestP105"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "fennair105_001PC", String = "Gr��e.", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fennair105_002", String = "Gr��e. Geht weiter, hier gibt es nichts zu sehen."},
			Answer{Tag = "fennair105_003PC", String = "Ihr seht recht mitgenommen aus. Stimmt etwas nicht?", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fennair105_004", String = "Es ist alles in Ordnung, geht bitte weiter, B�rger. Lasst uns allein."},
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
			Answer{Tag = "fennair105_007PC", String = "Ich wei� von Aedales Tod. Aileen schickt mich, um herauszufinden, was hier geschah.", AnswerId = 5},
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
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fennair105_010PC", String = "Erz�hlt mir, was sich zugetragen hat.", AnswerId = 9},
			OfferAnswer{Tag = "fennair105_015PC", String = "Erz�hlt mir etwas �ber Baetha.", AnswerId = 14},
			OfferAnswer{Tag = "fennair105_018PC", String = "Erz�hlt mir etwas �ber Lithere.", AnswerId = 17},
			OfferAnswer{Tag = "fennair105_021PC", String = "Erz�hlt mir etwas �ber Euch.", AnswerId = 20},
			OfferAnswer{Tag = "fennair105_027PC", String = "Wen haltet Ihr f�r die Schuldige?", AnswerId = 25},
			OfferAnswer{Tag = "fennair105_029PC", String = "Danke. Vielleicht komme ich sp�ter zur�ck.", AnswerId = 27},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fennair105_011", String = "Mir wurde befohlen, Baetha und die Hohe Priesterin bei einem Ritual zu sch�tzen. Ich glaube, es ging darum, einen entweihten Ort zu reinigen."},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fennair105_012", String = "Wir gingen also auf den Ostberg, Lithere kam mit uns. Aedale scholt Baetha wegen irgendeines Kelches, da h�rte ich Schritte oberhalb des Weges."},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fennair105_013", String = "Ich ging hinauf, um nachzusehen ... fand aber nichts. Als ich zur�ckkehrte, standen Lithere und Baetha an der Klippe und die Hohe Priesterin lag tot im Tal."},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fennair105_014", String = "Lithere entsandte mich in die Stadt, um die Wachen zu holen. Ich h�rte noch, wie sie Baetha beschuldigte, Aedale in den Abgrund gesto�en zu haben."},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fennair105_010PC", String = "Erz�hlt mir, was sich zugetragen hat.", AnswerId = 9},
			OfferAnswer{Tag = "fennair105_015PC", String = "Erz�hlt mir etwas �ber Baetha.", AnswerId = 14},
			OfferAnswer{Tag = "fennair105_018PC", String = "Erz�hlt mir etwas �ber Lithere.", AnswerId = 17},
			OfferAnswer{Tag = "fennair105_021PC", String = "Erz�hlt mir etwas �ber Euch.", AnswerId = 20},
			OfferAnswer{Tag = "fennair105_027PC", String = "Wen haltet Ihr f�r die Schuldige?", AnswerId = 25},
			OfferAnswer{Tag = "fennair105_029PC", String = "Danke. Vielleicht komme ich sp�ter zur�ck.", AnswerId = 27},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fennair105_016", String = "Baetha ist eine Novizin in Aryns Orden. Sie ist ein gutes Wesen, niemandem w�rde sie etwas zu Leide tun."},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fennair105_017", String = "Sie hat Aedale nicht get�tet, das kann einfach nicht sein!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fennair105_010PC", String = "Erz�hlt mir, was sich zugetragen hat.", AnswerId = 9},
			OfferAnswer{Tag = "fennair105_015PC", String = "Erz�hlt mir etwas �ber Baetha.", AnswerId = 14},
			OfferAnswer{Tag = "fennair105_018PC", String = "Erz�hlt mir etwas �ber Lithere.", AnswerId = 17},
			OfferAnswer{Tag = "fennair105_021PC", String = "Erz�hlt mir etwas �ber Euch.", AnswerId = 20},
			OfferAnswer{Tag = "fennair105_027PC", String = "Wen haltet Ihr f�r die Schuldige?", AnswerId = 25},
			OfferAnswer{Tag = "fennair105_029PC", String = "Danke. Vielleicht komme ich sp�ter zur�ck.", AnswerId = 27},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fennair105_019", String = "Lithere ist aus dem gleichen Holz geschnitzt wie Aedale. Oder besser gesagt, aus dem gleichen Eis. Aedale war eine ... schwierige Frau."},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fennair105_020", String = "Sie ist eine gebieterische Frau, aber sie arbeitet hart. Ich glaube, sie w�re gern die Hohe Priesterin."},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fennair105_010PC", String = "Erz�hlt mir, was sich zugetragen hat.", AnswerId = 9},
			OfferAnswer{Tag = "fennair105_015PC", String = "Erz�hlt mir etwas �ber Baetha.", AnswerId = 14},
			OfferAnswer{Tag = "fennair105_018PC", String = "Erz�hlt mir etwas �ber Lithere.", AnswerId = 17},
			OfferAnswer{Tag = "fennair105_021PC", String = "Erz�hlt mir etwas �ber Euch.", AnswerId = 20},
			OfferAnswer{Tag = "fennair105_027PC", String = "Wen haltet Ihr f�r die Schuldige?", AnswerId = 25},
			OfferAnswer{Tag = "fennair105_029PC", String = "Danke. Vielleicht komme ich sp�ter zur�ck.", AnswerId = 27},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fennair105_022", String = "Ich? Ich bin Wachmann."},
			Answer{Tag = "fennair105_023PC", String = "Aber wie kommt Ihr hierher?", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fennair105_024", String = "Ich war Begleiter eines Botschafters der Utraner. Wir kamen hier herauf, als die Frostmarschen noch offen waren."},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fennair105_025", String = "Ich ... war gebannt von den Elfen, ihrem Wissen und ihrer Ergebenheit. Mein Herr erlaubte mir, zu bleiben und schlie�lich willigten auch die Elfen ein. Seitdem diene ich bei den Wachen unter Aileens Befehl."},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fennair105_026", String = "Sie sch�tzen meine Dienste, weil ich schwere R�stungen tragen kann! Und diese gepanzerten F�uste haben schon manches Eisen aus dem Feuer geholt, das ihnen zu hei� war!"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fennair105_010PC", String = "Erz�hlt mir, was sich zugetragen hat.", AnswerId = 9},
			OfferAnswer{Tag = "fennair105_015PC", String = "Erz�hlt mir etwas �ber Baetha.", AnswerId = 14},
			OfferAnswer{Tag = "fennair105_018PC", String = "Erz�hlt mir etwas �ber Lithere.", AnswerId = 17},
			OfferAnswer{Tag = "fennair105_021PC", String = "Erz�hlt mir etwas �ber Euch.", AnswerId = 20},
			OfferAnswer{Tag = "fennair105_027PC", String = "Wen haltet Ihr f�r die Schuldige?", AnswerId = 25},
			OfferAnswer{Tag = "fennair105_029PC", String = "Danke. Vielleicht komme ich sp�ter zur�ck.", AnswerId = 27},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "fennair105_028", String = "lch w�rde Lithere verd�chtigen. Sie wollte schon immer Hohe Priesterin werden! Und Baetha w�rde so etwas nie tun."},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "fennair105_010PC", String = "Erz�hlt mir, was sich zugetragen hat.", AnswerId = 9},
			OfferAnswer{Tag = "fennair105_015PC", String = "Erz�hlt mir etwas �ber Baetha.", AnswerId = 14},
			OfferAnswer{Tag = "fennair105_018PC", String = "Erz�hlt mir etwas �ber Lithere.", AnswerId = 17},
			OfferAnswer{Tag = "fennair105_021PC", String = "Erz�hlt mir etwas �ber Euch.", AnswerId = 20},
			OfferAnswer{Tag = "fennair105_027PC", String = "Wen haltet Ihr f�r die Schuldige?", AnswerId = 25},
			OfferAnswer{Tag = "fennair105_029PC", String = "Danke. Vielleicht komme ich sp�ter zur�ck.", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end