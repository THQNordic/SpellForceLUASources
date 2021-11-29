-->INFO: Villager
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnIdleGoHome
{
X = 300 , Y = 267 , Direction = 2 , WalkMode = Run,
Conditions = {QuestState{QuestId = 439 , State = StateActive}}
}

OnIdleGoHome
{
X = 294 , Y = 246 , Direction = 0 , WalkMode = Walk,
Conditions = {QuestState{QuestId = 439 , State = StateSolved}}
}
OnToggleEvent
{
UpdateInterval = 15,
OnConditions = {
			QuestState{QuestId = 439 , State = StateUnknown}
			},
OnActions =	{
			RemoveDialog{},
			},
OffConditions = {
			QuestState{QuestId = 439 , State = StateActive}
			},
OffActions =	{
			EnableDialog{},
			},
}	


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p63\n3110_Villager.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "villager001", String = "Danke! Ohne Euch hätte es finster für uns ausgesehen! Die Wachleute können was erleben, diese Saufköpfe!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "villager002", String = "Hier, nehmt dies als Entlohnung! Und bitte entschuldigt die anderen! Die Leute haben etwas Angst vor Euch! Ihr seid ein Runenkrieger, nicht wahr?"},
			Answer{Tag = "villager002PC", String = "Auf dem Weg nach Graufurt!", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "villager003", String = "Oh, bis Graufurt ist es nicht mehr weit! Folgt einfach dem Weg den Berg hinauf! Gute Reise!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			SetRewardFlagTrue{ Name = "NachGraufurtPartVillage"} , RemoveDialog{},
			EndDialog(),
		}}


	EndDefinition()
end