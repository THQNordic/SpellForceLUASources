-->INFO: Altar
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p5\n3394_Altar.txt


	

	OnBeginDialog{
		Conditions = {
			QuestState{QuestId = 486 , State = StateActive},
		},
		Actions = {
			Say{Tag = "altar001", String = "(Ein rankenumwucherter Brunnen steht hier. Er gleicht einem Altar. Im hellen Wasser schwimmen Bl�tter der Lenyapflanze.)"},
			OfferAnswer{Tag = "altar001PC", String = "(1000 Einheiten Lenya opfern.)", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(QuestState{QuestId = 486 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "altar001", String = "(Ein rankenumwucherter Brunnen steht hier. Er gleicht einem Altar. Im hellen Wasser schwimmen Bl�tter der Lenyapflanze.)"},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(Negated(TimeDay())),
		},
		Actions = {
			Say{Tag = "altar003", String = "(Das Ritual bleibt ohne Wirkung! Das Lenyaopfer wird nicht angenommen! Das Ritual muss bei Nacht durchgef�hrt werden.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(TimeDay()),
		},
		Actions = {
			Say{Tag = "altar002", String = "(Das Lenya l�st sich im Wasser des Brunnens auf. Die B�ume der Umgebung beginnen zu murmeln und zu fl�stern...)"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q484SpawnDryads"}, QuestSolve{QuestId = 486} , 
					QuestSolve{QuestId = 484} , 
					QuestBegin{QuestId = 98},
					TransferResource{Resource = GoodManaHerb, Side = SideLight, Amount = 1000, Flag = Take},
					SetRewardFlagTrue{ Name = "BefreiungShiel2Dryaden"},
			EndDialog(),
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end