-->INFO: Thom
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)



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
-- Source: C:\project\main\mission\dialoge\p21\n2976_Thom.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagTrue{Name = "FlagThomKnown"},
			QuestState{QuestId = 376 , State = StateActive},
		},
		Actions = {
			Say{Tag = "thom001", String = "Ihr seid es! Bringt Ihr Hilfe?"},
			OfferAnswer{Tag = "thom003PC", String = "Ich weiß, wie Ihr General Torn heilen könnt.", AnswerId = 3},
		}}

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagTrue{Name = "FlagThomKnown"},
			Negated(QuestState{QuestId = 376 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "thom001", String = "Ihr seid es! Bringt Ihr Hilfe?"},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "FlagThomKnown"}),
		},
		Actions = {
			Say{Tag = "thom002", String = "Euch schicken die Götter, Fremder! Verfügt Ihr über Kenntnisse in der Heilkunst?"},
			Answer{Tag = "thom002PC", String = "Warum fragt Ihr?", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "thom003", String = "General Torn... sein Blick wird von einem Katarakt vernebelt! Er wird erblinden, falls ihm niemand den Star aussticht! Ich bin Thom, sein Feldscher! Doch dies übersteigt meine Fähigkeiten!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 376 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagThomKnown"},
 						QuestBegin{QuestId = 374},
 						QuestBegin{QuestId = 375},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "thom003PC", String = "Ich weiß, wie Ihr General Torn heilen könnt.", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 376 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagThomKnown"},
 						QuestBegin{QuestId = 374},
 						QuestBegin{QuestId = 375},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "thom004", String = "Sprecht!"},
			Answer{Tag = "thom004PC", String = "Mit dieser Nadel muss die getrübte Linse ins Innere des Auges versenkt werden!", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "thom005", String = "Habt vielen Dank! Ich werde es so ausführen, wie Ihr gesagt habt! Wie kann ich Euch dafür nur entlohnen... wartet... ich weiß!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "thom006", String = "Hier, nehmt diese Steintafel! Einer von uns brachte sie aus Mulandir mit! Vielleicht ist sie von Wert für Euch!"},
			Answer{Tag = "thom006PC", String = "Eine alte... Steintafel?", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "thom007", String = "Seht nur, diese Runen darauf! Das ist bestimmt ein mächtiger Zauber! In Graufurt gibt es Schriftgelehrte! Vielleicht kann dort jemand diese Tafel für Euch entziffern?"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 2898, GiveItem = 2899 , Flag = Exchange},
					QuestSolve{QuestId = 376},
					QuestSolve{QuestId = 374},
					RemoveDialogFromNpc{NpcId = 2976},
					SetRewardFlagTrue{ Name = "DerKatarakt"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end