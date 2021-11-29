-->INFO: Einsiedler
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)



OnIdleGoHome
{
X = 180,
Y = 381,
Direction = NorthEast,
Range = 3,
WalkRange = 3,
WaitTime = 5, 
WalkMode = Run, 
GotoMode = GotoContinuous,

	Conditions = 
	{
		IsGlobalFlagTrue { Name = "P111_HermitGoCamp"},
	},
	Actions = 
	{
		 QuestSolve{QuestId = 672},
		 
	},

	HomeActions = 
	{
		SetNpcTimeStamp {Name = "P111Station1Wartezeit"},
		SetNpcFlagTrue { Name = "Station1Angekommen" },
		SetGlobalFlagFalse { Name = "P111_HermitGoCamp"}, 		
	},

}

OnIdleGoHome
{
X = 198,
Y = 431,
Direction = East,
Range = 3,
WalkRange = 3,
WaitTime = 5, 
WalkMode = Run, 
GotoMode = GotoContinuous,

	Conditions = 
	{
		IsNpcTimeElapsed {Name = "P111Station1Wartezeit", Seconds = 4},
		IsNpcFlagTrue { Name = "Station1Angekommen"},
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		SetNpcFlagTrue { Name = "Station2Angekommen" },
		SetNpcTimeStamp {Name = "P111Station2Wartezeit"},
		SetNpcFlagFalse {Name = "Station1Angekommen"}, 	
	},

}

OnIdleGoHome
{
X = 380,
Y = 232,
Direction = South,
Range = 3,
WalkRange = 3,
WaitTime = 0, 
WalkMode = Run, 
GotoMode = GotoContinuous,

	Conditions = 
	{
		IsNpcFlagTrue { Name = "Station2Angekommen"},
		IsNpcTimeElapsed {Name = "P111Station2Wartezeit", Seconds = 4},
		
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		EnableDialog {NpcId = 6663},
		SetNpcFlagFalse {Name = "Station2Angekommen"},
	},

}


--Kiste öffnen
--Einsiedler begibt sich zur Kiste
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "P111_HermitOpenChest"},
			
    },
	Actions =
	{
		Goto { X = 381, Y = 227, NpcId = self , Range = 3, WalkMode = Walk , GotoMode = GotoForced},

	}
}

--An der Kiste angekommen
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "P111_HermitOpenChest"},
		FigureInRange { X = 381, Y = 227, NpcId = self , Range = 2},

    },
	Actions =
	{
		SetNpcTimeStamp{ Name = "WaittimeOpenChest"},
		
	}
}

--Wartet er dort 1 Sekunde, ändert seine Race auf neutral und geht dann wieder zum Spieler zurück 

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "P111_HermitOpenChest"},
		FigureInRange { X = 381, Y = 227, NpcId = self , Range = 2},
		IsNpcTimeElapsed { Name = "WaittimeOpenChest", Seconds = 1, UpdateInterval = 60},
		

    },
	Actions =
	{
		SetNpcFlagTrue { Name = "ReturnOpenChest" },
		ChangeRace { Race = 152, NpcId = self},
		Goto { X = 380, Y = 232, NpcId = self , Range = 2 , WalkMode = Walk , GotoMode = GotoForced},

	}
}

--Dort angekommen übergibt er dem Spieler seine Belohnung
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "P111_HermitOpenChest"},
		FigureInRange { X = 380, Y = 232, NpcId = self , Range = 2},
		IsNpcFlagTrue {Name = "ReturnOpenChest" },


    },
	Actions =
	{
		EnableDialog{NpcId = 6663},
	}
}


--Einsiedler outcries

OnPlatformOneTimeEvent
{
 
	Conditions = 
	{
		FigureHasHealth { Percent = 90 , NpcId = self , UpdateInterval = 60},
			
	} , 
	Actions = 
	{
		Outcry { NpcId = 6663, String = "Da kommen sie! Ich wusste sie würden kommen!" , Tag ="ocEinsiedlerP111_001" , Color = ColorWhite},
	} 
}





