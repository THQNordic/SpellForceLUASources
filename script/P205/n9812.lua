-->INFO: Nymphe
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


-- Nymphe wird steuerbar
OnPlatformOneTimeEvent
{
	Conditions = 
	{
	   	IsGlobalFlagTrue {Name = "g_P205_NympheMitnehmen", UpdateInterval = 10},
	},
	
	Actions =
	{
	   ChangeOwner{NpcId = self},
	   ChangeRace{Race = 148, NpcId = 9812},
	}
}

-- Dialog removen wenn alle Nymphen befreit wurden.
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P205_NymphenFreiA"},
		IsGlobalFlagTrue{Name = "g_P205_NymphenFreiB"},
		IsGlobalFlagTrue{Name = "g_P205_NymphenFreiC"},		  	
	},
	
	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9812"}
	}
}

OnOneTimeEvent
{
	Conditions = 
	{
		QuestState{QuestId = 869, State = StateSolved}	  	
	},
	
	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9812"}
	}
}

OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P205_CutsceneSpinnenkoenigAvatarStart", UpdateInterval = 10},
	},
	
	Actions =
	{
		SetNoFightFlagTrue{NpcId = 9812},
	}
}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P205\n9812_Nymphe.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "nymphetP205_001", String = "Ein Mensch! Hat die Herrin Euch geschickt?"},
			Answer{Tag = "nymphetP205_002PC", String = "Ich suche nach dem Übel, dass diesen Garten verdirbt!", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nymphetP205_003", String = "So wie ich und meine Schwestern! Doch wir wurden oben bei dem Monument von Spinnenwesen angegriffen!"},
			Answer{Tag = "nymphetP205_004PC", String = "Wo sind Eure Schwestern?", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nymphetP205_005", String = "Ich weiß es nicht, wir wurden auseinandergetrieben! Aber es gibt hier einige Höhlen, ich glaube, sie halten sich dort versteckt!"},
			Answer{Tag = "nymphetP205_006PC", String = "Dann lass uns nach ihnen suchen, wir können jede Hilfe brauchen!", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "nymphetP205_007", String = "Ja! Ich denke sie werden uns folgen, wenn sie noch am Leben sind! Wir müssen den Hain von diesem Gift und den Spinnen befreien!"},
			Answer{Tag = "nymphetP205_008PC", String = "Kommt!", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			QuestBegin {QuestId = 865},
			QuestBegin {QuestId = 871},
			SetGlobalFlagTrue{ Name = "g_P205_NympheMitnehmen"},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
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