-->INFO: Spinnenmann
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 1}
--!EDS ONIDLEGOHOME END


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
-- Source: C:\project\main\mission\dialoge\p6\n1989_Spinnenmann.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagSpiderkingKnown"},
		},
		Actions = {
			Say{Tag = "spinnenm001", String = "Sieh an, sieh an! Was treibt sich denn heute hier herum? Frisches, saftiges Menschenfleisch!"},
			Answer{Tag = "spinnenm001PC", String = "Wer - oder was - seid Ihr?", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSpiderkingKnown"}),
			IsNpcFlagFalse{Name = "Talked"},
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			QuestState{QuestId = 410 , State = StateActive},
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "spinnenm004", String = "Ah! Ich freue mich, Euch wiederzusehen!"},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSpiderkingKnown"}),
			IsNpcFlagFalse{Name = "Talked"},
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			QuestState{QuestId = 410 , State = StateActive},
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "spinnenm004", String = "Ah! Ich freue mich, Euch wiederzusehen!"},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSpiderkingKnown"}),
			IsNpcFlagFalse{Name = "Talked"},
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "spinnenm004", String = "Ah! Ich freue mich, Euch wiederzusehen!"},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSpiderkingKnown"}),
			IsNpcFlagFalse{Name = "Talked"},
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "spinnenm004", String = "Ah! Ich freue mich, Euch wiederzusehen!"},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSpiderkingKnown"}),
			IsNpcFlagFalse{Name = "Talked"},
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			QuestState{QuestId = 410 , State = StateActive},
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "spinnenm004", String = "Ah! Ich freue mich, Euch wiederzusehen!"},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSpiderkingKnown"}),
			IsNpcFlagFalse{Name = "Talked"},
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			QuestState{QuestId = 410 , State = StateActive},
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "spinnenm004", String = "Ah! Ich freue mich, Euch wiederzusehen!"},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSpiderkingKnown"}),
			IsNpcFlagFalse{Name = "Talked"},
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "spinnenm004", String = "Ah! Ich freue mich, Euch wiederzusehen!"},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSpiderkingKnown"}),
			IsNpcFlagFalse{Name = "Talked"},
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "spinnenm004", String = "Ah! Ich freue mich, Euch wiederzusehen!"},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSpiderkingKnown"}),
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			QuestState{QuestId = 410 , State = StateActive},
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "spinnenm004", String = "Ah! Ich freue mich, Euch wiederzusehen!"},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSpiderkingKnown"}),
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			QuestState{QuestId = 410 , State = StateActive},
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "spinnenm004", String = "Ah! Ich freue mich, Euch wiederzusehen!"},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSpiderkingKnown"}),
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "spinnenm004", String = "Ah! Ich freue mich, Euch wiederzusehen!"},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSpiderkingKnown"}),
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "spinnenm004", String = "Ah! Ich freue mich, Euch wiederzusehen!"},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSpiderkingKnown"}),
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			QuestState{QuestId = 410 , State = StateActive},
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "spinnenm004", String = "Ah! Ich freue mich, Euch wiederzusehen!"},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSpiderkingKnown"}),
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			QuestState{QuestId = 410 , State = StateActive},
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "spinnenm004", String = "Ah! Ich freue mich, Euch wiederzusehen!"},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSpiderkingKnown"}),
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "spinnenm004", String = "Ah! Ich freue mich, Euch wiederzusehen!"},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSpiderkingKnown"}),
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "spinnenm004", String = "Ah! Ich freue mich, Euch wiederzusehen!"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "spinnenm002", String = "Ohne Geschichte, ohne Namen! Die... Leute nennen mich den Spinnemann! Man meidet mich... man fürchtet mich, weil ich die Gabe besitze, mit den Spinnen zu reden!"},
			Answer{Tag = "spinnenm002PC", String = "Bist Du ein Freund - oder ein Feind, Spinnenmensch?", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			IsNpcFlagFalse{Name = "Talked"},
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			QuestState{QuestId = 410 , State = StateActive},
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSpiderkingKnown"},
			Say{Tag = "spinnenm003", String = "Weder noch, heißblütiger Runenkrieger! Ich bin der Hüter dieser wundervollen Kreaturen! Der Krieg vertrieb mich aus meinem Versteck in den Bergen! Doch wenn die Gewitter des Kampfes vorübergezogen sind, werde ich wieder dorthin entschwinden!"},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{2;
		Conditions = {
			IsNpcFlagFalse{Name = "Talked"},
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			QuestState{QuestId = 410 , State = StateActive},
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSpiderkingKnown"},
			Say{Tag = "spinnenm003", String = "Weder noch, heißblütiger Runenkrieger! Ich bin der Hüter dieser wundervollen Kreaturen! Der Krieg vertrieb mich aus meinem Versteck in den Bergen! Doch wenn die Gewitter des Kampfes vorübergezogen sind, werde ich wieder dorthin entschwinden!"},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
		}}

	OnAnswer{2;
		Conditions = {
			IsNpcFlagFalse{Name = "Talked"},
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSpiderkingKnown"},
			Say{Tag = "spinnenm003", String = "Weder noch, heißblütiger Runenkrieger! Ich bin der Hüter dieser wundervollen Kreaturen! Der Krieg vertrieb mich aus meinem Versteck in den Bergen! Doch wenn die Gewitter des Kampfes vorübergezogen sind, werde ich wieder dorthin entschwinden!"},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{2;
		Conditions = {
			IsNpcFlagFalse{Name = "Talked"},
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSpiderkingKnown"},
			Say{Tag = "spinnenm003", String = "Weder noch, heißblütiger Runenkrieger! Ich bin der Hüter dieser wundervollen Kreaturen! Der Krieg vertrieb mich aus meinem Versteck in den Bergen! Doch wenn die Gewitter des Kampfes vorübergezogen sind, werde ich wieder dorthin entschwinden!"},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
		}}

	OnAnswer{2;
		Conditions = {
			IsNpcFlagFalse{Name = "Talked"},
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			QuestState{QuestId = 410 , State = StateActive},
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSpiderkingKnown"},
			Say{Tag = "spinnenm003", String = "Weder noch, heißblütiger Runenkrieger! Ich bin der Hüter dieser wundervollen Kreaturen! Der Krieg vertrieb mich aus meinem Versteck in den Bergen! Doch wenn die Gewitter des Kampfes vorübergezogen sind, werde ich wieder dorthin entschwinden!"},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{2;
		Conditions = {
			IsNpcFlagFalse{Name = "Talked"},
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			QuestState{QuestId = 410 , State = StateActive},
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSpiderkingKnown"},
			Say{Tag = "spinnenm003", String = "Weder noch, heißblütiger Runenkrieger! Ich bin der Hüter dieser wundervollen Kreaturen! Der Krieg vertrieb mich aus meinem Versteck in den Bergen! Doch wenn die Gewitter des Kampfes vorübergezogen sind, werde ich wieder dorthin entschwinden!"},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
		}}

	OnAnswer{2;
		Conditions = {
			IsNpcFlagFalse{Name = "Talked"},
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSpiderkingKnown"},
			Say{Tag = "spinnenm003", String = "Weder noch, heißblütiger Runenkrieger! Ich bin der Hüter dieser wundervollen Kreaturen! Der Krieg vertrieb mich aus meinem Versteck in den Bergen! Doch wenn die Gewitter des Kampfes vorübergezogen sind, werde ich wieder dorthin entschwinden!"},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{2;
		Conditions = {
			IsNpcFlagFalse{Name = "Talked"},
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSpiderkingKnown"},
			Say{Tag = "spinnenm003", String = "Weder noch, heißblütiger Runenkrieger! Ich bin der Hüter dieser wundervollen Kreaturen! Der Krieg vertrieb mich aus meinem Versteck in den Bergen! Doch wenn die Gewitter des Kampfes vorübergezogen sind, werde ich wieder dorthin entschwinden!"},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			QuestState{QuestId = 410 , State = StateActive},
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSpiderkingKnown"},
			Say{Tag = "spinnenm003", String = "Weder noch, heißblütiger Runenkrieger! Ich bin der Hüter dieser wundervollen Kreaturen! Der Krieg vertrieb mich aus meinem Versteck in den Bergen! Doch wenn die Gewitter des Kampfes vorübergezogen sind, werde ich wieder dorthin entschwinden!"},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			QuestState{QuestId = 410 , State = StateActive},
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSpiderkingKnown"},
			Say{Tag = "spinnenm003", String = "Weder noch, heißblütiger Runenkrieger! Ich bin der Hüter dieser wundervollen Kreaturen! Der Krieg vertrieb mich aus meinem Versteck in den Bergen! Doch wenn die Gewitter des Kampfes vorübergezogen sind, werde ich wieder dorthin entschwinden!"},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSpiderkingKnown"},
			Say{Tag = "spinnenm003", String = "Weder noch, heißblütiger Runenkrieger! Ich bin der Hüter dieser wundervollen Kreaturen! Der Krieg vertrieb mich aus meinem Versteck in den Bergen! Doch wenn die Gewitter des Kampfes vorübergezogen sind, werde ich wieder dorthin entschwinden!"},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSpiderkingKnown"},
			Say{Tag = "spinnenm003", String = "Weder noch, heißblütiger Runenkrieger! Ich bin der Hüter dieser wundervollen Kreaturen! Der Krieg vertrieb mich aus meinem Versteck in den Bergen! Doch wenn die Gewitter des Kampfes vorübergezogen sind, werde ich wieder dorthin entschwinden!"},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			QuestState{QuestId = 410 , State = StateActive},
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSpiderkingKnown"},
			Say{Tag = "spinnenm003", String = "Weder noch, heißblütiger Runenkrieger! Ich bin der Hüter dieser wundervollen Kreaturen! Der Krieg vertrieb mich aus meinem Versteck in den Bergen! Doch wenn die Gewitter des Kampfes vorübergezogen sind, werde ich wieder dorthin entschwinden!"},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			QuestState{QuestId = 410 , State = StateActive},
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSpiderkingKnown"},
			Say{Tag = "spinnenm003", String = "Weder noch, heißblütiger Runenkrieger! Ich bin der Hüter dieser wundervollen Kreaturen! Der Krieg vertrieb mich aus meinem Versteck in den Bergen! Doch wenn die Gewitter des Kampfes vorübergezogen sind, werde ich wieder dorthin entschwinden!"},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSpiderkingKnown"},
			Say{Tag = "spinnenm003", String = "Weder noch, heißblütiger Runenkrieger! Ich bin der Hüter dieser wundervollen Kreaturen! Der Krieg vertrieb mich aus meinem Versteck in den Bergen! Doch wenn die Gewitter des Kampfes vorübergezogen sind, werde ich wieder dorthin entschwinden!"},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSpiderkingKnown"},
			Say{Tag = "spinnenm003", String = "Weder noch, heißblütiger Runenkrieger! Ich bin der Hüter dieser wundervollen Kreaturen! Der Krieg vertrieb mich aus meinem Versteck in den Bergen! Doch wenn die Gewitter des Kampfes vorübergezogen sind, werde ich wieder dorthin entschwinden!"},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q104SpidersGetReady"} , SetGlobalFlagTrue{Name = "Q104SpidersReady"}, SetNpcFlagTrue{Name = "Talked"} , RevealUnExplored{X = 237 , Y = 246 , Range = 12},
			Say{Tag = "spinnenm005", String = "Ach, Euer Blut ist jung und tatendurstig! Doch seht - was vermag ich schon gegen die Heere der Angreifer auszurichten? Ich würde zerquetscht werden wie ein Spinne!"},
			Answer{Tag = "spinnenm005PC", String = "Das werdet Ihr auch, wenn Ihr tatenlos hier herumsitzt! Kämpft mit mir Seite an Seite! Gemeinsam können wir den Feind besiegen!", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "spinnenm006", String = "Oh, welch Tatendrang, welch Tatendrang! Nun gut, mein heißblütiger Freund - so soll es sein! Ich werde Euch meine Jäger zur Hilfe schicken! Gebt mir Nachricht, sobald Euer Angriff beginnt!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "spinnenm007", String = "Sobald Ihr Zeichen gebt, werden meine Spinnen die Armee des Feindes am Eingang zum Pass angreifen."},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
			IsNpcFlagFalse{Name = "Talked"},
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			QuestState{QuestId = 410 , State = StateActive},
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{6;
		Conditions = {
			IsNpcFlagFalse{Name = "Talked"},
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			QuestState{QuestId = 410 , State = StateActive},
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
		}}

	OnAnswer{6;
		Conditions = {
			IsNpcFlagFalse{Name = "Talked"},
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{6;
		Conditions = {
			IsNpcFlagFalse{Name = "Talked"},
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			IsNpcFlagFalse{Name = "Talked"},
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			QuestState{QuestId = 410 , State = StateActive},
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{6;
		Conditions = {
			IsNpcFlagFalse{Name = "Talked"},
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			QuestState{QuestId = 410 , State = StateActive},
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
		}}

	OnAnswer{6;
		Conditions = {
			IsNpcFlagFalse{Name = "Talked"},
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{6;
		Conditions = {
			IsNpcFlagFalse{Name = "Talked"},
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			QuestState{QuestId = 410 , State = StateActive},
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			QuestState{QuestId = 410 , State = StateActive},
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			QuestState{QuestId = 410 , State = StateActive},
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			QuestState{QuestId = 410 , State = StateActive},
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "spinnenm008", String = "Gut, meine Kleinen werden Euch beistehen! Viel Glück... und eins noch..."},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "spinnenm009", String = "Einer von den Orks hat mir meine Flöte gestohlen! Ein seltenes und kostbares Stück... Ich wäre Euch sehr verbunden, wenn Ihr es mir wiederbringen könntet!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q104LaunchSpiders"} , QuestBegin{QuestId = 408} , 
					QuestBegin{QuestId = 409}, SetNpcFlagTrue{Name = "SpiderSent"},
			Say{Tag = "spinnenm010", String = "So... und nun lauft meine Kleinen!"},
			Answer{Tag = "", String = "", AnswerId = 10},
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
			IsNpcFlagFalse{Name = "Talked"},
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			QuestState{QuestId = 410 , State = StateActive},
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{11;
		Conditions = {
			IsNpcFlagFalse{Name = "Talked"},
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			QuestState{QuestId = 410 , State = StateActive},
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			IsNpcFlagFalse{Name = "Talked"},
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{11;
		Conditions = {
			IsNpcFlagFalse{Name = "Talked"},
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
		}}

	OnAnswer{11;
		Conditions = {
			IsNpcFlagFalse{Name = "Talked"},
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			QuestState{QuestId = 410 , State = StateActive},
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{11;
		Conditions = {
			IsNpcFlagFalse{Name = "Talked"},
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			QuestState{QuestId = 410 , State = StateActive},
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			IsNpcFlagFalse{Name = "Talked"},
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{11;
		Conditions = {
			IsNpcFlagFalse{Name = "Talked"},
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			QuestState{QuestId = 410 , State = StateActive},
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			QuestState{QuestId = 410 , State = StateActive},
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			QuestState{QuestId = 410 , State = StateActive},
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			QuestState{QuestId = 410 , State = StateActive},
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "spinnenm011", String = "Ahh... seid bedankt! Ein einsamer Mann wie ich braucht seine Musik, wisst Ihr!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "spinnenm012", String = "Hier, nehmt dies zum Ausgleich! Ich glaube, es wird Euch von Nutzen sein..."},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			TransferItem {TakeItem = 2371 , Flag = Take} , QuestSolve{QuestId = 410} , 
				QuestSolve{QuestId = 408},
				SetRewardFlagTrue{ Name = "AlterMannUndMusik"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
			IsNpcFlagFalse{Name = "Talked"},
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			QuestState{QuestId = 410 , State = StateActive},
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{15;
		Conditions = {
			IsNpcFlagFalse{Name = "Talked"},
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			QuestState{QuestId = 410 , State = StateActive},
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
		}}

	OnAnswer{15;
		Conditions = {
			IsNpcFlagFalse{Name = "Talked"},
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{15;
		Conditions = {
			IsNpcFlagFalse{Name = "Talked"},
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
		}}

	OnAnswer{15;
		Conditions = {
			IsNpcFlagFalse{Name = "Talked"},
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			QuestState{QuestId = 410 , State = StateActive},
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{15;
		Conditions = {
			IsNpcFlagFalse{Name = "Talked"},
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			QuestState{QuestId = 410 , State = StateActive},
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
		}}

	OnAnswer{15;
		Conditions = {
			IsNpcFlagFalse{Name = "Talked"},
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{15;
		Conditions = {
			IsNpcFlagFalse{Name = "Talked"},
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			QuestState{QuestId = 410 , State = StateActive},
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			QuestState{QuestId = 410 , State = StateActive},
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			QuestState{QuestId = 410 , State = StateActive},
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			QuestState{QuestId = 410 , State = StateActive},
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "spinnenm013", String = "So, sagt man das? Nun, entführt ist vielleicht das falsche Wort! Sie war mein... Gast... ich lud sie zum Essen ein..."},
			Answer{Tag = "spinnenm013PC", String = "Gebt sie frei - oder Eure Spinnen werden den Tod ihres Hüters betrauern!", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "spinnenm014", String = "Euer hitziges Gemüt wird Euch noch einmal in Schwierigkeiten bringen, mein junger Krieger... Freigeben...? Oh, sie ist frei... frei aller Not dieser Welt..."},
			OfferAnswer{Tag = "spinnenm014PC", String = "Bastard! Dafür werdet Ihr bezahlen!", AnswerId = 18},
			OfferAnswer{Tag = "spinnenm015PC", String = "Lassen wir die Toten ruhen, es gibt wichtigeres als Rache!", AnswerId = 20},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "spinnenm015", String = "Frisches Fleisch, meine Lieben! Kommt zum Mahle! Kommt, kommt...!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q107SpiderkingAgressive"} , 
						QuestBegin{QuestId = 108} , 
						SetGlobalFlagFalse{Name = "Q104SpidersGo"},
						RemoveDialog{},
			EndDialog(),
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "spinnenm016", String = "Ganz Eurer Meinung, junger Freund! Diese Angelegenheit ist doch schon längst... gegessen!"},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			QuestChangeState{QuestId = 108 , State = StateUnsolvable} , QuestChangeState{QuestId = 107 , State = StateUnsolvable},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
			IsNpcFlagFalse{Name = "Talked"},
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			QuestState{QuestId = 410 , State = StateActive},
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{22;
		Conditions = {
			IsNpcFlagFalse{Name = "Talked"},
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			QuestState{QuestId = 410 , State = StateActive},
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
		}}

	OnAnswer{22;
		Conditions = {
			IsNpcFlagFalse{Name = "Talked"},
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{22;
		Conditions = {
			IsNpcFlagFalse{Name = "Talked"},
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
		}}

	OnAnswer{22;
		Conditions = {
			IsNpcFlagFalse{Name = "Talked"},
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			QuestState{QuestId = 410 , State = StateActive},
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{22;
		Conditions = {
			IsNpcFlagFalse{Name = "Talked"},
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			QuestState{QuestId = 410 , State = StateActive},
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
		}}

	OnAnswer{22;
		Conditions = {
			IsNpcFlagFalse{Name = "Talked"},
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{22;
		Conditions = {
			IsNpcFlagFalse{Name = "Talked"},
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm004PC", String = "Ihr müsst Euch gegen die Eindringlinge erheben!", AnswerId = 3},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			QuestState{QuestId = 410 , State = StateActive},
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			QuestState{QuestId = 410 , State = StateActive},
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"}),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm007PC", String = "Schickt Eure Spinnen los!", AnswerId = 7},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			QuestState{QuestId = 410 , State = StateActive},
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			QuestState{QuestId = 410 , State = StateActive},
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm010PC", String = "Eure Flöte?", AnswerId = 12},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			QuestState{QuestId =  107 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "spinnenm012PC", String = "Man sagt, Ihr habt ein Mädchen entführt, Spinnenmensch?", AnswerId = 16},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Talked"}),
			Negated(UND(IsGlobalFlagTrue{Name = "Q104SpidersReady" , UpdateInterval = 15}, IsNpcFlagFalse{Name = "SpiderSent"})),
			Negated(QuestState{QuestId = 410 , State = StateActive}),
			Negated(QuestState{QuestId =  107 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end