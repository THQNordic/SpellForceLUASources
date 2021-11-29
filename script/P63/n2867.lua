-->INFO: Sandor
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
--OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 2}
--!EDS ONIDLEGOHOME END

REM = [[

OnOneTimeEvent
{
Conditions = {
		IsGlobalFlagTrue{Name = "PreviewVersion"}
			},
Actions = {
		RemoveDialog{}
		}
}
]]


OnPlatformOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "SandorMustFollowAvatar", UpdateInterval = 20},
	},
	Actions = 
	{
		Follow{Target = Avatar},
	},
}

OnPlatformOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagFalse{Name = "SandorMustFollowAvatar", UpdateInterval = 20},
	},
	Actions = 
	{
		StopFollow{Target = Avatar},
	},
}

OnIdleGoHome
{
	X = _X, Y = _Y, Direction = 4,
	Conditions = 
	{
		IsGlobalFlagFalse{Name = "SandorMustFollowAvatar", UpdateInterval = 20},
	},
}

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p63\n2867_Sandor.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagSandorKnown"},
		},
		Actions = {
			Say{Tag = "sandor001", String = "Ah, ein Abenteurer! Kommt näher! Bringt ein wenig Zerstreuung in den Arbeitstag eines einfachen Schusters! Erzählt mir von Euren Abenteuern!"},
			Answer{Tag = "sandor001PC", String = "Ich bin kein Abenteurer, mein Freund!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSandorKnown"}),
			QuestState{QuestId = 325, State = StateUnknown},
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			QuestState{QuestId = 331, State = StateActive},
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			Say{Tag = "sandor004", String = "Ah, Ihr seid zurück!"},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSandorKnown"}),
			QuestState{QuestId = 325, State = StateUnknown},
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			QuestState{QuestId = 331, State = StateActive},
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			Say{Tag = "sandor004", String = "Ah, Ihr seid zurück!"},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSandorKnown"}),
			QuestState{QuestId = 325, State = StateUnknown},
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			Negated(QuestState{QuestId = 331, State = StateActive}),
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			Say{Tag = "sandor004", String = "Ah, Ihr seid zurück!"},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSandorKnown"}),
			QuestState{QuestId = 325, State = StateUnknown},
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			Negated(QuestState{QuestId = 331, State = StateActive}),
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			Say{Tag = "sandor004", String = "Ah, Ihr seid zurück!"},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSandorKnown"}),
			QuestState{QuestId = 325, State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			QuestState{QuestId = 331, State = StateActive},
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			Say{Tag = "sandor004", String = "Ah, Ihr seid zurück!"},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSandorKnown"}),
			QuestState{QuestId = 325, State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			QuestState{QuestId = 331, State = StateActive},
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			Say{Tag = "sandor004", String = "Ah, Ihr seid zurück!"},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSandorKnown"}),
			QuestState{QuestId = 325, State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			Negated(QuestState{QuestId = 331, State = StateActive}),
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			Say{Tag = "sandor004", String = "Ah, Ihr seid zurück!"},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSandorKnown"}),
			QuestState{QuestId = 325, State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			Negated(QuestState{QuestId = 331, State = StateActive}),
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			Say{Tag = "sandor004", String = "Ah, Ihr seid zurück!"},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSandorKnown"}),
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			QuestState{QuestId = 331, State = StateActive},
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			Say{Tag = "sandor004", String = "Ah, Ihr seid zurück!"},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSandorKnown"}),
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			QuestState{QuestId = 331, State = StateActive},
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			Say{Tag = "sandor004", String = "Ah, Ihr seid zurück!"},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSandorKnown"}),
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			Negated(QuestState{QuestId = 331, State = StateActive}),
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			Say{Tag = "sandor004", String = "Ah, Ihr seid zurück!"},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSandorKnown"}),
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			Negated(QuestState{QuestId = 331, State = StateActive}),
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			Say{Tag = "sandor004", String = "Ah, Ihr seid zurück!"},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSandorKnown"}),
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			QuestState{QuestId = 331, State = StateActive},
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			Say{Tag = "sandor004", String = "Ah, Ihr seid zurück!"},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSandorKnown"}),
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			QuestState{QuestId = 331, State = StateActive},
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			Say{Tag = "sandor004", String = "Ah, Ihr seid zurück!"},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSandorKnown"}),
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			Negated(QuestState{QuestId = 331, State = StateActive}),
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			Say{Tag = "sandor004", String = "Ah, Ihr seid zurück!"},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSandorKnown"}),
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			Negated(QuestState{QuestId = 331, State = StateActive}),
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			Say{Tag = "sandor004", String = "Ah, Ihr seid zurück!"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sandor002", String = "Nein? Ihr seht aber verflucht wie einer aus! Was ist, wollt Ihr vielleicht ein kleines Abenteuer erleben?"},
			Answer{Tag = "sandor002PC", String = "Meine Zeit ist begrenzt...", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			QuestState{QuestId = 331, State = StateActive},
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSandorKnown"},
			Say{Tag = "sandor003", String = "Ach was, ziert Euch nicht! Hört mir für einen Moment zu, es wird Euch sicher interessieren! Alte Schätze und alte Geheimnisse!"},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			QuestState{QuestId = 331, State = StateActive},
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSandorKnown"},
			Say{Tag = "sandor003", String = "Ach was, ziert Euch nicht! Hört mir für einen Moment zu, es wird Euch sicher interessieren! Alte Schätze und alte Geheimnisse!"},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			Negated(QuestState{QuestId = 331, State = StateActive}),
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSandorKnown"},
			Say{Tag = "sandor003", String = "Ach was, ziert Euch nicht! Hört mir für einen Moment zu, es wird Euch sicher interessieren! Alte Schätze und alte Geheimnisse!"},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			Negated(QuestState{QuestId = 331, State = StateActive}),
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSandorKnown"},
			Say{Tag = "sandor003", String = "Ach was, ziert Euch nicht! Hört mir für einen Moment zu, es wird Euch sicher interessieren! Alte Schätze und alte Geheimnisse!"},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			QuestState{QuestId = 331, State = StateActive},
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSandorKnown"},
			Say{Tag = "sandor003", String = "Ach was, ziert Euch nicht! Hört mir für einen Moment zu, es wird Euch sicher interessieren! Alte Schätze und alte Geheimnisse!"},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			QuestState{QuestId = 331, State = StateActive},
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSandorKnown"},
			Say{Tag = "sandor003", String = "Ach was, ziert Euch nicht! Hört mir für einen Moment zu, es wird Euch sicher interessieren! Alte Schätze und alte Geheimnisse!"},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			Negated(QuestState{QuestId = 331, State = StateActive}),
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSandorKnown"},
			Say{Tag = "sandor003", String = "Ach was, ziert Euch nicht! Hört mir für einen Moment zu, es wird Euch sicher interessieren! Alte Schätze und alte Geheimnisse!"},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			Negated(QuestState{QuestId = 331, State = StateActive}),
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSandorKnown"},
			Say{Tag = "sandor003", String = "Ach was, ziert Euch nicht! Hört mir für einen Moment zu, es wird Euch sicher interessieren! Alte Schätze und alte Geheimnisse!"},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			QuestState{QuestId = 331, State = StateActive},
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSandorKnown"},
			Say{Tag = "sandor003", String = "Ach was, ziert Euch nicht! Hört mir für einen Moment zu, es wird Euch sicher interessieren! Alte Schätze und alte Geheimnisse!"},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			QuestState{QuestId = 331, State = StateActive},
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSandorKnown"},
			Say{Tag = "sandor003", String = "Ach was, ziert Euch nicht! Hört mir für einen Moment zu, es wird Euch sicher interessieren! Alte Schätze und alte Geheimnisse!"},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			Negated(QuestState{QuestId = 331, State = StateActive}),
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSandorKnown"},
			Say{Tag = "sandor003", String = "Ach was, ziert Euch nicht! Hört mir für einen Moment zu, es wird Euch sicher interessieren! Alte Schätze und alte Geheimnisse!"},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			Negated(QuestState{QuestId = 331, State = StateActive}),
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSandorKnown"},
			Say{Tag = "sandor003", String = "Ach was, ziert Euch nicht! Hört mir für einen Moment zu, es wird Euch sicher interessieren! Alte Schätze und alte Geheimnisse!"},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			QuestState{QuestId = 331, State = StateActive},
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSandorKnown"},
			Say{Tag = "sandor003", String = "Ach was, ziert Euch nicht! Hört mir für einen Moment zu, es wird Euch sicher interessieren! Alte Schätze und alte Geheimnisse!"},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			QuestState{QuestId = 331, State = StateActive},
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSandorKnown"},
			Say{Tag = "sandor003", String = "Ach was, ziert Euch nicht! Hört mir für einen Moment zu, es wird Euch sicher interessieren! Alte Schätze und alte Geheimnisse!"},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			Negated(QuestState{QuestId = 331, State = StateActive}),
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSandorKnown"},
			Say{Tag = "sandor003", String = "Ach was, ziert Euch nicht! Hört mir für einen Moment zu, es wird Euch sicher interessieren! Alte Schätze und alte Geheimnisse!"},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			Negated(QuestState{QuestId = 331, State = StateActive}),
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSandorKnown"},
			Say{Tag = "sandor003", String = "Ach was, ziert Euch nicht! Hört mir für einen Moment zu, es wird Euch sicher interessieren! Alte Schätze und alte Geheimnisse!"},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sandor005", String = "Sandor ist mein Name! Also... vor einigen Tagen streifte ich durch die Berge nahe dem Schattenpass, auf der Suche nach alten Gegenständen, als..."},
			Answer{Tag = "sandor005PC", String = "Am Schattenpass... im Land der Goblins?", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sandor006", String = "Ist das Eure Geschichte oder meine? Wo war ich? Ach ja! Nun, als ich also dort meines Weges ging, vernahm ich plötzlich seltsame Geräusche... wie das entfernte Echo von Stimmen!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sandor007", String = "Ich fand drei verschiedene Stellen, an denen alte Grabsteine standen! Aus jedem einzelnen von ihnen schien dieses Raunen zu dringen..."},
			Answer{Tag = "sandor007PC", String = "Habt Ihr es näher untersucht?", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sandor008", String = "Nein! Ich bin nur ein Schuster! Dort lagen überall Knochen herum... und als ich näher trat, lief ein Zittern durch sie hindurch! Da bin ich gelaufen, so schnell ich konnte!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sandor009", String = "Die Grabsteine stehen nicht hier in der Stadt! Es sind Grabmäler draußen in den Bergen! Einer steht im Norden, einer im Süden und einer im Südwesten!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			QuestBegin {QuestId = 324}, QuestBegin {QuestId = 325}, QuestBegin {QuestId = 326}, QuestBegin {QuestId = 327}, QuestBegin {QuestId = 328},
			Say{Tag = "sandor010", String = "Untersucht die drei Grabsteine und kehrt danach hierher zurück und erzählt mir davon! Aber seht Euch vor!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			QuestState{QuestId = 331, State = StateActive},
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			QuestState{QuestId = 331, State = StateActive},
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			Negated(QuestState{QuestId = 331, State = StateActive}),
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			Negated(QuestState{QuestId = 331, State = StateActive}),
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			QuestState{QuestId = 331, State = StateActive},
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			QuestState{QuestId = 331, State = StateActive},
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			Negated(QuestState{QuestId = 331, State = StateActive}),
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			Negated(QuestState{QuestId = 331, State = StateActive}),
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			QuestState{QuestId = 331, State = StateActive},
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			QuestState{QuestId = 331, State = StateActive},
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			Negated(QuestState{QuestId = 331, State = StateActive}),
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			Negated(QuestState{QuestId = 331, State = StateActive}),
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			QuestState{QuestId = 331, State = StateActive},
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			QuestState{QuestId = 331, State = StateActive},
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			Negated(QuestState{QuestId = 331, State = StateActive}),
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			Negated(QuestState{QuestId = 331, State = StateActive}),
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sandor011", String = "Und?"},
			Answer{Tag = "sandor011PC", String = "Es waren tatsächlich Worte zu hören. Tar, Shin und Guar!", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sandor012", String = "Hm. Was mag das wohl heißen?"},
			Answer{Tag = "sandor012PC", String = "Ich weiß es nicht, Sandor!", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sandor013", String = "Hm... geht zu Goran, dem alten Schriftgelehrten! Vielleicht kann er diese Worte entschlüsseln! Er kennt sich mit den alten Sprachen aus!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			QuestSolve {QuestId = 325}, QuestSolve {QuestId = 326}, QuestSolve {QuestId = 327}, QuestSolve {QuestId = 328} , QuestSolve {QuestId = 329}, SetPlayerFlagFalse {Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			QuestBegin {QuestId = 330},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			QuestState{QuestId = 331, State = StateActive},
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			QuestState{QuestId = 331, State = StateActive},
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			Negated(QuestState{QuestId = 331, State = StateActive}),
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			Negated(QuestState{QuestId = 331, State = StateActive}),
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			QuestState{QuestId = 331, State = StateActive},
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			QuestState{QuestId = 331, State = StateActive},
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			Negated(QuestState{QuestId = 331, State = StateActive}),
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			Negated(QuestState{QuestId = 331, State = StateActive}),
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			QuestState{QuestId = 331, State = StateActive},
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			QuestState{QuestId = 331, State = StateActive},
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			Negated(QuestState{QuestId = 331, State = StateActive}),
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			Negated(QuestState{QuestId = 331, State = StateActive}),
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			QuestState{QuestId = 331, State = StateActive},
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			QuestState{QuestId = 331, State = StateActive},
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			Negated(QuestState{QuestId = 331, State = StateActive}),
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			Negated(QuestState{QuestId = 331, State = StateActive}),
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sandor014", String = "Und? Was sagt er?"},
			Answer{Tag = "sandor014PC", String = "Er glaubt, dass diese Worte den Name eines alten Hexers bilden: Shin Tar Guar!", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sandor015", String = "Ein alter Hexer? Es gibt da eine Höhle in den Bergen... in ihr ist angeblich das Grab eines alten Hexers zu finden! Ich möchte wetten, dass sie voller Schätze steckt!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sandor016", String = "Die Höhle ist mit einem Steintor verschlossen. Keiner konnte es bisher öffnen! Wenn es das Grab dieses Hexers ist..."},
			Answer{Tag = "sandor016PC", String = "...dann öffnet sein Name vielleicht das Tor!", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 332}, QuestSolve {QuestId = 331}, SetGlobalFlagTrue{Name = "SandorMustFollowAvatar"},
			Say{Tag = "sandor017", String = "Kommt! Folgt mir! Wir gehen zu der Höhle!"},
			Answer{Tag = "sandor017PC", String = "Nur ein Schuster... soviel dazu...", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{20;
		Conditions = {
			Negated(IsPlayerFlagTrue {Name ="CPlayerHasThreeStones"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{20;
		Conditions = {
			IsPlayerFlagTrue {Name ="CPlayerHasThreeStones"},
		},
		Actions = {
			Say{Tag = "sandor018", String = "Ja, Stimmen wie Echos aus der Ferne!"},
			Answer{Tag = "sandor018PC", String = "Ich habe drei Grabsteine gefunden, an denen solche Echos erklangen!", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sandor019", String = "Habt Ihr verstehen können, was die Stimmen sagen?"},
			Answer{Tag = "sandor019PC", String = "Es waren drei Worte: Tar, Shin und Guar.", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sandor020", String = "Dann habt Ihr wohl bereits alles ergründet... aber was bedeuten diese Worte?"},
			Answer{Tag = "sandor020PC", String = "Ich weiß es nicht!", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			QuestSolve {QuestId = 325}, QuestSolve {QuestId = 326}, QuestSolve {QuestId = 327}, QuestSolve {QuestId = 328}, QuestBegin{QuestId = 329},
			QuestSolve {QuestId = 329},
			SetNpcFlagTrue{Name = "StonesAsked"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sandor021", String = "Es hört sich an, wie ein alte Sprache... vielleicht solltet Ihr Goran danach fragen!"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sandor022", String = "Er ist Schriftgelehrter, vielleicht kann er die Worte übersetzen! Sein Haus steht in der Nähe des Marktes!"},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			QuestState{QuestId = 331, State = StateActive},
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			QuestBegin {QuestId = 330},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			QuestState{QuestId = 331, State = StateActive},
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			QuestBegin {QuestId = 330},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			Negated(QuestState{QuestId = 331, State = StateActive}),
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			QuestBegin {QuestId = 330},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			Negated(QuestState{QuestId = 331, State = StateActive}),
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			QuestBegin {QuestId = 330},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			QuestState{QuestId = 331, State = StateActive},
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			QuestBegin {QuestId = 330},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			QuestState{QuestId = 331, State = StateActive},
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			QuestBegin {QuestId = 330},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			Negated(QuestState{QuestId = 331, State = StateActive}),
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			QuestBegin {QuestId = 330},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			Negated(QuestState{QuestId = 331, State = StateActive}),
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			QuestBegin {QuestId = 330},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			QuestState{QuestId = 331, State = StateActive},
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			QuestBegin {QuestId = 330},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			QuestState{QuestId = 331, State = StateActive},
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			QuestBegin {QuestId = 330},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			Negated(QuestState{QuestId = 331, State = StateActive}),
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			QuestBegin {QuestId = 330},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			Negated(QuestState{QuestId = 331, State = StateActive}),
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			QuestBegin {QuestId = 330},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			QuestState{QuestId = 331, State = StateActive},
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			QuestBegin {QuestId = 330},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			QuestState{QuestId = 331, State = StateActive},
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			QuestBegin {QuestId = 330},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			Negated(QuestState{QuestId = 331, State = StateActive}),
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			QuestBegin {QuestId = 330},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			Negated(QuestState{QuestId = 331, State = StateActive}),
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			QuestBegin {QuestId = 330},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
			 IsPlayerFlagTrue {Name = "CNoStoneTouched"},
		},
		Actions = {
			Say{Tag = "sandor023", String = "Stimmen... wie Echos aus weiter Ferne! Wispernd, in einer seltsamen Sprache!"},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{27;
		Conditions = {
			Negated( IsPlayerFlagTrue {Name = "CNoStoneTouched"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "sandor023PC", String = "Ich habe bereits solche Geräusche in den Bergen vernommen! Wie viele dieser Orte gibt es, sagtet Ihr?", AnswerId = 30},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			QuestState{QuestId = 331, State = StateActive},
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Blocker"},
			SetNpcFlagTrue{Name = "StonesAsked"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{29;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			QuestState{QuestId = 331, State = StateActive},
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Blocker"},
			SetNpcFlagTrue{Name = "StonesAsked"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
		}}

	OnAnswer{29;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			Negated(QuestState{QuestId = 331, State = StateActive}),
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Blocker"},
			SetNpcFlagTrue{Name = "StonesAsked"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{29;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			Negated(QuestState{QuestId = 331, State = StateActive}),
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Blocker"},
			SetNpcFlagTrue{Name = "StonesAsked"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
		}}

	OnAnswer{29;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			QuestState{QuestId = 331, State = StateActive},
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Blocker"},
			SetNpcFlagTrue{Name = "StonesAsked"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{29;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			QuestState{QuestId = 331, State = StateActive},
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Blocker"},
			SetNpcFlagTrue{Name = "StonesAsked"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
		}}

	OnAnswer{29;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			Negated(QuestState{QuestId = 331, State = StateActive}),
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Blocker"},
			SetNpcFlagTrue{Name = "StonesAsked"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{29;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			Negated(QuestState{QuestId = 331, State = StateActive}),
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Blocker"},
			SetNpcFlagTrue{Name = "StonesAsked"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			QuestState{QuestId = 331, State = StateActive},
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Blocker"},
			SetNpcFlagTrue{Name = "StonesAsked"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			QuestState{QuestId = 331, State = StateActive},
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Blocker"},
			SetNpcFlagTrue{Name = "StonesAsked"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			Negated(QuestState{QuestId = 331, State = StateActive}),
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Blocker"},
			SetNpcFlagTrue{Name = "StonesAsked"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			Negated(QuestState{QuestId = 331, State = StateActive}),
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Blocker"},
			SetNpcFlagTrue{Name = "StonesAsked"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			QuestState{QuestId = 331, State = StateActive},
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Blocker"},
			SetNpcFlagTrue{Name = "StonesAsked"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			QuestState{QuestId = 331, State = StateActive},
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Blocker"},
			SetNpcFlagTrue{Name = "StonesAsked"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			Negated(QuestState{QuestId = 331, State = StateActive}),
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Blocker"},
			SetNpcFlagTrue{Name = "StonesAsked"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			Negated(QuestState{QuestId = 331, State = StateActive}),
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Blocker"},
			SetNpcFlagTrue{Name = "StonesAsked"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sandor024", String = "Es sind drei!"},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			QuestState{QuestId = 331, State = StateActive},
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Blocker"},
			SetNpcFlagTrue{Name = "StonesAsked"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{31;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			QuestState{QuestId = 331, State = StateActive},
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Blocker"},
			SetNpcFlagTrue{Name = "StonesAsked"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
		}}

	OnAnswer{31;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			Negated(QuestState{QuestId = 331, State = StateActive}),
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Blocker"},
			SetNpcFlagTrue{Name = "StonesAsked"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{31;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			Negated(QuestState{QuestId = 331, State = StateActive}),
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Blocker"},
			SetNpcFlagTrue{Name = "StonesAsked"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
		}}

	OnAnswer{31;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			QuestState{QuestId = 331, State = StateActive},
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Blocker"},
			SetNpcFlagTrue{Name = "StonesAsked"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{31;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			QuestState{QuestId = 331, State = StateActive},
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Blocker"},
			SetNpcFlagTrue{Name = "StonesAsked"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
		}}

	OnAnswer{31;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			Negated(QuestState{QuestId = 331, State = StateActive}),
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Blocker"},
			SetNpcFlagTrue{Name = "StonesAsked"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{31;
		Conditions = {
			QuestState{QuestId = 325, State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			Negated(QuestState{QuestId = 331, State = StateActive}),
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Blocker"},
			SetNpcFlagTrue{Name = "StonesAsked"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor004PC", String = "Gut! Erzählt mir von Euren Geheimnissen, Freund Schuster!", AnswerId = 3},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			QuestState{QuestId = 331, State = StateActive},
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Blocker"},
			SetNpcFlagTrue{Name = "StonesAsked"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			QuestState{QuestId = 331, State = StateActive},
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Blocker"},
			SetNpcFlagTrue{Name = "StonesAsked"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			Negated(QuestState{QuestId = 331, State = StateActive}),
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Blocker"},
			SetNpcFlagTrue{Name = "StonesAsked"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"},
			Negated(QuestState{QuestId = 331, State = StateActive}),
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Blocker"},
			SetNpcFlagTrue{Name = "StonesAsked"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor010PC", String = "Ich habe die drei Grabsteine untersucht.", AnswerId = 10},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			QuestState{QuestId = 331, State = StateActive},
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Blocker"},
			SetNpcFlagTrue{Name = "StonesAsked"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			QuestState{QuestId = 331, State = StateActive},
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Blocker"},
			SetNpcFlagTrue{Name = "StonesAsked"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor013PC", String = "Ich war bei Goran!", AnswerId = 15},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			Negated(QuestState{QuestId = 331, State = StateActive}),
			UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"}),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Blocker"},
			SetNpcFlagTrue{Name = "StonesAsked"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sandor017PCa", String = "Stimmen aus Grabsteinen?", AnswerId = 20},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(QuestState{QuestId = 325, State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "FlagPlayerHasThreeStonesDuringEchoes"}),
			Negated(QuestState{QuestId = 331, State = StateActive}),
			Negated(UND(QuestState{QuestId = 325, State = StateActive} , IsNpcFlagFalse{Name = "StonesAsked"})),
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Blocker"},
			SetNpcFlagTrue{Name = "StonesAsked"},
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end