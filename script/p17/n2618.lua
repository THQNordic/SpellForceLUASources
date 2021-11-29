-->INFO: cord
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 3}
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
-- Source: C:\project\main\mission\dialoge\p17\n2618_cord.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "FlagCordKnown"},
		},
		Actions = {
			Say{Tag = "cordGW001", String = "Endlich gerettet! Die rote Legion dankt Euch für Eure Hilfe!"},
			Answer{Tag = "cordGW001PC", String = "Wo ist diese rote Legion, von der Ihr sprecht?", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagCordKnown"}),
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "cordGW003", String = "Ich grüße Euch!"},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagCordKnown"}),
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "cordGW003", String = "Ich grüße Euch!"},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagCordKnown"}),
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "cordGW003", String = "Ich grüße Euch!"},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagCordKnown"}),
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "cordGW003", String = "Ich grüße Euch!"},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagCordKnown"}),
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "cordGW003", String = "Ich grüße Euch!"},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagCordKnown"}),
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "cordGW003", String = "Ich grüße Euch!"},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagCordKnown"}),
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "cordGW003", String = "Ich grüße Euch!"},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagCordKnown"}),
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "cordGW003", String = "Ich grüße Euch!"},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagCordKnown"}),
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "cordGW003", String = "Ich grüße Euch!"},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagCordKnown"}),
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "cordGW003", String = "Ich grüße Euch!"},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagCordKnown"}),
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "cordGW003", String = "Ich grüße Euch!"},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagCordKnown"}),
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "cordGW003", String = "Ich grüße Euch!"},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagCordKnown"}),
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "cordGW003", String = "Ich grüße Euch!"},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagCordKnown"}),
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "cordGW003", String = "Ich grüße Euch!"},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagCordKnown"}),
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "cordGW003", String = "Ich grüße Euch!"},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagCordKnown"}),
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "cordGW003", String = "Ich grüße Euch!"},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagCordKnown"}),
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "cordGW003", String = "Ich grüße Euch!"},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagCordKnown"}),
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "cordGW003", String = "Ich grüße Euch!"},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagCordKnown"}),
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "cordGW003", String = "Ich grüße Euch!"},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagCordKnown"}),
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "cordGW003", String = "Ich grüße Euch!"},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagCordKnown"}),
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "cordGW003", String = "Ich grüße Euch!"},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagCordKnown"}),
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "cordGW003", String = "Ich grüße Euch!"},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagCordKnown"}),
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "cordGW003", String = "Ich grüße Euch!"},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagCordKnown"}),
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "cordGW003", String = "Ich grüße Euch!"},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagCordKnown"}),
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "cordGW003", String = "Ich grüße Euch!"},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagCordKnown"}),
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "cordGW003", String = "Ich grüße Euch!"},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagCordKnown"}),
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "cordGW003", String = "Ich grüße Euch!"},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagCordKnown"}),
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "cordGW003", String = "Ich grüße Euch!"},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagCordKnown"}),
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "cordGW003", String = "Ich grüße Euch!"},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagCordKnown"}),
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "cordGW003", String = "Ich grüße Euch!"},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagCordKnown"}),
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "cordGW003", String = "Ich grüße Euch!"},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagCordKnown"}),
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "cordGW003", String = "Ich grüße Euch!"},
		}}

	OnAnswer{1;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagCordKnown"},
			Say{Tag = "cordGW002", String = "Diese Hunde haben alle meine Männer niedergemetzelt! Nur mich haben sie als Geisel verschont! Als Geisel für die große Schlacht um Farlorns Heim!"},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagCordKnown"},
			Say{Tag = "cordGW002", String = "Diese Hunde haben alle meine Männer niedergemetzelt! Nur mich haben sie als Geisel verschont! Als Geisel für die große Schlacht um Farlorns Heim!"},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{1;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagCordKnown"},
			Say{Tag = "cordGW002", String = "Diese Hunde haben alle meine Männer niedergemetzelt! Nur mich haben sie als Geisel verschont! Als Geisel für die große Schlacht um Farlorns Heim!"},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagCordKnown"},
			Say{Tag = "cordGW002", String = "Diese Hunde haben alle meine Männer niedergemetzelt! Nur mich haben sie als Geisel verschont! Als Geisel für die große Schlacht um Farlorns Heim!"},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
		}}

	OnAnswer{1;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagCordKnown"},
			Say{Tag = "cordGW002", String = "Diese Hunde haben alle meine Männer niedergemetzelt! Nur mich haben sie als Geisel verschont! Als Geisel für die große Schlacht um Farlorns Heim!"},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagCordKnown"},
			Say{Tag = "cordGW002", String = "Diese Hunde haben alle meine Männer niedergemetzelt! Nur mich haben sie als Geisel verschont! Als Geisel für die große Schlacht um Farlorns Heim!"},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{1;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagCordKnown"},
			Say{Tag = "cordGW002", String = "Diese Hunde haben alle meine Männer niedergemetzelt! Nur mich haben sie als Geisel verschont! Als Geisel für die große Schlacht um Farlorns Heim!"},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagCordKnown"},
			Say{Tag = "cordGW002", String = "Diese Hunde haben alle meine Männer niedergemetzelt! Nur mich haben sie als Geisel verschont! Als Geisel für die große Schlacht um Farlorns Heim!"},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
		}}

	OnAnswer{1;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagCordKnown"},
			Say{Tag = "cordGW002", String = "Diese Hunde haben alle meine Männer niedergemetzelt! Nur mich haben sie als Geisel verschont! Als Geisel für die große Schlacht um Farlorns Heim!"},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagCordKnown"},
			Say{Tag = "cordGW002", String = "Diese Hunde haben alle meine Männer niedergemetzelt! Nur mich haben sie als Geisel verschont! Als Geisel für die große Schlacht um Farlorns Heim!"},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{1;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagCordKnown"},
			Say{Tag = "cordGW002", String = "Diese Hunde haben alle meine Männer niedergemetzelt! Nur mich haben sie als Geisel verschont! Als Geisel für die große Schlacht um Farlorns Heim!"},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagCordKnown"},
			Say{Tag = "cordGW002", String = "Diese Hunde haben alle meine Männer niedergemetzelt! Nur mich haben sie als Geisel verschont! Als Geisel für die große Schlacht um Farlorns Heim!"},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
		}}

	OnAnswer{1;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagCordKnown"},
			Say{Tag = "cordGW002", String = "Diese Hunde haben alle meine Männer niedergemetzelt! Nur mich haben sie als Geisel verschont! Als Geisel für die große Schlacht um Farlorns Heim!"},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagCordKnown"},
			Say{Tag = "cordGW002", String = "Diese Hunde haben alle meine Männer niedergemetzelt! Nur mich haben sie als Geisel verschont! Als Geisel für die große Schlacht um Farlorns Heim!"},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{1;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagCordKnown"},
			Say{Tag = "cordGW002", String = "Diese Hunde haben alle meine Männer niedergemetzelt! Nur mich haben sie als Geisel verschont! Als Geisel für die große Schlacht um Farlorns Heim!"},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagCordKnown"},
			Say{Tag = "cordGW002", String = "Diese Hunde haben alle meine Männer niedergemetzelt! Nur mich haben sie als Geisel verschont! Als Geisel für die große Schlacht um Farlorns Heim!"},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagCordKnown"},
			Say{Tag = "cordGW002", String = "Diese Hunde haben alle meine Männer niedergemetzelt! Nur mich haben sie als Geisel verschont! Als Geisel für die große Schlacht um Farlorns Heim!"},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagCordKnown"},
			Say{Tag = "cordGW002", String = "Diese Hunde haben alle meine Männer niedergemetzelt! Nur mich haben sie als Geisel verschont! Als Geisel für die große Schlacht um Farlorns Heim!"},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagCordKnown"},
			Say{Tag = "cordGW002", String = "Diese Hunde haben alle meine Männer niedergemetzelt! Nur mich haben sie als Geisel verschont! Als Geisel für die große Schlacht um Farlorns Heim!"},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagCordKnown"},
			Say{Tag = "cordGW002", String = "Diese Hunde haben alle meine Männer niedergemetzelt! Nur mich haben sie als Geisel verschont! Als Geisel für die große Schlacht um Farlorns Heim!"},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagCordKnown"},
			Say{Tag = "cordGW002", String = "Diese Hunde haben alle meine Männer niedergemetzelt! Nur mich haben sie als Geisel verschont! Als Geisel für die große Schlacht um Farlorns Heim!"},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagCordKnown"},
			Say{Tag = "cordGW002", String = "Diese Hunde haben alle meine Männer niedergemetzelt! Nur mich haben sie als Geisel verschont! Als Geisel für die große Schlacht um Farlorns Heim!"},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagCordKnown"},
			Say{Tag = "cordGW002", String = "Diese Hunde haben alle meine Männer niedergemetzelt! Nur mich haben sie als Geisel verschont! Als Geisel für die große Schlacht um Farlorns Heim!"},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagCordKnown"},
			Say{Tag = "cordGW002", String = "Diese Hunde haben alle meine Männer niedergemetzelt! Nur mich haben sie als Geisel verschont! Als Geisel für die große Schlacht um Farlorns Heim!"},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagCordKnown"},
			Say{Tag = "cordGW002", String = "Diese Hunde haben alle meine Männer niedergemetzelt! Nur mich haben sie als Geisel verschont! Als Geisel für die große Schlacht um Farlorns Heim!"},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagCordKnown"},
			Say{Tag = "cordGW002", String = "Diese Hunde haben alle meine Männer niedergemetzelt! Nur mich haben sie als Geisel verschont! Als Geisel für die große Schlacht um Farlorns Heim!"},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagCordKnown"},
			Say{Tag = "cordGW002", String = "Diese Hunde haben alle meine Männer niedergemetzelt! Nur mich haben sie als Geisel verschont! Als Geisel für die große Schlacht um Farlorns Heim!"},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagCordKnown"},
			Say{Tag = "cordGW002", String = "Diese Hunde haben alle meine Männer niedergemetzelt! Nur mich haben sie als Geisel verschont! Als Geisel für die große Schlacht um Farlorns Heim!"},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagCordKnown"},
			Say{Tag = "cordGW002", String = "Diese Hunde haben alle meine Männer niedergemetzelt! Nur mich haben sie als Geisel verschont! Als Geisel für die große Schlacht um Farlorns Heim!"},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagCordKnown"},
			Say{Tag = "cordGW002", String = "Diese Hunde haben alle meine Männer niedergemetzelt! Nur mich haben sie als Geisel verschont! Als Geisel für die große Schlacht um Farlorns Heim!"},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagCordKnown"},
			Say{Tag = "cordGW002", String = "Diese Hunde haben alle meine Männer niedergemetzelt! Nur mich haben sie als Geisel verschont! Als Geisel für die große Schlacht um Farlorns Heim!"},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagCordKnown"},
			Say{Tag = "cordGW002", String = "Diese Hunde haben alle meine Männer niedergemetzelt! Nur mich haben sie als Geisel verschont! Als Geisel für die große Schlacht um Farlorns Heim!"},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "cordGW004", String = "In der Tat! Wir, die rote Legion, kämpfen schon lange mit den Briarwölfen um dieses Land! Es befindet sich jenseits von Mulandir. Farlorns Heim beherbergt eine der letzen großen Wasserquellen dieser Region!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "cordGW005", String = "Unser Stützpunkt befindet sich dort! Und dort wird sich auch die Schlacht um die Düsterlande entscheiden! "},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "cordGW006", String = "Mit den Wölfen vor uns und Urams alten Dämonenhorden im Rücken bleibt uns allerdings nur noch wenig Hoffnung!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "cordGW007", String = "Warum lenkt Ihr Eure Schritte nicht nach Farlorns Heim? Jemand wie Euch können wir brauchen!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "BattleAsked"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{7;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
		}}

	OnAnswer{7;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{7;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
		}}

	OnAnswer{7;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{7;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
		}}

	OnAnswer{7;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{7;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "cordGW008", String = "Sie sind das Zeichen der Briarwölfe! Jeder, der eines trägt, hat Anrecht auf einen Teil der Beute!"},
			Answer{Tag = "cordGW008PC", String = "Dann sollte ich wohl meinen Anteil einfordern!", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "cordGW009", String = "Wenn Ihr in Schmerz und Tod bezahlt werden wollt, nur zu! Ihr würdet bei den Wölfen kaum Freunde finden!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "cordGW010", String = "Aber der Kommandant der roten Legion, Halicos, zahlt ein Kopfgeld für jedes Wolfzeichen, das wir ihm bringen! Er wird Euch sicher den selben Preis zahlen! Ihr findet ihn bei unserer Garnison in Farlorns Heim!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 266} , QuestBegin{QuestId = 267} , SetNpcFlagTrue{Name = "SignAsked"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{12;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{12;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{12;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{12;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
		}}

	OnAnswer{12;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{12;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{12;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{12;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{12;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "cordGW011", String = "Einst waren wir Urams Streitmacht im Konvokationskrieg! Unter seinem Banner zogen wir gegen Hokans untote Horden und hielten den Gottwall gegen ihren Ansturm!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "cordGW012", String = "Mit den Jahren des Krieges beschwor Uram jedoch immer mehr Dämonen in seinen Dienst! Wir wurden zu Handlangern der roten Horde!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "cordGW013", String = "Als es ihm gelang, den großen Dämonen Ulather unter seinen Willen zu zwingen, war unser Sieg zum Greifen nah! Doch dann brach die Konvokation herein! Heute ist Ulather von unserem Verbündetem zu unserem Jäger geworden..."},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "cordGW014", String = "Seine Schergen rücken immer weiter vor, auf der Suche nach Fleisch!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "INFOUlather"} , SetNpcFlagTrue{Name = "LegionAsked"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{18;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{18;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
		}}

	OnAnswer{18;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{18;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{18;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
		}}

	OnAnswer{18;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{18;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{18;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
		}}

	OnAnswer{18;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{18;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{18;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "cordGW015", String = "Er ist einer der großen Dämonen, ein Anführer der roten Horde! Uram beschwor ihn und zwang ihn, seine Diener aus der Tiefe gegen Urams Rivalen Hokan zu senden!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "cordGW016", String = "Ulather warf mit seiner Horde Hokans Armeen zunächst zurück! Doch man munkelt, Hokan habe daraufhin seinerseits eine noch schrecklichere Armee heraufbeschworen!"},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "INFOBladesCord"} , SetNpcFlagTrue{Name = "UlatherAsked"},
			Say{Tag = "cordGW017", String = "Jetzt ist der Krieg vorbei! Uram ist tot und Ulather ohne Meister! So verwüsten seine Horden das Land und vernichten alles Leben, das nicht von Rauch und Asche erstickt wird!"},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{22;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
		}}

	OnAnswer{22;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{22;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
		}}

	OnAnswer{22;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{22;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
		}}

	OnAnswer{22;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{22;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "cordGW018", String = "Ich war nicht dort und nur wenige haben die Schlacht um Kaith Halur überlebt! Sie berichteten von kreischenden Ungetümen aus schwarzem Eisen, die grauenvoll unter unseren Reihen wüteten..."},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "cordGW019", String = "Fragt Kommandant Halicos in Farlorns Heim! Er war in jener Schlacht dabei! Auch wenn er sich nicht gern daran erinnern wird..."},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "INFOBladesAskHalicos"} , SetNpcFlagTrue{Name = "BladesAsked"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{26;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{26;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{26;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
		}}

	OnAnswer{26;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{26;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{26;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{26;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
		}}

	OnAnswer{26;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{26;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{26;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{26;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
		}}

	OnAnswer{26;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{26;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{26;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{26;
		Conditions = {
			UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW003PC", String = "Eine Schlacht um Farlorns Heim?", AnswerId = 2},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"}),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW007PC", String = "Was bedeuten diese Wolfsabzeichen?", AnswerId = 8},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			IsNpcFlagFalse{Name = "LegionAsked"},
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW010PC", String = "Was ist die rote Legion eigentlich?", AnswerId = 13},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW014PC", String = "Wer ist Ulather?", AnswerId = 19},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cordGW017PC", String = "Was genau hat Hokan Ulather entgegen geworfen?", AnswerId = 23},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(UND(QuestState{QuestId = 268 , State = StateUnknown} , IsNpcFlagFalse{Name = "BattleAsked"})),
			Negated(UND(PlayerHasItem{ItemId = 2630} ,IsNpcFlagFalse{Name = "SignAsked"})),
			Negated(IsNpcFlagFalse{Name = "LegionAsked"}),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOUlather"} , IsNpcFlagFalse{Name = "UlatherAsked"})),
			Negated(UND(IsPlayerFlagTrue{Name = "INFOBladesCord"} ,IsNpcFlagFalse{Name = "BladesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end