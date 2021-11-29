-->INFO: Dorfwache
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = self},
		SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_8789"},		
	}
}


--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = North}
--!EDS ONIDLEGOHOME END


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n8789_Dorfwache.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsGlobalFlagTrue {Name = "g_P204_SpielerWarBeiAlyah"},
		},
		Actions = {
			Say{Tag = "gatekeeper_fandaroP204_001", String = "Immer daran denken Freund! Der Kaiser ist gut, der Kaiser ist weise!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_P204_SpielerWarBeiAlyah"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{2;
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagDorfwacheKnown"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "gatekeeper_fandaroP204_002PC", String = "Aonirs Licht, guter Mann. Ein Frage ...", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagDorfwacheKnown"}),
		},
		Actions = {
			Say{Tag = "gatekeeper_fandaroP204_014", String = "Ihr solltet mit Alyah reden. Sie befindet sich nördlich von hier."},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_fandaroP204_003", String = "Ihr solltet hier besser mit dem Segen des Kaisers grüßen, Fremdling! Sein Licht überstrahlt das der Götter!"},
			Answer{Tag = "gatekeeper_fandaroP204_004PC", String = "Ihr meint der Glanz seines Goldes?", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_fandaroP204_005", String = "Ah, ich sehe Ihr versteht! Aber passt auf Eure Zunge auf, hier in Empyria ist man mit dem Henkersbeil schnell zur Hand"},
			Answer{Tag = "gatekeeper_fandaroP204_006PC", String = "Empyria, alsobin ich endlich am Ziel ... Sagt, gibt es hier jemanden, den man die Frau unter dem Baum nennt?", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_fandaroP204_007", String = "Hm, so nennt man die Dryade der Lebenseibe!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_fandaroP204_008", String = "Sie lebt nicht hier in der Stadt, aber oben im Palastgarten gibt es ein Portal, dass zu ihrem Hain führt."},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_fandaroP204_009", String = "Allerdings lässt der Kaiser dieses Portal gut bewachen! Man munkelt, er hätte ein Auga auf die Dryade geworfen, wenn Ihr versteht was ich meine ...!"},
			Answer{Tag = "gatekeeper_fandaroP204_010PC", String = "Ich muss zu dieser Dryade! Gibt es einen Weg in den Palastgarten?", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_fandaroP204_011", String = "Hm, Fremde haben keinen Zutritt zur Stadt. Euch bliebe nur der ... weniger gesetzestreue Weg. "},
			Answer{Tag = "gatekeeper_fandaroP204_012PC", String = "Ich verstehe.", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_fandaroP204_013", String = "Am besten Ihr fragt Alyah , sie ... kennt sich mit so etwas aus. Ihr findet sie etwas nördlich von hier!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagDorfwacheKnown"},
			QuestBegin {QuestId = 812}, QuestSolve {QuestId = 1081}, SetGlobalFlagTrue {Name = "g_P204_AlyahDialogAn"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end