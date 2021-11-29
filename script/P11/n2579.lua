-->INFO: locked_chest
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p11\n2579_locked_chest.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "chestStoneblade001", String = "(Diese verschlossene Truhe hat keinerlei Schlüsselloch. Nur eine sternförmige Einlassung befindet sich an der Vorderseite.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			PlayerHasItem{ItemId = 2660},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "chestStoneblade001PC", String = "(Das sternförmige Amulett einsetzen.)", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2660}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "chestStoneblade002", String = "(Als das Amulett in die Einlassung gleitet, ertönt im Innern der Truhe ein Klicken.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			RemoveDialogFromNpc{NpcId = 2579},
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