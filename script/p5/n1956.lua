-->INFO: Tynar
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome
{
	WalkMode = Walk, X = _X, Y = _Y, Direction = 3,
	Conditions =
	{
		Negated(QuestState{QuestId = 467 , State = StateSolved , UpdateInterval = 50})
	}
}
--!EDS ONIDLEGOHOME END


--!EDS RESPAWN BEGIN
Respawn{WaitTime=10}
--!EDS RESPAWN END
SpawnOnlyWhen
{
Conditions = {
			QuestState{QuestId = 95 , State = StateSolved , UpdateInterval = 5}
				},
Actions = {
--		SetEffect{TargetType = Figure, NpcId = self, Length = 0, Effect = "Materialize"},
		}
}


-- Utraner nach Hause
OnIdleGoHome
{
	X = 306, Y = 141, Direction = 1 , 
	Conditions =
	{
		QuestState{QuestId = 467 , State = StateSolved , UpdateInterval = 50}
	}
}

--Dialogsteuerung
--Umschalter
OnToggleEvent
{
OnConditions = {
			IsNpcFlagTrue{Name = "HasMainquest"},
			},
OnActions = {
		SetDialogType{Type = MainQuest}
		},
OffConditions = {
			IsNpcFlagFalse{Name = "HasMainquest"},
			},
OffActions = {
		SetDialogType{Type = SideQuest}
		},
}
--initial
OnOneTimeEvent
{
Conditions = {},
Actions = {
		SetNpcFlagTrue{Name = "HasMainquest"},
		}
}

-- Zu Shan gehen von Shiel aus
OnOneTimeEvent
{
Conditions = {
			QuestState{QuestId = 97, State = StateSolved}
			},
Actions = {
		SetNpcFlagFalse{Name = "HasMainquest"},
		}
}








