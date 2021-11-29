-->INFO: Lucius
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 3}
--!EDS ONIDLEGOHOME END

OneTimeInitAction(SetEffect {Effect = "Chain"})
OnOneTimeEvent{Actions = {RemoveDialog {}}}




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\Project\main\mission\dialoge\p103\n7227_Lucius.txt


	

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
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			StopEffect {NpcId = 7227},
			Say{Tag = "lucius103_001", String = "Oh ...  ich bin frei?"},
			Answer{Tag = "lucius103_002PC", String = "So scheint es, Freund.", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lucius103_003", String = "Oh! Ihr ... Ihr habt mich befreit?"},
			Answer{Tag = "lucius103_004PC", String = "Euer Scharfblick ist erstaunlich.", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lucius103_005", String = "Oh! Gut! Danke! Jetzt ... jetzt dürft Ihr etwas von meinen Waren kaufen! Ja!"},
			Answer{Tag = "lucius103_006PC", String = "Als Dank ... etwas kaufen?", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lucius103_007", String = "Oh! Mein Meister hat mir verboten, Sachen zu verschenken. Ich habe früher immer ganz viel verschenkt! Das hat dem Meister gar nicht gefallen! Oh nein!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lucius103_008", String = "Mein Meister, das ist der Mann mit der Maske, wisst Ihr? Er wird Euch bestimmt eine schöne Belohnung geben. Geht nur zu ihm!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lucius103_009", String = "Oder Ihr kauft selbst etwas Feines. Schaut Euch meine Waren nur an!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "LuciusFrei"},SetGlobalFlagTrue {Name = "KauzLuciusFrei"}, QuestSolve {QuestId = 721}, QuestBegin {QuestId = 722},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			RemoveDialog{},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end