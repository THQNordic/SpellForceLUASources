-->INFO: Calina
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 3}
--!EDS ONIDLEGOHOME END

--!EDS RESPAWN BEGIN
Respawn{WaitTime=3}
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
-- Source: C:\project\main\mission\dialoge\p6\n1988_Calina.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagCalinaKnown"},
		},
		Actions = {
			Say{Tag = "calina001", String = "Welch hoher Besuch in meinem bescheidenen Hause!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagCalinaKnown"}),
			IsNpcFlagFalse{Name = "CalinaAsked"},
			UND(PlayerHasItem{ItemId = 2383} , QuestState{QuestId = 413 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "calina003", String = "Grüße!"},
			OfferAnswer{Tag = "calina003PC", String = "Was ist Euer Geschäft hier?", AnswerId = 2},
			OfferAnswer{Tag = "calina005PC", String = "Wäre Euch diese Spinnenseide von Nutzen?", AnswerId = 6},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagCalinaKnown"}),
			IsNpcFlagFalse{Name = "CalinaAsked"},
			Negated(UND(PlayerHasItem{ItemId = 2383} , QuestState{QuestId = 413 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "calina003", String = "Grüße!"},
			OfferAnswer{Tag = "calina003PC", String = "Was ist Euer Geschäft hier?", AnswerId = 2},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagCalinaKnown"}),
			Negated(IsNpcFlagFalse{Name = "CalinaAsked"}),
			UND(PlayerHasItem{ItemId = 2383} , QuestState{QuestId = 413 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "calina003", String = "Grüße!"},
			OfferAnswer{Tag = "calina005PC", String = "Wäre Euch diese Spinnenseide von Nutzen?", AnswerId = 6},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagCalinaKnown"}),
			Negated(IsNpcFlagFalse{Name = "CalinaAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2383} , QuestState{QuestId = 413 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "calina003", String = "Grüße!"},
		}}

	OnAnswer{1;
		Conditions = {
			IsNpcFlagFalse{Name = "CalinaAsked"},
			UND(PlayerHasItem{ItemId = 2383} , QuestState{QuestId = 413 , State = StateUnknown}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagCalinaKnown"},
			Say{Tag = "calina002", String = "Seid herzlich willkommen!"},
			OfferAnswer{Tag = "calina003PC", String = "Was ist Euer Geschäft hier?", AnswerId = 2},
			OfferAnswer{Tag = "calina005PC", String = "Wäre Euch diese Spinnenseide von Nutzen?", AnswerId = 6},
		}}

	OnAnswer{1;
		Conditions = {
			IsNpcFlagFalse{Name = "CalinaAsked"},
			Negated(UND(PlayerHasItem{ItemId = 2383} , QuestState{QuestId = 413 , State = StateUnknown})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagCalinaKnown"},
			Say{Tag = "calina002", String = "Seid herzlich willkommen!"},
			OfferAnswer{Tag = "calina003PC", String = "Was ist Euer Geschäft hier?", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "CalinaAsked"}),
			UND(PlayerHasItem{ItemId = 2383} , QuestState{QuestId = 413 , State = StateUnknown}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagCalinaKnown"},
			Say{Tag = "calina002", String = "Seid herzlich willkommen!"},
			OfferAnswer{Tag = "calina005PC", String = "Wäre Euch diese Spinnenseide von Nutzen?", AnswerId = 6},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "CalinaAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2383} , QuestState{QuestId = 413 , State = StateUnknown})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagCalinaKnown"},
			Say{Tag = "calina002", String = "Seid herzlich willkommen!"},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "calina004", String = "Näherin bin ich! Seidenstickerin, um genau zu sein! Wenn auch solcherart Kunst in diesen rauen Landen kaum gewürdigt wird..."},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "calina005", String = "Hier in Skye dreht sich alles nur ums Überleben und Kämpfen! Aber die Leute haben ein gutes Herz und nirgends werdet Ihr ehrlichere und anständigere Menschen finden!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "CalinaAsked"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
			IsNpcFlagFalse{Name = "CalinaAsked"},
			UND(PlayerHasItem{ItemId = 2383} , QuestState{QuestId = 413 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "calina003PC", String = "Was ist Euer Geschäft hier?", AnswerId = 2},
			OfferAnswer{Tag = "calina005PC", String = "Wäre Euch diese Spinnenseide von Nutzen?", AnswerId = 6},
		}}

	OnAnswer{5;
		Conditions = {
			IsNpcFlagFalse{Name = "CalinaAsked"},
			Negated(UND(PlayerHasItem{ItemId = 2383} , QuestState{QuestId = 413 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "calina003PC", String = "Was ist Euer Geschäft hier?", AnswerId = 2},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "CalinaAsked"}),
			UND(PlayerHasItem{ItemId = 2383} , QuestState{QuestId = 413 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "calina005PC", String = "Wäre Euch diese Spinnenseide von Nutzen?", AnswerId = 6},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "CalinaAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2383} , QuestState{QuestId = 413 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "calina006", String = "Oh, wahrhaftig... reine Spinnenseide... sehr selten - und kostbar! In der Seide der großen Spinnen liegt viel Kraft!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "calina007", String = "Leider bin ich nicht die Richtige dafür. Ich würde es mit meinem groben Webwerk nur verderben! Aber es gibt eine Näherin, die Euch aus dieser Seide den wertvollsten aller Stoffe fertigen kann!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "calina008", String = "Sucht Tanara in Graufurt auf! Zeigt ihr diese Seide! Ich bin mir sicher, Ihr werdet es nicht bereuen!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 255} , QuestBegin{QuestId = 413},
				SetGlobalFlagTrue {Name = "TanaraKannSprechen"},
				SetRewardFlagTrue{ Name = "FeineStoffe1"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse{Name = "CalinaAsked"},
			UND(PlayerHasItem{ItemId = 2383} , QuestState{QuestId = 413 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "calina003PC", String = "Was ist Euer Geschäft hier?", AnswerId = 2},
			OfferAnswer{Tag = "calina005PC", String = "Wäre Euch diese Spinnenseide von Nutzen?", AnswerId = 6},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse{Name = "CalinaAsked"},
			Negated(UND(PlayerHasItem{ItemId = 2383} , QuestState{QuestId = 413 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "calina003PC", String = "Was ist Euer Geschäft hier?", AnswerId = 2},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "CalinaAsked"}),
			UND(PlayerHasItem{ItemId = 2383} , QuestState{QuestId = 413 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "calina005PC", String = "Wäre Euch diese Spinnenseide von Nutzen?", AnswerId = 6},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "CalinaAsked"}),
			Negated(UND(PlayerHasItem{ItemId = 2383} , QuestState{QuestId = 413 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end