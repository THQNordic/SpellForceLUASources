-->INFO: Reiter
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)


OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 2,
Conditions = {
		IsNpcFlagFalse{Name = "GetIsmail"},
		IsNpcFlagFalse{Name = "TalkedAboutDeath"},
		}
}
--zu Ismail gehen
OnIdleGoHome{WalkMode = Run, X = 344, Y = 402, Direction = 2,
Conditions = {
		IsNpcFlagTrue{Name = "GetIsmail"},
		IsNpcFlagFalse{Name = "TalkedAboutDeath"},
		}
}
--zum Portal
OnIdleGoHome{WalkMode = Run, X = 121, Y = 323, Direction = 2,
Conditions = {
		IsNpcFlagFalse{Name = "GetIsmail"},
		IsNpcFlagTrue{Name = "TalkedAboutDeath"},
		},
HomeActions = {
			SetNpcFlagTrue{Name = "AtPortal"},
				}
}
--und weg
Despawn
{
Conditions = {
		IsNpcFlagTrue{Name = "AtPortal"},
		IsNpcFlagTrue{Name = "TalkedAboutDeath"},
		},
}
--Dialog
OneTimeInitAction( SetDialogType{Type = MainQuest}	)
OnToggleEvent
{
OnConditions = {
			ODER(QuestState{QuestId = 491 , State = StateActive} , QuestState{QuestId = 494 , State = StateSolved})
			},
OnActions = {
			SetDialogType{Type = SideQuest}
			},
OffConditions = {
			ODER(UND(FigureDead{NpcId = 2497} , IsNpcFlagFalse{Name = "TalkedAboutDeath"}), QuestState{QuestId = 494 , State = StateActive})
			},
OffActions =	{
			SetDialogType{Type = MainQuest}
			},
}




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p16\n3602_Reiter.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagUtharKnown"},
		},
		Actions = {
			Say{Tag = "reiter001", String = "Tiaras Flamme, ein Mensch! Ihr seid meine Rettung!"},
			Answer{Tag = "reiter001PC", String = "Was tut Ihr hier? Wie konntet Ihr hier überleben? Mitten im Reich der Untoten?", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUtharKnown"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "reiter002", String = "Sie wagten nicht, mich anzurühren! Tiara selbst hat mich gesegnet! Auf das ich meine Rache vollstrecke! Doch dafür benötige ich Hilfe!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 490 , State = StateUnknown},
			IsNpcFlagFalse{Name = "InfoAsked"},
			QuestState{QuestId = 494 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUtharKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter005PC", String = "Was kann ich tun?", AnswerId = 10},
			OfferAnswer{Tag = "reiter008PC", String = "Von welcher Rache sprecht Ihr?", AnswerId = 15},
			OfferAnswer{Tag = "reiter014PC", String = "Eure Ausrüstung ist komplett!", AnswerId = 23},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 490 , State = StateUnknown},
			IsNpcFlagFalse{Name = "InfoAsked"},
			Negated(QuestState{QuestId = 494 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUtharKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter005PC", String = "Was kann ich tun?", AnswerId = 10},
			OfferAnswer{Tag = "reiter008PC", String = "Von welcher Rache sprecht Ihr?", AnswerId = 15},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 490 , State = StateUnknown},
			Negated(IsNpcFlagFalse{Name = "InfoAsked"}),
			QuestState{QuestId = 494 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUtharKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter005PC", String = "Was kann ich tun?", AnswerId = 10},
			OfferAnswer{Tag = "reiter014PC", String = "Eure Ausrüstung ist komplett!", AnswerId = 23},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 490 , State = StateUnknown},
			Negated(IsNpcFlagFalse{Name = "InfoAsked"}),
			Negated(QuestState{QuestId = 494 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUtharKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter005PC", String = "Was kann ich tun?", AnswerId = 10},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 490 , State = StateUnknown}),
			IsNpcFlagFalse{Name = "InfoAsked"},
			QuestState{QuestId = 494 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUtharKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter008PC", String = "Von welcher Rache sprecht Ihr?", AnswerId = 15},
			OfferAnswer{Tag = "reiter014PC", String = "Eure Ausrüstung ist komplett!", AnswerId = 23},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 490 , State = StateUnknown}),
			IsNpcFlagFalse{Name = "InfoAsked"},
			Negated(QuestState{QuestId = 494 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUtharKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter008PC", String = "Von welcher Rache sprecht Ihr?", AnswerId = 15},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 490 , State = StateUnknown}),
			Negated(IsNpcFlagFalse{Name = "InfoAsked"}),
			QuestState{QuestId = 494 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUtharKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter014PC", String = "Eure Ausrüstung ist komplett!", AnswerId = 23},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 490 , State = StateUnknown}),
			Negated(IsNpcFlagFalse{Name = "InfoAsked"}),
			Negated(QuestState{QuestId = 494 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUtharKnown"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{3;
		Conditions = {
			UND(FigureDead{NpcId = 2497} , IsNpcFlagFalse{Name = "TalkedAboutDeath"}),
		},
		Actions = {
			Say{Tag = "reiter003", String = "Meine Rache ist vollstreckt! Nun kann ich heimkehren!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(FigureDead{NpcId = 2497} , IsNpcFlagFalse{Name = "TalkedAboutDeath"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "reiter004", String = "Den Rest meiner Tage werde ich Tiara preisen für ihre Gerechtigkeit und Güte! Ich wünsche Euch viel Glück, Freund!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			SetNpcFlagFalse{Name = "GetIsmail"}, SetNpcFlagTrue{Name = "TalkedAboutDeath"} , RemoveDialog{},
			EndDialog(),
		}}

	OnAnswer{6;
		Conditions = {
			UND(QuestState{QuestId = 494 , State = StateActive} , IsNpcFlagFalse{Name = "AllSaid"}),
		},
		Actions = {
			Say{Tag = "reiter016", String = "Habt Ihr alles gefunden?"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND(QuestState{QuestId = 494 , State = StateActive} , IsNpcFlagFalse{Name = "AllSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 490 , State = StateUnknown},
			IsNpcFlagFalse{Name = "InfoAsked"},
			QuestState{QuestId = 494 , State = StateActive},
		},
		Actions = {
			SetNpcFlagTrue{Name = "AllSaid"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter005PC", String = "Was kann ich tun?", AnswerId = 10},
			OfferAnswer{Tag = "reiter008PC", String = "Von welcher Rache sprecht Ihr?", AnswerId = 15},
			OfferAnswer{Tag = "reiter014PC", String = "Eure Ausrüstung ist komplett!", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 490 , State = StateUnknown},
			IsNpcFlagFalse{Name = "InfoAsked"},
			Negated(QuestState{QuestId = 494 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "AllSaid"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter005PC", String = "Was kann ich tun?", AnswerId = 10},
			OfferAnswer{Tag = "reiter008PC", String = "Von welcher Rache sprecht Ihr?", AnswerId = 15},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 490 , State = StateUnknown},
			Negated(IsNpcFlagFalse{Name = "InfoAsked"}),
			QuestState{QuestId = 494 , State = StateActive},
		},
		Actions = {
			SetNpcFlagTrue{Name = "AllSaid"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter005PC", String = "Was kann ich tun?", AnswerId = 10},
			OfferAnswer{Tag = "reiter014PC", String = "Eure Ausrüstung ist komplett!", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 490 , State = StateUnknown},
			Negated(IsNpcFlagFalse{Name = "InfoAsked"}),
			Negated(QuestState{QuestId = 494 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "AllSaid"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter005PC", String = "Was kann ich tun?", AnswerId = 10},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 490 , State = StateUnknown}),
			IsNpcFlagFalse{Name = "InfoAsked"},
			QuestState{QuestId = 494 , State = StateActive},
		},
		Actions = {
			SetNpcFlagTrue{Name = "AllSaid"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter008PC", String = "Von welcher Rache sprecht Ihr?", AnswerId = 15},
			OfferAnswer{Tag = "reiter014PC", String = "Eure Ausrüstung ist komplett!", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 490 , State = StateUnknown}),
			IsNpcFlagFalse{Name = "InfoAsked"},
			Negated(QuestState{QuestId = 494 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "AllSaid"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter008PC", String = "Von welcher Rache sprecht Ihr?", AnswerId = 15},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 490 , State = StateUnknown}),
			Negated(IsNpcFlagFalse{Name = "InfoAsked"}),
			QuestState{QuestId = 494 , State = StateActive},
		},
		Actions = {
			SetNpcFlagTrue{Name = "AllSaid"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter014PC", String = "Eure Ausrüstung ist komplett!", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 490 , State = StateUnknown}),
			Negated(IsNpcFlagFalse{Name = "InfoAsked"}),
			Negated(QuestState{QuestId = 494 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "AllSaid"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{8;
		Conditions = {
			UND(QuestState{QuestId = 493 , State = StateSolved} , IsNpcFlagFalse{Name = "GriffonSaid"}),
		},
		Actions = {
			Say{Tag = "reiter017", String = "Ah, mein treuer Greif! Seid bedankt!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND(QuestState{QuestId = 493 , State = StateSolved} , IsNpcFlagFalse{Name = "GriffonSaid"})),
			QuestState{QuestId = 490 , State = StateUnknown},
			IsNpcFlagFalse{Name = "InfoAsked"},
			QuestState{QuestId = 494 , State = StateActive},
		},
		Actions = {
			Say{Tag = "reiter005", String = "Zurück, mein Freund?"},
			OfferAnswer{Tag = "reiter005PC", String = "Was kann ich tun?", AnswerId = 10},
			OfferAnswer{Tag = "reiter008PC", String = "Von welcher Rache sprecht Ihr?", AnswerId = 15},
			OfferAnswer{Tag = "reiter014PC", String = "Eure Ausrüstung ist komplett!", AnswerId = 23},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND(QuestState{QuestId = 493 , State = StateSolved} , IsNpcFlagFalse{Name = "GriffonSaid"})),
			QuestState{QuestId = 490 , State = StateUnknown},
			IsNpcFlagFalse{Name = "InfoAsked"},
			Negated(QuestState{QuestId = 494 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "reiter005", String = "Zurück, mein Freund?"},
			OfferAnswer{Tag = "reiter005PC", String = "Was kann ich tun?", AnswerId = 10},
			OfferAnswer{Tag = "reiter008PC", String = "Von welcher Rache sprecht Ihr?", AnswerId = 15},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND(QuestState{QuestId = 493 , State = StateSolved} , IsNpcFlagFalse{Name = "GriffonSaid"})),
			QuestState{QuestId = 490 , State = StateUnknown},
			Negated(IsNpcFlagFalse{Name = "InfoAsked"}),
			QuestState{QuestId = 494 , State = StateActive},
		},
		Actions = {
			Say{Tag = "reiter005", String = "Zurück, mein Freund?"},
			OfferAnswer{Tag = "reiter005PC", String = "Was kann ich tun?", AnswerId = 10},
			OfferAnswer{Tag = "reiter014PC", String = "Eure Ausrüstung ist komplett!", AnswerId = 23},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND(QuestState{QuestId = 493 , State = StateSolved} , IsNpcFlagFalse{Name = "GriffonSaid"})),
			QuestState{QuestId = 490 , State = StateUnknown},
			Negated(IsNpcFlagFalse{Name = "InfoAsked"}),
			Negated(QuestState{QuestId = 494 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "reiter005", String = "Zurück, mein Freund?"},
			OfferAnswer{Tag = "reiter005PC", String = "Was kann ich tun?", AnswerId = 10},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND(QuestState{QuestId = 493 , State = StateSolved} , IsNpcFlagFalse{Name = "GriffonSaid"})),
			Negated(QuestState{QuestId = 490 , State = StateUnknown}),
			IsNpcFlagFalse{Name = "InfoAsked"},
			QuestState{QuestId = 494 , State = StateActive},
		},
		Actions = {
			Say{Tag = "reiter005", String = "Zurück, mein Freund?"},
			OfferAnswer{Tag = "reiter008PC", String = "Von welcher Rache sprecht Ihr?", AnswerId = 15},
			OfferAnswer{Tag = "reiter014PC", String = "Eure Ausrüstung ist komplett!", AnswerId = 23},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND(QuestState{QuestId = 493 , State = StateSolved} , IsNpcFlagFalse{Name = "GriffonSaid"})),
			Negated(QuestState{QuestId = 490 , State = StateUnknown}),
			IsNpcFlagFalse{Name = "InfoAsked"},
			Negated(QuestState{QuestId = 494 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "reiter005", String = "Zurück, mein Freund?"},
			OfferAnswer{Tag = "reiter008PC", String = "Von welcher Rache sprecht Ihr?", AnswerId = 15},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND(QuestState{QuestId = 493 , State = StateSolved} , IsNpcFlagFalse{Name = "GriffonSaid"})),
			Negated(QuestState{QuestId = 490 , State = StateUnknown}),
			Negated(IsNpcFlagFalse{Name = "InfoAsked"}),
			QuestState{QuestId = 494 , State = StateActive},
		},
		Actions = {
			Say{Tag = "reiter005", String = "Zurück, mein Freund?"},
			OfferAnswer{Tag = "reiter014PC", String = "Eure Ausrüstung ist komplett!", AnswerId = 23},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND(QuestState{QuestId = 493 , State = StateSolved} , IsNpcFlagFalse{Name = "GriffonSaid"})),
			Negated(QuestState{QuestId = 490 , State = StateUnknown}),
			Negated(IsNpcFlagFalse{Name = "InfoAsked"}),
			Negated(QuestState{QuestId = 494 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "reiter005", String = "Zurück, mein Freund?"},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 490 , State = StateUnknown},
			IsNpcFlagFalse{Name = "InfoAsked"},
			QuestState{QuestId = 494 , State = StateActive},
		},
		Actions = {
			SetNpcFlagTrue{Name = "GriffonSaid"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter005PC", String = "Was kann ich tun?", AnswerId = 10},
			OfferAnswer{Tag = "reiter008PC", String = "Von welcher Rache sprecht Ihr?", AnswerId = 15},
			OfferAnswer{Tag = "reiter014PC", String = "Eure Ausrüstung ist komplett!", AnswerId = 23},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 490 , State = StateUnknown},
			IsNpcFlagFalse{Name = "InfoAsked"},
			Negated(QuestState{QuestId = 494 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "GriffonSaid"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter005PC", String = "Was kann ich tun?", AnswerId = 10},
			OfferAnswer{Tag = "reiter008PC", String = "Von welcher Rache sprecht Ihr?", AnswerId = 15},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 490 , State = StateUnknown},
			Negated(IsNpcFlagFalse{Name = "InfoAsked"}),
			QuestState{QuestId = 494 , State = StateActive},
		},
		Actions = {
			SetNpcFlagTrue{Name = "GriffonSaid"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter005PC", String = "Was kann ich tun?", AnswerId = 10},
			OfferAnswer{Tag = "reiter014PC", String = "Eure Ausrüstung ist komplett!", AnswerId = 23},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 490 , State = StateUnknown},
			Negated(IsNpcFlagFalse{Name = "InfoAsked"}),
			Negated(QuestState{QuestId = 494 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "GriffonSaid"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter005PC", String = "Was kann ich tun?", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 490 , State = StateUnknown}),
			IsNpcFlagFalse{Name = "InfoAsked"},
			QuestState{QuestId = 494 , State = StateActive},
		},
		Actions = {
			SetNpcFlagTrue{Name = "GriffonSaid"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter008PC", String = "Von welcher Rache sprecht Ihr?", AnswerId = 15},
			OfferAnswer{Tag = "reiter014PC", String = "Eure Ausrüstung ist komplett!", AnswerId = 23},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 490 , State = StateUnknown}),
			IsNpcFlagFalse{Name = "InfoAsked"},
			Negated(QuestState{QuestId = 494 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "GriffonSaid"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter008PC", String = "Von welcher Rache sprecht Ihr?", AnswerId = 15},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 490 , State = StateUnknown}),
			Negated(IsNpcFlagFalse{Name = "InfoAsked"}),
			QuestState{QuestId = 494 , State = StateActive},
		},
		Actions = {
			SetNpcFlagTrue{Name = "GriffonSaid"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter014PC", String = "Eure Ausrüstung ist komplett!", AnswerId = 23},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 490 , State = StateUnknown}),
			Negated(IsNpcFlagFalse{Name = "InfoAsked"}),
			Negated(QuestState{QuestId = 494 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "GriffonSaid"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "reiter006", String = "Ich bin hier, um meine Rache an Ismail zu vollstrecken! Ich bin der einzige, der ihn besiegen kann! Keine Klinge außer der meinen kann ihm etwas anhaben!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "reiter007", String = "Doch sie wurde mir von den Untoten gestohlen! Mitsamt meiner Rüstung und meinem getreuen Greifen!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "reiter008", String = "Bitte, bringt mir Schwert und Rüstung! Und befreit meinen Greif! Er wird seinen Weg alleine zurück finden!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 243} , QuestBegin{QuestId = 490} , QuestBegin{QuestId = 491} , QuestBegin{QuestId = 492} , QuestBegin{QuestId = 493},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 490 , State = StateUnknown},
			IsNpcFlagFalse{Name = "InfoAsked"},
			QuestState{QuestId = 494 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter005PC", String = "Was kann ich tun?", AnswerId = 10},
			OfferAnswer{Tag = "reiter008PC", String = "Von welcher Rache sprecht Ihr?", AnswerId = 15},
			OfferAnswer{Tag = "reiter014PC", String = "Eure Ausrüstung ist komplett!", AnswerId = 23},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 490 , State = StateUnknown},
			IsNpcFlagFalse{Name = "InfoAsked"},
			Negated(QuestState{QuestId = 494 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter005PC", String = "Was kann ich tun?", AnswerId = 10},
			OfferAnswer{Tag = "reiter008PC", String = "Von welcher Rache sprecht Ihr?", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 490 , State = StateUnknown},
			Negated(IsNpcFlagFalse{Name = "InfoAsked"}),
			QuestState{QuestId = 494 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter005PC", String = "Was kann ich tun?", AnswerId = 10},
			OfferAnswer{Tag = "reiter014PC", String = "Eure Ausrüstung ist komplett!", AnswerId = 23},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 490 , State = StateUnknown},
			Negated(IsNpcFlagFalse{Name = "InfoAsked"}),
			Negated(QuestState{QuestId = 494 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter005PC", String = "Was kann ich tun?", AnswerId = 10},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 490 , State = StateUnknown}),
			IsNpcFlagFalse{Name = "InfoAsked"},
			QuestState{QuestId = 494 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter008PC", String = "Von welcher Rache sprecht Ihr?", AnswerId = 15},
			OfferAnswer{Tag = "reiter014PC", String = "Eure Ausrüstung ist komplett!", AnswerId = 23},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 490 , State = StateUnknown}),
			IsNpcFlagFalse{Name = "InfoAsked"},
			Negated(QuestState{QuestId = 494 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter008PC", String = "Von welcher Rache sprecht Ihr?", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 490 , State = StateUnknown}),
			Negated(IsNpcFlagFalse{Name = "InfoAsked"}),
			QuestState{QuestId = 494 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter014PC", String = "Eure Ausrüstung ist komplett!", AnswerId = 23},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 490 , State = StateUnknown}),
			Negated(IsNpcFlagFalse{Name = "InfoAsked"}),
			Negated(QuestState{QuestId = 494 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "reiter009", String = "Von meiner Rache an Ismail! Um seinem Meister, dem Zirkelmagier Hokan, zu gefallen, ermordete er meine Familie, während ich auf dem Schlachtfeld kämpfte!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "reiter010", String = "Ich versuchte, sie zu rächen! Doch Ismail verspottete mich nur!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "reiter011", String = "Er spielte mit mir! Er tötete meine Freunde, meine Kameraden! Mein Leben wurde zu einer Straße des Todes!"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "reiter012", String = "Da erhörte Tiara meine wütenden Gebete! Sie sandte mir ihren Segen!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "reiter013", String = "So erhielt ich die Stärke, Ismail zu schlagen! Die Untoten können mich nicht schrecken - Tiaras Kraft schützt mich vor ihnen!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "reiter014", String = "Doch ich geriet in eine Falle! Es gelang den Untoten, mich zu überlisten! Sie raubten mir Waffen und Rüstung und ließen mich wehrlos zurück!"},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "InfoAsked"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 490 , State = StateUnknown},
			IsNpcFlagFalse{Name = "InfoAsked"},
			QuestState{QuestId = 494 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter005PC", String = "Was kann ich tun?", AnswerId = 10},
			OfferAnswer{Tag = "reiter008PC", String = "Von welcher Rache sprecht Ihr?", AnswerId = 15},
			OfferAnswer{Tag = "reiter014PC", String = "Eure Ausrüstung ist komplett!", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 490 , State = StateUnknown},
			IsNpcFlagFalse{Name = "InfoAsked"},
			Negated(QuestState{QuestId = 494 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter005PC", String = "Was kann ich tun?", AnswerId = 10},
			OfferAnswer{Tag = "reiter008PC", String = "Von welcher Rache sprecht Ihr?", AnswerId = 15},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 490 , State = StateUnknown},
			Negated(IsNpcFlagFalse{Name = "InfoAsked"}),
			QuestState{QuestId = 494 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter005PC", String = "Was kann ich tun?", AnswerId = 10},
			OfferAnswer{Tag = "reiter014PC", String = "Eure Ausrüstung ist komplett!", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 490 , State = StateUnknown},
			Negated(IsNpcFlagFalse{Name = "InfoAsked"}),
			Negated(QuestState{QuestId = 494 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter005PC", String = "Was kann ich tun?", AnswerId = 10},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 490 , State = StateUnknown}),
			IsNpcFlagFalse{Name = "InfoAsked"},
			QuestState{QuestId = 494 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter008PC", String = "Von welcher Rache sprecht Ihr?", AnswerId = 15},
			OfferAnswer{Tag = "reiter014PC", String = "Eure Ausrüstung ist komplett!", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 490 , State = StateUnknown}),
			IsNpcFlagFalse{Name = "InfoAsked"},
			Negated(QuestState{QuestId = 494 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter008PC", String = "Von welcher Rache sprecht Ihr?", AnswerId = 15},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 490 , State = StateUnknown}),
			Negated(IsNpcFlagFalse{Name = "InfoAsked"}),
			QuestState{QuestId = 494 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter014PC", String = "Eure Ausrüstung ist komplett!", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 490 , State = StateUnknown}),
			Negated(IsNpcFlagFalse{Name = "InfoAsked"}),
			Negated(QuestState{QuestId = 494 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "reiter015", String = "Tiaras Segen sei mit Dir, Krieger! Ihr dient einer gerechten Sache! Heute wirst du sterben, Ismail! Das schwöre ich beim Blute meiner Familie!"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			ChangeUnit{Unit = 1198} , ChangeRace{Race = 145} , 
				QuestSolve{QuestId = 494}, SetNpcFlagTrue{Name = "GetIsmail"} ,
				TransferXP{XP = 500 , Flag = Give} , SetGlobalFlagTrue{Name = "Q490DespawnGriffon"},
				TransferItem{TakeItem = 3245 , Amount = 1 , Flag = Take} , TransferItem{TakeItem = 3246 , Amount = 1 , Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 490 , State = StateUnknown},
			IsNpcFlagFalse{Name = "InfoAsked"},
			QuestState{QuestId = 494 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter005PC", String = "Was kann ich tun?", AnswerId = 10},
			OfferAnswer{Tag = "reiter008PC", String = "Von welcher Rache sprecht Ihr?", AnswerId = 15},
			OfferAnswer{Tag = "reiter014PC", String = "Eure Ausrüstung ist komplett!", AnswerId = 23},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 490 , State = StateUnknown},
			IsNpcFlagFalse{Name = "InfoAsked"},
			Negated(QuestState{QuestId = 494 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter005PC", String = "Was kann ich tun?", AnswerId = 10},
			OfferAnswer{Tag = "reiter008PC", String = "Von welcher Rache sprecht Ihr?", AnswerId = 15},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 490 , State = StateUnknown},
			Negated(IsNpcFlagFalse{Name = "InfoAsked"}),
			QuestState{QuestId = 494 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter005PC", String = "Was kann ich tun?", AnswerId = 10},
			OfferAnswer{Tag = "reiter014PC", String = "Eure Ausrüstung ist komplett!", AnswerId = 23},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 490 , State = StateUnknown},
			Negated(IsNpcFlagFalse{Name = "InfoAsked"}),
			Negated(QuestState{QuestId = 494 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter005PC", String = "Was kann ich tun?", AnswerId = 10},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 490 , State = StateUnknown}),
			IsNpcFlagFalse{Name = "InfoAsked"},
			QuestState{QuestId = 494 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter008PC", String = "Von welcher Rache sprecht Ihr?", AnswerId = 15},
			OfferAnswer{Tag = "reiter014PC", String = "Eure Ausrüstung ist komplett!", AnswerId = 23},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 490 , State = StateUnknown}),
			IsNpcFlagFalse{Name = "InfoAsked"},
			Negated(QuestState{QuestId = 494 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter008PC", String = "Von welcher Rache sprecht Ihr?", AnswerId = 15},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 490 , State = StateUnknown}),
			Negated(IsNpcFlagFalse{Name = "InfoAsked"}),
			QuestState{QuestId = 494 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "reiter014PC", String = "Eure Ausrüstung ist komplett!", AnswerId = 23},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 490 , State = StateUnknown}),
			Negated(IsNpcFlagFalse{Name = "InfoAsked"}),
			Negated(QuestState{QuestId = 494 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end