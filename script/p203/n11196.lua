-->INFO: Zelt_Tagebuch
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p203\n11196_Zelt_Tagebuch.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsNpcFlagTrue{Name = "n_p203_Zelt_Mit_Tagebuch_Gefunden"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "n_p203_Zelt_Mit_Tagebuch_Gefunden"}),
		},
		Actions = {
			Say{Tag = "tent_diaryP203_001", String = "(Ein verlassenes Zelt.)"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "n_p203_Zelt_Mit_Tagebuch_Gefunden"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
			UND( IsNpcFlagTrue{Name = "n_p203_Zelt_Mit_Tagebuch_Gefunden"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[4]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "n_p203_Zelt_Mit_Tagebuch_Tagebuch_Gefunden"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tent_diaryP203_002PC", String = "(Das Zelt durchsuchen.)", AnswerId = 4},
			OfferAnswer{Tag = "tent_diaryP203_004PC", String = "(Das Tagebuch lesen.)", AnswerId = 8},
		}}

	OnAnswer{3;
		Conditions = {
			UND( IsNpcFlagTrue{Name = "n_p203_Zelt_Mit_Tagebuch_Gefunden"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[4]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "n_p203_Zelt_Mit_Tagebuch_Tagebuch_Gefunden"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tent_diaryP203_002PC", String = "(Das Zelt durchsuchen.)", AnswerId = 4},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( IsNpcFlagTrue{Name = "n_p203_Zelt_Mit_Tagebuch_Gefunden"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[4]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "n_p203_Zelt_Mit_Tagebuch_Tagebuch_Gefunden"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tent_diaryP203_004PC", String = "(Das Tagebuch lesen.)", AnswerId = 8},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( IsNpcFlagTrue{Name = "n_p203_Zelt_Mit_Tagebuch_Gefunden"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[4]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "n_p203_Zelt_Mit_Tagebuch_Tagebuch_Gefunden"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "tent_diaryP203_003PC", String = "(Ihr findet ein paar magere Vorräte, eine Decke und ein zersschlissenes Tagebuch.)", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[4]Abgeschaltet"},
			SetNpcFlagTrue{Name = "n_p203_Zelt_Mit_Tagebuch_Tagebuch_Gefunden"},
			Say{Tag = "", String = ""},
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
			UND( IsNpcFlagTrue{Name = "n_p203_Zelt_Mit_Tagebuch_Gefunden"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[4]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "n_p203_Zelt_Mit_Tagebuch_Tagebuch_Gefunden"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tent_diaryP203_002PC", String = "(Das Zelt durchsuchen.)", AnswerId = 4},
			OfferAnswer{Tag = "tent_diaryP203_004PC", String = "(Das Tagebuch lesen.)", AnswerId = 8},
		}}

	OnAnswer{7;
		Conditions = {
			UND( IsNpcFlagTrue{Name = "n_p203_Zelt_Mit_Tagebuch_Gefunden"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[4]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "n_p203_Zelt_Mit_Tagebuch_Tagebuch_Gefunden"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tent_diaryP203_002PC", String = "(Das Zelt durchsuchen.)", AnswerId = 4},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND( IsNpcFlagTrue{Name = "n_p203_Zelt_Mit_Tagebuch_Gefunden"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[4]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "n_p203_Zelt_Mit_Tagebuch_Tagebuch_Gefunden"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tent_diaryP203_004PC", String = "(Das Tagebuch lesen.)", AnswerId = 8},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND( IsNpcFlagTrue{Name = "n_p203_Zelt_Mit_Tagebuch_Gefunden"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[4]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "n_p203_Zelt_Mit_Tagebuch_Tagebuch_Gefunden"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tent_diaryP203_005", String = "(Die meisten Einträge sind ausgeblichen und unleserlich. Aber Ihr könnt noch einige lesbare Stellen ausmachen.)"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tent_diaryP203_006", String = "(Erster Sundainmond: Ich habe die Quelle erreicht. Es ist wie Tario vermutet hat, irgend etwas verwandelt das Wasser zu brennendem Gift! Ich kann nicht sagen, was es ist ...)"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tent_diaryP203_007", String = "(... aber es wird immer schlimmer! Es ist kaum noch klares Wasser bei der Quelle übrig, immer mehr von dem Gift kommt aus der Quelle!)"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tent_diaryP203_008", String = "(Dritter Sudani: Irgend etwas steckt in der Quelle fest, aber ich komme nicht heran! ich glaube, dass dieser Gegenstand das Gift ins Wasser bringt. Ich werde mir einen Nagelstock bauen, vielleicht bekomme ich das Ding so heraus.)"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tent_diaryP203_009", String = "(Vierter Sundani: Der Nagelstock ist fertig, aber ein Drachling hat meine Handschuhe gestohlen! Ohne Schutz wird  das Wasser der Quelle meine Hände verbrennen! Kaum noch klares Wasser übrig.)"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tent_diaryP203_010", String = "(Siebter Sundani: Ich komme nicht an den Ursprung des Giftes heran! Das giftige Wasser hat meine Hände ganz verbrannt, ich kann sie kaum noch spüren. Ich glaube ich habe Fieber ... es tut so weh ... hätte ich nur meine Handschuhe!)"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tent_diaryP203_011", String = "(Achter Sudani: Das Ding sitzt einfach zu fest ... rechts ... runter ... bin nicht schnell genug ... ich fürchte ich muss aufgeben ...)"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tent_diaryP203_012", String = "(Zehnter: Die Hazim haben angegriffen, ich glaube sie haben das Dorf umzingelt ... wahrscheinlich sind dort alle tot. Ich bleibe hier, wo  es wenigstens noch ein wenig reines Wasser gibt! Die im Dorf brauchen es sowieso nicht mehr!)"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
			UND( IsNpcFlagTrue{Name = "n_p203_Zelt_Mit_Tagebuch_Gefunden"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[4]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "n_p203_Zelt_Mit_Tagebuch_Tagebuch_Gefunden"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tent_diaryP203_002PC", String = "(Das Zelt durchsuchen.)", AnswerId = 4},
			OfferAnswer{Tag = "tent_diaryP203_004PC", String = "(Das Tagebuch lesen.)", AnswerId = 8},
		}}

	OnAnswer{18;
		Conditions = {
			UND( IsNpcFlagTrue{Name = "n_p203_Zelt_Mit_Tagebuch_Gefunden"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[4]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "n_p203_Zelt_Mit_Tagebuch_Tagebuch_Gefunden"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tent_diaryP203_002PC", String = "(Das Zelt durchsuchen.)", AnswerId = 4},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(UND( IsNpcFlagTrue{Name = "n_p203_Zelt_Mit_Tagebuch_Gefunden"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[4]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "n_p203_Zelt_Mit_Tagebuch_Tagebuch_Gefunden"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tent_diaryP203_004PC", String = "(Das Tagebuch lesen.)", AnswerId = 8},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(UND( IsNpcFlagTrue{Name = "n_p203_Zelt_Mit_Tagebuch_Gefunden"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[4]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "n_p203_Zelt_Mit_Tagebuch_Tagebuch_Gefunden"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end