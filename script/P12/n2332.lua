-->INFO: morton
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 2, Conditions = {IsGlobalFlagFalse{Name = "Q199MortonGotoThurgon"}}}
--!EDS ONIDLEGOHOME END



-- Zu Thurgon gehen
OnIdleGoHome{WalkMode = Walk, X = 225, Y = 301, Direction = 3 , Conditions = {IsGlobalFlagTrue{Name = "Q199MortonGotoThurgon"}}}

--!EDS RESPAWN BEGIN
Respawn{WaitTime=60}
--!EDS RESPAWN END


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
-- Source: C:\project\main\mission\dialoge\p12\n2332_morton.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagMortonKnown"},
		},
		Actions = {
			Say{Tag = "morton001", String = "Ich grüße Euch im Namen des Ordens! Ich hoffe, Ihr seid gekommen, um uns zu helfen?"},
			Answer{Tag = "morton001PC", String = "Welche Hilfe benötigt Ihr?", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMortonKnown"}),
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "morton003", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMortonKnown"}),
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "morton003", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMortonKnown"}),
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "morton003", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMortonKnown"}),
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "morton003", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMortonKnown"}),
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "morton003", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMortonKnown"}),
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "morton003", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMortonKnown"}),
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "morton003", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMortonKnown"}),
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "morton003", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMortonKnown"}),
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "morton003", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMortonKnown"}),
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "morton003", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMortonKnown"}),
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "morton003", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMortonKnown"}),
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "morton003", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMortonKnown"}),
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "morton003", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMortonKnown"}),
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "morton003", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMortonKnown"}),
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "morton003", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMortonKnown"}),
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "morton003", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMortonKnown"}),
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "morton003", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMortonKnown"}),
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "morton003", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMortonKnown"}),
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "morton003", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMortonKnown"}),
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "morton003", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMortonKnown"}),
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "morton003", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMortonKnown"}),
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "morton003", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMortonKnown"}),
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "morton003", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMortonKnown"}),
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "morton003", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMortonKnown"}),
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "morton003", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMortonKnown"}),
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "morton003", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMortonKnown"}),
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "morton003", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMortonKnown"}),
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "morton003", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMortonKnown"}),
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "morton003", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMortonKnown"}),
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "morton003", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMortonKnown"}),
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "morton003", String = "Grüße, Freund!"},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMortonKnown"}),
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "morton003", String = "Grüße, Freund!"},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMortonKnown"},
			Say{Tag = "morton002", String = "Die Untoten belagern uns schon lange! So lange sie außerhalb der Mauern bleiben, können wir durchhalten! Doch vor eingen Tagen gelangten sie durch einen der Geheimgänge in die Festung! Es war grauenhaft..."},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMortonKnown"},
			Say{Tag = "morton002", String = "Die Untoten belagern uns schon lange! So lange sie außerhalb der Mauern bleiben, können wir durchhalten! Doch vor eingen Tagen gelangten sie durch einen der Geheimgänge in die Festung! Es war grauenhaft..."},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMortonKnown"},
			Say{Tag = "morton002", String = "Die Untoten belagern uns schon lange! So lange sie außerhalb der Mauern bleiben, können wir durchhalten! Doch vor eingen Tagen gelangten sie durch einen der Geheimgänge in die Festung! Es war grauenhaft..."},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMortonKnown"},
			Say{Tag = "morton002", String = "Die Untoten belagern uns schon lange! So lange sie außerhalb der Mauern bleiben, können wir durchhalten! Doch vor eingen Tagen gelangten sie durch einen der Geheimgänge in die Festung! Es war grauenhaft..."},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMortonKnown"},
			Say{Tag = "morton002", String = "Die Untoten belagern uns schon lange! So lange sie außerhalb der Mauern bleiben, können wir durchhalten! Doch vor eingen Tagen gelangten sie durch einen der Geheimgänge in die Festung! Es war grauenhaft..."},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMortonKnown"},
			Say{Tag = "morton002", String = "Die Untoten belagern uns schon lange! So lange sie außerhalb der Mauern bleiben, können wir durchhalten! Doch vor eingen Tagen gelangten sie durch einen der Geheimgänge in die Festung! Es war grauenhaft..."},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMortonKnown"},
			Say{Tag = "morton002", String = "Die Untoten belagern uns schon lange! So lange sie außerhalb der Mauern bleiben, können wir durchhalten! Doch vor eingen Tagen gelangten sie durch einen der Geheimgänge in die Festung! Es war grauenhaft..."},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMortonKnown"},
			Say{Tag = "morton002", String = "Die Untoten belagern uns schon lange! So lange sie außerhalb der Mauern bleiben, können wir durchhalten! Doch vor eingen Tagen gelangten sie durch einen der Geheimgänge in die Festung! Es war grauenhaft..."},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMortonKnown"},
			Say{Tag = "morton002", String = "Die Untoten belagern uns schon lange! So lange sie außerhalb der Mauern bleiben, können wir durchhalten! Doch vor eingen Tagen gelangten sie durch einen der Geheimgänge in die Festung! Es war grauenhaft..."},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMortonKnown"},
			Say{Tag = "morton002", String = "Die Untoten belagern uns schon lange! So lange sie außerhalb der Mauern bleiben, können wir durchhalten! Doch vor eingen Tagen gelangten sie durch einen der Geheimgänge in die Festung! Es war grauenhaft..."},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMortonKnown"},
			Say{Tag = "morton002", String = "Die Untoten belagern uns schon lange! So lange sie außerhalb der Mauern bleiben, können wir durchhalten! Doch vor eingen Tagen gelangten sie durch einen der Geheimgänge in die Festung! Es war grauenhaft..."},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMortonKnown"},
			Say{Tag = "morton002", String = "Die Untoten belagern uns schon lange! So lange sie außerhalb der Mauern bleiben, können wir durchhalten! Doch vor eingen Tagen gelangten sie durch einen der Geheimgänge in die Festung! Es war grauenhaft..."},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMortonKnown"},
			Say{Tag = "morton002", String = "Die Untoten belagern uns schon lange! So lange sie außerhalb der Mauern bleiben, können wir durchhalten! Doch vor eingen Tagen gelangten sie durch einen der Geheimgänge in die Festung! Es war grauenhaft..."},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMortonKnown"},
			Say{Tag = "morton002", String = "Die Untoten belagern uns schon lange! So lange sie außerhalb der Mauern bleiben, können wir durchhalten! Doch vor eingen Tagen gelangten sie durch einen der Geheimgänge in die Festung! Es war grauenhaft..."},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMortonKnown"},
			Say{Tag = "morton002", String = "Die Untoten belagern uns schon lange! So lange sie außerhalb der Mauern bleiben, können wir durchhalten! Doch vor eingen Tagen gelangten sie durch einen der Geheimgänge in die Festung! Es war grauenhaft..."},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMortonKnown"},
			Say{Tag = "morton002", String = "Die Untoten belagern uns schon lange! So lange sie außerhalb der Mauern bleiben, können wir durchhalten! Doch vor eingen Tagen gelangten sie durch einen der Geheimgänge in die Festung! Es war grauenhaft..."},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMortonKnown"},
			Say{Tag = "morton002", String = "Die Untoten belagern uns schon lange! So lange sie außerhalb der Mauern bleiben, können wir durchhalten! Doch vor eingen Tagen gelangten sie durch einen der Geheimgänge in die Festung! Es war grauenhaft..."},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMortonKnown"},
			Say{Tag = "morton002", String = "Die Untoten belagern uns schon lange! So lange sie außerhalb der Mauern bleiben, können wir durchhalten! Doch vor eingen Tagen gelangten sie durch einen der Geheimgänge in die Festung! Es war grauenhaft..."},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMortonKnown"},
			Say{Tag = "morton002", String = "Die Untoten belagern uns schon lange! So lange sie außerhalb der Mauern bleiben, können wir durchhalten! Doch vor eingen Tagen gelangten sie durch einen der Geheimgänge in die Festung! Es war grauenhaft..."},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMortonKnown"},
			Say{Tag = "morton002", String = "Die Untoten belagern uns schon lange! So lange sie außerhalb der Mauern bleiben, können wir durchhalten! Doch vor eingen Tagen gelangten sie durch einen der Geheimgänge in die Festung! Es war grauenhaft..."},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMortonKnown"},
			Say{Tag = "morton002", String = "Die Untoten belagern uns schon lange! So lange sie außerhalb der Mauern bleiben, können wir durchhalten! Doch vor eingen Tagen gelangten sie durch einen der Geheimgänge in die Festung! Es war grauenhaft..."},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMortonKnown"},
			Say{Tag = "morton002", String = "Die Untoten belagern uns schon lange! So lange sie außerhalb der Mauern bleiben, können wir durchhalten! Doch vor eingen Tagen gelangten sie durch einen der Geheimgänge in die Festung! Es war grauenhaft..."},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMortonKnown"},
			Say{Tag = "morton002", String = "Die Untoten belagern uns schon lange! So lange sie außerhalb der Mauern bleiben, können wir durchhalten! Doch vor eingen Tagen gelangten sie durch einen der Geheimgänge in die Festung! Es war grauenhaft..."},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMortonKnown"},
			Say{Tag = "morton002", String = "Die Untoten belagern uns schon lange! So lange sie außerhalb der Mauern bleiben, können wir durchhalten! Doch vor eingen Tagen gelangten sie durch einen der Geheimgänge in die Festung! Es war grauenhaft..."},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMortonKnown"},
			Say{Tag = "morton002", String = "Die Untoten belagern uns schon lange! So lange sie außerhalb der Mauern bleiben, können wir durchhalten! Doch vor eingen Tagen gelangten sie durch einen der Geheimgänge in die Festung! Es war grauenhaft..."},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMortonKnown"},
			Say{Tag = "morton002", String = "Die Untoten belagern uns schon lange! So lange sie außerhalb der Mauern bleiben, können wir durchhalten! Doch vor eingen Tagen gelangten sie durch einen der Geheimgänge in die Festung! Es war grauenhaft..."},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMortonKnown"},
			Say{Tag = "morton002", String = "Die Untoten belagern uns schon lange! So lange sie außerhalb der Mauern bleiben, können wir durchhalten! Doch vor eingen Tagen gelangten sie durch einen der Geheimgänge in die Festung! Es war grauenhaft..."},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMortonKnown"},
			Say{Tag = "morton002", String = "Die Untoten belagern uns schon lange! So lange sie außerhalb der Mauern bleiben, können wir durchhalten! Doch vor eingen Tagen gelangten sie durch einen der Geheimgänge in die Festung! Es war grauenhaft..."},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMortonKnown"},
			Say{Tag = "morton002", String = "Die Untoten belagern uns schon lange! So lange sie außerhalb der Mauern bleiben, können wir durchhalten! Doch vor eingen Tagen gelangten sie durch einen der Geheimgänge in die Festung! Es war grauenhaft..."},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMortonKnown"},
			Say{Tag = "morton002", String = "Die Untoten belagern uns schon lange! So lange sie außerhalb der Mauern bleiben, können wir durchhalten! Doch vor eingen Tagen gelangten sie durch einen der Geheimgänge in die Festung! Es war grauenhaft..."},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMortonKnown"},
			Say{Tag = "morton002", String = "Die Untoten belagern uns schon lange! So lange sie außerhalb der Mauern bleiben, können wir durchhalten! Doch vor eingen Tagen gelangten sie durch einen der Geheimgänge in die Festung! Es war grauenhaft..."},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMortonKnown"},
			Say{Tag = "morton002", String = "Die Untoten belagern uns schon lange! So lange sie außerhalb der Mauern bleiben, können wir durchhalten! Doch vor eingen Tagen gelangten sie durch einen der Geheimgänge in die Festung! Es war grauenhaft..."},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "morton004", String = "Die Geheimgänge sind damals von den Zwergen als Fluchttunnel gegraben worden! Nur wenigen ist ihre Existenz überhaupt bekannt!"},
			Answer{Tag = "morton004PC", String = "Haben die Untoten sie durch Zufall entdeckt?", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "morton005", String = "Unmöglich - bei zwergischer Arbeit! Jemand aus der Feste muss uns verraten haben!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "morton006", String = "Wir haben den Gang verschüttet und Wachen davor postiert! Aber solange noch ein Verräter unter uns weilt, können wir keine Ruhe finden!"},
			Answer{Tag = "morton006PC", String = "Habt Ihr einen Verdacht?", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "morton007", String = "Nein! Es muss einer der Zauberer oder der Kommandanten sein!"},
			Answer{Tag = "morton007PC", String = "Wenn ich auf Hinweise stoße, lasse ich es Euch wissen!", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 199} , QuestBegin{QuestId = 200},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "morton008", String = "Woher stammt sie?"},
			Answer{Tag = "morton008PC", String = "Aus einem Lager der Untoten im Norden! Seht Ihr... hier und hier... die eingezeichneten Stollen...", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "morton009", String = "Verflucht! Diese Karte zeigt die exakte Lage der Geheimgänge und wo sie betreten werden können! Aber wer hat sie gezeichnet? Diese Schrift... hm, ich kenne sie nicht..."},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 201}, QuestBegin{QuestId = 222},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(ODER(QuestState{QuestId = 202 , State = StateActive} , UND(PlayerHasItem{ItemId = 2628}, PlayerHasItem{ItemId = 2616}))),
		},
		Actions = {
			Say{Tag = "morton014", String = "Ja?"},
			Answer{Tag = "morton014PC", String = "Ich werde nach Hinweisen suchen, die über die Herkunft der Karte Aufschluss geben!", AnswerId = 18},
		}}

	OnAnswer{12;
		Conditions = {
			ODER(QuestState{QuestId = 202 , State = StateActive} , UND(PlayerHasItem{ItemId = 2628}, PlayerHasItem{ItemId = 2616})),
		},
		Actions = {
			Say{Tag = "morton010", String = "Ja?"},
			Answer{Tag = "morton010PC", String = "Ich habe sie erkannt! Thurgon gab mir einen Brief! Seht Ihr hier... die Anschrift?", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "morton011", String = "Ihr habt recht! Das ist Thurgons Schrift! Bei den Göttern, nie hätte ich..."},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "morton012", String = "Nun, wie dem auch sei! Ich will wissen, warum er diesen grauenvollen Verrat begangen hat!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "morton013", String = "Folgt mir! Wir werden ihn aufsuchen! Ihr müsst ihn mit diesem Beweismaterial konfrontieren!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 203} , QuestSolve{QuestId = 222} , QuestSolve{QuestId = 202} , QuestSolve{QuestId = 200},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "morton015", String = "Tut das! Ich hoffe, wir hören von Euch!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{19;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{19;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{19;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
		}}

	OnAnswer{19;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{19;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{19;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{19;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
		}}

	OnAnswer{19;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{19;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{19;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{19;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
		}}

	OnAnswer{19;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{19;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{19;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{19;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "morton016", String = "Ihr müsst ihn mit dem Brief und dem Plan konfrontieren! Stellt ihn zur Rede! Es liegt in Eurer Hand - Ihr habt die Beweismittel!"},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "morton017", String = "Eine gerechte Strafe! Er hat mit dem Tod Handel getrieben - nun ist er ihm selbst zum Opfer gefallen!"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "morton018", String = "Ich danke Euch! Auch wenn es ein trauriger Dienst war, den Ihr vollbringen musstet!"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			SetRewardFlagTrue{ Name = "Verraeter"},
				QuestSolve{QuestId = 205} , QuestSolve{QuestId = 199} , RemoveDialog{},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 199 , State = StateUnknown},
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton003PC", String = "Wie konnten die Untoten ins Innere der Festung gelangen?", AnswerId = 2},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			QuestState{QuestId = 201 , State = StateActive},
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton007PCa", String = "Ich habe diese Karte gefunden!", AnswerId = 8},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			QuestState{QuestId = 222 , State = StateActive},
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton009PC", String = "Diese Schrift auf der Karte...", AnswerId = 12},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			QuestState{QuestId = 204 , State = StateActive},
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton015PC", String = "Was geschieht wegen Thurgon?", AnswerId = 20},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			QuestState{QuestId = 205 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "morton016PC", String = "Thurgon ist tot!", AnswerId = 22},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 199 , State = StateUnknown}),
			Negated(QuestState{QuestId = 201 , State = StateActive}),
			Negated(QuestState{QuestId = 222 , State = StateActive}),
			Negated(QuestState{QuestId = 204 , State = StateActive}),
			Negated(QuestState{QuestId = 205 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end