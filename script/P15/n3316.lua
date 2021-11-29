-->INFO: homunculus_sleeping
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\Project\main\mission\dialoge\p15\n3316_homunculus_sleeping.txt


	

	OnBeginDialog{
		Conditions = {
			Negated(QuestState{QuestId = 231 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "homunculusSleeping001", String = "(Eine menschenähnliche Kreatur liegt wie schlafend da. Sie wirkt grotesk und unnatürlich entstellt. An ihrer Brust ist eine achteckige Vertiefung zu erkennen.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(Negated(QuestState{QuestId = 231 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "homunculusSleeping001", String = "(Eine menschenähnliche Kreatur liegt wie schlafend da. Sie wirkt grotesk und unnatürlich entstellt. An ihrer Brust ist eine achteckige Vertiefung zu erkennen.)"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 232 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "homunculusSleeping001PC", String = "(Das glimmende Octagon einsetzen.)", AnswerId = 3},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 232 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 232 , State = StateActive},
		},
		Actions = {
			QuestBegin{QuestId = 183} , QuestBegin{QuestId = 231},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "homunculusSleeping001PC", String = "(Das glimmende Octagon einsetzen.)", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 232 , State = StateActive}),
		},
		Actions = {
			QuestBegin{QuestId = 183} , QuestBegin{QuestId = 231},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "homunculusSleeping002", String = "(Das Licht des Octagons breitet sich über die Kreatur aus. Ein Zucken läuft durch den leblosen Körper.)"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q183HomunculusAlive"} , TransferXP{XP = 100 , Flag = Give} , 
					QuestSolve{QuestId = 232} , QuestSolve{QuestId = 183}, RemoveObject{X = 205 , Y = 335 , Object = 2438} , RemoveDialog{},
					TransferItem{TakeItem = 2625 , Amount = 1 , Flag = Take},
			EndDialog(),
		}}


	EndDefinition()
end