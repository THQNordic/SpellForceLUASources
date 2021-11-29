-->INFO: MenhirKarte
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p111\n7565_MenhirKarte.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "menhirKarte_P111_001", String = "(Goldene Zwergenrunen bedecken diesen Stein. Es sind drei Vertiefungen zu erkennen, die zusammen ein Dreieck ergeben.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItem3GoldenItems"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "menhirKarte_P111_002PC", String = "(Die 3 Teile des Schlüssels einsetzen.)", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItem3GoldenItems"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "menhirKarte_P111_003", String = "(Die goldenen Fragmente leuchten auf)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "menhirKarte_P111_004", String = "(Die Runen bilden einen Schriftzug:' Suche die Karte im Fels. Das Feuer auf der Karte weist dir den Weg.')"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			SetEffect{Effect = "Campfire", X = 224, Y = 354, Length = 0},
	      QuestSolve {QuestId = 709},
	      QuestBegin {QuestId = 739},
	      QuestBegin {QuestId = 710},
	      SetItemFlagFalse {Name = "PlayerHasItem3GoldenItems"},	
	      SetRewardFlagTrue { Name = "SQTiondriaObjekteEingesetzt" },	
	      RemoveDialog{NpcId = 7565},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
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