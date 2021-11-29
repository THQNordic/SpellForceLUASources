-->INFO: Erlin
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)



OnOneTimeEvent
{
	
	Conditions = 
	{
		
	},
	Actions =	
	{
		HoldPosition{ NpcId = self},
		SetDialogType{ NpcId = self , Type = SideQuest},

	}
	
}

OnOneTimeEvent
{
	
	Conditions = 
	{
		IsNpcFlagTrue{Name = "QuestionBattle"},
		IsNpcFlagTrue{Name = "QuestionTremor"},
		IsNpcFlagTrue{Name = "QuestionMen"},
	},
	Actions =	
	{
		RemoveDialog{ NpcId = self },

	}
	
}



--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p107\n5670_Erlin.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "Known"},
		},
		Actions = {
			Say{Tag = "erlin107_001", String = "Sie kehren zurück! Alles fängt wieder von vorne an!"},
			Answer{Tag = "erlin107_002PC", String = "Was habt Ihr, Zwerg?", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			IsNpcFlagFalse{Name = "QuestionMen"},
			IsNpcFlagFalse{Name = "QuestionTremor"},
			IsNpcFlagFalse{Name = "QuestionBattle"},
		},
		Actions = {
			Say{Tag = "erlin107_010", String = "Seid gegrüßt, Freund."},
			OfferAnswer{Tag = "erlin107_011PC", String = "Warum habt Ihr Verwundete?", AnswerId = 7},
			OfferAnswer{Tag = "erlin107_016PC", String = "Was war das für ein Erdbeben?", AnswerId = 13},
			OfferAnswer{Tag = "erlin107_021PC", String = "Was für eine Schlacht hat hier stattgefunden?", AnswerId = 18},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			IsNpcFlagFalse{Name = "QuestionMen"},
			IsNpcFlagFalse{Name = "QuestionTremor"},
			Negated(IsNpcFlagFalse{Name = "QuestionBattle"}),
		},
		Actions = {
			Say{Tag = "erlin107_010", String = "Seid gegrüßt, Freund."},
			OfferAnswer{Tag = "erlin107_011PC", String = "Warum habt Ihr Verwundete?", AnswerId = 7},
			OfferAnswer{Tag = "erlin107_016PC", String = "Was war das für ein Erdbeben?", AnswerId = 13},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			IsNpcFlagFalse{Name = "QuestionMen"},
			Negated(IsNpcFlagFalse{Name = "QuestionTremor"}),
			IsNpcFlagFalse{Name = "QuestionBattle"},
		},
		Actions = {
			Say{Tag = "erlin107_010", String = "Seid gegrüßt, Freund."},
			OfferAnswer{Tag = "erlin107_011PC", String = "Warum habt Ihr Verwundete?", AnswerId = 7},
			OfferAnswer{Tag = "erlin107_021PC", String = "Was für eine Schlacht hat hier stattgefunden?", AnswerId = 18},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			IsNpcFlagFalse{Name = "QuestionMen"},
			Negated(IsNpcFlagFalse{Name = "QuestionTremor"}),
			Negated(IsNpcFlagFalse{Name = "QuestionBattle"}),
		},
		Actions = {
			Say{Tag = "erlin107_010", String = "Seid gegrüßt, Freund."},
			OfferAnswer{Tag = "erlin107_011PC", String = "Warum habt Ihr Verwundete?", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(IsNpcFlagFalse{Name = "QuestionMen"}),
			IsNpcFlagFalse{Name = "QuestionTremor"},
			IsNpcFlagFalse{Name = "QuestionBattle"},
		},
		Actions = {
			Say{Tag = "erlin107_010", String = "Seid gegrüßt, Freund."},
			OfferAnswer{Tag = "erlin107_016PC", String = "Was war das für ein Erdbeben?", AnswerId = 13},
			OfferAnswer{Tag = "erlin107_021PC", String = "Was für eine Schlacht hat hier stattgefunden?", AnswerId = 18},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(IsNpcFlagFalse{Name = "QuestionMen"}),
			IsNpcFlagFalse{Name = "QuestionTremor"},
			Negated(IsNpcFlagFalse{Name = "QuestionBattle"}),
		},
		Actions = {
			Say{Tag = "erlin107_010", String = "Seid gegrüßt, Freund."},
			OfferAnswer{Tag = "erlin107_016PC", String = "Was war das für ein Erdbeben?", AnswerId = 13},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(IsNpcFlagFalse{Name = "QuestionMen"}),
			Negated(IsNpcFlagFalse{Name = "QuestionTremor"}),
			IsNpcFlagFalse{Name = "QuestionBattle"},
		},
		Actions = {
			Say{Tag = "erlin107_010", String = "Seid gegrüßt, Freund."},
			OfferAnswer{Tag = "erlin107_021PC", String = "Was für eine Schlacht hat hier stattgefunden?", AnswerId = 18},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(IsNpcFlagFalse{Name = "QuestionMen"}),
			Negated(IsNpcFlagFalse{Name = "QuestionTremor"}),
			Negated(IsNpcFlagFalse{Name = "QuestionBattle"}),
		},
		Actions = {
			Say{Tag = "erlin107_010", String = "Seid gegrüßt, Freund."},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "erlin107_003", String = "Wir sind Wächter über die Gräber im Wintertal. Lange behüteten wir den Schlaf der Gefallenen."},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "erlin107_004", String = "Doch vor einigen Tagen erbebte der Boden! Das Eis brach auf ... und aus den Spalten kehren nun die Geister zurück ans Licht!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "erlin107_005", String = "Das Wintertal ist voller Gespenster! Sie kämpfen noch einmal ihre letzte Schlacht! Haltet Euch fern von diesem Ort!"},
			Answer{Tag = "erlin107_006PC", String = "Mein Weg führt weiter, nach Fastholme.", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "erlin107_007", String = "Dann müsst Ihr das Tal mit seinen Schrecken durchqueren! Nehmt Euch in Acht! Dort unten am Wegesrand kämpfen die einstigen Anführer der Heere miteinander!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "erlin107_008", String = "Wir werden hier ausharren, bis die Verwundeten wieder stark genug sind, um weiter zu reisen. Und hoffen, dass sich bald wieder der Friede über das Land legt."},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionMen"},
			IsNpcFlagFalse{Name = "QuestionTremor"},
			IsNpcFlagFalse{Name = "QuestionBattle"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			SetDialogType{Type = SideQuest},
			Say{Tag = "erlin107_009", String = "Viel Glück, Freund!"},
			OfferAnswer{Tag = "erlin107_011PC", String = "Warum habt Ihr Verwundete?", AnswerId = 7},
			OfferAnswer{Tag = "erlin107_016PC", String = "Was war das für ein Erdbeben?", AnswerId = 13},
			OfferAnswer{Tag = "erlin107_021PC", String = "Was für eine Schlacht hat hier stattgefunden?", AnswerId = 18},
		}}

	OnAnswer{6;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionMen"},
			IsNpcFlagFalse{Name = "QuestionTremor"},
			Negated(IsNpcFlagFalse{Name = "QuestionBattle"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			SetDialogType{Type = SideQuest},
			Say{Tag = "erlin107_009", String = "Viel Glück, Freund!"},
			OfferAnswer{Tag = "erlin107_011PC", String = "Warum habt Ihr Verwundete?", AnswerId = 7},
			OfferAnswer{Tag = "erlin107_016PC", String = "Was war das für ein Erdbeben?", AnswerId = 13},
		}}

	OnAnswer{6;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionMen"},
			Negated(IsNpcFlagFalse{Name = "QuestionTremor"}),
			IsNpcFlagFalse{Name = "QuestionBattle"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			SetDialogType{Type = SideQuest},
			Say{Tag = "erlin107_009", String = "Viel Glück, Freund!"},
			OfferAnswer{Tag = "erlin107_011PC", String = "Warum habt Ihr Verwundete?", AnswerId = 7},
			OfferAnswer{Tag = "erlin107_021PC", String = "Was für eine Schlacht hat hier stattgefunden?", AnswerId = 18},
		}}

	OnAnswer{6;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionMen"},
			Negated(IsNpcFlagFalse{Name = "QuestionTremor"}),
			Negated(IsNpcFlagFalse{Name = "QuestionBattle"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			SetDialogType{Type = SideQuest},
			Say{Tag = "erlin107_009", String = "Viel Glück, Freund!"},
			OfferAnswer{Tag = "erlin107_011PC", String = "Warum habt Ihr Verwundete?", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionMen"}),
			IsNpcFlagFalse{Name = "QuestionTremor"},
			IsNpcFlagFalse{Name = "QuestionBattle"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			SetDialogType{Type = SideQuest},
			Say{Tag = "erlin107_009", String = "Viel Glück, Freund!"},
			OfferAnswer{Tag = "erlin107_016PC", String = "Was war das für ein Erdbeben?", AnswerId = 13},
			OfferAnswer{Tag = "erlin107_021PC", String = "Was für eine Schlacht hat hier stattgefunden?", AnswerId = 18},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionMen"}),
			IsNpcFlagFalse{Name = "QuestionTremor"},
			Negated(IsNpcFlagFalse{Name = "QuestionBattle"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			SetDialogType{Type = SideQuest},
			Say{Tag = "erlin107_009", String = "Viel Glück, Freund!"},
			OfferAnswer{Tag = "erlin107_016PC", String = "Was war das für ein Erdbeben?", AnswerId = 13},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionMen"}),
			Negated(IsNpcFlagFalse{Name = "QuestionTremor"}),
			IsNpcFlagFalse{Name = "QuestionBattle"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			SetDialogType{Type = SideQuest},
			Say{Tag = "erlin107_009", String = "Viel Glück, Freund!"},
			OfferAnswer{Tag = "erlin107_021PC", String = "Was für eine Schlacht hat hier stattgefunden?", AnswerId = 18},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionMen"}),
			Negated(IsNpcFlagFalse{Name = "QuestionTremor"}),
			Negated(IsNpcFlagFalse{Name = "QuestionBattle"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			SetDialogType{Type = SideQuest},
			Say{Tag = "erlin107_009", String = "Viel Glück, Freund!"},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "erlin107_012", String = "Seit den Tagen dieser unseligen Schlacht wachen wir gemeinsam mit den Elfen aus Tirganach über den Schlaf unserer Toten."},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "erlin107_013", String = "Diese Stätte war ein Mahnmal gegen den Streit unter den Völkern des Lichts! Bis dieses Beben es in einen Ort des Grauens verwandelte!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "erlin107_014", String = "Die Elfen waren genauso überrascht wie wir, als die Geister plötzlich von allen Seiten über uns herfielen. Viele starben."},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "erlin107_015", String = "Nun haben wir nicht mehr genug Heilmittel und unsere Leute sind zu schwach, um weiter zu ziehen."},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "QuestionMen"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionMen"},
			IsNpcFlagFalse{Name = "QuestionTremor"},
			IsNpcFlagFalse{Name = "QuestionBattle"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "erlin107_011PC", String = "Warum habt Ihr Verwundete?", AnswerId = 7},
			OfferAnswer{Tag = "erlin107_016PC", String = "Was war das für ein Erdbeben?", AnswerId = 13},
			OfferAnswer{Tag = "erlin107_021PC", String = "Was für eine Schlacht hat hier stattgefunden?", AnswerId = 18},
		}}

	OnAnswer{12;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionMen"},
			IsNpcFlagFalse{Name = "QuestionTremor"},
			Negated(IsNpcFlagFalse{Name = "QuestionBattle"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "erlin107_011PC", String = "Warum habt Ihr Verwundete?", AnswerId = 7},
			OfferAnswer{Tag = "erlin107_016PC", String = "Was war das für ein Erdbeben?", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionMen"},
			Negated(IsNpcFlagFalse{Name = "QuestionTremor"}),
			IsNpcFlagFalse{Name = "QuestionBattle"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "erlin107_011PC", String = "Warum habt Ihr Verwundete?", AnswerId = 7},
			OfferAnswer{Tag = "erlin107_021PC", String = "Was für eine Schlacht hat hier stattgefunden?", AnswerId = 18},
		}}

	OnAnswer{12;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionMen"},
			Negated(IsNpcFlagFalse{Name = "QuestionTremor"}),
			Negated(IsNpcFlagFalse{Name = "QuestionBattle"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "erlin107_011PC", String = "Warum habt Ihr Verwundete?", AnswerId = 7},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionMen"}),
			IsNpcFlagFalse{Name = "QuestionTremor"},
			IsNpcFlagFalse{Name = "QuestionBattle"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "erlin107_016PC", String = "Was war das für ein Erdbeben?", AnswerId = 13},
			OfferAnswer{Tag = "erlin107_021PC", String = "Was für eine Schlacht hat hier stattgefunden?", AnswerId = 18},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionMen"}),
			IsNpcFlagFalse{Name = "QuestionTremor"},
			Negated(IsNpcFlagFalse{Name = "QuestionBattle"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "erlin107_016PC", String = "Was war das für ein Erdbeben?", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionMen"}),
			Negated(IsNpcFlagFalse{Name = "QuestionTremor"}),
			IsNpcFlagFalse{Name = "QuestionBattle"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "erlin107_021PC", String = "Was für eine Schlacht hat hier stattgefunden?", AnswerId = 18},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionMen"}),
			Negated(IsNpcFlagFalse{Name = "QuestionTremor"}),
			Negated(IsNpcFlagFalse{Name = "QuestionBattle"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "erlin107_017", String = "Es war, als ob die Berge selbst auseinander brechen würden! Dann erklang ein Schrei über dem Land und er ging jedem durch Mark und Bein!"},
			Answer{Tag = "erlin107_018PC", String = "Aryn ist erwacht.", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "erlin107_019", String = "Niethalf schütze uns! Dann war es der Ruf des Drachen, den wir hörten?"},
			Answer{Tag = "erlin107_020PC", String = "Und seine Wut ist es, die das ganze Land in Aufruhr bringt.", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "QuestionTremor"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionMen"},
			IsNpcFlagFalse{Name = "QuestionTremor"},
			IsNpcFlagFalse{Name = "QuestionBattle"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "erlin107_011PC", String = "Warum habt Ihr Verwundete?", AnswerId = 7},
			OfferAnswer{Tag = "erlin107_016PC", String = "Was war das für ein Erdbeben?", AnswerId = 13},
			OfferAnswer{Tag = "erlin107_021PC", String = "Was für eine Schlacht hat hier stattgefunden?", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionMen"},
			IsNpcFlagFalse{Name = "QuestionTremor"},
			Negated(IsNpcFlagFalse{Name = "QuestionBattle"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "erlin107_011PC", String = "Warum habt Ihr Verwundete?", AnswerId = 7},
			OfferAnswer{Tag = "erlin107_016PC", String = "Was war das für ein Erdbeben?", AnswerId = 13},
		}}

	OnAnswer{17;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionMen"},
			Negated(IsNpcFlagFalse{Name = "QuestionTremor"}),
			IsNpcFlagFalse{Name = "QuestionBattle"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "erlin107_011PC", String = "Warum habt Ihr Verwundete?", AnswerId = 7},
			OfferAnswer{Tag = "erlin107_021PC", String = "Was für eine Schlacht hat hier stattgefunden?", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionMen"},
			Negated(IsNpcFlagFalse{Name = "QuestionTremor"}),
			Negated(IsNpcFlagFalse{Name = "QuestionBattle"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "erlin107_011PC", String = "Warum habt Ihr Verwundete?", AnswerId = 7},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionMen"}),
			IsNpcFlagFalse{Name = "QuestionTremor"},
			IsNpcFlagFalse{Name = "QuestionBattle"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "erlin107_016PC", String = "Was war das für ein Erdbeben?", AnswerId = 13},
			OfferAnswer{Tag = "erlin107_021PC", String = "Was für eine Schlacht hat hier stattgefunden?", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionMen"}),
			IsNpcFlagFalse{Name = "QuestionTremor"},
			Negated(IsNpcFlagFalse{Name = "QuestionBattle"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "erlin107_016PC", String = "Was war das für ein Erdbeben?", AnswerId = 13},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionMen"}),
			Negated(IsNpcFlagFalse{Name = "QuestionTremor"}),
			IsNpcFlagFalse{Name = "QuestionBattle"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "erlin107_021PC", String = "Was für eine Schlacht hat hier stattgefunden?", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionMen"}),
			Negated(IsNpcFlagFalse{Name = "QuestionTremor"}),
			Negated(IsNpcFlagFalse{Name = "QuestionBattle"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "erlin107_022", String = "Es war die letzte Schlacht der Elfen gegen uns Zwerge. Ein sinnloser Streit um Land und alte Schulden."},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "erlin107_023", String = "Hier im Wintertal trafen die Heere aufeinander, Äxte und Pfeile taten ihr Werk. Und der Tod hielt reichlich Ernte."},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "erlin107_024", String = "Tagelang kämpften sie, Licht gegen Licht, bis die Ziele der Schlacht längst vergessen waren und nur noch der blanke Hass sie gegeneinander trieb."},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "erlin107_025", String = "Als Garvyn und Rogras, die Heerführer, fielen, endete schließlich dieser unselige Krieg. Seit jeher mahnt uns dieser Ort, dass auch die Kinder des Lichts nicht gefeit sind gegen die Dunkelheit ihrer Seelen."},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "erlin107_026", String = "Seit dem schicken Elfen und Zwerge Krieger und Priester an diesen Ort, um gemeinsam zu beten und über die Ruhe der Toten zu wachen."},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "QuestionBattle"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionMen"},
			IsNpcFlagFalse{Name = "QuestionTremor"},
			IsNpcFlagFalse{Name = "QuestionBattle"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "erlin107_011PC", String = "Warum habt Ihr Verwundete?", AnswerId = 7},
			OfferAnswer{Tag = "erlin107_016PC", String = "Was war das für ein Erdbeben?", AnswerId = 13},
			OfferAnswer{Tag = "erlin107_021PC", String = "Was für eine Schlacht hat hier stattgefunden?", AnswerId = 18},
		}}

	OnAnswer{24;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionMen"},
			IsNpcFlagFalse{Name = "QuestionTremor"},
			Negated(IsNpcFlagFalse{Name = "QuestionBattle"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "erlin107_011PC", String = "Warum habt Ihr Verwundete?", AnswerId = 7},
			OfferAnswer{Tag = "erlin107_016PC", String = "Was war das für ein Erdbeben?", AnswerId = 13},
		}}

	OnAnswer{24;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionMen"},
			Negated(IsNpcFlagFalse{Name = "QuestionTremor"}),
			IsNpcFlagFalse{Name = "QuestionBattle"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "erlin107_011PC", String = "Warum habt Ihr Verwundete?", AnswerId = 7},
			OfferAnswer{Tag = "erlin107_021PC", String = "Was für eine Schlacht hat hier stattgefunden?", AnswerId = 18},
		}}

	OnAnswer{24;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionMen"},
			Negated(IsNpcFlagFalse{Name = "QuestionTremor"}),
			Negated(IsNpcFlagFalse{Name = "QuestionBattle"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "erlin107_011PC", String = "Warum habt Ihr Verwundete?", AnswerId = 7},
		}}

	OnAnswer{24;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionMen"}),
			IsNpcFlagFalse{Name = "QuestionTremor"},
			IsNpcFlagFalse{Name = "QuestionBattle"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "erlin107_016PC", String = "Was war das für ein Erdbeben?", AnswerId = 13},
			OfferAnswer{Tag = "erlin107_021PC", String = "Was für eine Schlacht hat hier stattgefunden?", AnswerId = 18},
		}}

	OnAnswer{24;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionMen"}),
			IsNpcFlagFalse{Name = "QuestionTremor"},
			Negated(IsNpcFlagFalse{Name = "QuestionBattle"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "erlin107_016PC", String = "Was war das für ein Erdbeben?", AnswerId = 13},
		}}

	OnAnswer{24;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionMen"}),
			Negated(IsNpcFlagFalse{Name = "QuestionTremor"}),
			IsNpcFlagFalse{Name = "QuestionBattle"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "erlin107_021PC", String = "Was für eine Schlacht hat hier stattgefunden?", AnswerId = 18},
		}}

	OnAnswer{24;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionMen"}),
			Negated(IsNpcFlagFalse{Name = "QuestionTremor"}),
			Negated(IsNpcFlagFalse{Name = "QuestionBattle"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end