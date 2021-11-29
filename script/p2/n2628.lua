-->INFO: Swerdis
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--Dialogsteuerung
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
-- Source: C:\project\main\mission\dialoge\p2\n2628_Swerdis.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagTrue{Name = "FlagSwerdisKnown"},
			PlayerHasItem{ItemId = 2670},
		},
		Actions = {
			Say{Tag = "swerdis001", String = "Was wollt Ihr von mir?"},
			OfferAnswer{Tag = "swerdis003PC", String = "Ich habe Eure Tinktur besorgt! Hier ist sie!", AnswerId = 3},
		}}

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagTrue{Name = "FlagSwerdisKnown"},
			Negated(PlayerHasItem{ItemId = 2670}),
		},
		Actions = {
			Say{Tag = "swerdis001", String = "Was wollt Ihr von mir?"},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "FlagSwerdisKnown"}),
		},
		Actions = {
			Say{Tag = "swerdis002", String = "Bitte Fremder, lasst mich in meinem Schmerz allein! Viele unserer Verletzten werden sterben, wenn niemand nach Graufurt durchdringt!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "swerdis003", String = "Die Waffen der Angreifer sind verseucht und giftig! Und nur Händlerin Valdis verfügt über die Wundtinktur, die unsere Verletzten vor dem Wundbrand bewahren kann!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem{ItemId = 2670},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSwerdisKnown"},
						QuestBegin{QuestId = 357},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "swerdis003PC", String = "Ich habe Eure Tinktur besorgt! Hier ist sie!", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2670}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSwerdisKnown"},
						QuestBegin{QuestId = 357},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "swerdis004", String = "Oh, Fremder! Ich stehe tief in Eurer Schuld! Bitte nehmt dies als kleines Zeichen meiner Dankbarkeit!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 2670 , GiveItem = 2673 , Flag = Exchange},
 			 RemoveDialogFromNpc{NpcId = 2628},
			QuestSolve{QuestId = 353},
 					  QuestSolve{QuestId = 354},
					  QuestSolve{QuestId = 355},
					  QuestSolve{QuestId = 356},
					  QuestSolve{QuestId = 357},
					  QuestSolve{QuestId = 352},
					  SetRewardFlagTrue{ Name = "WundtinkturSwerdis"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
			PlayerHasItem{ItemId = 2670},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "swerdis003PC", String = "Ich habe Eure Tinktur besorgt! Hier ist sie!", AnswerId = 3},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2670}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end