-->INFO: Joshua
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnDeadPlayerGoHome
{
	X = 437, Y = 424, Direction = NorthEast, KeepFollowing = FALSE ,
	Conditions = {
		IsGlobalFlagTrue{Name = "Q138JoshuaMarchToColdmark"},
	},
	Actions = { 
		SetNpcFlagFalse{Name = "ToggelSimul"},
		SetGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
		SetNpcFlagFalse{Name = "JoshuaFollowsPlayer"},
		EnableDialog{},
	},
	HomeActions = { 
	},
}

OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 7 , 
Conditions =	{
				IsGlobalFlagFalse{Name = "Q138JoshuaMarchToEastgate"},
				IsGlobalFlagFalse{Name = "Q138JoshuaMarchToColdmark"},
				IsGlobalFlagFalse{Name = "Q138JoshuaRunBackToThane"}
				}
}

OnIdleGoHome{WalkMode = Run, X = 360, Y = 475, Direction = East , 
Conditions =	{
				IsGlobalFlagTrue{Name = "Q138JoshuaWalkToThane"}
				}
}

OnIdleGoHome{WalkMode = Run, X = 437 , Y = 424 , Direction = East , 
Conditions =	{
				IsGlobalFlagTrue{Name = "Q138JoshuaMarchToEastgate"}
				}
}


--OnIdleGoHome{WalkMode = Run, X = 703, Y = 521, Direction = 2 , 
--Conditions =	{
--				IsGlobalFlagTrue{Name = "Q138JoshuaMarchToColdmark"}
--				}
--}

