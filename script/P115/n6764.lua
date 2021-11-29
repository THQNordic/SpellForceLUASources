-->INFO: Drachenstein1
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

		





--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P115\n6764_Drachenstein1.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "drachenstein1115_001", String = "(Der Drachenstein strömt eine durchdringende Kälte aus. Deutlich spürt man Aryns Macht hinter der durchsichtigen Wand.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			PlayerHasItem{ItemId = 4096},
		},
		Actions = {
			Say{Tag = "drachenstein1115_002", String = "(Der Feuerkristall beginnt stärker zu glühen.)"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 4096}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "drachenstein1115_003", String = "(Als der Kristall den Drachenstein berührt, erlischt die Flamme, während die Kälte in den Stein zurückweicht.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			ChangeObject{X = _X , Y = _Y , Object = 2789 },
			SetGlobalFlagTrue{ Name = "P115_FirstStoneOff"},
			TransferItem{TakeItem = 4096, Flag = Take},
			RemoveDialog{NpcId = self},
			QuestSolve{QuestId =660},
			IncreaseGlobalCounter { Name = "DrachensteinZaehlerP115"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end