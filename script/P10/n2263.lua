-->INFO: Welp
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 7, Conditions = {QuestState{QuestId = 164 , State = StateUnknown}}}


OnIdleGoHome{WalkMode = Run, X = 250 , Y = 579 , Direction = 3 , 
Conditions = {Negated(QuestState{QuestId = 164 , State = StateUnknown})},
HomeActions = {SetGlobalFlagTrue{Name = "Q164WelpIsHome"}}
}

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
-- Source: C:\project\main\mission\dialoge\p10\n2263_Welp.txt


	

	OnBeginDialog{
		Conditions = {
			Negated(QuestState{QuestId = 163 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "welp001", String = "(Dieses Wolfswelpe scheint sehr schwach zu sein und kann sich kaum auf den Beinen halten. Ein Brocken Rindfleisch von Bauer Bron könnte es stärken.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(Negated(QuestState{QuestId = 163 , State = StateSolved})),
		},
		Actions = {
			Say{Tag = "welp004", String = "(Das Welpe ist gestärkt und läuft zielstrebig davon.)"},
		}}

	OnAnswer{1;
		Conditions = {
			PlayerHasItem{ItemId = 2513},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "Q161HasSeenWelp"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "welp001PC", String = "(Dem Welpen das Fleisch geben.)", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2513}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "Q161HasSeenWelp"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "welp002", String = "(Das Tier verzehrt das Fleisch gierig und richtet sich auf...)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "welp003", String = "(...dann läuft es zielstrebig davon.)"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 2513 , Amount = 1 , Flag = Take} , 
				TransferXP{XP = 100 , Flag = Give} , QuestBegin{QuestId = 164} , 
				QuestSolve{QuestId = 163} , SetRewardFlagTrue{ Name = "WeisseSchatten1"},
				RemoveDialog{},
			EndDialog(),
		}}


	EndDefinition()
end