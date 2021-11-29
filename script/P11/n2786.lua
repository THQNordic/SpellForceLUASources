-->INFO: TworsnikTruhe
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p11\n2786_TworsnikTruhe.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "tworsnikChest001", String = "(Die Truhe ist durch ein Schloss gesichert.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			PlayerHasItem{ItemId = 2739},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tworsnikChest001PC", String = "(Mit Tworsniks Schlüssel aufschließen.)", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2739}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tworsnikChest002", String = "(Der Schlüssel passt und entriegelt das Schloss. Die Truhe kann jetzt geöffnet werden.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 2739 , GiveItem = 0 , Flag = Take},
			SetPlayerFlagTrue{Name = "FlagTworsnikChestOpened"},
			QuestSolve{QuestId = 507},
			RemoveDialogFromNpc{NpcId = 2786}
			,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end