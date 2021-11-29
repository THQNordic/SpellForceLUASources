-->INFO: flink
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 1}
--!EDS ONIDLEGOHOME END






Despawn{Conditions = {QuestState{QuestId = 190 , State = StateSolved}}}

Respawn{WaitTime = 60 , Conditions = {Negated(QuestState{QuestId = 190 , State = StateSolved})}}


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
-- Source: C:\project\main\mission\dialoge\p12\n2331_flink.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagFlinkKnown"},
		},
		Actions = {
			Say{Tag = "flink001", String = "Holla, ein neues Gesicht! Hoffe mal, Ihr seid etwas umgänglicher als diese ganzen größenwahnsinnigen Möchtegernhelden, die sich hier sonst herumtreiben!"},
			Answer{Tag = "flink001PC", String = "Diese Leute schützen Euer Leben mit dem ihren!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagFlinkKnown"}),
			IsPlayerFlagFalse{Name = "FlinkTauntOff"},
			IsPlayerFlagTrue{Name = "FlinkInfoSearchOn"},
		},
		Actions = {
			Say{Tag = "flink004", String = "Na, neue Heldentaten vollbracht?"},
			OfferAnswer{Tag = "flink004PC", String = "Was macht ein Kerl wie Ihr in einer Festung wie dieser?", AnswerId = 3},
			OfferAnswer{Tag = "flink007PC", String = "Wen genau sucht Ihr?", AnswerId = 8},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagFlinkKnown"}),
			IsPlayerFlagFalse{Name = "FlinkTauntOff"},
			Negated(IsPlayerFlagTrue{Name = "FlinkInfoSearchOn"}),
		},
		Actions = {
			Say{Tag = "flink004", String = "Na, neue Heldentaten vollbracht?"},
			OfferAnswer{Tag = "flink004PC", String = "Was macht ein Kerl wie Ihr in einer Festung wie dieser?", AnswerId = 3},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagFlinkKnown"}),
			Negated(IsPlayerFlagFalse{Name = "FlinkTauntOff"}),
			IsPlayerFlagTrue{Name = "FlinkInfoSearchOn"},
		},
		Actions = {
			Say{Tag = "flink004", String = "Na, neue Heldentaten vollbracht?"},
			OfferAnswer{Tag = "flink007PC", String = "Wen genau sucht Ihr?", AnswerId = 8},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagFlinkKnown"}),
			Negated(IsPlayerFlagFalse{Name = "FlinkTauntOff"}),
			Negated(IsPlayerFlagTrue{Name = "FlinkInfoSearchOn"}),
		},
		Actions = {
			Say{Tag = "flink004", String = "Na, neue Heldentaten vollbracht?"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flink002", String = "Na wunderbar! Genau das, was wir gebraucht haben! NOCH ein größenwahnsinniger Held!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			IsPlayerFlagFalse{Name = "FlinkTauntOff"},
			IsPlayerFlagTrue{Name = "FlinkInfoSearchOn"},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagFlinkKnown"},
			Say{Tag = "flink003", String = "Gestatten, Flink McWinter, ein... Reisender! Zumindest hoffe ich, das bald wieder zu sein!"},
			OfferAnswer{Tag = "flink004PC", String = "Was macht ein Kerl wie Ihr in einer Festung wie dieser?", AnswerId = 3},
			OfferAnswer{Tag = "flink007PC", String = "Wen genau sucht Ihr?", AnswerId = 8},
		}}

	OnAnswer{2;
		Conditions = {
			IsPlayerFlagFalse{Name = "FlinkTauntOff"},
			Negated(IsPlayerFlagTrue{Name = "FlinkInfoSearchOn"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagFlinkKnown"},
			Say{Tag = "flink003", String = "Gestatten, Flink McWinter, ein... Reisender! Zumindest hoffe ich, das bald wieder zu sein!"},
			OfferAnswer{Tag = "flink004PC", String = "Was macht ein Kerl wie Ihr in einer Festung wie dieser?", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlinkTauntOff"}),
			IsPlayerFlagTrue{Name = "FlinkInfoSearchOn"},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagFlinkKnown"},
			Say{Tag = "flink003", String = "Gestatten, Flink McWinter, ein... Reisender! Zumindest hoffe ich, das bald wieder zu sein!"},
			OfferAnswer{Tag = "flink007PC", String = "Wen genau sucht Ihr?", AnswerId = 8},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlinkTauntOff"}),
			Negated(IsPlayerFlagTrue{Name = "FlinkInfoSearchOn"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagFlinkKnown"},
			Say{Tag = "flink003", String = "Gestatten, Flink McWinter, ein... Reisender! Zumindest hoffe ich, das bald wieder zu sein!"},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flink005", String = "Warum wusste ich nur, dass Ihr diese Frage stellen würdet? Wahrscheinlich weil ich ein Menschenkenner bin! Im Gegensatz zu Euch!"},
			Answer{Tag = "flink005PC", String = "Auch ich kenne die Menschen! Zumindest den ein oder anderen Weg, sie für immer zum Schweigen zu bringen! Wenn Ihr versteht, was ich meine...", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flink006", String = "Reizend! So was in der Art hatte ich befürchtet!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flink007", String = "Nun, um Eure Frage zu beantworten... ich war auf der Suche nach jemandem! Ich kam nur gerade zufällig hier vorbei, als der erste Angriff erfolgte!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlinkTauntOff"}, SetPlayerFlagTrue{Name = "FlinkInfoSearchOn"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
			IsPlayerFlagFalse{Name = "FlinkTauntOff"},
			IsPlayerFlagTrue{Name = "FlinkInfoSearchOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink004PC", String = "Was macht ein Kerl wie Ihr in einer Festung wie dieser?", AnswerId = 3},
			OfferAnswer{Tag = "flink007PC", String = "Wen genau sucht Ihr?", AnswerId = 8},
		}}

	OnAnswer{7;
		Conditions = {
			IsPlayerFlagFalse{Name = "FlinkTauntOff"},
			Negated(IsPlayerFlagTrue{Name = "FlinkInfoSearchOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink004PC", String = "Was macht ein Kerl wie Ihr in einer Festung wie dieser?", AnswerId = 3},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlinkTauntOff"}),
			IsPlayerFlagTrue{Name = "FlinkInfoSearchOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink007PC", String = "Wen genau sucht Ihr?", AnswerId = 8},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlinkTauntOff"}),
			Negated(IsPlayerFlagTrue{Name = "FlinkInfoSearchOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flink008", String = "Einen alten Geschäftsfreund von mir, Cassius Demer! Falls Ihr ihn - oder was auch immer von ihm übrig ist - irgendwo antreffen solltet, lasst es mich bitte wissen!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 220} , QuestBegin{QuestId = 221} , SetPlayerFlagFalse{Name = "FlinkInfoSearchOn"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
			IsPlayerFlagFalse{Name = "FlinkTauntOff"},
			IsPlayerFlagTrue{Name = "FlinkInfoSearchOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink004PC", String = "Was macht ein Kerl wie Ihr in einer Festung wie dieser?", AnswerId = 3},
			OfferAnswer{Tag = "flink007PC", String = "Wen genau sucht Ihr?", AnswerId = 8},
		}}

	OnAnswer{10;
		Conditions = {
			IsPlayerFlagFalse{Name = "FlinkTauntOff"},
			Negated(IsPlayerFlagTrue{Name = "FlinkInfoSearchOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink004PC", String = "Was macht ein Kerl wie Ihr in einer Festung wie dieser?", AnswerId = 3},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlinkTauntOff"}),
			IsPlayerFlagTrue{Name = "FlinkInfoSearchOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flink007PC", String = "Wen genau sucht Ihr?", AnswerId = 8},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlinkTauntOff"}),
			Negated(IsPlayerFlagTrue{Name = "FlinkInfoSearchOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end