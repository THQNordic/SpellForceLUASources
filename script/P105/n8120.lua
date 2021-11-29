-->INFO: Mordquest_Leiche
--> Leiche Adale MordQuest
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)



--MordQuest wird erst aktiv, wenn der Spieler den Auftrag von Aileen erhalten hat!
SpawnOnlyWhen
{
	
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "MordTeilnehmerSpawnenP105" },
	},
	Actions = 
	{
		SetDialogType{ NpcId = self, Type = SideQuest},
		SetFreezeFlagTrue{ NpcId = self},
	},
}

Despawn
{
	Conditions = 
	{
		QuestState{ QuestId = 765, State = StateSolved},
	} , 
	Actions = 
	{
	}
}








--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P105\n8120_Mordquest_Leiche.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "leiche105_001", String = "(Auf dem Boden liegt der reglose Körper von Aedale, der hohen Priesterin.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "leiche105_002", String = "(Sie scheint die Felswand hinabgestürzt zu sein.)"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "leiche105_003", String = "(Ihre Priesterrobe ist zerrissen und aus einigen kleinen, regelmäßigen Schnittwunden rund um den Hals floss Blut, das nun zu Eis gefroren ist.)"},
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


	EndDefinition()
end