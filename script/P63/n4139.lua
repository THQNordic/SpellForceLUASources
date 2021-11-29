-->INFO: Flink
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 4}
--!EDS ONIDLEGOHOME END

SpawnOnlyWhen
{
Conditions = {QuestState{QuestId = 190 , State = StateSolved}},
}

--Dialogsteuerung

OnOneTimeEvent
{
Conditions = {},
Actions = {
		SetDialogType{Type = SideQuest}
		}
}



--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p63\n4139_Flink.txt


	

	OnBeginDialog{
		Conditions = {
			Negated(QuestState{QuestId = 220 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(Negated(QuestState{QuestId = 220 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "flinkGrey019", String = "Weitergehen! Hier gibt es nichts zu sehen...!"},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagFlinkKnown"}),
			QuestState{QuestId = 527 , State = StateActive},
			QuestState{QuestId = 529 , State = StateActive},
		},
		Actions = {
			Say{Tag = "flinkGrey005", String = "Uhm, ist das Euer Geldbeutel? Wie kommt der denn hierher...?"},
			OfferAnswer{Tag = "flinkGrey005PC", String = "Was Eure Geschäfte angeht...", AnswerId = 5},
			OfferAnswer{Tag = "flinkGrey014PC", String = "Hier, das Bruchstück!", AnswerId = 16},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagFlinkKnown"}),
			QuestState{QuestId = 527 , State = StateActive},
			Negated(QuestState{QuestId = 529 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "flinkGrey005", String = "Uhm, ist das Euer Geldbeutel? Wie kommt der denn hierher...?"},
			OfferAnswer{Tag = "flinkGrey005PC", String = "Was Eure Geschäfte angeht...", AnswerId = 5},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagFlinkKnown"}),
			Negated(QuestState{QuestId = 527 , State = StateActive}),
			QuestState{QuestId = 529 , State = StateActive},
		},
		Actions = {
			Say{Tag = "flinkGrey005", String = "Uhm, ist das Euer Geldbeutel? Wie kommt der denn hierher...?"},
			OfferAnswer{Tag = "flinkGrey014PC", String = "Hier, das Bruchstück!", AnswerId = 16},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagFlinkKnown"}),
			Negated(QuestState{QuestId = 527 , State = StateActive}),
			Negated(QuestState{QuestId = 529 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "flinkGrey005", String = "Uhm, ist das Euer Geldbeutel? Wie kommt der denn hierher...?"},
		}}

	OnAnswer{1;
		Conditions = {
			IsNpcFlagFalse{Name = "FlagFlinkKnown"},
		},
		Actions = {
			Say{Tag = "flinkGrey001", String = "Ich hab nichts gesehen...! Er ist da lang gelaufen...!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkGrey002", String = "Moment mal! Euch kenne ich doch..."},
			Answer{Tag = "flinkGrey002PC", String = "Ja! Der größenwahnsinnige Held! Ihr erinnert Euch?", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkGrey003", String = "Natürlich! Das Grauschattental! Die Untoten! Und Ihr habt uns da rausgehauen!"},
			Answer{Tag = "flinkGrey003PC", String = "Es wundert mich, dass Ihr überhaupt etwas davon mitbekommen habt! Ihr habt Euch ja recht schnell aus dem Staub gemacht!", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 527 , State = StateActive},
			QuestState{QuestId = 529 , State = StateActive},
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagFlinkKnown"},
			Say{Tag = "flinkGrey004", String = "Ähm... die Geschäfte, mein Freund! Die Geschäfte..."},
			OfferAnswer{Tag = "flinkGrey005PC", String = "Was Eure Geschäfte angeht...", AnswerId = 5},
			OfferAnswer{Tag = "flinkGrey014PC", String = "Hier, das Bruchstück!", AnswerId = 16},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 527 , State = StateActive},
			Negated(QuestState{QuestId = 529 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagFlinkKnown"},
			Say{Tag = "flinkGrey004", String = "Ähm... die Geschäfte, mein Freund! Die Geschäfte..."},
			OfferAnswer{Tag = "flinkGrey005PC", String = "Was Eure Geschäfte angeht...", AnswerId = 5},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 527 , State = StateActive}),
			QuestState{QuestId = 529 , State = StateActive},
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagFlinkKnown"},
			Say{Tag = "flinkGrey004", String = "Ähm... die Geschäfte, mein Freund! Die Geschäfte..."},
			OfferAnswer{Tag = "flinkGrey014PC", String = "Hier, das Bruchstück!", AnswerId = 16},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 527 , State = StateActive}),
			Negated(QuestState{QuestId = 529 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagFlinkKnown"},
			Say{Tag = "flinkGrey004", String = "Ähm... die Geschäfte, mein Freund! Die Geschäfte..."},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkGrey006", String = "Ähm... ja?"},
			Answer{Tag = "flinkGrey006PC", String = "Ich habe Euren Freund Cassius Demer gefunden... Oder besser - wie Ihr es ausgedrückt habt - was von ihm übrig war!", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkGrey007", String = "Ah! Das! Ja! Ha ha!... Ja... äh, und?"},
			Answer{Tag = "flinkGrey007PC", String = "Er hatte dieses goldene Bruchstück bei sich!", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkGrey008", String = "Was? Das ist alles? Dreimal verflucht! Jetzt bleibt nur noch Fayt!"},
			Answer{Tag = "flinkGrey008PC", String = "Fayt?", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkGrey009", String = "Er muss den letzten Teil des Schlüssels haben! Aber jetzt komme ich nicht mehr an ihn ran!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkGrey010", String = "Ich hätte ihn fast gehabt! Jetzt hat er mich ausgetrickst! Und nun sitzt er wieder gut bewacht unter seinen Leuten! Verflucht!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkGrey011", String = "Wenn ich könnte, ich würde ihm sein Herz rausreißen! Aber was kann ich schon gegen seine Söldner ausrichten..."},
			Answer{Tag = "flinkGrey011PC", String = "Ihr nichts! Aber ich...", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkGrey012", String = "Ihr? Das sind mindestens zwei Dutzend harte Söldner! Die fressen Euch zum Frühstück!"},
			Answer{Tag = "flinkGrey012PC", String = "Ich bin ein Runenkrieger, vergesst das nicht!", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkGrey013", String = "Des Wahnsinns fette Beute, dass seid Ihr! Aber gut, wenn Ihr so verrückt sein wollt! Fayt und seine Bande haben sich im Schattenhain breit gemacht, jetzt wo die Elfen weg sind!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkGrey014", String = "Sucht ihn und gerbt ihm das Fell! Er besitzt genauso ein Bruchstück wie Cassius! Bringt es mir!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 528} , QuestSolve{QuestId = 527},
			TransferItem{TakeItem = 3466 , Amount = 1 ,Flag = Take},
				SetRewardFlagTrue{ Name = "TricksterFindFlink"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
			QuestState{QuestId = 527 , State = StateActive},
			QuestState{QuestId = 529 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkGrey005PC", String = "Was Eure Geschäfte angeht...", AnswerId = 5},
			OfferAnswer{Tag = "flinkGrey014PC", String = "Hier, das Bruchstück!", AnswerId = 16},
		}}

	OnAnswer{15;
		Conditions = {
			QuestState{QuestId = 527 , State = StateActive},
			Negated(QuestState{QuestId = 529 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkGrey005PC", String = "Was Eure Geschäfte angeht...", AnswerId = 5},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(QuestState{QuestId = 527 , State = StateActive}),
			QuestState{QuestId = 529 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkGrey014PC", String = "Hier, das Bruchstück!", AnswerId = 16},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(QuestState{QuestId = 527 , State = StateActive}),
			Negated(QuestState{QuestId = 529 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkGrey015", String = "Zerbo ist mir gnädig! Seid bedankt, großer starker Krieger!"},
			Answer{Tag = "flinkGrey015PC", String = "Wofür ist dieser Schlüssel eigentlich?", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkGrey016", String = "Aber, aber! Wer wird denn so viele Fragen stellen..."},
			Answer{Tag = "flinkGrey016PC", String = "Reizend! So was in der Art hatte ich schon geahnt...", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkGrey017", String = "Seht ihr? Ihr lernt schnell! Nun gehabt Euch wohl!"},
			Answer{Tag = "flinkGrey017PC", String = "...", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkGrey018", String = "Also gut, also gut! Hier! Das bin ich Euch wohl schuldig!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 529} , QuestSolve{QuestId = 220},
					SetRewardFlagTrue{ Name = "TricksterReturn"},
					TransferItem{TakeItem = 3467 , Amount = 1 , Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 527 , State = StateActive},
			QuestState{QuestId = 529 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkGrey005PC", String = "Was Eure Geschäfte angeht...", AnswerId = 5},
			OfferAnswer{Tag = "flinkGrey014PC", String = "Hier, das Bruchstück!", AnswerId = 16},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 527 , State = StateActive},
			Negated(QuestState{QuestId = 529 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkGrey005PC", String = "Was Eure Geschäfte angeht...", AnswerId = 5},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 527 , State = StateActive}),
			QuestState{QuestId = 529 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flinkGrey014PC", String = "Hier, das Bruchstück!", AnswerId = 16},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 527 , State = StateActive}),
			Negated(QuestState{QuestId = 529 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end