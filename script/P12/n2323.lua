-->INFO: malicor_prison
-->INFO: malicor
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 2 ,  
Conditions = {Negated(QuestState{QuestId = 212 , State = StateSolved})}
}

OnIdleGoHome{WalkMode = Walk, X = 207 , Y = 290 , Direction = South ,  
Conditions = {QuestState{QuestId = 212 , State = StateSolved}}
}

--!EDS RESPAWN BEGIN
Respawn{WaitTime=60}
--!EDS RESPAWN END

--OneTimeInitAction(	SetEffect{Effect = "Chain" , TargetType = "Figure" , Length = 0 , NpcId = self}	)


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

-- Zu Tana gehen
OnOneTimeEvent
{
Conditions = {
			QuestState{QuestId = 214, State = StateActive}
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
-- Source: C:\project\main\mission\dialoge\p12\n2323_malicor_prison.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagMalicorPrisonKnown"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMalicorPrisonKnown"}),
			QuestState{QuestId = 213 , State = StateActive},
		},
		Actions = {
			Say{Tag = "malicor003", String = "Danke für Eure Hilfe! Was wünscht Ihr?"},
			OfferAnswer{Tag = "malicor003PC", String = "Ich benötige die Maske!", AnswerId = 4},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMalicorPrisonKnown"}),
			Negated(QuestState{QuestId = 213 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "malicor003", String = "Danke für Eure Hilfe! Was wünscht Ihr?"},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 213 , State = StateActive},
		},
		Actions = {
			Say{Tag = "malicor001", String = "Wer seid Ihr?"},
			Answer{Tag = "malicor001PC", String = "Ein Gesandter des Ordens! Urias sagte mir, dass ich Euch hier finde! Lasst mich Eure Ketten lösen!", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 213 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 213 , State = StateActive},
		},
		Actions = {
			StopEffect{TargetType = Figure , X = 0 , Y = 0 , NpcId = 2323},
			SetPlayerFlagTrue{Name = "FlagMalicorPrisonKnown"},
			Say{Tag = "malicor002", String = "Seid Ihr aus der Grenzfeste ausgebrochen? Aonirs Licht, dann gibt es noch Hoffnung!"},
			OfferAnswer{Tag = "malicor003PC", String = "Ich benötige die Maske!", AnswerId = 4},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 213 , State = StateActive}),
		},
		Actions = {
			StopEffect{TargetType = Figure , X = 0 , Y = 0 , NpcId = 2323},
			SetPlayerFlagTrue{Name = "FlagMalicorPrisonKnown"},
			Say{Tag = "malicor002", String = "Seid Ihr aus der Grenzfeste ausgebrochen? Aonirs Licht, dann gibt es noch Hoffnung!"},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 213 , State = StateActive},
		},
		Actions = {
			StopEffect{TargetType = Figure , X = 0 , Y = 0 , NpcId = 2323},
			SetPlayerFlagTrue{Name = "FlagMalicorPrisonKnown"},
			Say{Tag = "malicor002", String = "Seid Ihr aus der Grenzfeste ausgebrochen? Aonirs Licht, dann gibt es noch Hoffnung!"},
			OfferAnswer{Tag = "malicor003PC", String = "Ich benötige die Maske!", AnswerId = 4},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 213 , State = StateActive}),
		},
		Actions = {
			StopEffect{TargetType = Figure , X = 0 , Y = 0 , NpcId = 2323},
			SetPlayerFlagTrue{Name = "FlagMalicorPrisonKnown"},
			Say{Tag = "malicor002", String = "Seid Ihr aus der Grenzfeste ausgebrochen? Aonirs Licht, dann gibt es noch Hoffnung!"},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "malicor004", String = "Verstehe! Ich ahnte bereits, dass Ihr nicht nur meinetwegen gekommen seid!"},
			Answer{Tag = "malicor004PC", String = "Ich hoffe, Ihr habt diesen Kreaturen nicht verraten, wo sie ist?", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "malicor005", String = "Oh doch! Doch ich habe es verraten! Ich habe alles verraten! Alles was ich wusste! Glaubt mir, kein Folterknecht kann sich ausmalen, was diese..."},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "malicor006", String = "Wie auch immer! Die Untoten wissen, wo sie ist! Deswegen haben sie die Grenzfeste ja angegriffen! Weil sich mein Teil der Maske genau dort befindet!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "malicor007", String = "Sie ist in einer schweren Truhe. Ich habe sie mit einem Zauber verschlossen. Eine Vertraute von mir besitzt den einzigen Schlüssel!"},
			Answer{Tag = "malicor007PC", String = "Ist sie noch in der Feste?", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "malicor008", String = "Die Truhe mit Sicherheit! Was meine Vertraute angeht... ich weiß es nicht! Ich bete, dass sie noch lebt!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "malicor009", String = "Sucht eine fahrende Bardin! Ihr Name ist Tana Klingensang! Sie weiß, wie die Truhe zu öffnen ist!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "malicor010", String = "Ich werde noch etwas ausruhen und meine Wunden versorgen! Danach kehre ich in die Feste zurück! Wir sehen uns - irgendwann! Viel Glück, Runenkrieger!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 214} , QuestSolve{QuestId = 213},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 213 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "malicor003PC", String = "Ich benötige die Maske!", AnswerId = 4},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 213 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end