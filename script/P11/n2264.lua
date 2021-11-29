-->INFO: Kraga
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Run, X = _X, Y = _Y, Direction = 3 , Conditions = {IsGlobalFlagFalse{Name = "Q184KragaHomeOff"}}}
--!EDS ONIDLEGOHOME END

--initial
OnOneTimeEvent
{
Conditions = {},
Actions = {
		SetDialogType{Type = SideQuest}
		}
}

--Kraga greift Braga an
-- -Q184-
OnPlatformOneTimeEvent
{
	Conditions =	
	{
		FigureAlive{NpcId = 2265},
		QuestState{QuestId = 188 , State = StateActive},
		IsGlobalFlagTrue{Name = "Q184KragaKillBraga"},
	},
	Actions =		
	{
		AttackTarget{Target = 2265 , FriendlyFire = TRUE},
		--SetGlobalFlagFalse{Name = "Q184KragaKillBraga"},
		RemoveDialog{NpcId = 2264},
	}
}



--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p11\n2264_Kraga.txt


	

	OnBeginDialog{
		Conditions = {
			IsGlobalFlagTrue{Name = "184KragaAggro"},
		},
		Actions = {
			Say{Tag = "kraga001", String = "Menschling Lügling! Kraga ihn zermalmen!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "184KragaAggro"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagKragaKnown"},
		},
		Actions = {
			Say{Tag = "kraga002", String = "Lügling! Lügling! Kraga töten! Kraga würgen! Kraga töten den Dieb! Arrr!"},
			Answer{Tag = "kraga002PC", String = "Was habt Ihr?", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKragaKnown"}),
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "kraga004", String = "Was ist?"},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKragaKnown"}),
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "kraga004", String = "Was ist?"},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKragaKnown"}),
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "kraga004", String = "Was ist?"},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKragaKnown"}),
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "kraga004", String = "Was ist?"},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKragaKnown"}),
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "kraga004", String = "Was ist?"},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKragaKnown"}),
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "kraga004", String = "Was ist?"},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKragaKnown"}),
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "kraga004", String = "Was ist?"},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKragaKnown"}),
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "kraga004", String = "Was ist?"},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKragaKnown"}),
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "kraga004", String = "Was ist?"},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKragaKnown"}),
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "kraga004", String = "Was ist?"},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKragaKnown"}),
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "kraga004", String = "Was ist?"},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKragaKnown"}),
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "kraga004", String = "Was ist?"},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKragaKnown"}),
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "kraga004", String = "Was ist?"},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKragaKnown"}),
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "kraga004", String = "Was ist?"},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKragaKnown"}),
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "kraga004", String = "Was ist?"},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKragaKnown"}),
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "kraga004", String = "Was ist?"},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKragaKnown"}),
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "kraga004", String = "Was ist?"},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKragaKnown"}),
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "kraga004", String = "Was ist?"},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKragaKnown"}),
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "kraga004", String = "Was ist?"},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKragaKnown"}),
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "kraga004", String = "Was ist?"},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKragaKnown"}),
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "kraga004", String = "Was ist?"},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKragaKnown"}),
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "kraga004", String = "Was ist?"},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKragaKnown"}),
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "kraga004", String = "Was ist?"},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKragaKnown"}),
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "kraga004", String = "Was ist?"},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKragaKnown"}),
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "kraga004", String = "Was ist?"},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKragaKnown"}),
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "kraga004", String = "Was ist?"},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKragaKnown"}),
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "kraga004", String = "Was ist?"},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKragaKnown"}),
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "kraga004", String = "Was ist?"},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKragaKnown"}),
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "kraga004", String = "Was ist?"},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKragaKnown"}),
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "kraga004", String = "Was ist?"},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKragaKnown"}),
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "kraga004", String = "Was ist?"},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagKragaKnown"}),
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "kraga004", String = "Was ist?"},
		}}

	OnAnswer{3;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKragaKnown"},
			Say{Tag = "kraga003", String = "Kraga Wache stehen! Kraga tapfer! Aber Braga Schlechtling! Braga Lügling! Nimmt Kragas Feinstein und nicht gibt zurück!"},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{3;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKragaKnown"},
			Say{Tag = "kraga003", String = "Kraga Wache stehen! Kraga tapfer! Aber Braga Schlechtling! Braga Lügling! Nimmt Kragas Feinstein und nicht gibt zurück!"},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{3;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKragaKnown"},
			Say{Tag = "kraga003", String = "Kraga Wache stehen! Kraga tapfer! Aber Braga Schlechtling! Braga Lügling! Nimmt Kragas Feinstein und nicht gibt zurück!"},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{3;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKragaKnown"},
			Say{Tag = "kraga003", String = "Kraga Wache stehen! Kraga tapfer! Aber Braga Schlechtling! Braga Lügling! Nimmt Kragas Feinstein und nicht gibt zurück!"},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
		}}

	OnAnswer{3;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKragaKnown"},
			Say{Tag = "kraga003", String = "Kraga Wache stehen! Kraga tapfer! Aber Braga Schlechtling! Braga Lügling! Nimmt Kragas Feinstein und nicht gibt zurück!"},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{3;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKragaKnown"},
			Say{Tag = "kraga003", String = "Kraga Wache stehen! Kraga tapfer! Aber Braga Schlechtling! Braga Lügling! Nimmt Kragas Feinstein und nicht gibt zurück!"},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{3;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKragaKnown"},
			Say{Tag = "kraga003", String = "Kraga Wache stehen! Kraga tapfer! Aber Braga Schlechtling! Braga Lügling! Nimmt Kragas Feinstein und nicht gibt zurück!"},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{3;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKragaKnown"},
			Say{Tag = "kraga003", String = "Kraga Wache stehen! Kraga tapfer! Aber Braga Schlechtling! Braga Lügling! Nimmt Kragas Feinstein und nicht gibt zurück!"},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
		}}

	OnAnswer{3;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKragaKnown"},
			Say{Tag = "kraga003", String = "Kraga Wache stehen! Kraga tapfer! Aber Braga Schlechtling! Braga Lügling! Nimmt Kragas Feinstein und nicht gibt zurück!"},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{3;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKragaKnown"},
			Say{Tag = "kraga003", String = "Kraga Wache stehen! Kraga tapfer! Aber Braga Schlechtling! Braga Lügling! Nimmt Kragas Feinstein und nicht gibt zurück!"},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{3;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKragaKnown"},
			Say{Tag = "kraga003", String = "Kraga Wache stehen! Kraga tapfer! Aber Braga Schlechtling! Braga Lügling! Nimmt Kragas Feinstein und nicht gibt zurück!"},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{3;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKragaKnown"},
			Say{Tag = "kraga003", String = "Kraga Wache stehen! Kraga tapfer! Aber Braga Schlechtling! Braga Lügling! Nimmt Kragas Feinstein und nicht gibt zurück!"},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
		}}

	OnAnswer{3;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKragaKnown"},
			Say{Tag = "kraga003", String = "Kraga Wache stehen! Kraga tapfer! Aber Braga Schlechtling! Braga Lügling! Nimmt Kragas Feinstein und nicht gibt zurück!"},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{3;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKragaKnown"},
			Say{Tag = "kraga003", String = "Kraga Wache stehen! Kraga tapfer! Aber Braga Schlechtling! Braga Lügling! Nimmt Kragas Feinstein und nicht gibt zurück!"},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{3;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKragaKnown"},
			Say{Tag = "kraga003", String = "Kraga Wache stehen! Kraga tapfer! Aber Braga Schlechtling! Braga Lügling! Nimmt Kragas Feinstein und nicht gibt zurück!"},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{3;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKragaKnown"},
			Say{Tag = "kraga003", String = "Kraga Wache stehen! Kraga tapfer! Aber Braga Schlechtling! Braga Lügling! Nimmt Kragas Feinstein und nicht gibt zurück!"},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKragaKnown"},
			Say{Tag = "kraga003", String = "Kraga Wache stehen! Kraga tapfer! Aber Braga Schlechtling! Braga Lügling! Nimmt Kragas Feinstein und nicht gibt zurück!"},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKragaKnown"},
			Say{Tag = "kraga003", String = "Kraga Wache stehen! Kraga tapfer! Aber Braga Schlechtling! Braga Lügling! Nimmt Kragas Feinstein und nicht gibt zurück!"},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKragaKnown"},
			Say{Tag = "kraga003", String = "Kraga Wache stehen! Kraga tapfer! Aber Braga Schlechtling! Braga Lügling! Nimmt Kragas Feinstein und nicht gibt zurück!"},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKragaKnown"},
			Say{Tag = "kraga003", String = "Kraga Wache stehen! Kraga tapfer! Aber Braga Schlechtling! Braga Lügling! Nimmt Kragas Feinstein und nicht gibt zurück!"},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKragaKnown"},
			Say{Tag = "kraga003", String = "Kraga Wache stehen! Kraga tapfer! Aber Braga Schlechtling! Braga Lügling! Nimmt Kragas Feinstein und nicht gibt zurück!"},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKragaKnown"},
			Say{Tag = "kraga003", String = "Kraga Wache stehen! Kraga tapfer! Aber Braga Schlechtling! Braga Lügling! Nimmt Kragas Feinstein und nicht gibt zurück!"},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKragaKnown"},
			Say{Tag = "kraga003", String = "Kraga Wache stehen! Kraga tapfer! Aber Braga Schlechtling! Braga Lügling! Nimmt Kragas Feinstein und nicht gibt zurück!"},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKragaKnown"},
			Say{Tag = "kraga003", String = "Kraga Wache stehen! Kraga tapfer! Aber Braga Schlechtling! Braga Lügling! Nimmt Kragas Feinstein und nicht gibt zurück!"},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKragaKnown"},
			Say{Tag = "kraga003", String = "Kraga Wache stehen! Kraga tapfer! Aber Braga Schlechtling! Braga Lügling! Nimmt Kragas Feinstein und nicht gibt zurück!"},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKragaKnown"},
			Say{Tag = "kraga003", String = "Kraga Wache stehen! Kraga tapfer! Aber Braga Schlechtling! Braga Lügling! Nimmt Kragas Feinstein und nicht gibt zurück!"},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKragaKnown"},
			Say{Tag = "kraga003", String = "Kraga Wache stehen! Kraga tapfer! Aber Braga Schlechtling! Braga Lügling! Nimmt Kragas Feinstein und nicht gibt zurück!"},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKragaKnown"},
			Say{Tag = "kraga003", String = "Kraga Wache stehen! Kraga tapfer! Aber Braga Schlechtling! Braga Lügling! Nimmt Kragas Feinstein und nicht gibt zurück!"},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKragaKnown"},
			Say{Tag = "kraga003", String = "Kraga Wache stehen! Kraga tapfer! Aber Braga Schlechtling! Braga Lügling! Nimmt Kragas Feinstein und nicht gibt zurück!"},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKragaKnown"},
			Say{Tag = "kraga003", String = "Kraga Wache stehen! Kraga tapfer! Aber Braga Schlechtling! Braga Lügling! Nimmt Kragas Feinstein und nicht gibt zurück!"},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKragaKnown"},
			Say{Tag = "kraga003", String = "Kraga Wache stehen! Kraga tapfer! Aber Braga Schlechtling! Braga Lügling! Nimmt Kragas Feinstein und nicht gibt zurück!"},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagKragaKnown"},
			Say{Tag = "kraga003", String = "Kraga Wache stehen! Kraga tapfer! Aber Braga Schlechtling! Braga Lügling! Nimmt Kragas Feinstein und nicht gibt zurück!"},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kraga005", String = "Ich Kraga! Kraga hält Wache vor Schatz von Brahir! Mutig, tapfer! Aber Braga schlecht!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kraga006", String = "Braga Bruder von Kraga! Böse! Stiehlt Feinstein von Kraga! Schöner Feinstein, Geschenk von mächtigen Brahir für Kraga! Braga Dieb! Braga Schlechtling!"},
			Answer{Tag = "kraga006PC", String = "Und warum holt Ihr Euch den Stein nicht zurück?", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kraga007", String = "Das Kraga tun wollen! Aber Kraga muss Wache halten hier! Er nicht kann Bruder suchen! Arr!"},
			Answer{Tag = "kraga007PC", String = "Verstehe! Nun, sollte ich zufällig auf Euren Bruder stoßen, lasse ich es Euch wissen!", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kraga008", String = "Das gut! Du suchen Braga und mir sagen!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 184} , QuestBegin{QuestId = 185} , SetPlayerFlagFalse{Name = "Q184FirstQuestion"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{9;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{9;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{9;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
		}}

	OnAnswer{9;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{9;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{9;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{9;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{9;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{9;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{9;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
		}}

	OnAnswer{9;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{9;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{9;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{9;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kraga009", String = "Oh, der Lügling, Trügling! Kraga ihn zermalmen wird! Wo? Wo ist Braga?"},
			Answer{Tag = "kraga009PC", String = "An einem See nicht weit westlich von hier. Dort hält er sich versteckt... falls man das so nennen kann...", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kraga010", String = "Arr! Kraga ihn zermalmen! Aber Kraga nicht kann weg! Muss Wache halten! Arr!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 186} , QuestBegin{QuestId = 187},
				SetRewardFlagTrue{ Name = "Riesenaerger1"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{13;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{13;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{13;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
		}}

	OnAnswer{13;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{13;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{13;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{13;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
		}}

	OnAnswer{13;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{13;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{13;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{13;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
		}}

	OnAnswer{13;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{13;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{13;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{13;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kraga011", String = "Menschling das machen will? Hier Wache stehen dass Kraga kann gehen und Braga zermalmen?"},
			Answer{Tag = "kraga011PC", String = "Geht nur! Ich werde Brahirs Schatz mit meinem Leben verteidigen, wenn es nötig ist!", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kraga012", String = "Das hochanständig ist von Menschling, ja! Kraga wird den Trügling bestrafen! Ist gleich zurück."},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kraga013", String = "Ihr hier solange warten! Aber nicht gehen an Schatz von Brahir! Kraga wissen und Kraga Menschling zermalmen! Nicht gehen an Schatz!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			TransferXP{XP = 100 , Flag = Give} , SetGlobalFlagTrue{Name = "Q184KragaKillBraga"} , QuestSolve{QuestId = 187} , QuestBegin{QuestId = 188},
			EndDialog(),
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kraga014", String = "Ja! Kraga hat wieder Stein! Danke Menschling, für aufpassen! Ihr hochanständig, jaja!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kraga015", String = "Hier, Kraga hat kleines Stück aus Schatz genommen! Menschling soll haben als Dank!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			SetRewardFlagTrue{ Name = "Riesenaerger2"}, 
				QuestSolve{QuestId = 188}, SetGlobalFlagFalse{Name = "Q184KragaKilledBraga"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{21;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
		}}

	OnAnswer{21;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{21;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
		}}

	OnAnswer{21;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{21;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
		}}

	OnAnswer{21;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{21;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kraga016", String = "Ohh! Kleiner Menschling hat Feinstein geholt! Aber wie habt Ihr das gemacht?"},
			Answer{Tag = "kraga016PC", String = "Größe ist nicht alles, guter Freund! Hier habt Ihr Euren Besitz!", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kraga017", String = "Danke!"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kraga018", String = "Oh, nur eins ich besitze, was gut ist als Belohnung für Feinstein. Hier."},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 2543 , Amount = 1 , Flag = Take} , 
				QuestSolve{QuestId = 189} , QuestSolve{QuestId = 184},
				SetRewardFlagTrue{ Name = "Riesenaerger2"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{26;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{26;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{26;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
		}}

	OnAnswer{26;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{26;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{26;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{26;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
		}}

	OnAnswer{26;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{26;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{26;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{26;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
		}}

	OnAnswer{26;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{26;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{26;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{26;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q184FirstQuestion"},
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga004PC", String = "Wer sind Kraga und Braga?", AnswerId = 4},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			QuestState{QuestId = 186 , State = StateActive},
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga008PC", String = "Ich habe Euren Bruder entdeckt!", AnswerId = 10},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			QuestState{QuestId = 187 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga010PC", String = "Soll ich kurz Eure Wache übernehmen?", AnswerId = 14},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"},
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga013PC", String = "Habt Ihr Euren Feinstein?", AnswerId = 18},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			QuestState{QuestId = 189 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kraga015PC", String = "Euer...Feinstein, glaube ich!", AnswerId = 22},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q184FirstQuestion"}),
			Negated(QuestState{QuestId = 186 , State = StateActive}),
			Negated(QuestState{QuestId = 187 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q184KragaKilledBraga"}),
			Negated(QuestState{QuestId = 189 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end