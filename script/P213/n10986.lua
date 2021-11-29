-->INFO: DariusGefangen
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P213_DariusFrei"},
	},
	Actions =
	{
		SetEffect {Effect = "OccludeWhite", Length = 9000, TargetType = World, X = 213, Y = 146},
		ChangeObject {Object = 3082, X = 213, Y = 146},
		SetRewardFlagTrue {Name = "BlutigenDariusBefreit"}
	}
}




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p213\n10986_DariusGefangen.txt


	

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
			Say{Tag = "darius_prisonP213_001", String = "(Darius ist hier an eine Art magischen Altar geschlagen. Aus seinen aufgeschnittenen Armen rinnt seltsam glitzerndes Blut in Gefäße auf dem Altar.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius_prisonP213_002", String = "(Er scheint fast leblos zu sein, nur seine Lippen bewegen sich in einem stummen Murmeln.)"},
			OfferAnswer{Tag = "darius_prisonP213_003PC", String = "(Darius befreien.)", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius_prisonP213_004", String = "(Ihr löst vorsichtig die Befestigungen, die Darius auf der Altarplatte halten. Der alte Mann sackt in Eure Arme.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius_prisonP213_005", String = "(Mühselig richtet er sich schließlich auf und blickt Euch in die Augen.)"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P213_DariusFrei"},
				SetGlobalFlagTrue{Name = "g_StoryQuestDariusFree"},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end