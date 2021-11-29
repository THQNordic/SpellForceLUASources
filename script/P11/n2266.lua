-->INFO: DeepOne
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 7}
--!EDS ONIDLEGOHOME END

--!EDS RESPAWN BEGIN
Respawn{WaitTime=360}
--!EDS RESPAWN END


--initial
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
-- Source: C:\project\main\mission\dialoge\p11\n2266_DeepOne.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagDeepOneKnown"},
		},
		Actions = {
			Say{Tag = "deepOne001", String = "Es ist lange her, dass ein Abgesandter der Völker uns aufgesucht hat!"},
			Answer{Tag = "deepOne001PC", String = "Ihr seid keine einfachen Elementargeister!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDeepOneKnown"}),
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "deepOne004", String = "Was wollt ihr, Mensch?"},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDeepOneKnown"}),
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "deepOne004", String = "Was wollt ihr, Mensch?"},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDeepOneKnown"}),
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "deepOne004", String = "Was wollt ihr, Mensch?"},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDeepOneKnown"}),
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "deepOne004", String = "Was wollt ihr, Mensch?"},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDeepOneKnown"}),
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "deepOne004", String = "Was wollt ihr, Mensch?"},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDeepOneKnown"}),
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "deepOne004", String = "Was wollt ihr, Mensch?"},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDeepOneKnown"}),
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "deepOne004", String = "Was wollt ihr, Mensch?"},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDeepOneKnown"}),
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "deepOne004", String = "Was wollt ihr, Mensch?"},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDeepOneKnown"}),
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "deepOne004", String = "Was wollt ihr, Mensch?"},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDeepOneKnown"}),
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "deepOne004", String = "Was wollt ihr, Mensch?"},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDeepOneKnown"}),
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "deepOne004", String = "Was wollt ihr, Mensch?"},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDeepOneKnown"}),
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "deepOne004", String = "Was wollt ihr, Mensch?"},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDeepOneKnown"}),
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "deepOne004", String = "Was wollt ihr, Mensch?"},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDeepOneKnown"}),
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "deepOne004", String = "Was wollt ihr, Mensch?"},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDeepOneKnown"}),
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "deepOne004", String = "Was wollt ihr, Mensch?"},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDeepOneKnown"}),
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "deepOne004", String = "Was wollt ihr, Mensch?"},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDeepOneKnown"}),
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "deepOne004", String = "Was wollt ihr, Mensch?"},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDeepOneKnown"}),
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "deepOne004", String = "Was wollt ihr, Mensch?"},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDeepOneKnown"}),
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "deepOne004", String = "Was wollt ihr, Mensch?"},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDeepOneKnown"}),
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "deepOne004", String = "Was wollt ihr, Mensch?"},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDeepOneKnown"}),
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "deepOne004", String = "Was wollt ihr, Mensch?"},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDeepOneKnown"}),
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "deepOne004", String = "Was wollt ihr, Mensch?"},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDeepOneKnown"}),
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "deepOne004", String = "Was wollt ihr, Mensch?"},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDeepOneKnown"}),
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "deepOne004", String = "Was wollt ihr, Mensch?"},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDeepOneKnown"}),
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "deepOne004", String = "Was wollt ihr, Mensch?"},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDeepOneKnown"}),
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "deepOne004", String = "Was wollt ihr, Mensch?"},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDeepOneKnown"}),
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "deepOne004", String = "Was wollt ihr, Mensch?"},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDeepOneKnown"}),
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "deepOne004", String = "Was wollt ihr, Mensch?"},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDeepOneKnown"}),
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "deepOne004", String = "Was wollt ihr, Mensch?"},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDeepOneKnown"}),
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "deepOne004", String = "Was wollt ihr, Mensch?"},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDeepOneKnown"}),
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "deepOne004", String = "Was wollt ihr, Mensch?"},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDeepOneKnown"}),
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "deepOne004", String = "Was wollt ihr, Mensch?"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "deepOne002", String = "Wir sind die Diener der Tiefe, die Schmiede Niethalfs! Vor langer Zeit dienten wir den Zwergen dieses Landes!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagDeepOneKnown"},
			Say{Tag = "deepOne003", String = "Für sie formten wir die mächtigen Klingen der Erde! Aber ein Streit brach unseren Bund und brachte einen Fluch über das Land!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "deepOne005", String = "Wenn Ihr den Preis dafür bezahlt!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "deepOne006", String = "Unter dem Befehl des Zirkels brachen die Zwerge unseren Bund und schürften an Stellen, die ihnen verboten waren! Sie beschworen den Zorn der Felsen herauf und wurden vernichtet!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "deepOne007", String = "Bevor wir den Völkern wieder dienen können, muss dieser alte Fluch bezwungen werden! Ihr müsst euch dem Zorn der Felsen stellen!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "deepOne008", String = "Darüber hinaus erfordert die Fertigung der Klinge viele seltene Metalle. Es wären wohl 300 Brocken Eures Eisenvorrates dafür notwendig!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 269}, QuestSolve{QuestId = 482},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(PlayerHasGood{Good = GoodIron, Amount = 300 , Side = SideLight , Player = self , UpdateInterval = 10}),
		},
		Actions = {
			Say{Tag = "deepOne010", String = "Versucht nicht, uns zu täuschen! Kommt erst wieder, wenn Ihr 300 Brocken zusammen habt!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{10;
		Conditions = {
			PlayerHasGood{Good = GoodIron, Amount = 300 , Side = SideLight , Player = self , UpdateInterval = 10},
		},
		Actions = {
			Say{Tag = "deepOne009", String = "Gut, wir werden mit dem Schmieden beginnen, sobald Ihr bereit seid! Denkt an den Fluch, dem Ihr Euch stellen müsst! Seid Ihr bereit?"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 269}, SetGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			SetRewardFlagTrue{ Name = "Erdklinge11"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "deepOne011", String = "Dann höre: sobald ich beginne, die Klinge zu formen, werden fünf der steinernen Wächter erwachen! Sie werden den Zorn der Felsen heraufbeschwören! Ihr müsst sie aufhalten!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 167} , SetGlobalFlagFalse{Name = "Q166SetReadyForWrath"}, 
			SetGlobalFlagTrue{Name = "Q166CutsceneFlag"},
			Say{Tag = "deepOne012", String = "Bezwingt die Wächter, bevor die Beschwörung zu Ende ist oder Ihr werdet vernichtet werden!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "deepOne013", String = "Und lasst auch Eure Güter nicht unbewacht! Einige der Steinernen werden versuchen, Euch aufzuhalten! Kehrt  zurück, sobald Ihr die Wächter bezwungen habt! Die Klinge wird fertig sein!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "deepOne014", String = "Ihr habt den Fluch bezwungen! So nehmt den Preis: diese Klinge wurde mit der Kraft der Erde für Euch geformt! Sie soll unseren neuen Bund besiegeln!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 3556 , Amount = 1 , Flag = Give} ,
					QuestSolve{QuestId = 168}, QuestBegin{QuestId = 169},
					SetRewardFlagTrue{ Name = "Erdklinge12"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "deepOne015", String = "Bei Niethalfs Hammer! Ihr habt den Zorn selbst bezwungen! Was sogar die Armeen der Zwerge nicht zu vollbringen vermochten, habt Ihr vollbracht, Menschenkrieger!"},
			Answer{Tag = "deepOne015PC", String = "Ich nehme an, damit gebührt mir der Preis?", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 3556 , Amount = 1 , Flag = Give} , 
							QuestSolve{QuestId = 323}, 
							QuestBegin{QuestId = 169} , 
							TransferItem{TakeItem = 2815 , Amount = 1 , Flag = Take},
							SetRewardFlagTrue{ Name = "Erdklinge12"},
			Say{Tag = "deepOne016", String = "Wohlan denn, empfangt die Klinge der Erde als Zeichen unseres neuen Bundes! Ihr habt Euch ihrer als wahrhaft würdig erwiesen!"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 482 , State = StateActive},
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne004PC", String = "Könnt Ihr eine Erdenklinge für mich formen?", AnswerId = 4},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			QuestState{QuestId = 269 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne008PC", String = "Hier sind die 300 Eisen für die Klinge!", AnswerId = 10},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"},
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne010PC", String = "Ich bin bereit, dem Fluch zu begegnen!", AnswerId = 14},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			QuestState{QuestId = 168 , State = StateActive},
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne013PC", String = "Die Wächter sind besiegt.", AnswerId = 18},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			QuestState{QuestId = 323 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "deepOne014PC", String = "Ich habe den Fluch gebrochen - seht: das Herz das Zorns!", AnswerId = 21},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 482 , State = StateActive}),
			Negated(QuestState{QuestId = 269 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q166SetReadyForWrath"}),
			Negated(QuestState{QuestId = 168 , State = StateActive}),
			Negated(QuestState{QuestId = 323 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end