--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p5\n1956_Tynar.txt


	

	OnBeginDialog{
		Conditions = {
			Negated(QuestState{QuestId = 89 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "tynar001", String = "Dunkel... So dunkel..."},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(Negated(QuestState{QuestId = 89 , State = StateSolved})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			IsPlayerFlagFalse{Name = "IsTynarKnown"},
		},
		Actions = {
			Say{Tag = "tynar002", String = "Ihr... Ihr habt mein Leben gerettet! Ich stehe für immer in Eurer Schuld!"},
			Answer{Tag = "tynar002PC", String = "Diese Schuld mögt Ihr schon bald begleichen können, Herr!", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "IsTynarKnown"}),
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "tynar004", String = "Seid gegrüßt, Freund!"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "IsTynarKnown"}),
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "tynar004", String = "Seid gegrüßt, Freund!"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "IsTynarKnown"}),
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "tynar004", String = "Seid gegrüßt, Freund!"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "IsTynarKnown"}),
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "tynar004", String = "Seid gegrüßt, Freund!"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "IsTynarKnown"}),
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "tynar004", String = "Seid gegrüßt, Freund!"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "IsTynarKnown"}),
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "tynar004", String = "Seid gegrüßt, Freund!"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "IsTynarKnown"}),
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "tynar004", String = "Seid gegrüßt, Freund!"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "IsTynarKnown"}),
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "tynar004", String = "Seid gegrüßt, Freund!"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "IsTynarKnown"}),
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "tynar004", String = "Seid gegrüßt, Freund!"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "IsTynarKnown"}),
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "tynar004", String = "Seid gegrüßt, Freund!"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "IsTynarKnown"}),
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "tynar004", String = "Seid gegrüßt, Freund!"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "IsTynarKnown"}),
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "tynar004", String = "Seid gegrüßt, Freund!"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "IsTynarKnown"}),
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "tynar004", String = "Seid gegrüßt, Freund!"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "IsTynarKnown"}),
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "tynar004", String = "Seid gegrüßt, Freund!"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "IsTynarKnown"}),
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "tynar004", String = "Seid gegrüßt, Freund!"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "IsTynarKnown"}),
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "tynar004", String = "Seid gegrüßt, Freund!"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "IsTynarKnown"}),
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "tynar004", String = "Seid gegrüßt, Freund!"},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "IsTynarKnown"}),
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "tynar004", String = "Seid gegrüßt, Freund!"},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "IsTynarKnown"}),
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "tynar004", String = "Seid gegrüßt, Freund!"},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "IsTynarKnown"}),
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "tynar004", String = "Seid gegrüßt, Freund!"},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "IsTynarKnown"}),
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "tynar004", String = "Seid gegrüßt, Freund!"},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "IsTynarKnown"}),
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "tynar004", String = "Seid gegrüßt, Freund!"},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "IsTynarKnown"}),
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "tynar004", String = "Seid gegrüßt, Freund!"},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "IsTynarKnown"}),
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "tynar004", String = "Seid gegrüßt, Freund!"},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "IsTynarKnown"}),
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "tynar004", String = "Seid gegrüßt, Freund!"},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "IsTynarKnown"}),
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "tynar004", String = "Seid gegrüßt, Freund!"},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "IsTynarKnown"}),
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "tynar004", String = "Seid gegrüßt, Freund!"},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "IsTynarKnown"}),
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "tynar004", String = "Seid gegrüßt, Freund!"},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "IsTynarKnown"}),
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "tynar004", String = "Seid gegrüßt, Freund!"},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "IsTynarKnown"}),
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "tynar004", String = "Seid gegrüßt, Freund!"},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "IsTynarKnown"}),
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "tynar004", String = "Seid gegrüßt, Freund!"},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "IsTynarKnown"}),
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "tynar004", String = "Seid gegrüßt, Freund!"},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "IsTynarKnown"},
			Say{Tag = "tynar003", String = "Was immer in meiner Macht steht! Sprecht! Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "IsTynarKnown"},
			Say{Tag = "tynar003", String = "Was immer in meiner Macht steht! Sprecht! Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "IsTynarKnown"},
			Say{Tag = "tynar003", String = "Was immer in meiner Macht steht! Sprecht! Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "IsTynarKnown"},
			Say{Tag = "tynar003", String = "Was immer in meiner Macht steht! Sprecht! Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "IsTynarKnown"},
			Say{Tag = "tynar003", String = "Was immer in meiner Macht steht! Sprecht! Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "IsTynarKnown"},
			Say{Tag = "tynar003", String = "Was immer in meiner Macht steht! Sprecht! Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "IsTynarKnown"},
			Say{Tag = "tynar003", String = "Was immer in meiner Macht steht! Sprecht! Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "IsTynarKnown"},
			Say{Tag = "tynar003", String = "Was immer in meiner Macht steht! Sprecht! Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "IsTynarKnown"},
			Say{Tag = "tynar003", String = "Was immer in meiner Macht steht! Sprecht! Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "IsTynarKnown"},
			Say{Tag = "tynar003", String = "Was immer in meiner Macht steht! Sprecht! Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "IsTynarKnown"},
			Say{Tag = "tynar003", String = "Was immer in meiner Macht steht! Sprecht! Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "IsTynarKnown"},
			Say{Tag = "tynar003", String = "Was immer in meiner Macht steht! Sprecht! Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "IsTynarKnown"},
			Say{Tag = "tynar003", String = "Was immer in meiner Macht steht! Sprecht! Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "IsTynarKnown"},
			Say{Tag = "tynar003", String = "Was immer in meiner Macht steht! Sprecht! Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "IsTynarKnown"},
			Say{Tag = "tynar003", String = "Was immer in meiner Macht steht! Sprecht! Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "IsTynarKnown"},
			Say{Tag = "tynar003", String = "Was immer in meiner Macht steht! Sprecht! Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "IsTynarKnown"},
			Say{Tag = "tynar003", String = "Was immer in meiner Macht steht! Sprecht! Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "IsTynarKnown"},
			Say{Tag = "tynar003", String = "Was immer in meiner Macht steht! Sprecht! Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "IsTynarKnown"},
			Say{Tag = "tynar003", String = "Was immer in meiner Macht steht! Sprecht! Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "IsTynarKnown"},
			Say{Tag = "tynar003", String = "Was immer in meiner Macht steht! Sprecht! Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "IsTynarKnown"},
			Say{Tag = "tynar003", String = "Was immer in meiner Macht steht! Sprecht! Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "IsTynarKnown"},
			Say{Tag = "tynar003", String = "Was immer in meiner Macht steht! Sprecht! Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "IsTynarKnown"},
			Say{Tag = "tynar003", String = "Was immer in meiner Macht steht! Sprecht! Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "IsTynarKnown"},
			Say{Tag = "tynar003", String = "Was immer in meiner Macht steht! Sprecht! Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "IsTynarKnown"},
			Say{Tag = "tynar003", String = "Was immer in meiner Macht steht! Sprecht! Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "IsTynarKnown"},
			Say{Tag = "tynar003", String = "Was immer in meiner Macht steht! Sprecht! Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "IsTynarKnown"},
			Say{Tag = "tynar003", String = "Was immer in meiner Macht steht! Sprecht! Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "IsTynarKnown"},
			Say{Tag = "tynar003", String = "Was immer in meiner Macht steht! Sprecht! Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "IsTynarKnown"},
			Say{Tag = "tynar003", String = "Was immer in meiner Macht steht! Sprecht! Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "IsTynarKnown"},
			Say{Tag = "tynar003", String = "Was immer in meiner Macht steht! Sprecht! Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "IsTynarKnown"},
			Say{Tag = "tynar003", String = "Was immer in meiner Macht steht! Sprecht! Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "IsTynarKnown"},
			Say{Tag = "tynar003", String = "Was immer in meiner Macht steht! Sprecht! Was kann ich für Euch tun?"},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tynar005", String = "Das soll Euch nicht verwehrt bleiben! Ich werde Euch einen Trupp meiner besten Männer zur Verfügung stellen!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q97MonumentGroupGo"}, 
				SetGlobalFlagFalse{Name = "Q97MonumentGroupDead"},
				SetRewardFlagTrue{ Name = "Bannwerk2"}, SetRewardFlagTrue{ Name = "BefreiungShiel1Kommandant"},
			Say{Tag = "tynar006", String = "Die Männer treten draußen vor dem Lager an! Ihr könnt jederzeit über sie verfügen! Eine Warnung allerdings noch zuvor..."},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 96} , SetGlobalFlagTrue{Name = "Q96MonumentCutscene"} ,
			QuestBegin{QuestId = 97},
			QuestSolve{QuestId = 100},
			EndDialog(),
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q97MonumentGroupGo"}, 
				SetGlobalFlagFalse{Name = "Q97MonumentGroupDead"},
				SetRewardFlagTrue{ Name = "Bannwerk2"}, SetRewardFlagTrue{ Name = "BefreiungShiel1Kommandant"},
			Say{Tag = "tynar007", String = "Ich werde Euch weitere Soldaten zur Verfügung stellen! Aber seid diesmal vorsichtig! Und achtet vor allem darauf, dass Ihr keines ihrer Lager alarmiert!"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q97MonumentGroupGo"}, 
				SetGlobalFlagFalse{Name = "Q97MonumentGroupDead"},
				SetRewardFlagTrue{ Name = "Bannwerk2"}, SetRewardFlagTrue{ Name = "BefreiungShiel1Kommandant"},
			Say{Tag = "tynar007", String = "Ich werde Euch weitere Soldaten zur Verfügung stellen! Aber seid diesmal vorsichtig! Und achtet vor allem darauf, dass Ihr keines ihrer Lager alarmiert!"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q97MonumentGroupGo"}, 
				SetGlobalFlagFalse{Name = "Q97MonumentGroupDead"},
				SetRewardFlagTrue{ Name = "Bannwerk2"}, SetRewardFlagTrue{ Name = "BefreiungShiel1Kommandant"},
			Say{Tag = "tynar007", String = "Ich werde Euch weitere Soldaten zur Verfügung stellen! Aber seid diesmal vorsichtig! Und achtet vor allem darauf, dass Ihr keines ihrer Lager alarmiert!"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q97MonumentGroupGo"}, 
				SetGlobalFlagFalse{Name = "Q97MonumentGroupDead"},
				SetRewardFlagTrue{ Name = "Bannwerk2"}, SetRewardFlagTrue{ Name = "BefreiungShiel1Kommandant"},
			Say{Tag = "tynar007", String = "Ich werde Euch weitere Soldaten zur Verfügung stellen! Aber seid diesmal vorsichtig! Und achtet vor allem darauf, dass Ihr keines ihrer Lager alarmiert!"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q97MonumentGroupGo"}, 
				SetGlobalFlagFalse{Name = "Q97MonumentGroupDead"},
				SetRewardFlagTrue{ Name = "Bannwerk2"}, SetRewardFlagTrue{ Name = "BefreiungShiel1Kommandant"},
			Say{Tag = "tynar007", String = "Ich werde Euch weitere Soldaten zur Verfügung stellen! Aber seid diesmal vorsichtig! Und achtet vor allem darauf, dass Ihr keines ihrer Lager alarmiert!"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q97MonumentGroupGo"}, 
				SetGlobalFlagFalse{Name = "Q97MonumentGroupDead"},
				SetRewardFlagTrue{ Name = "Bannwerk2"}, SetRewardFlagTrue{ Name = "BefreiungShiel1Kommandant"},
			Say{Tag = "tynar007", String = "Ich werde Euch weitere Soldaten zur Verfügung stellen! Aber seid diesmal vorsichtig! Und achtet vor allem darauf, dass Ihr keines ihrer Lager alarmiert!"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q97MonumentGroupGo"}, 
				SetGlobalFlagFalse{Name = "Q97MonumentGroupDead"},
				SetRewardFlagTrue{ Name = "Bannwerk2"}, SetRewardFlagTrue{ Name = "BefreiungShiel1Kommandant"},
			Say{Tag = "tynar007", String = "Ich werde Euch weitere Soldaten zur Verfügung stellen! Aber seid diesmal vorsichtig! Und achtet vor allem darauf, dass Ihr keines ihrer Lager alarmiert!"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q97MonumentGroupGo"}, 
				SetGlobalFlagFalse{Name = "Q97MonumentGroupDead"},
				SetRewardFlagTrue{ Name = "Bannwerk2"}, SetRewardFlagTrue{ Name = "BefreiungShiel1Kommandant"},
			Say{Tag = "tynar007", String = "Ich werde Euch weitere Soldaten zur Verfügung stellen! Aber seid diesmal vorsichtig! Und achtet vor allem darauf, dass Ihr keines ihrer Lager alarmiert!"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q97MonumentGroupGo"}, 
				SetGlobalFlagFalse{Name = "Q97MonumentGroupDead"},
				SetRewardFlagTrue{ Name = "Bannwerk2"}, SetRewardFlagTrue{ Name = "BefreiungShiel1Kommandant"},
			Say{Tag = "tynar007", String = "Ich werde Euch weitere Soldaten zur Verfügung stellen! Aber seid diesmal vorsichtig! Und achtet vor allem darauf, dass Ihr keines ihrer Lager alarmiert!"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q97MonumentGroupGo"}, 
				SetGlobalFlagFalse{Name = "Q97MonumentGroupDead"},
				SetRewardFlagTrue{ Name = "Bannwerk2"}, SetRewardFlagTrue{ Name = "BefreiungShiel1Kommandant"},
			Say{Tag = "tynar007", String = "Ich werde Euch weitere Soldaten zur Verfügung stellen! Aber seid diesmal vorsichtig! Und achtet vor allem darauf, dass Ihr keines ihrer Lager alarmiert!"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q97MonumentGroupGo"}, 
				SetGlobalFlagFalse{Name = "Q97MonumentGroupDead"},
				SetRewardFlagTrue{ Name = "Bannwerk2"}, SetRewardFlagTrue{ Name = "BefreiungShiel1Kommandant"},
			Say{Tag = "tynar007", String = "Ich werde Euch weitere Soldaten zur Verfügung stellen! Aber seid diesmal vorsichtig! Und achtet vor allem darauf, dass Ihr keines ihrer Lager alarmiert!"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q97MonumentGroupGo"}, 
				SetGlobalFlagFalse{Name = "Q97MonumentGroupDead"},
				SetRewardFlagTrue{ Name = "Bannwerk2"}, SetRewardFlagTrue{ Name = "BefreiungShiel1Kommandant"},
			Say{Tag = "tynar007", String = "Ich werde Euch weitere Soldaten zur Verfügung stellen! Aber seid diesmal vorsichtig! Und achtet vor allem darauf, dass Ihr keines ihrer Lager alarmiert!"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q97MonumentGroupGo"}, 
				SetGlobalFlagFalse{Name = "Q97MonumentGroupDead"},
				SetRewardFlagTrue{ Name = "Bannwerk2"}, SetRewardFlagTrue{ Name = "BefreiungShiel1Kommandant"},
			Say{Tag = "tynar007", String = "Ich werde Euch weitere Soldaten zur Verfügung stellen! Aber seid diesmal vorsichtig! Und achtet vor allem darauf, dass Ihr keines ihrer Lager alarmiert!"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q97MonumentGroupGo"}, 
				SetGlobalFlagFalse{Name = "Q97MonumentGroupDead"},
				SetRewardFlagTrue{ Name = "Bannwerk2"}, SetRewardFlagTrue{ Name = "BefreiungShiel1Kommandant"},
			Say{Tag = "tynar007", String = "Ich werde Euch weitere Soldaten zur Verfügung stellen! Aber seid diesmal vorsichtig! Und achtet vor allem darauf, dass Ihr keines ihrer Lager alarmiert!"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q97MonumentGroupGo"}, 
				SetGlobalFlagFalse{Name = "Q97MonumentGroupDead"},
				SetRewardFlagTrue{ Name = "Bannwerk2"}, SetRewardFlagTrue{ Name = "BefreiungShiel1Kommandant"},
			Say{Tag = "tynar007", String = "Ich werde Euch weitere Soldaten zur Verfügung stellen! Aber seid diesmal vorsichtig! Und achtet vor allem darauf, dass Ihr keines ihrer Lager alarmiert!"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q97MonumentGroupGo"}, 
				SetGlobalFlagFalse{Name = "Q97MonumentGroupDead"},
				SetRewardFlagTrue{ Name = "Bannwerk2"}, SetRewardFlagTrue{ Name = "BefreiungShiel1Kommandant"},
			Say{Tag = "tynar007", String = "Ich werde Euch weitere Soldaten zur Verfügung stellen! Aber seid diesmal vorsichtig! Und achtet vor allem darauf, dass Ihr keines ihrer Lager alarmiert!"},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q97MonumentGroupGo"}, 
				SetGlobalFlagFalse{Name = "Q97MonumentGroupDead"},
				SetRewardFlagTrue{ Name = "Bannwerk2"}, SetRewardFlagTrue{ Name = "BefreiungShiel1Kommandant"},
			Say{Tag = "tynar007", String = "Ich werde Euch weitere Soldaten zur Verfügung stellen! Aber seid diesmal vorsichtig! Und achtet vor allem darauf, dass Ihr keines ihrer Lager alarmiert!"},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q97MonumentGroupGo"}, 
				SetGlobalFlagFalse{Name = "Q97MonumentGroupDead"},
				SetRewardFlagTrue{ Name = "Bannwerk2"}, SetRewardFlagTrue{ Name = "BefreiungShiel1Kommandant"},
			Say{Tag = "tynar007", String = "Ich werde Euch weitere Soldaten zur Verfügung stellen! Aber seid diesmal vorsichtig! Und achtet vor allem darauf, dass Ihr keines ihrer Lager alarmiert!"},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q97MonumentGroupGo"}, 
				SetGlobalFlagFalse{Name = "Q97MonumentGroupDead"},
				SetRewardFlagTrue{ Name = "Bannwerk2"}, SetRewardFlagTrue{ Name = "BefreiungShiel1Kommandant"},
			Say{Tag = "tynar007", String = "Ich werde Euch weitere Soldaten zur Verfügung stellen! Aber seid diesmal vorsichtig! Und achtet vor allem darauf, dass Ihr keines ihrer Lager alarmiert!"},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q97MonumentGroupGo"}, 
				SetGlobalFlagFalse{Name = "Q97MonumentGroupDead"},
				SetRewardFlagTrue{ Name = "Bannwerk2"}, SetRewardFlagTrue{ Name = "BefreiungShiel1Kommandant"},
			Say{Tag = "tynar007", String = "Ich werde Euch weitere Soldaten zur Verfügung stellen! Aber seid diesmal vorsichtig! Und achtet vor allem darauf, dass Ihr keines ihrer Lager alarmiert!"},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q97MonumentGroupGo"}, 
				SetGlobalFlagFalse{Name = "Q97MonumentGroupDead"},
				SetRewardFlagTrue{ Name = "Bannwerk2"}, SetRewardFlagTrue{ Name = "BefreiungShiel1Kommandant"},
			Say{Tag = "tynar007", String = "Ich werde Euch weitere Soldaten zur Verfügung stellen! Aber seid diesmal vorsichtig! Und achtet vor allem darauf, dass Ihr keines ihrer Lager alarmiert!"},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q97MonumentGroupGo"}, 
				SetGlobalFlagFalse{Name = "Q97MonumentGroupDead"},
				SetRewardFlagTrue{ Name = "Bannwerk2"}, SetRewardFlagTrue{ Name = "BefreiungShiel1Kommandant"},
			Say{Tag = "tynar007", String = "Ich werde Euch weitere Soldaten zur Verfügung stellen! Aber seid diesmal vorsichtig! Und achtet vor allem darauf, dass Ihr keines ihrer Lager alarmiert!"},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q97MonumentGroupGo"}, 
				SetGlobalFlagFalse{Name = "Q97MonumentGroupDead"},
				SetRewardFlagTrue{ Name = "Bannwerk2"}, SetRewardFlagTrue{ Name = "BefreiungShiel1Kommandant"},
			Say{Tag = "tynar007", String = "Ich werde Euch weitere Soldaten zur Verfügung stellen! Aber seid diesmal vorsichtig! Und achtet vor allem darauf, dass Ihr keines ihrer Lager alarmiert!"},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q97MonumentGroupGo"}, 
				SetGlobalFlagFalse{Name = "Q97MonumentGroupDead"},
				SetRewardFlagTrue{ Name = "Bannwerk2"}, SetRewardFlagTrue{ Name = "BefreiungShiel1Kommandant"},
			Say{Tag = "tynar007", String = "Ich werde Euch weitere Soldaten zur Verfügung stellen! Aber seid diesmal vorsichtig! Und achtet vor allem darauf, dass Ihr keines ihrer Lager alarmiert!"},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q97MonumentGroupGo"}, 
				SetGlobalFlagFalse{Name = "Q97MonumentGroupDead"},
				SetRewardFlagTrue{ Name = "Bannwerk2"}, SetRewardFlagTrue{ Name = "BefreiungShiel1Kommandant"},
			Say{Tag = "tynar007", String = "Ich werde Euch weitere Soldaten zur Verfügung stellen! Aber seid diesmal vorsichtig! Und achtet vor allem darauf, dass Ihr keines ihrer Lager alarmiert!"},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q97MonumentGroupGo"}, 
				SetGlobalFlagFalse{Name = "Q97MonumentGroupDead"},
				SetRewardFlagTrue{ Name = "Bannwerk2"}, SetRewardFlagTrue{ Name = "BefreiungShiel1Kommandant"},
			Say{Tag = "tynar007", String = "Ich werde Euch weitere Soldaten zur Verfügung stellen! Aber seid diesmal vorsichtig! Und achtet vor allem darauf, dass Ihr keines ihrer Lager alarmiert!"},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q97MonumentGroupGo"}, 
				SetGlobalFlagFalse{Name = "Q97MonumentGroupDead"},
				SetRewardFlagTrue{ Name = "Bannwerk2"}, SetRewardFlagTrue{ Name = "BefreiungShiel1Kommandant"},
			Say{Tag = "tynar007", String = "Ich werde Euch weitere Soldaten zur Verfügung stellen! Aber seid diesmal vorsichtig! Und achtet vor allem darauf, dass Ihr keines ihrer Lager alarmiert!"},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q97MonumentGroupGo"}, 
				SetGlobalFlagFalse{Name = "Q97MonumentGroupDead"},
				SetRewardFlagTrue{ Name = "Bannwerk2"}, SetRewardFlagTrue{ Name = "BefreiungShiel1Kommandant"},
			Say{Tag = "tynar007", String = "Ich werde Euch weitere Soldaten zur Verfügung stellen! Aber seid diesmal vorsichtig! Und achtet vor allem darauf, dass Ihr keines ihrer Lager alarmiert!"},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q97MonumentGroupGo"}, 
				SetGlobalFlagFalse{Name = "Q97MonumentGroupDead"},
				SetRewardFlagTrue{ Name = "Bannwerk2"}, SetRewardFlagTrue{ Name = "BefreiungShiel1Kommandant"},
			Say{Tag = "tynar007", String = "Ich werde Euch weitere Soldaten zur Verfügung stellen! Aber seid diesmal vorsichtig! Und achtet vor allem darauf, dass Ihr keines ihrer Lager alarmiert!"},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q97MonumentGroupGo"}, 
				SetGlobalFlagFalse{Name = "Q97MonumentGroupDead"},
				SetRewardFlagTrue{ Name = "Bannwerk2"}, SetRewardFlagTrue{ Name = "BefreiungShiel1Kommandant"},
			Say{Tag = "tynar007", String = "Ich werde Euch weitere Soldaten zur Verfügung stellen! Aber seid diesmal vorsichtig! Und achtet vor allem darauf, dass Ihr keines ihrer Lager alarmiert!"},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q97MonumentGroupGo"}, 
				SetGlobalFlagFalse{Name = "Q97MonumentGroupDead"},
				SetRewardFlagTrue{ Name = "Bannwerk2"}, SetRewardFlagTrue{ Name = "BefreiungShiel1Kommandant"},
			Say{Tag = "tynar007", String = "Ich werde Euch weitere Soldaten zur Verfügung stellen! Aber seid diesmal vorsichtig! Und achtet vor allem darauf, dass Ihr keines ihrer Lager alarmiert!"},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q97MonumentGroupGo"}, 
				SetGlobalFlagFalse{Name = "Q97MonumentGroupDead"},
				SetRewardFlagTrue{ Name = "Bannwerk2"}, SetRewardFlagTrue{ Name = "BefreiungShiel1Kommandant"},
			Say{Tag = "tynar007", String = "Ich werde Euch weitere Soldaten zur Verfügung stellen! Aber seid diesmal vorsichtig! Und achtet vor allem darauf, dass Ihr keines ihrer Lager alarmiert!"},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tynar008", String = "Ich weiß es nicht! Aber wer auch immer es war, er hätte mich besser gleich töten sollen! Nun wird kein Ort zu weit und kein Loch zu tief sein, um ihm als Versteck zu dienen!"},
			Answer{Tag = "tynar008PC", String = "Habt Ihr irgendwelche Hinweise?", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tynar009", String = "Nur eine einzige, traurige Spur! Meine geliebte Frau wurde von ihm geraubt! Als das Gift zu wirken begann und ich das Bewusstsein verlor, muss er sie aus unserem Gemach entführt haben!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tynar010", String = "Haltet Ausschau nach Ihr! Ich hoffe, sie lebt noch... wenngleich es die Hoffnung eines Toren ist! Doch wo immer sie auch sein mag, der Verräter wird nicht weit sein!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 134} , QuestBegin{QuestId = 135},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tynar011", String = "Ihr Götter! Dann ist sie tot! Oh, Shaira...! Diese elenden Bastarde! Dafür werden sie mit ihrem Blut bezahlen!"},
			Answer{Tag = "tynar011PC", String = "Einer der Orkführer trug diese Kette bei sich! Er muss sie von dem Verräter bekommen haben!", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tynar012", String = "Findet ihn! Findet den Mörder! Er hat mir meine Frau und meine Ehre genommen! Würde meine Pflicht als Lord Kommandant mich nicht binden, ich würde ihn jagen bis ans Ende der Welt!"},
			Answer{Tag = "tynar012PC", String = "Eure Frau wird gerächt werden! Jedoch Eure Ehre ist unbefleckt!", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tynar013", String = "Ihr versteht nicht! Er stahl nicht nur meine Frau aus dem Gemach! Er nahm auch das purpurne Banner, das Zeichen unseres Hauses!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tynar014", String = "Ohne das Banner bin ich entehrt! Kein Feind konnte es uns je entreißen! Nun dient es einem Verräter als Trophäe!"},
			Answer{Tag = "tynar014PC", String = "Ich werde ihn finden, Herr! Ihr könnt Euch auf mich verlassen!", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 392} , QuestSolve{QuestId = 136}, 
				TransferItem{TakeItem = 2350 , Flag = Take},
				SetRewardFlagTrue{ Name = "PurpurnesBanner1Kettchen"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tynar015", String = "Hatte er das Banner bei sich? Wer war es? Wie sah er aus?"},
			Answer{Tag = "tynar015PC", String = "Das Banner ist hier! Es war ein narbiger Bursche mit harten Augen! Ein guter Kämpfer mit Schild und Schwert!", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tynar016", String = "Halgard! Dieser Hund! Ich ahnte, dass er es war! Schon lange hat er Shaira nachgestellt! Hätte ich nur eher gehandelt... ich war ein Narr!"},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tynar017", String = "Was aber Euch betrifft, Runenkrieger... Ihr habt die Ehre Utrans wieder hergestellt und den Tod meiner Frau gerächt! Nehmt dies zum Dank! Es soll Euch auf Euren Reisen nützlich sein!"},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 137} , QuestSolve{QuestId = 134} , 
			TransferItem{TakeItem = 2488 , Flag = Take},
			SetRewardFlagTrue{ Name = "PurpurnesBanner2"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 100 , State = StateActive},
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar004PC", String = "Ich benötige eine Armee, um die Monumente zu erobern!", AnswerId = 4},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"},
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar006PC", String = "Unser Angriff wurde abgeschmettert!", AnswerId = 7},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			QuestState{QuestId = 134 , State = StateUnknown},
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar007PC", String = "Wer hat Euch vergiftet?", AnswerId = 8},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			QuestState{QuestId = 136 , State = StateActive},
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar010PC", String = "Gehörte diese Kette Eurer Frau?", AnswerId = 13},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			QuestState{QuestId = 137 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tynar014PCa", String = "Der Verräter ist tot!", AnswerId = 19},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 100 , State = StateActive}),
			Negated(IsGlobalFlagTrue{Name = "Q97MonumentGroupDead"}),
			Negated(QuestState{QuestId = 134 , State = StateUnknown}),
			Negated(QuestState{QuestId = 136 , State = StateActive}),
			Negated(QuestState{QuestId = 137 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end