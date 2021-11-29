-->INFO: Uru2
-->INFO: Uru

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
OneTimeInitAction (ChangeRace {Race = 152, NpcId = self})

	
--Uru begibt sichauf Position vor Cutszene Kathai Befreit.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209UruWachen"},
	},
	Actions = 
	{ 
		Goto {X = 378, Y = 251, NpcId = self, Range = 0, WalkMode = Walk, GotoMode = GotoNormal},
	}
}

--Uru schaut in Richtung Westen.
OnOneTimeEvent
{
	Conditions = 
	{ 
		FigureInRange {X = 378, Y = 251, NpcId = self, Range = 0},
		FigureJob {Job = JobIdle , NpcId = self},
		IsGlobalFlagTrue {Name = "g_sP209UruWachen"},
	},
	Actions = 
	{ 
		LookAtDirection {Direction = West, NpcId = self},
	}
}



--Uru begibt sich zur Arena
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209KathaiMove"},
	},
	Actions = 
	{ 
		Goto {X = 322, Y = 184, NpcId = self, Range = 3, WalkMode = Walk, GotoMode = GotoContinuous},
	}
}

--Wenn Uru an der Arena angekommen ist wird ihr Dialog freigeschaltet.
OnOneTimeEvent
{
	Conditions = 
	{ 
		FigureInRange {X = 322, Y = 184, NpcId = self , Range = 3},
		IsGlobalCounter {Name = "g_cnP209ArtefaktAnzahl", Value = 1, Operator = IsGreaterOrEqual},
		IsGlobalFlagTrue {Name = "g_sP209KathaiMove"},
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "PleaseEnableMainQuestDialog_8588"},
	}
}

--Uru begibt sich zum Westtor
Umspawn
{
	UnitId = self,
	X = 290,
	Y = 263,
	NoSpawnEffect = TRUE, 
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_sP209UmspawnCutszeneBote1"},			
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8588" },
	},
}


--Wenn Uru am Westtor angekommen ist wird ihr Dialog freigeschaltet.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209ArenaStart"},
		IsGlobalFlagTrue {Name = "g_sP209XalabarGeschlagen"},
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "PleaseEnableMainQuestDialog_8588"},
	}
}

