-->INFO: Orthanc
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

REM = [[

OnOneTimeEvent
{
Conditions = {
		IsGlobalFlagTrue{Name = "PreviewVersion"}
			},
Actions = {
		RemoveDialog{}
		}
}
]]


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p63\n2896_Orthanc.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagOrthancKnown"},
		},
		Actions = {
			Say{Tag = "orthanc001", String = "Was soll es sein? Ein Schwert für den Bruder? Oder ein Dolch für die Liebschaft?"},
			Answer{Tag = "orthanc001PC", String = "Was meint Ihr?", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagOrthancKnown"}),
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "orthanc005", String = "Ah, Krieger! Ich hoffe das... Geschäft läuft zufriedenstellend!"},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagOrthancKnown"}),
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "orthanc005", String = "Ah, Krieger! Ich hoffe das... Geschäft läuft zufriedenstellend!"},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagOrthancKnown"}),
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "orthanc005", String = "Ah, Krieger! Ich hoffe das... Geschäft läuft zufriedenstellend!"},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagOrthancKnown"}),
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "orthanc005", String = "Ah, Krieger! Ich hoffe das... Geschäft läuft zufriedenstellend!"},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagOrthancKnown"}),
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "orthanc005", String = "Ah, Krieger! Ich hoffe das... Geschäft läuft zufriedenstellend!"},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagOrthancKnown"}),
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "orthanc005", String = "Ah, Krieger! Ich hoffe das... Geschäft läuft zufriedenstellend!"},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagOrthancKnown"}),
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "orthanc005", String = "Ah, Krieger! Ich hoffe das... Geschäft läuft zufriedenstellend!"},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagOrthancKnown"}),
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "orthanc005", String = "Ah, Krieger! Ich hoffe das... Geschäft läuft zufriedenstellend!"},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagOrthancKnown"}),
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "orthanc005", String = "Ah, Krieger! Ich hoffe das... Geschäft läuft zufriedenstellend!"},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagOrthancKnown"}),
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "orthanc005", String = "Ah, Krieger! Ich hoffe das... Geschäft läuft zufriedenstellend!"},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagOrthancKnown"}),
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "orthanc005", String = "Ah, Krieger! Ich hoffe das... Geschäft läuft zufriedenstellend!"},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagOrthancKnown"}),
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "orthanc005", String = "Ah, Krieger! Ich hoffe das... Geschäft läuft zufriedenstellend!"},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagOrthancKnown"}),
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "orthanc005", String = "Ah, Krieger! Ich hoffe das... Geschäft läuft zufriedenstellend!"},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagOrthancKnown"}),
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "orthanc005", String = "Ah, Krieger! Ich hoffe das... Geschäft läuft zufriedenstellend!"},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagOrthancKnown"}),
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "orthanc005", String = "Ah, Krieger! Ich hoffe das... Geschäft läuft zufriedenstellend!"},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagOrthancKnown"}),
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "orthanc005", String = "Ah, Krieger! Ich hoffe das... Geschäft läuft zufriedenstellend!"},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagOrthancKnown"}),
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "orthanc005", String = "Ah, Krieger! Ich hoffe das... Geschäft läuft zufriedenstellend!"},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagOrthancKnown"}),
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "orthanc005", String = "Ah, Krieger! Ich hoffe das... Geschäft läuft zufriedenstellend!"},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagOrthancKnown"}),
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "orthanc005", String = "Ah, Krieger! Ich hoffe das... Geschäft läuft zufriedenstellend!"},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagOrthancKnown"}),
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "orthanc005", String = "Ah, Krieger! Ich hoffe das... Geschäft läuft zufriedenstellend!"},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagOrthancKnown"}),
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "orthanc005", String = "Ah, Krieger! Ich hoffe das... Geschäft läuft zufriedenstellend!"},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagOrthancKnown"}),
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "orthanc005", String = "Ah, Krieger! Ich hoffe das... Geschäft läuft zufriedenstellend!"},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagOrthancKnown"}),
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "orthanc005", String = "Ah, Krieger! Ich hoffe das... Geschäft läuft zufriedenstellend!"},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagOrthancKnown"}),
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "orthanc005", String = "Ah, Krieger! Ich hoffe das... Geschäft läuft zufriedenstellend!"},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagOrthancKnown"}),
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "orthanc005", String = "Ah, Krieger! Ich hoffe das... Geschäft läuft zufriedenstellend!"},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagOrthancKnown"}),
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "orthanc005", String = "Ah, Krieger! Ich hoffe das... Geschäft läuft zufriedenstellend!"},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagOrthancKnown"}),
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "orthanc005", String = "Ah, Krieger! Ich hoffe das... Geschäft läuft zufriedenstellend!"},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagOrthancKnown"}),
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "orthanc005", String = "Ah, Krieger! Ich hoffe das... Geschäft läuft zufriedenstellend!"},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagOrthancKnown"}),
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "orthanc005", String = "Ah, Krieger! Ich hoffe das... Geschäft läuft zufriedenstellend!"},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagOrthancKnown"}),
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "orthanc005", String = "Ah, Krieger! Ich hoffe das... Geschäft läuft zufriedenstellend!"},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagOrthancKnown"}),
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "orthanc005", String = "Ah, Krieger! Ich hoffe das... Geschäft läuft zufriedenstellend!"},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagOrthancKnown"}),
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "orthanc005", String = "Ah, Krieger! Ich hoffe das... Geschäft läuft zufriedenstellend!"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orthanc002", String = "Schon gut! Die meisten Leute, die zu mir kommen, hängen... eher düsteren Gedanken nach! Wenn Ihr versteht, was ich meine!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orthanc003", String = "Ich fertige Werkzeuge des Todes! Keine Fleischermesser oder Milizschwerter! Dafür mögt Ihr auf den Markt gehen!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orthanc004", String = "Also, was begehrt Ihr von Orthanc, Krieger?"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagOrthancKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagOrthancKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagOrthancKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagOrthancKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagOrthancKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagOrthancKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagOrthancKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagOrthancKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagOrthancKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagOrthancKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagOrthancKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagOrthancKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagOrthancKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagOrthancKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagOrthancKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagOrthancKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagOrthancKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagOrthancKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagOrthancKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagOrthancKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagOrthancKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagOrthancKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagOrthancKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagOrthancKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagOrthancKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagOrthancKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagOrthancKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagOrthancKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagOrthancKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagOrthancKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagOrthancKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagOrthancKnown"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orthanc006", String = "Selten! Ein guter Panzer dauert einfach zu lange! Zudem mangelt es meist an dem nötigen Material!"},
			Answer{Tag = "orthanc006PC", String = "Ihr habt also schon Rüstungen geschmiedet?", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orthanc007", String = "Ich fertigte einst eine Rüstung aus gleißendem Mondsilber! Die einzige, die je von Menschenhand geschaffen wurde! Tag um Tag standen Sunder und ich schwitzend an der Esse!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orthanc008", String = "Wir brachten all unser Können und Wissen auf, um diese eine Rüstung zu fertigen! Sie war für den größten Krieger bestimmt, den die Menschenreiche je gesehen haben!"},
			Answer{Tag = "orthanc008PC", String = "Was ist aus der Rüstung geworden?", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orthanc009", String = "Amra hat sie getragen, als er auszog, um Lea zu suchen! Was aus ihm geworden ist? Ich weiß es nicht... er ist nie von seiner Reise zurückgekehrt!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orthanc010", String = "Mein alter Lehrling, Sunder, hat eine Weile nach Amra gesucht! Aber ohne Erfolg. Er hat jetzt eine Schmiede in Liannon! Falls Ihr ihn trefft, grüßt ihn von mir!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			QuestBegin {QuestId = 379}, QuestBegin {QuestId = 380}, SetGlobalFlagTrue {Name = "EpicQuest"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{11;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{11;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{11;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
		}}

	OnAnswer{11;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{11;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{11;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{11;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{11;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{11;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{11;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
		}}

	OnAnswer{11;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{11;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{11;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{11;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orthanc011", String = "Ich könnte Euch eine Waffe schmieden, von der Ihr nicht einmal zu träumen wagt, Krieger! Doch dafür benötige ich Material, das kostbarer ist als ein Königreich!"},
			Answer{Tag = "orthanc011PC", String = "Wovon sprecht Ihr?", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orthanc012", String = "Unter den Untoten im Süden der Windwallberge gibt es einige von solcher Bosheit, dass ihre verdorbene Seele zu Stein geworden ist! Diesen Steinen wohnt eine große, unheilige Kraft inne!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orthanc013", String = "Bringt mir die fünf Seelensteine - und Ihr sollt eine Waffe erhalten, wie Ihr sie noch nicht gesehen habt!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			QuestBegin {QuestId = 469}, QuestBegin {QuestId = 470},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{16;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{16;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{16;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{16;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{16;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{16;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
		}}

	OnAnswer{16;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{16;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{16;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{16;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{16;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{16;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{16;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orthanc014", String = "Wahrhaftig! Die fünf Seelensteine...! Bei den ewigen Feuern des Braga Gor!"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orthanc015", String = "Doch bevor ich sie formen kann, müsst Ihr mir sagen, welche Waffe Ihr wünscht!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orthanc016", String = "Ich könnte eine schwere zweihändige Axt daraus herstellen oder auch ein leichtes Einhandschwert! Die Zauberwirkung der Seelensteine auf beiden wäre identisch!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orthanc017", String = "Oder ich fertige Euch einen Eisenstab, wie er nur von Magiern und Zauberern benutzt wird!"},
			OfferAnswer{Tag = "orthanc017PC", String = "Ich wähle die schwere zweihändige Axt!", AnswerId = 21},
			OfferAnswer{Tag = "orthanc018PC", String = "Ich wähle das leichte einhändige Schwert!", AnswerId = 24},
			OfferAnswer{Tag = "orthanc019PC", String = "Ich wähle den Eisenstab für Magier!", AnswerId = 27},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orthanc018", String = "Wie Ihr wünscht! Da... die Steine verbinden sich... die Axt ist geschmiedet! Hier, nehmt sie!"},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 2384 , Flag = Take},
							TransferItem{TakeItem = 2627 , Flag = Take},
							TransferItem{TakeItem = 2614 , Flag = Take},
							TransferItem{TakeItem = 2386 , Flag = Take},
							TransferItem{TakeItem = 2620 , Flag = Take},
							QuestSolve {QuestId = 471},
							QuestSolve {QuestId = 469},
							SetRewardFlagTrue{ Name = "Seelenschwerter"},
			TransferItem{GiveItem = 3238 , Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{23;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{23;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{23;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
		}}

	OnAnswer{23;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{23;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{23;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{23;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
		}}

	OnAnswer{23;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{23;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{23;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{23;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
		}}

	OnAnswer{23;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{23;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{23;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{23;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orthanc019", String = "So sei es... an Parierstange und Griff... die Kraft der Steine durchströmt den Stahl...! Hier, das Schwert ist vollendet!"},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 2384 , Flag = Take},
							TransferItem{TakeItem = 2627 , Flag = Take},
							TransferItem{TakeItem = 2614 , Flag = Take},
							TransferItem{TakeItem = 2386 , Flag = Take},
							TransferItem{TakeItem = 2620 , Flag = Take},
							QuestSolve {QuestId = 471},
							QuestSolve {QuestId = 469},
							SetRewardFlagTrue{ Name = "Seelenschwerter"},
			TransferItem{GiveItem = 3239 , Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{26;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{26;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{26;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
		}}

	OnAnswer{26;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{26;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{26;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{26;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
		}}

	OnAnswer{26;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{26;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{26;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{26;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
		}}

	OnAnswer{26;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{26;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{26;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{26;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orthanc020", String = "Fünf Seelen beleben das Eisen! Fünf weben den Bann in der Glut...! Hier, nehmt ihn! Der Seelenstab gehört Euch!"},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 2384 , Flag = Take},
							TransferItem{TakeItem = 2627 , Flag = Take},
							TransferItem{TakeItem = 2614 , Flag = Take},
							TransferItem{TakeItem = 2386 , Flag = Take},
							TransferItem{TakeItem = 2620 , Flag = Take},
							QuestSolve {QuestId = 471},
							QuestSolve {QuestId = 469},
							SetRewardFlagTrue{ Name = "Seelenschwerter"},
			TransferItem{GiveItem = 3237 , Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{29;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{29;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{29;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
		}}

	OnAnswer{29;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{29;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{29;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{29;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
		}}

	OnAnswer{29;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{29;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{29;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{29;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
		}}

	OnAnswer{29;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{29;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{29;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{29;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orthanc021", String = "Hmm...  nein, bestenfalls ein Anfang! Daraus kann ich nur leichte, bewegliche Rüstungsteile fertigen!"},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orthanc022", String = "Um einen richtigen Panzer zu erhalten, braucht man auch die Schuppen eines echten Drachen! Nicht nur die eines Drachlings..."},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orthanc023", String = "Solltet Ihr auf Euren Reisen auf einen stoßen - und die Begegnung überleben - dann kommt wieder zu mir! Ich werde Euch einen Drachenpanzer formen!"},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 516} , QuestBegin{QuestId = 517},
						SetRewardFlagTrue{ Name = "Drachenpanzer1"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{34;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{34;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{34;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
		}}

	OnAnswer{34;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{34;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{34;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{34;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
		}}

	OnAnswer{34;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{34;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{34;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{34;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
		}}

	OnAnswer{34;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{34;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{34;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{34;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
		}}

	OnAnswer{34;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{34;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{34;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{34;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
		}}

	OnAnswer{34;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{34;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{34;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{34;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
		}}

	OnAnswer{34;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{34;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{34;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{34;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
		}}

	OnAnswer{34;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{34;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{34;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{34;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orthanc024", String = "Ihr habt einen Drachen erschlagen? Niethalfs Gnade!"},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orthanc025", String = "Dann will ich Euch den Panzer fertigen! Mit all meinem Fleiß und all meinem Wissen!"},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			Say{Tag = "orthanc026", String = "Nehmt die Rüstung, sie gebührt Euch! Es ist mir eine Ehre, für Euch zu schmieden!"},
			Answer{Tag = "", String = "", AnswerId = 38},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 518}, QuestSolve{QuestId = 515},
						TransferItem{TakeItem = 2667 , Flag = Take},
						TransferItem{TakeItem = 2516 , Flag = Take},
						SetRewardFlagTrue{ Name = "Drachenpanzer2"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 39},
		}}

	OnAnswer{39;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{39;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{39;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{39;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
		}}

	OnAnswer{39;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{39;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{39;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{39;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
		}}

	OnAnswer{39;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{39;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{39;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{39;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
		}}

	OnAnswer{39;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{39;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{39;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{39;
		Conditions = {
			UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"}),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc005PC", String = "Fertigt Ihr auch Rüstungen, Orthanc?", AnswerId = 5},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			QuestState {QuestId = 469, State = StateUnknown},
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc010PC", String = "Könnt Ihr mir eine gute Waffe schmieden?", AnswerId = 12},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			QuestState {QuestId = 471, State = StateActive},
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc013PC", String = "Ich habe alle fünf Seelensteine gefunden!", AnswerId = 17},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive}),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc020PC", String = "Sind Drachlingschuppen Material genug für eine Rüstung?", AnswerId = 30},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			QuestState{QuestId = 518 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "orthanc023PC", String = "Ich habe hier die Schuppen eines echten Drachen!", AnswerId = 35},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(UND(Negated(QuestState {QuestId = 110, State = StateUnknown}), IsGlobalFlagFalse {Name = "EpicQuest"})),
			Negated(QuestState {QuestId = 469, State = StateUnknown}),
			Negated(QuestState {QuestId = 471, State = StateActive}),
			Negated(UND(Negated(QuestState{QuestId = 379 , State = StateUnknown}) , QuestState{QuestId = 516 , State = StateActive})),
			Negated(QuestState{QuestId = 518 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end