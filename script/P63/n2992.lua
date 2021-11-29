-->INFO: Tombard
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

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


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p63\n2992_Tombard.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagTrue{ Name = "TombardKnown"},
		},
		Actions = {
			Say{Tag = "tombard001", String = "Tombard muss arbeiten..."},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagTrue{ Name = "TombardKnown"}),
		},
		Actions = {
			Say{Tag = "tombard007", String = "Hm? Was?"},
			Answer{Tag = "tombard007PC", String = "Wie ist Euer Name?", AnswerId = 9},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 397 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tombard001PC", String = "Adhira schickt mich mit einem Trank!", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 397 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tombard002", String = "Trank? Oh, das ist gut! Adhira hat mir erzählt davon! Trank macht Tombard stark und schlau! Dann Tombard niemand mehr auslachen wird..."},
			Answer{Tag = "tombard002PC", String = "Es sollte Euch auch ohne den Trank niemand auslachen!", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tombard003", String = "Du mir den Trank geben! Du mir geben! Tombard will stark und schlau sein!"},
			Answer{Tag = "tombard003PC", String = "Hier nehmt!", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tombard004", String = "Danke! Uh, schmeckt böse... brennt..."},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tombard005", String = "Jetzt... Tombard schlau wird! Niemand mehr... Tombard... auslachen... NIEMAND!"},
			Answer{Tag = "tombard005PC", String = "Was ist mit Euch? Ihr seht so verändert aus!", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tombard006", String = "NIEMAND WIRD MICH JE WIEDER AUSLACHEN! HAR HAR!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 3169 , Flag = Take},
				   QuestSolve{QuestId = 397},
				   QuestBegin{QuestId = 398},
				   RemoveDialog{NpcId = self},
				   ChangeUnit{Unit = 1155},
				   ChangeRace{Race = 150 , NpcId = self},
				   SetRewardFlagTrue{ Name = "BlutTombardTot"},
				   EndDialog{},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tombard008", String = "Tombard! Tombard muss arbeiten!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "TombardKnown"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}


	EndDefinition()
end