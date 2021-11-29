-->INFO: CassiusCorpseHowlMounds
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\Project\main\mission\dialoge\p15\n4199_CassiusCorpseHowlMounds.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "cassiusCorpse001", String = "(Die Leiche eines Reisenden liegt hier. Der Kleidung nach scheint er dem Diebeshandwerk nachgegangen zu sein. Ein vergilbter Brief offenbart den Namen des Empfängers: Cassius Demer.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 221 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cassiusCorpse001PC", String = "(Die Leiche nach Hinweisen durchsuchen.)", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 221 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "cassiusCorpse002", String = "(Der Brief zerfällt bei näherer Untersuchung zu Staub. In der vermoderten Kleidung ist aber noch ein seltsames, goldenes Bruchstück zu finden.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "cassiusCorpse003", String = "(Das Bruchstück scheint zu irgendeinem Schmuckstück oder einem anderen Kunsthandwerk zu gehören.)"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 3466 , Amount = 1 , Flag = Give} , 
					QuestSolve{QuestId = 221} , QuestBegin{QuestId = 527} , 
					SetRewardFlagTrue{ Name = "Trickster1Cassius"},
			RemoveDialog{},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end