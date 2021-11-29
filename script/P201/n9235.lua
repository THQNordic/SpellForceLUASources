-->INFO: Laurinstein1
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)







--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P201\n9235_Laurinstein1.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags l�sen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "laurinstone1_001", String = "(Der Kristall verstr�mt ein unwirkliches Licht. Er scheint mit Laurin in Verbindung zu stehen.)"},
			OfferAnswer{Tag = "laurinstone1_002PC", String = "(Den Kristall ber�hren.)", AnswerId = 1},
			OfferAnswer{Tag = "laurinstone1_004PC", String = "(Den Kristall unber�hrt lassen.)", AnswerId = 4},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "laurinstone1_003", String = "(Als Ihr den Kristall ber�hrt, erlischt kurz sein Leuchten. Laurin scheint f�r einen Moment abgelenkt.)"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{ Name = "g_sP201_LaurinStein1Off"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
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