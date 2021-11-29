-->INFO: chestBreathForestTree
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p30\n4192_chestBreathForestTree.txt


	

	OnBeginDialog{
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 3460})),
			PlayerHasItem{ItemId = 3460},
		},
		Actions = {
			Say{Tag = "chestBreath002", String = "(Das Wasser des Brunnens schillert hellgrün.)"},
			OfferAnswer{Tag = "chestBreath003PC", String = "(Das Herz des Waldes zurücklegen.)", AnswerId = 5},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 3460})),
			Negated(PlayerHasItem{ItemId = 3460}),
		},
		Actions = {
			Say{Tag = "chestBreath002", String = "(Das Wasser des Brunnens schillert hellgrün.)"},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(PlayerHasItem{ItemId = 3460}),
			Negated(PlayerHasItem{ItemId = 3460}),
		},
		Actions = {
			Say{Tag = "chestBreath001", String = "(In dem Wasser des Brunnen glitzert ein großer, grüner Edelstein. Es muss das Herz des Waldes sein.)"},
			OfferAnswer{Tag = "chestBreath002PC", String = "(Das Herz des Waldes nehmen.)", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(PlayerHasItem{ItemId = 3460}),
			Negated(Negated(PlayerHasItem{ItemId = 3460})),
		},
		Actions = {
			Say{Tag = "chestBreath001", String = "(In dem Wasser des Brunnen glitzert ein großer, grüner Edelstein. Es muss das Herz des Waldes sein.)"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "chestBreath003", String = "(Das Herz pulsiert grünlich, als Ihr es an Euch nehmt. Die große Blutesche setzt sich knurrend in Eure Richtung in Bewegung.)"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 3460 , Amount = 1 , Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 3460}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "chestBreath002PC", String = "(Das Herz des Waldes nehmen.)", AnswerId = 1},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 3460})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "chestBreath004", String = "(Ihr legt das Herz in das Wasser zurück, das sofort grünlich aufleuchtet. Die Blutesche gibt ein beruhigtes Brummen von sich.)"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 3460 , Amount = 1 , Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
			PlayerHasItem{ItemId = 3460},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "chestBreath003PC", String = "(Das Herz des Waldes zurücklegen.)", AnswerId = 5},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 3460}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end