OnIdleGoHome{WalkMode = Run, X = 360, Y = 475, Direction = East , 
Conditions =	{
				IsGlobalFlagTrue{Name = "Q138JoshuaRunBackToThane"}
				}
}
--Toggle Simulation
PlatformInitAction( SetNpcFlagFalse{Name = "ToggelSimul"} )
--on
OnEvent
{
Conditions = {
				IsNpcFlagFalse{Name = "ToggelSimul" , UpdateInterval = 10},
				FigureJob{Job = JobIdle , NpcId = self},
				IsGlobalFlagTrue{Name = "Q138JoshuaMarchToColdmark"},
				IsNpcFlagFalse{Name = "DeadPlayerGoHome", UpdateInterval = 10},
				FigureAlive{NpcId = Avatar},
				},
Actions = 	{
				-- ist ein aggro toggle follow, also safe
				Follow{Target = Avatar , NpcId = self},
				SetNpcFlagTrue{Name = "ToggelSimul"},
				}
}
--off
OnEvent
{
Conditions = {
				IsNpcFlagTrue{Name = "ToggelSimul" , UpdateInterval = 10},
				FigureHasAggro{NpcId = self , UpdateInterval = 10},
				IsNpcFlagFalse{Name = "DeadPlayerGoHome", UpdateInterval = 10},
				FigureAlive{NpcId = Avatar},
				},		
Actions = 	{
				StopFollow{Target = Avatar , NpcId = self},
				SetNpcFlagFalse{Name = "ToggelSimul"},
				}
}
OnToggleEvent
{
OnConditions =	{
				ODER(
					QuestState{QuestId = 141 , State = StateUnknown},
					QuestState{QuestId = 138 , State = StateSolved}
					),
				},
OnActions =		{
				RemoveDialog{},
				},
OffConditions =	{
				QuestState{QuestId = 141 , State = StateActive},
				},
OffActions =	{
				EnableDialog{},
				SetNpcFlagTrue{Name = "HasMainquest"},
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

-- Tor Offen
OnOneTimeEvent
{
Conditions = {
			QuestState{QuestId = 144, State = StateSolved , UpdateInterval = 10},
			},
Actions = {
		SetNpcFlagTrue{Name = "HasMainquest"},
		}
}

-- Helm
OnOneTimeEvent
{
Conditions = {
			QuestState{QuestId = 146, State = StateActive , UpdateInterval = 10},
			},
Actions = {
		SetNpcFlagTrue{Name = "HasMainquest"},
		}
}



--Dialogsteuerung
--Umschalter
OnToggleEvent
{
OnConditions = {
		IsNpcFlagTrue{Name = "JoshuaFollowsPlayer", UpdateInterval = 20},
			},
OnActions = {
		RemoveDialog{},
		},
OffConditions = {
		IsNpcFlagFalse{Name = "JoshuaFollowsPlayer", UpdateInterval = 20},
			},
OffActions = {
		EnableDialog{},
		},
}



--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p10\n2184_Joshua.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagJoshuaSWKnown"},
		},
		Actions = {
			Say{Tag = "joshuaSW001", String = "Wer seid Ihr? Was wollt Ihr? Hat Euch mein Vater geschickt?"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagJoshuaSWKnown"}),
			QuestState{QuestId = 141 , State = StateActive},
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			Say{Tag = "joshuaSW002", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagJoshuaSWKnown"}),
			QuestState{QuestId = 141 , State = StateActive},
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			Say{Tag = "joshuaSW002", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagJoshuaSWKnown"}),
			QuestState{QuestId = 141 , State = StateActive},
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			Say{Tag = "joshuaSW002", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagJoshuaSWKnown"}),
			QuestState{QuestId = 141 , State = StateActive},
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			Say{Tag = "joshuaSW002", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagJoshuaSWKnown"}),
			QuestState{QuestId = 141 , State = StateActive},
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			Say{Tag = "joshuaSW002", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagJoshuaSWKnown"}),
			QuestState{QuestId = 141 , State = StateActive},
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			Say{Tag = "joshuaSW002", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagJoshuaSWKnown"}),
			QuestState{QuestId = 141 , State = StateActive},
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			Say{Tag = "joshuaSW002", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagJoshuaSWKnown"}),
			QuestState{QuestId = 141 , State = StateActive},
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			Say{Tag = "joshuaSW002", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagJoshuaSWKnown"}),
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			Say{Tag = "joshuaSW002", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagJoshuaSWKnown"}),
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			Say{Tag = "joshuaSW002", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagJoshuaSWKnown"}),
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			Say{Tag = "joshuaSW002", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagJoshuaSWKnown"}),
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			Say{Tag = "joshuaSW002", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagJoshuaSWKnown"}),
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			Say{Tag = "joshuaSW002", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagJoshuaSWKnown"}),
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			Say{Tag = "joshuaSW002", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagJoshuaSWKnown"}),
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			Say{Tag = "joshuaSW002", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagJoshuaSWKnown"}),
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			Say{Tag = "joshuaSW002", String = "Ah, Ihr seid es!"},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagJoshuaSWKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagJoshuaSWKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagJoshuaSWKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagJoshuaSWKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagJoshuaSWKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagJoshuaSWKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagJoshuaSWKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagJoshuaSWKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagJoshuaSWKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagJoshuaSWKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagJoshuaSWKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagJoshuaSWKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagJoshuaSWKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagJoshuaSWKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagJoshuaSWKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagJoshuaSWKnown"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "joshuaSW003", String = "Nachricht von den Zwergen? Seid Ihr... seid Ihr gekommen... um... um mich zu töten?"},
			Answer{Tag = "joshuaSW003PC", String = "Nein! Der Thane von Windholme ist bereit, Euch eine zweite Chance zu geben!", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "joshuaSW004", String = "Ihr verschwendet Eure Zeit! Ich... bin kein Krieger! Und werde nie einer sein! Die Zwerge werden mich niemals achten... soviel ist sicher!"},
			Answer{Tag = "joshuaSW004PC", String = "Ihr müsst Euch Eurer Bestimmung stellen! Schon um das Leben der Menschen willen, über die Euer Vater herrscht! Es ist Eure Pflicht, Lordsohn!", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "joshuaSW005", String = "Aber... ich kann nicht... Ach, verdammt soll ich sein! Tod oder Schande, es bleibt sich gleich! Mein Leben ist so oder so verwirkt! Ich werde gehen!"},
			Answer{Tag = "joshuaSW005PC", String = "Und ich werde Euch begleiten! Wir treffen uns am Tor im Osten!", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 144} , TransferXP{XP = 100 , Flag = Give} ,
				SetGlobalFlagTrue{Name = "Q138JoshuaMarchToEastgate"} , 
				SetGlobalFlagFalse{Name = "Q138JoshuaGotoPortal"} ,  
				SetGlobalFlagTrue{Name = "Q138SkeldOpenGate"} , QuestSolve{QuestId = 141},
				SetRewardFlagTrue{ Name = "InsGrauschattental2"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{6;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q138IsEastgateOpen"}),
		},
		Actions = {
			Say{Tag = "joshuaSW007", String = "Ihr müsst erst dem Wächter befehlen, das Tor zu öffnen!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{7;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q138IsEastgateOpen"},
		},
		Actions = {
			Say{Tag = "joshuaSW006", String = "Es ist ganz im Osten, auf dem höchsten Berg...Ihr werdet es schon finden. Geht doch voran, ich folge Euch..."},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q138JoshuaMarchToColdmark"} , 
				SetGlobalFlagFalse{Name = "Q138JoshuaMarchToEastgate"},
				SetNpcFlagFalse{Name = "ToggelSimul"},
				SetNpcFlagTrue{Name = "JoshuaFollowsPlayer"},
				SetRewardFlagTrue{ Name = "InsGrauschattental3"},
				SetNpcFlagFalse{Name = "DeadPlayerGoHome"},
				SetGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"},
				EndDialog{} ,
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q138JoshuaMarchToColdmark"} , 
				SetGlobalFlagFalse{Name = "Q138JoshuaMarchToEastgate"},
				SetNpcFlagFalse{Name = "ToggelSimul"},
				SetNpcFlagTrue{Name = "JoshuaFollowsPlayer"},
				SetRewardFlagTrue{ Name = "InsGrauschattental3"},
				SetNpcFlagFalse{Name = "DeadPlayerGoHome"},
				SetGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"},
				EndDialog{} ,
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q138JoshuaMarchToColdmark"} , 
				SetGlobalFlagFalse{Name = "Q138JoshuaMarchToEastgate"},
				SetNpcFlagFalse{Name = "ToggelSimul"},
				SetNpcFlagTrue{Name = "JoshuaFollowsPlayer"},
				SetRewardFlagTrue{ Name = "InsGrauschattental3"},
				SetNpcFlagFalse{Name = "DeadPlayerGoHome"},
				SetGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"},
				EndDialog{} ,
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q138JoshuaMarchToColdmark"} , 
				SetGlobalFlagFalse{Name = "Q138JoshuaMarchToEastgate"},
				SetNpcFlagFalse{Name = "ToggelSimul"},
				SetNpcFlagTrue{Name = "JoshuaFollowsPlayer"},
				SetRewardFlagTrue{ Name = "InsGrauschattental3"},
				SetNpcFlagFalse{Name = "DeadPlayerGoHome"},
				SetGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"},
				EndDialog{} ,
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q138JoshuaMarchToColdmark"} , 
				SetGlobalFlagFalse{Name = "Q138JoshuaMarchToEastgate"},
				SetNpcFlagFalse{Name = "ToggelSimul"},
				SetNpcFlagTrue{Name = "JoshuaFollowsPlayer"},
				SetRewardFlagTrue{ Name = "InsGrauschattental3"},
				SetNpcFlagFalse{Name = "DeadPlayerGoHome"},
				SetGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"},
				EndDialog{} ,
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q138JoshuaMarchToColdmark"} , 
				SetGlobalFlagFalse{Name = "Q138JoshuaMarchToEastgate"},
				SetNpcFlagFalse{Name = "ToggelSimul"},
				SetNpcFlagTrue{Name = "JoshuaFollowsPlayer"},
				SetRewardFlagTrue{ Name = "InsGrauschattental3"},
				SetNpcFlagFalse{Name = "DeadPlayerGoHome"},
				SetGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"},
				EndDialog{} ,
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q138JoshuaMarchToColdmark"} , 
				SetGlobalFlagFalse{Name = "Q138JoshuaMarchToEastgate"},
				SetNpcFlagFalse{Name = "ToggelSimul"},
				SetNpcFlagTrue{Name = "JoshuaFollowsPlayer"},
				SetRewardFlagTrue{ Name = "InsGrauschattental3"},
				SetNpcFlagFalse{Name = "DeadPlayerGoHome"},
				SetGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"},
				EndDialog{} ,
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q138JoshuaMarchToColdmark"} , 
				SetGlobalFlagFalse{Name = "Q138JoshuaMarchToEastgate"},
				SetNpcFlagFalse{Name = "ToggelSimul"},
				SetNpcFlagTrue{Name = "JoshuaFollowsPlayer"},
				SetRewardFlagTrue{ Name = "InsGrauschattental3"},
				SetNpcFlagFalse{Name = "DeadPlayerGoHome"},
				SetGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"},
				EndDialog{} ,
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q138JoshuaMarchToColdmark"} , 
				SetGlobalFlagFalse{Name = "Q138JoshuaMarchToEastgate"},
				SetNpcFlagFalse{Name = "ToggelSimul"},
				SetNpcFlagTrue{Name = "JoshuaFollowsPlayer"},
				SetRewardFlagTrue{ Name = "InsGrauschattental3"},
				SetNpcFlagFalse{Name = "DeadPlayerGoHome"},
				SetGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"},
				EndDialog{} ,
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q138JoshuaMarchToColdmark"} , 
				SetGlobalFlagFalse{Name = "Q138JoshuaMarchToEastgate"},
				SetNpcFlagFalse{Name = "ToggelSimul"},
				SetNpcFlagTrue{Name = "JoshuaFollowsPlayer"},
				SetRewardFlagTrue{ Name = "InsGrauschattental3"},
				SetNpcFlagFalse{Name = "DeadPlayerGoHome"},
				SetGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"},
				EndDialog{} ,
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q138JoshuaMarchToColdmark"} , 
				SetGlobalFlagFalse{Name = "Q138JoshuaMarchToEastgate"},
				SetNpcFlagFalse{Name = "ToggelSimul"},
				SetNpcFlagTrue{Name = "JoshuaFollowsPlayer"},
				SetRewardFlagTrue{ Name = "InsGrauschattental3"},
				SetNpcFlagFalse{Name = "DeadPlayerGoHome"},
				SetGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"},
				EndDialog{} ,
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q138JoshuaMarchToColdmark"} , 
				SetGlobalFlagFalse{Name = "Q138JoshuaMarchToEastgate"},
				SetNpcFlagFalse{Name = "ToggelSimul"},
				SetNpcFlagTrue{Name = "JoshuaFollowsPlayer"},
				SetRewardFlagTrue{ Name = "InsGrauschattental3"},
				SetNpcFlagFalse{Name = "DeadPlayerGoHome"},
				SetGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"},
				EndDialog{} ,
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q138JoshuaMarchToColdmark"} , 
				SetGlobalFlagFalse{Name = "Q138JoshuaMarchToEastgate"},
				SetNpcFlagFalse{Name = "ToggelSimul"},
				SetNpcFlagTrue{Name = "JoshuaFollowsPlayer"},
				SetRewardFlagTrue{ Name = "InsGrauschattental3"},
				SetNpcFlagFalse{Name = "DeadPlayerGoHome"},
				SetGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"},
				EndDialog{} ,
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q138JoshuaMarchToColdmark"} , 
				SetGlobalFlagFalse{Name = "Q138JoshuaMarchToEastgate"},
				SetNpcFlagFalse{Name = "ToggelSimul"},
				SetNpcFlagTrue{Name = "JoshuaFollowsPlayer"},
				SetRewardFlagTrue{ Name = "InsGrauschattental3"},
				SetNpcFlagFalse{Name = "DeadPlayerGoHome"},
				SetGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"},
				EndDialog{} ,
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q138JoshuaMarchToColdmark"} , 
				SetGlobalFlagFalse{Name = "Q138JoshuaMarchToEastgate"},
				SetNpcFlagFalse{Name = "ToggelSimul"},
				SetNpcFlagTrue{Name = "JoshuaFollowsPlayer"},
				SetRewardFlagTrue{ Name = "InsGrauschattental3"},
				SetNpcFlagFalse{Name = "DeadPlayerGoHome"},
				SetGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"},
				EndDialog{} ,
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q138JoshuaMarchToColdmark"} , 
				SetGlobalFlagFalse{Name = "Q138JoshuaMarchToEastgate"},
				SetNpcFlagFalse{Name = "ToggelSimul"},
				SetNpcFlagTrue{Name = "JoshuaFollowsPlayer"},
				SetRewardFlagTrue{ Name = "InsGrauschattental3"},
				SetNpcFlagFalse{Name = "DeadPlayerGoHome"},
				SetGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"},
				EndDialog{} ,
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "joshuaSW008", String = "Vergebt mir! Ich bin davon gelaufen! Es... geschah wie von selbst! Wäre ich nur als Bauer geboren worden..."},
			Answer{Tag = "joshuaSW008PC", String = "Aber Ihr seid der Sohn eines Fürsten! Kommt jetzt!", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "joshuaSW009", String = "Gut denn! Auf ein Neues!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q138JoshuaMarchToColdmark"},
					SetNpcFlagFalse{Name = "DeadPlayerGoHome"},
					SetNpcFlagFalse{Name = "ToggelSimul"},
					SetGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"},
					SetNpcFlagTrue{Name = "JoshuaFollowsPlayer"},
					RemoveDialog{},
					EndDialog{}	,
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q138JoshuaMarchToColdmark"},
					SetNpcFlagFalse{Name = "DeadPlayerGoHome"},
					SetNpcFlagFalse{Name = "ToggelSimul"},
					SetGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"},
					SetNpcFlagTrue{Name = "JoshuaFollowsPlayer"},
					RemoveDialog{},
					EndDialog{}	,
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q138JoshuaMarchToColdmark"},
					SetNpcFlagFalse{Name = "DeadPlayerGoHome"},
					SetNpcFlagFalse{Name = "ToggelSimul"},
					SetGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"},
					SetNpcFlagTrue{Name = "JoshuaFollowsPlayer"},
					RemoveDialog{},
					EndDialog{}	,
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q138JoshuaMarchToColdmark"},
					SetNpcFlagFalse{Name = "DeadPlayerGoHome"},
					SetNpcFlagFalse{Name = "ToggelSimul"},
					SetGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"},
					SetNpcFlagTrue{Name = "JoshuaFollowsPlayer"},
					RemoveDialog{},
					EndDialog{}	,
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q138JoshuaMarchToColdmark"},
					SetNpcFlagFalse{Name = "DeadPlayerGoHome"},
					SetNpcFlagFalse{Name = "ToggelSimul"},
					SetGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"},
					SetNpcFlagTrue{Name = "JoshuaFollowsPlayer"},
					RemoveDialog{},
					EndDialog{}	,
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q138JoshuaMarchToColdmark"},
					SetNpcFlagFalse{Name = "DeadPlayerGoHome"},
					SetNpcFlagFalse{Name = "ToggelSimul"},
					SetGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"},
					SetNpcFlagTrue{Name = "JoshuaFollowsPlayer"},
					RemoveDialog{},
					EndDialog{}	,
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q138JoshuaMarchToColdmark"},
					SetNpcFlagFalse{Name = "DeadPlayerGoHome"},
					SetNpcFlagFalse{Name = "ToggelSimul"},
					SetGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"},
					SetNpcFlagTrue{Name = "JoshuaFollowsPlayer"},
					RemoveDialog{},
					EndDialog{}	,
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 141 , State = StateActive},
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q138JoshuaMarchToColdmark"},
					SetNpcFlagFalse{Name = "DeadPlayerGoHome"},
					SetNpcFlagFalse{Name = "ToggelSimul"},
					SetGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"},
					SetNpcFlagTrue{Name = "JoshuaFollowsPlayer"},
					RemoveDialog{},
					EndDialog{}	,
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW002PC", String = "Seid Ihr Joshua? Ich bringe Euch Nachricht von den Zwergen!", AnswerId = 2},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q138JoshuaMarchToColdmark"},
					SetNpcFlagFalse{Name = "DeadPlayerGoHome"},
					SetNpcFlagFalse{Name = "ToggelSimul"},
					SetGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"},
					SetNpcFlagTrue{Name = "JoshuaFollowsPlayer"},
					RemoveDialog{},
					EndDialog{}	,
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q138JoshuaMarchToColdmark"},
					SetNpcFlagFalse{Name = "DeadPlayerGoHome"},
					SetNpcFlagFalse{Name = "ToggelSimul"},
					SetGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"},
					SetNpcFlagTrue{Name = "JoshuaFollowsPlayer"},
					RemoveDialog{},
					EndDialog{}	,
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q138JoshuaMarchToColdmark"},
					SetNpcFlagFalse{Name = "DeadPlayerGoHome"},
					SetNpcFlagFalse{Name = "ToggelSimul"},
					SetGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"},
					SetNpcFlagTrue{Name = "JoshuaFollowsPlayer"},
					RemoveDialog{},
					EndDialog{}	,
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"})),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q138JoshuaMarchToColdmark"},
					SetNpcFlagFalse{Name = "DeadPlayerGoHome"},
					SetNpcFlagFalse{Name = "ToggelSimul"},
					SetGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"},
					SetNpcFlagTrue{Name = "JoshuaFollowsPlayer"},
					RemoveDialog{},
					EndDialog{}	,
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW005PCa", String = "Führt mich zu dem Ort, an dem Herger starb!", AnswerId = 7},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q138JoshuaMarchToColdmark"},
					SetNpcFlagFalse{Name = "DeadPlayerGoHome"},
					SetNpcFlagFalse{Name = "ToggelSimul"},
					SetGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"},
					SetNpcFlagTrue{Name = "JoshuaFollowsPlayer"},
					RemoveDialog{},
					EndDialog{}	,
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"},
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q138JoshuaMarchToColdmark"},
					SetNpcFlagFalse{Name = "DeadPlayerGoHome"},
					SetNpcFlagFalse{Name = "ToggelSimul"},
					SetGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"},
					SetNpcFlagTrue{Name = "JoshuaFollowsPlayer"},
					RemoveDialog{},
					EndDialog{}	,
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW007PC", String = "Kommt! Es ist noch nicht vorbei!", AnswerId = 10},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q138JoshuaMarchToColdmark"},
					SetNpcFlagFalse{Name = "DeadPlayerGoHome"},
					SetNpcFlagFalse{Name = "ToggelSimul"},
					SetGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"},
					SetNpcFlagTrue{Name = "JoshuaFollowsPlayer"},
					RemoveDialog{},
					EndDialog{}	,
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "joshuaSW009PC", String = "Bringt diesen Helm dem Thanen zurück!", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 141 , State = StateActive}),
			Negated(UND(FigureInRange{X = 437 , Y = 424 , NpcId = 2184 , Range = 5} , UND(Negated(QuestState{QuestId = 145 , State = StateSolved}), IsGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"}))),
			Negated(IsGlobalFlagTrue{Name = "Q138JoshuaHasRunOff"}),
			Negated(UND(PlayerHasItem{ItemId = 2515} , IsNpcFlagFalse{Name = "HelmSaid"})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q138JoshuaMarchToColdmark"},
					SetNpcFlagFalse{Name = "DeadPlayerGoHome"},
					SetNpcFlagFalse{Name = "ToggelSimul"},
					SetGlobalFlagFalse{Name = "Q138JoshuaHasRunOff"},
					SetNpcFlagTrue{Name = "JoshuaFollowsPlayer"},
					RemoveDialog{},
					EndDialog{}	,
			Say{Tag = "", String = ""},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "joshuaSW010", String = "Diese Ehre steht Euch zu! Wenn Ihr wollt, überbringt ihn selbst!"},
			OfferAnswer{Tag = "joshuaSW010PC", String = "Ich muss weiter! Grüßt den Thanen von mir!", AnswerId = 14},
			OfferAnswer{Tag = "joshuaSW011PCa", String = "Gut, ich werde den Thanen aufsuchen!", AnswerId = 16},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "joshuaSW011", String = "Wie Ihr wünscht! Gute Reise, Runendiener! Und danke für alles!"},
			Answer{Tag = "joshuaSW011PC", String = "Lebt wohl, Lordsohn!", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			TransferXP{XP = 100 , Flag = Give} , TransferItem{GiveItem = 1009 , Amount = 1 , 
					Flag = Give} , TransferItem{GiveItem = 1015 , Amount = 1 , Flag = Give} , 
					TransferItem{GiveItem = 1333 , Amount = 1 , Flag = Give} , 
					SetGlobalFlagTrue{Name = "Q138JoshuaWalkToThane"} , 
					TransferItem{TakeItem = 2515 , Amount = 1 , Flag = Take},
					SetNpcFlagTrue{Name = "HelmSaid"},
					QuestSolve{QuestId = 146} , QuestSolve{QuestId = 147} , QuestSolve{QuestId = 138}, QuestBegin{QuestId = 142},
					SetRewardFlagTrue{ Name = "InsGrauschattental4"},
			StopFollow{Target = Avatar, NpcId = self} , 
			SetNpcFlagFalse{Name = "JoshuaFollowsPlayer"},
			SetGlobalFlagTrue{Name = "Q138JoshuaRunBackToThane"} , RemoveDialog{},
			SetNpcFlagFalse{Name = "HasMainquest"},
			EndDialog(),
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "joshuaSW012", String = "Wir sehen uns... irgendwann, irgendwo! Viel Glück! Und vielen Dank für alles!"},
			Answer{Tag = "joshuaSW012PC", String = "Lebt wohl!", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			StopFollow{Target = Avatar, NpcId = self} , 
			SetNpcFlagFalse{Name = "JoshuaFollowsPlayer"},
			SetGlobalFlagFalse{Name = "Q138JoshuaMarchToColdmark"} , RemoveDialog{},
			SetNpcFlagFalse{Name = "HasMainquest"},
			EndDialog(),
		}}


	EndDefinition()
end