--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p111\n6663_Einsiedler.txt


	

	OnBeginDialog{
		Conditions = {
			IsGlobalCounter {Name = "P111_Einsiedler", Value = 0, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalCounter {Name = "P111_Einsiedler", Value = 0, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "P111_IsEinsiedlerKnown"}),
		},
		Actions = {
			Say{Tag = "Einsiedler111_011", String = "Die Schatten! Überall sind die Schatten!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{1;
		Conditions = {
			IsPlayerFlagFalse{Name = "P111_IsEinsiedlerKnown"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "Einsiedler111_001PC", String = "Ein Mensch? Hier?", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "Einsiedler111_002", String = "Ich sehe sie nicht ... sie sehen mich nicht ... ich sehe sie nicht ..."},
			Answer{Tag = "Einsiedler111_003PC", String = "Hört Ihr? Ich rede mit Euch!", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "Einsiedler111_004", String = "Was? Ah! Nein! Lasst mich!"},
			Answer{Tag = "Einsiedler111_005PC", String = "Niemand tut Euch etwas zu Leide, guter Mann, will nur ...", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "Einsiedler111_006", String = "Niemand? Etwas zu Leide? Ha! Ihr könnt sie nicht sehen, aber sie sehen Euch! Oh, und Leid ist ihr Handwerk!"},
			Answer{Tag = "Einsiedler111_007PC", String = "Was sind das für Kreaturen?", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "Einsiedler111_008", String = "Schatten! Das Schwert war ihr Tod und ihre Heimat ... jetzt sind sie frei ... der Engel verliert seine Macht ..."},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "Einsiedler111_009", String = "Ich konnte sie sehen, solange ich noch meinen Ring hatte! Aber sie verfolgten mich! Wohin immer ich ging! Nie war ich sicher!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "Einsiedler111_010", String = "Also habe ich den Ring zerstört! Seither kümmern sie sich nicht mehr um mich!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "P111_IsEinsiedlerKnown"},
			    QuestSolve{QuestId = 672},
			    QuestBegin{QuestId = 673},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
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
			OfferAnswer{Tag = "Einsiedler111_012PC", String = "Warum seid Ihr hier?", AnswerId = 12},
			OfferAnswer{Tag = "Einsiedler111_016PC", String = "Was wisst Ihr über die Schatten und das Schwert?", AnswerId = 16},
			OfferAnswer{Tag = "Einsiedler111_021PC", String = "Kann man sie mit diesem Ring sehen?", AnswerId = 21},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "Einsiedler111_013", String = "Ich war ein Diener des Engels! Ein Sklave, verdammt, dieser Kreatur jeden Wunsch zu erfüllen! Gemeinsam mit ihm wachte ich über das Schattenschwert!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "Einsiedler111_014", String = "Aber als die Schatten begannen, die Barrieren um das Schwert zu durchbrechen, floh ich hierher! Der Feuerengel verstieß mich als Feigling und überließ mich den Schatten als Beute!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "Einsiedler111_015", String = "Aber ich habe den Ring zerschlagen und bin seitdem unwichtig für sie! Nun muss der Engel sich selbst mit ihnen befassen!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "Einsiedler111_017", String = "Nur der dunkle Meister selbst weiß, woher das Schwert kam. Man sagt, es sei nicht von dieser Welt. Und es sei die einzige Waffe, die den Meister verletzen kann. Deshalb versteckt er es hier!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "Einsiedler111_018", String = "Die Schatten sind die einstigen Opfer des Schwertes. Sie fristen ein unheiliges Dasein in seinem schwarzen Kristall."},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "Einsiedler111_019", String = "Viel Unheil muss mit diesem Schwert geschehen sein! Wie viele Heerscharen sind dieser Klinge zum Opfer gefallen?"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "Einsiedler111_020", String = "Wer weiß, ob wir je die Geschichte dieser Waffe erfahren!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "Einsiedler111_022", String = "Ja! Der Schattenring verleiht diese Gabe! Aber er zieht sie auch magisch an. Wer ihn trägt, muss unweigerlich gegen sie kämpfen!"},
			Answer{Tag = "Einsiedler111_023PC", String = "Wenn sie zu sehen sind, kann ich mich wenigstens verteidigen!", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "Einsiedler111_024", String = "Oh, Ihr wollt den Ring, nicht wahr? Aber ich habe ihn entzwei geschlagen! Einen Teil trage ich bei mir ...aber der andere ... lasst mich überlegen ..."},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "Einsiedler111_025", String = "Ja, mein altes Lager! Dort zerbrach ich den Ring, dort muss er liegen. Wenn Ihr mich dorthin begleitet, könnt Ihr ihn haben. Aber passt auf, mich ignorieren sie, Euch nicht!"},
			Answer{Tag = "Einsiedler111_026PC", String = "So sei es. Geht voran, ich passe schon auf!", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "P111_HermitGoCamp"},
			RemoveDialog{NpcId = 6663},
			IncreaseGlobalCounter {Name = "P111_Einsiedler"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{26;
		Conditions = {
			IsGlobalCounter {Name = "P111_Einsiedler", Value = 1, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "Einsiedler111_027", String = "Ah, hier war ich schon lange nicht mehr. Wartet, wo kann nur der Teil des Ringes sein ..."},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(IsGlobalCounter {Name = "P111_Einsiedler", Value = 1, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "Einsiedler111_030", String = "Jetzt habe ich beide Teile des Ringes. Wartet, ich setze ihn zusammen ..."},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "Einsiedler111_028", String = "Da! Dort, in dieser Truhe liegt der andere Teil des Ringes."},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "Einsiedler111_029", String = "Wartet. Ich werde ihn holen!"},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			RemoveDialog{NpcId = 6663},
			SetGlobalFlagTrue{Name = "P111_HermitOpenChest"},
			IncreaseGlobalCounter {Name = "P111_Einsiedler"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "Einsiedler111_031", String = "So, der Schattenring ist wieder eins. Nehmt ihn! Ihr wolltet es ja so!"},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "Einsiedler111_032", String = "Und dies hier! Nehmt das auch, ich brauche die Sachen sowieso nicht mehr! Die Frage ist nur, wie lange Ihr sie noch gebrauchen könnt ..."},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 4175 , Flag = Give},
						TransferItem{GiveItem = 629 , Flag = Give},
						TransferItem{GiveItem = 692 , Flag = Give},
						TransferItem{GiveItem = 736 , Flag = Give},
						TransferItem{GiveItem = 4040 , Flag = Give},
			RemoveDialog{NpcId = 6663},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end