--Die Uru bekommt ein Fragezeichen sobald die DryadenCutszene abgelaufen ist.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209CutszeneDryadeEnded"},
		
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "PleaseEnableSideQuestDialog_8588"},
	}
}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P209\n8588_Uru2.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsGlobalFlagFalse {Name = "g_sP209StadtKathaiBefreit"},
		},
		Actions = {
			Say{Tag = "uru209_001", String = "Die Winde haben mir von Euch berichtet, Sturmbote. Ihr seid hier, um dem maskierten Tod Einhalt zu gebieten!"},
			Answer{Tag = "uru209_002PC", String = "Zu erst einmal bin ich hier, um Eure Stadt zu befreien. Ich muss Eure Grenztore öffnen, sonst kann mein Heer Euch nicht helfen!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagFalse {Name = "g_sP209StadtKathaiBefreit"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_003", String = "Der Weg zu den Toren ist von den Untoten beretis besetzt!"},
			Answer{Tag = "uru209_004PC", String = "Dann werde ich mich dorthin durchkämpfen müssen! Brauche ich einen Schlüssel für die Tore?", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_005", String = "Nein, von dieser Seite der Berge aus sind sie einfach zu öffnen. Ihr braucht nur viel, viel Glück und Mut."},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_006", String = "Nehmt einige unserer Jäger mit! Jenquai ist ihr Anführer, sie werden sie Euch vertrauen!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209KathaiUnterstuetzungErhalten"},
			Say{Tag = "", String = ""},
			Answer{Tag = "uru209_007PC", String = "Danke, Uru! Wenn das hier vorbei ist, haben wir viel zu bereden.", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_008", String = "Wohl wahr. Ich bete zu den Winden für Euch."},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruGeredet1"},
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
			IsGlobalFlagFalse {Name = "g_sP209UruArtefaktDialogStart"},
		},
		Actions = {
			Say{Tag = "uru209_009", String = "Wie steht der Kampf, Sturmbote?"},
			Answer{Tag = "uru209_010PC", String = "Die graue Horde ist zerschlagen Sie sind besiegt!", AnswerId = 9},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsGlobalFlagFalse {Name = "g_sP209UruArtefaktDialogStart"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209CutszeneKathaiBefreitStart"},
			EndDialog(),
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsGlobalFlagFalse {Name = "g_sP209XalabarGeschlagen"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{11;
		Conditions = {
			IsGlobalFlagFalse {Name = "g_sP209XalabarGeschlagen"},
			IsGlobalCounter {Name = "g_cnP209ArtefaktAnzahl", Value = 1, Operator = IsEqual},
			IsGlobalCounter {Name = "g_cnP209ArtefaktAnzahl", Value = 2, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "uru209_011", String = "Habt Ihr ein Gon?"},
			OfferAnswer{Tag = "uru209_012PC", String = "Ja, ich habe ein Gon gefunden.", AnswerId = 12},
			OfferAnswer{Tag = "uru209_024PC", String = "Ich habe die beiden letzen Gons gefunden!", AnswerId = 24},
		}}

	OnAnswer{11;
		Conditions = {
			IsGlobalFlagFalse {Name = "g_sP209XalabarGeschlagen"},
			IsGlobalCounter {Name = "g_cnP209ArtefaktAnzahl", Value = 1, Operator = IsEqual},
			Negated(IsGlobalCounter {Name = "g_cnP209ArtefaktAnzahl", Value = 2, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "uru209_011", String = "Habt Ihr ein Gon?"},
			OfferAnswer{Tag = "uru209_012PC", String = "Ja, ich habe ein Gon gefunden.", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			IsGlobalFlagFalse {Name = "g_sP209XalabarGeschlagen"},
			Negated(IsGlobalCounter {Name = "g_cnP209ArtefaktAnzahl", Value = 1, Operator = IsEqual}),
			IsGlobalCounter {Name = "g_cnP209ArtefaktAnzahl", Value = 2, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "uru209_011", String = "Habt Ihr ein Gon?"},
			OfferAnswer{Tag = "uru209_024PC", String = "Ich habe die beiden letzen Gons gefunden!", AnswerId = 24},
		}}

	OnAnswer{11;
		Conditions = {
			IsGlobalFlagFalse {Name = "g_sP209XalabarGeschlagen"},
			Negated(IsGlobalCounter {Name = "g_cnP209ArtefaktAnzahl", Value = 1, Operator = IsEqual}),
			Negated(IsGlobalCounter {Name = "g_cnP209ArtefaktAnzahl", Value = 2, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "uru209_011", String = "Habt Ihr ein Gon?"},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_013", String = "Dann könnt Ihr Xalabar gegenübertreten, auch er hat einen der heiligen Gegenstände!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_014", String = "Allerdings hat sich ihm einer unserer Heiler angeschlossen, der auch bereits ein Gon trägt!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_015", String = "Ihr habt also zwei Gegnern vor Euch!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_016", String = "Ihr könnt den Kampf jetzt beginnen oder zuerst noch ein weiters Gon suchen um auch für Euch noch einen zweiten Streiter für den Kampf zu wählen."},
			OfferAnswer{Tag = "uru209_017PC", String = "ich werde alleine mit Xalabar und seinem Helfer fertig!", AnswerId = 16},
			OfferAnswer{Tag = "uru209_022PC", String = "Ich werde lieber noch nach dem letzen Gon suchen, Uru.", AnswerId = 21},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_018", String = "Nun gut wie ihr es wünscht, aber denkt daran ihr müsst alleine kämpfen!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_019", String = "Sollte sich einer Eurer Begleiter oder jemand Eurer Truppen ohne ein Gon auf den Kampfplatz begeben, wird der Kampf sofort unterbrochen!"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_020", String = "Haltet also Eure Truppen davon fern! Nur wer ein Gon trägt, darf an der Prüfung der Wahrheit teilnehmen!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209ArenaStart"},
			Say{Tag = "uru209_021", String = "Geht zum Kampfplatz, sobald Ihr bereit seid."},
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
			Say{Tag = "uru209_023", String = "Gut! Mögen die Winde Euch zu ihm leiten!"},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209LetztesArtefaktSuchen"},
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
			Say{Tag = "uru209_025", String = "Dann müsst Ihr einen Kampfgefährten für die Prüfung wählen, der das Gon erhalten soll! Jenquai und Euer Gefährte Urias haben sich bereit erklärt, an Eurer Seite zu kämpfen."},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
			IsGlobalFlagFalse {Name = "g_sP209ArenaStart"},
			IsGlobalFlagFalse {Name = "g_sP209ArenaStart"},
		},
		Actions = {
			Say{Tag = "uru209_026", String = "Sprecht mit Ihnen und wählt wer von beiden Eurer Mitstreiter sein soll! Dann kann die Prüfung beginnen!"},
			OfferAnswer{Tag = "uru209_027PC", String = "Ich wähle meinen alten Freund, den Paladin Urias!", AnswerId = 26},
			OfferAnswer{Tag = "uru209_029PC", String = "Ich wähle meinen neuen Freund, den Kampfmagier Jenquai!", AnswerId = 30},
		}}

	OnAnswer{25;
		Conditions = {
			IsGlobalFlagFalse {Name = "g_sP209ArenaStart"},
			Negated(IsGlobalFlagFalse {Name = "g_sP209ArenaStart"}),
		},
		Actions = {
			Say{Tag = "uru209_026", String = "Sprecht mit Ihnen und wählt wer von beiden Eurer Mitstreiter sein soll! Dann kann die Prüfung beginnen!"},
			OfferAnswer{Tag = "uru209_027PC", String = "Ich wähle meinen alten Freund, den Paladin Urias!", AnswerId = 26},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(IsGlobalFlagFalse {Name = "g_sP209ArenaStart"}),
			IsGlobalFlagFalse {Name = "g_sP209ArenaStart"},
		},
		Actions = {
			Say{Tag = "uru209_026", String = "Sprecht mit Ihnen und wählt wer von beiden Eurer Mitstreiter sein soll! Dann kann die Prüfung beginnen!"},
			OfferAnswer{Tag = "uru209_029PC", String = "Ich wähle meinen neuen Freund, den Kampfmagier Jenquai!", AnswerId = 30},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(IsGlobalFlagFalse {Name = "g_sP209ArenaStart"}),
			Negated(IsGlobalFlagFalse {Name = "g_sP209ArenaStart"}),
		},
		Actions = {
			Say{Tag = "uru209_026", String = "Sprecht mit Ihnen und wählt wer von beiden Eurer Mitstreiter sein soll! Dann kann die Prüfung beginnen!"},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_028", String = "So soll es geschehen! Geht nun in die Arena und kämpft mit Xalabar!"},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UriasFollow"},
			SetPlatformFlagTrue {Name = "g_sP209UriasFollow"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209ArenaStart"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_028", String = "So soll es geschehen! Geht nun in die Arena und kämpft mit Xalabar!"},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209JenquaiFollow"},
			SetPlatformFlagTrue {Name = "g_sP209JenquaiFollow"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209ArenaStart"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{34;
		Conditions = {
			IsGlobalFlagFalse {Name = "g_sP209CutszeneBoteEnded"},
		},
		Actions = {
			Say{Tag = "uru209_030", String = "Ihr habt die Prüfung der Wahrheit bestanden! Eure Worte haben von nun an Gewicht unter den Kathai! Xalabar muss schweigen!"},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{34;
		Conditions = {
			Negated(IsGlobalFlagFalse {Name = "g_sP209CutszeneBoteEnded"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 38},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_031", String = "Seid nun endlich wilkommen als Gast der Kathai! Unser Wasser und Salz sind das Eure und Euch soll kein Leid widerfahren unter unserem Dach!"},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_032", String = "Kommt, wir haben viel zu bereden ... dunkle Wolken ziehen mit dem Wind der Zeit ..."},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209CutszeneBote"},
			EndDialog(),
		}}

	OnAnswer{38;
		Conditions = {
			IsGlobalFlagFalse {Name = "g_sP209CutszeneKaiserEnded"},
		},
		Actions = {
			Say{Tag = "uru209_033", String = "Was ist geschehen?"},
			Answer{Tag = "uru209_034PC", String = "Eine Falle! Urias ist tot! Das Heer des Kaisers macht sich bereit zum Angriff!", AnswerId = 39},
		}}

	OnAnswer{38;
		Conditions = {
			Negated(IsGlobalFlagFalse {Name = "g_sP209CutszeneKaiserEnded"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 48},
		}}

	OnAnswer{39;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_035", String = "Das ist das Ende!"},
			Answer{Tag = "uru209_036PC", String = "Es sind zu wenig Krieger zur Verteidigung übrig! Und mein Monument ist verloren! Ich kann kein Heer zu Eurem Schuzt beschwören!", AnswerId = 40},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_037", String = "Ein Monument ... ein Runenmonument ... es gibt vielleicht noch einen Weg ..."},
			Answer{Tag = "uru209_038PC", String = "Sprecht, schnell!", AnswerId = 41},
		}}

	OnAnswer{41;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_039", String = "Nördlich der Stadt gibt es einen heiligen Ort, einen Ort der Erdgötter, der für uns Kinder des Winds verboten ist. Dort steht etwas, dass vielleicht ein Runenmonument sein könnte!"},
			Answer{Tag = "uru209_040PC", String = "Warum sagt Ihr das nicht gleich?", AnswerId = 42},
		}}

	OnAnswer{42;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_041", String = "Diese heilige Stätte ist seit Generationen für uns verboten! Aber Ihr seid kein Kind des Windes, also nehmt diesen Schlüssel! Er wird von Uru zu Uru vererbt solange es mein Volk gibt. Er öffnet jenen verbotenen Ort!"},
			Answer{Tag = "uru209_042PC", String = "Dieser Schlüssel ... das ist Zwergenarbeit!", AnswerId = 43},
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209ZwergenSchluessel"},
			Say{Tag = "", String = ""},
			Answer{Tag = "uru209_043PC", String = "Es muss eine alte Zwergenmine sein! Wie komme ich dort hin?", AnswerId = 44},
		}}

	OnAnswer{44;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_044", String = "Die verbotene Stätte liegt im Norden der Stadt zwischen den Felsen. Ihr könnt sie nicht verfehlen."},
			Answer{Tag = "", String = "", AnswerId = 45},
		}}

	OnAnswer{45;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_045", String = "Ich hoffe es ist das, wonach Ihr sucht, Runenkrieger."},
			Answer{Tag = "uru209_046PC", String = "Das hoffe ich auch! Dann werde ich diesem Kaiser Urias Tod dreimal heimzahlen! Beim Seelenfluss, das werde ich!", AnswerId = 46},
		}}

	OnAnswer{46;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 47},
		}}

	OnAnswer{47;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{47;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{48;
		Conditions = {
			IsGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
		},
		Actions = {
			Say{Tag = "uru209_047", String = "Sturmbote?"},
			Answer{Tag = "", String = "", AnswerId = 49},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"}),
		},
		Actions = {
			Say{Tag = "uru209_048", String = "Die Schlacht um Kathai ist geschlagen, Runenkrieger. Ich sehe keine Sturmwolken mehr am Horizont."},
			Answer{Tag = "", String = "", AnswerId = 52},
		}}

	OnAnswer{49;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 50},
		}}

	OnAnswer{50;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 51},
		}}

	OnAnswer{51;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{52;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP209UruTalkedAfterBattle"},
			Say{Tag = "uru209_049", String = "Es ist für Euch nun Zeit weiter nach Süden zu gehen, Ihr müsst das Dunkelwehrgebirge überqueren!"},
		}}

	OnAnswer{53;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_051", String = "Das Land der dunklen Götter. Jenseits der Berge liegt der schwarze Dschungel, der Ort an dem Zarach die dunklen Völker einst geschaffen hat."},
			Answer{Tag = "", String = "", AnswerId = 54},
		}}

	OnAnswer{54;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_052", String = "Er ist unsagbar verderbt und böse, selbst die Wächtergötter meiden diesen Ort ... denn sie haben dort keine Macht! Es ist ein verlorenes Land."},
			Answer{Tag = "uru209_053PC", String = "Ist dort der Unterschlupf von Hokan Ashir, dem Maskierten?", AnswerId = 55},
		}}

	OnAnswer{55;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_054", String = "Dort liegt der Knochentempel. Es ist das alte Heim Zarachs, ein Ort, an den selbst die Götter nicht schauen können. Dort werdet Ihr Hokan Ashir und den Zirkel finden."},
			Answer{Tag = "", String = "", AnswerId = 56},
		}}

	OnAnswer{56;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_055", String = "Dort hält er auch den Gott gefangen, mit dessen Blut er den Essentrank braut."},
			Answer{Tag = "uru209_056PC", String = "Er hat wirklich einen Gott in seiner Gewalt?", AnswerId = 57},
		}}

	OnAnswer{57;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_057", String = "Ja. Einen der Wächter. Dort, im Tempel Zarachs, hat dieser Gott keine Macht! Dort ist er so verletzbar und schwach wie ein Sterblicher. Und Hokan wird sein Blut solange rauben, bis all seine Pläne erfüllt sind!"},
			Answer{Tag = "uru209_058PC", String = "Hat er nicht den Zirkel erweckt? Was will er noch?", AnswerId = 58},
		}}

	OnAnswer{58;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_059", String = "Hokan strebt nach mehr! Die Maske des Belial, die ihm sein Leben wiedergegeben hat, ist auch zu einem Teil von ihm geworden!"},
			Answer{Tag = "", String = "", AnswerId = 59},
		}}

	OnAnswer{59;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_060", String = "Durch die Weiten der Sternennacht ruft sie nach Ihrem Herrn und Schöpfer, Belial, Meister der Totenbeschwörung, ein Halbgott im Dienste Zarachs. Hokan will sich durch die Maske mit Belials Geist vereinigen!"},
			Answer{Tag = "uru209_061PC", String = "Wenn Hokan wirklich mit Belial verschmilzt, dann ... dann wird er als Halbgott an der Spitze der versklavten Zirkelmagier gegen die Welt ziehen!", AnswerId = 60},
		}}

	OnAnswer{60;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_062", String = "Ja, nichts wird ihn dann nochaufhalten, noch nicht einmal die Götter. Ihr seid der einzige, der es jetzt noch verhindern kann! Es ist Eure Bestimmung, Sturmbote!"},
			Answer{Tag = "uru209_063PC", String = "Dann sollte ich mihc wohl auf den Weg machen.", AnswerId = 61},
		}}

	OnAnswer{61;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_064", String = "Ihr könnt die Dunkelwehrberge am besten überwinden, in dem Ihr durch eine der alten Wachfestungen zieht. Aber die Untoten haben sie alle in ihrem Griff!"},
			Answer{Tag = "", String = "", AnswerId = 62},
		}}

	OnAnswer{62;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_065", String = "Die Tore der Feste, die hier an Katahi grenzt, sind verschlossen! Aber es gibt einen Weg wie Ihr trotz allem hinein kommt!"},
			Answer{Tag = "", String = "", AnswerId = 63},
		}}

	OnAnswer{63;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_066", String = "Ihr müsst die Uhrwerkhallen durchqueren! Das ist ein altes Zerbitenbauwerk,  östlich der Feste. Von dort kommt Ihr weiter ins Innere der Wachfeste."},
			Answer{Tag = "", String = "", AnswerId = 64},
		}}

	OnAnswer{64;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_067", String = "Ich gebe Euch den Schlüssel für das magische Tor der Zerbiten. Druchquert die Uhrwerkhallen, doch nehmt Euch vor den zahllosen Fallen dort in acht!"},
			Answer{Tag = "", String = "", AnswerId = 65},
		}}

	OnAnswer{65;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_068", String = "Wenn Ihr die Wachtfeste erreicht habt, öffnet unseren Kriegern das Tor! Wir werden Euch beistehen!"},
			Answer{Tag = "", String = "", AnswerId = 66},
		}}

	OnAnswer{66;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name="g_sP209KeyClockwork"},
			SetGlobalFlagTrue {Name = "g_sP209ClockworkTold"},
						SetGlobalFlagTrue{Name = "g_StoryQuestEnterClockwork"},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[53]Abgeschaltet"},
			EndDialog(),
		}}

	OnAnswer{67;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_070", String = "Es ist die alte Wacht des Kaiserreiches. Früher wachten von dort die besten Soldaten des Reiches über uns!"},
			Answer{Tag = "", String = "", AnswerId = 68},
		}}

	OnAnswer{68;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_071", String = "Als damal alte Imperium der Menschen die dunklen Völker von Xu vertrieb, erkannte der Gottkasier, das er zwar die Dunklen, aber niemals den schwarzen Dschungel bezwingen konnte."},
			Answer{Tag = "", String = "", AnswerId = 69},
		}}

	OnAnswer{69;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_072", String = "Er ließ die Wacht bauen, eine Kette aus Festungen entlang der Dunkelwehrberge. Und er ließ die Elite seiner Soldaten dort Wacht halten um jedes Unheil, dass der schwarze Dschungel ausspein würde, sofort im Keim zu ersticken."},
			Answer{Tag = "", String = "", AnswerId = 70},
		}}

	OnAnswer{70;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_073", String = "Zuerst begehrten wir Kathai dagegen auf! Aber als der alte Kaiser schwor, uns und alle Völker dieses Landes auf ewig vor den Kreaturen des Dschungels zu schützen, da willigten wir ein."},
			Answer{Tag = "", String = "", AnswerId = 71},
		}}

	OnAnswer{71;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_074", String = "Dieser Schwur hat das Reich viele Generationen lang geschützt. Und selbst wenn Zwist und Krieg herrschte, die Hörner der Wacht riefen uns zusammen, Hazim, Kathai oder Kaiserlicher und wir boten gemeinsam den Schrecken des Dschungels die Stirn!"},
			Answer{Tag = "", String = "", AnswerId = 72},
		}}

	OnAnswer{72;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_075", String = "Doch das sind heute nur noch Errinnerungen. Die Wacht ist verfallen, keiner späht mehr an den Mauern. Das Reich ist nur noch ein Schatten seiner selbst!"},
			Answer{Tag = "", String = "", AnswerId = 73},
		}}

	OnAnswer{73;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[67]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 74},
		}}

	OnAnswer{74;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 75},
		}}

	OnAnswer{75;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
		}}

	OnAnswer{75;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{75;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{76;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_077", String = "Es ist ein Bauwerk der Zerbiten, eines alten Zaubererordens. Als die Wacht noch bemannt war, studierten dort die Zerbiten die Geheimnisse des schwarzen Dschungels."},
			Answer{Tag = "", String = "", AnswerId = 77},
		}}

	OnAnswer{77;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_078", String = "Sie lernten viel über die schwarze Magie, die den Dschungel druchdringt. Aber ein Verräter aus ihrer Mitte trachtete danach, das Wissen der Zerbiten als Waffe zu gebrauchen."},
			Answer{Tag = "", String = "", AnswerId = 78},
		}}

	OnAnswer{78;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_079", String = "Sie kämpften gegen ihn, aber sie sahen, dass sie seinem teuflsichen Geist nicht gewachsen waren! Also brachten sie überall in ihren Festungen Fallen an, in der Hoffnung, dass sie so Ihre Geheimnisse vor ihm schützen konnten."},
			Answer{Tag = "", String = "", AnswerId = 79},
		}}

	OnAnswer{79;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_080", String = "Deswegen nennt man diesen Ort die Uhrwerkhallen! Denn dort ticken zahllose mechanische Fallen und magische Rätsel, wartend auf ihre nächsten Opfer."},
			Answer{Tag = "uru209_081PC", String = "Und dahin schickt Ihr mich?", AnswerId = 80},
		}}

	OnAnswer{80;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_082", String = "Es muss sein! Nur dort gibt es einen Übergang zu einer Feste der Wacht! Da die Untoten die Tore der Wacht verschlossen haben, ist es der einzige Weg, wie Ihr in die Feste und über die Dunkelwehrberge gelangen könnt!"},
			Answer{Tag = "", String = "", AnswerId = 81},
		}}

	OnAnswer{81;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[76]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 82},
		}}

	OnAnswer{82;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 83},
		}}

	OnAnswer{83;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
		}}

	OnAnswer{83;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{83;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{84;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_084", String = "Er war einst ein Diener Zarachs. Keiner weiß mehr, ob er inem der alten Völker angehörte, oder ob er eine Schöpfung Zarachs war."},
			Answer{Tag = "", String = "", AnswerId = 85},
		}}

	OnAnswer{85;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_085", String = "Man sagt, er ging Zarach bei der Erschaffung der dunklen Völker zur Hand, ja sogar, dass er der Foltermeister war, der Ihre Körper verformte während Zarach ihre Qual zu Hass schmeidete!"},
			Answer{Tag = "", String = "", AnswerId = 86},
		}}

	OnAnswer{86;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_086", String = "Aber Belail fand keinen Gefallen an den Dunklen. Er wollte seine eigenen Puppen haben und so begann er damit Tote mit Magie zu beleben. Er schuf sich Puppen aus Fleisch und geknechteten Seelen!"},
			Answer{Tag = "uru209_087PC", String = "Nekromantie!", AnswerId = 87},
		}}

	OnAnswer{87;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_088", String = "Ja, die Magie der wandelnden Toten war sein Werk, seine Schöpfung. Und die Maske des Belial verkörpert all seine Macht, denn er hat sie selbst geschmiedet. Deshalb war sie für den Nekromanten Hokan Ashir stets der wertvollste Besitz!"},
			Answer{Tag = "", String = "", AnswerId = 88},
		}}

	OnAnswer{88;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_089", String = "Er muss sie im Knochentempel gefunden haben, als er damals als junger Zerbit den Dschungel erforscht hat. Sie hat ihn verändert! Und in einer Weise ist sie für das Ende der Zerbiten und alles was nun geschieht verantwortlich."},
			Answer{Tag = "", String = "", AnswerId = 89},
		}}

	OnAnswer{89;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_090", String = "Denn die Maske trägt den Willen Belials! Auch wenn Hokan glaubt, ihre Macht zu beherrschen, er wird nie wissen, ob er nicht doch nur ein Sendbote Belials ist."},
			Answer{Tag = "", String = "", AnswerId = 90},
		}}

	OnAnswer{90;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[84]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 91},
		}}

	OnAnswer{91;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 92},
		}}

	OnAnswer{92;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
		}}

	OnAnswer{92;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{92;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{93;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_092", String = "Sie ist der letzte Geist der Bäume von Xu."},
			Answer{Tag = "", String = "", AnswerId = 94},
		}}

	OnAnswer{94;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_093", String = "Einst gab es viele Dryaden hier, sie waren mit den Urmüttern der Bäume, den Lebenseiben verbunden. ihre Kraft machte dieses Land zu einem grünen Paradies."},
			Answer{Tag = "", String = "", AnswerId = 95},
		}}

	OnAnswer{95;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_094", String = "Doch die Dryaden sind sorglos. So schwermütig sie auch im Winter sind, so ungestüm und leidenschaftlich sind sie im Frühling."},
			Answer{Tag = "", String = "", AnswerId = 96},
		}}

	OnAnswer{96;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_095", String = "Und so war auch sie. Und als eines Tages ein Gott ihren Hain aufsuchte, da vergass sie die Regeln der Schöpfung und umgarnte ihn mit ihrer Lebensfreude."},
			Answer{Tag = "", String = "", AnswerId = 97},
		}}

	OnAnswer{97;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_096", String = "Der Gott verfiel ihr. Da wurden die anderen Götter zornig und bestraften sie für den Frevel, den sie mit ihren uberirdischen Reizen begangen hatte."},
			Answer{Tag = "", String = "", AnswerId = 98},
		}}

	OnAnswer{98;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_097", String = "Sie verfluchten sie, auf das sie nie wieder ihren Hain verlassen würde. Ihre Kraft wurde ihr genommen, so dass sie nur noch wenige Bäume um sich erhalten konnte."},
			Answer{Tag = "", String = "", AnswerId = 99},
		}}

	OnAnswer{99;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_098", String = "Die anderen der alten Dryaden trauerten um ihre unglückliche Schwester und überwarfen sich mit den Göttern. Schließlich verleißen sie Xu und der einst schöne Garten verfiel zur Wüste."},
			Answer{Tag = "", String = "", AnswerId = 100},
		}}

	OnAnswer{100;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_99", String = "Heute ist nur noch diese eine der alten Dryaden von Xu am Leben. Doch ihre Macht, die einst einen ganzen Kontinent hat grünen lassen, reicht nur noch bis zu Grenze ihres kleinen Hains."},
			Answer{Tag = "", String = "", AnswerId = 101},
		}}

	OnAnswer{101;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_100", String = "Dies macht sie sehr traurig. Und sie hat nie wieder einen anderen Mann in ihren Hain geführt ... Ihr Herz errinnert sich wohl immer noch an den Frühling der Welt, den sie an der Seite einses Gott verlebt hat."},
			Answer{Tag = "", String = "", AnswerId = 102},
		}}

	OnAnswer{102;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[93]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 103},
		}}

	OnAnswer{103;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 104},
		}}

	OnAnswer{104;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
		}}

	OnAnswer{104;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{104;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{105;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_102", String = "Wenn der Baumgeist es sagt, ist es so. Es wird berichtet, das Ereon von Zeit zu Zeit unter den Menschen wandelt."},
			Answer{Tag = "", String = "", AnswerId = 106},
		}}

	OnAnswer{106;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_103", String = "Oft tritt er in Form eines Schriftgelehrten oder Zauberers auf. Er gilt als der Gott, der uns Völkern noch am nächsten steht."},
			Answer{Tag = "uru209_104PC", String = "Und ich habe ihn als alten Kauz belächelt! Einen Gott! Aber warum dieser Mummenschanz?", AnswerId = 107},
		}}

	OnAnswer{107;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_105", String = "Die Regeln Aonirs verbieten es den Wächtergöttern, Einfluss auf das Schicksal der Völker zu nehmen. Also hat Ereon einen Weg gewählt Euch zu helfen, ohne als Gott aufzutreten."},
			Answer{Tag = "", String = "", AnswerId = 108},
		}}

	OnAnswer{108;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_106", String = "Aber wenn es stimmt, was man sich über Rohen und das Buch der Konvokation erzählt, dann hat Ereon damit wohl die Grenze überschritten."},
			Answer{Tag = "uru209_107PC", String = "Was meint Ihr?", AnswerId = 109},
		}}

	OnAnswer{109;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_108", String = "Es war wohl Ereon in seiner Vekleidung des Darius, der Rohen das Buch der Konvokation gegeben hat ... und damit ermöglicht hat, dass diese Welt noch so existiert, wie sie ist."},
			Answer{Tag = "", String = "", AnswerId = 110},
		}}

	OnAnswer{110;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uru209_109", String = "Sollte das wahr sein und er deshalb aus dem Kreis der Götter ausgestossen worden sein, dann ist es unsere Pflicht ihm zu helfen! Denn wir alle schulden ihm unser Leben!"},
			Answer{Tag = "", String = "", AnswerId = 111},
		}}

	OnAnswer{111;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[105]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 112},
		}}

	OnAnswer{112;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 113},
		}}

	OnAnswer{113;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_050PC", String = "Was erwartet mich dort?", AnswerId = 53},
		}}

	OnAnswer{113;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_069PC", String = "Was ist das für eine Wachfeste?", AnswerId = 67, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_076PC", String = "Was sind die Uhrwerkhallen für ein Ort?", AnswerId = 76, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_083PC", String = "Wer ist Belial?", AnswerId = 84, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} ),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_091PC", String = "Was wisst Ihr über die Dryade?", AnswerId = 93, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uru209_101PC", String = "Dann ist Darius also tatsächlich der Wächter Ereon?", AnswerId = 105, Color = ColorDarkOrange},
		}}

	OnAnswer{113;
		Conditions = {
			Negated(UND( IsGlobalFlagFalse {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[53]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[67]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[76]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[84]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[93]Abgeschaltet"} )),
			Negated(UND( IsGlobalFlagTrue {Name = "g_sP209EreonTold"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[105]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end