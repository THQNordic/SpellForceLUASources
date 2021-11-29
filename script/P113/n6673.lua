-->INFO: Cenwen
--Cenwen

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 60 ,
	Conditions = 
	{},
	Actions = 
	{
		HoldPosition{NpcId = self},
		RemoveDialog{NpcId = self },
	}
}


--Cenwen frei, wenn Fial Darg tot
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 20 ,
	Conditions = 
	{
		IsGlobalTimeElapsed{Name = "P113TimeStampFialBesiegt", Seconds = 5, UpdateInterval = 20},
		IsGlobalFlagTrue{Name = "P113FialDargBesiegt", UpdateInterval = 30},
		FigureDead{ NpcId = 6626},
		IsGlobalFlagFalse{Name = "P113EndkampfBeginnt", UpdateInterval = 30},
	},
	Actions = 
	{
		StopEffect{ X = 143, Y = 233, TargetType = World},
		StopEffect{ X = 143, Y = 235, TargetType = World},
		StopEffect{ X = 145, Y = 235, TargetType = World},
		StopEffect{ X = 145, Y = 233, TargetType = World},
		SetGlobalFlagTrue {Name = "P113DialogCenwenAn"}, --Cenwen bekommt Dialog
		SetGlobalFlagTrue{Name = "CenwenIsFree"},
		QuestSolve{QuestId = 697, ActivateNextQuest = FALSE}, --QBefreie Cenwen
		QuestBegin{QuestId = 699, SubQuestActivate = FALSE}, --QSprich mit Cenwen
		SetRewardFlagTrue { Name = "FialDargTotCenwenFrei" },

	}
}



--Dialogmanager
OnToggleEvent
{
	NotInDialog = FALSE , UpdateInterval = 60 ,
	OnConditions = 
	{
		IsGlobalFlagFalse{Name = "P113DialogCenwenAn", UpdateInterval = 20},
		
	},
	OnActions = 
	{
		RemoveDialog{NpcId = self },
	},
	OffConditions = 
	{
		--FigureDead{NpcId = 6626},
		IsGlobalFlagTrue{Name = "P113DialogCenwenAn", UpdateInterval = 20},
	},
	OffActions = 
	{ 
		EnableDialog{NpcId = self , Important = TRUE},
		
	},
}

--Effekt für Despawn
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 20 ,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "P113CenwenDespawn", UpdateInterval = 20},
	},
	Actions = 
	{
		SetGlobalTimeStamp{Name = "P113CenwenVanish"},
		SetEffect {Effect = "DeMaterialize", Length = 3000 , TargetType = Figure , NpcId = 6673},
	}
}

--Cenwen despawn, wenn Dialog geführt
Despawn
{
	PlayDeathAnim = FALSE ,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "P113CenwenDespawn", UpdateInterval = 20},
		IsGlobalTimeElapsed{Name = "P113CenwenVanish", Seconds = 3, UpdateInterval = 20},
	} , 
	Actions = 
	{
		QuestSolve{QuestId = 699, ActivateNextQuest = FALSE}, --Q sprich mit cenwen
		QuestSolve{QuestId = 627, ActivateNextQuest = FALSE}, --Mainquest Abgrund gelöst
		QuestBegin{QuestId = 694, SubQuestActivate = FALSE}, --Q Kehre nach Tirganach zurück
		QuestBegin{QuestId = 719, SubQuestActivate = FALSE}, --Subquest Cenwen
		QuestSolve{QuestId = 626, ActivateNextQuest = FALSE}, --Q sprich mit cenwen
	}
}




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P113\n6673_Cenwen.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "cenwen113_001", String = "Ich trauere um Eure Gefährtin. Sie war eine mutige Frau."},
			Answer{Tag = "cenwen113_002PC", String = "Das war sie.", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "cenwen113_003", String = "Ihr ... Ihr seid Menschen, nicht wahr? Ich erinnere mich an Geschichten ..."},
			Answer{Tag = "cenwen113_004PC", String = "Viele Jahre hat das Eis Euch von der Welt getrennt.", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "cenwen113_005", String = "Das Eis .. Aryn! Ist er erwacht?"},
			Answer{Tag = "cenwen113_006PC", String = "Noch ist er schwach, aber die Berge erzittern bereits von seiner Wut!", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "cenwen113_007", String = "Ich muss zu ihm! Der Bund! Sein Zorn wird schrecklich sein!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "cenwen113_008", String = "Meine Magie kann mich nach Norden bringen ...aber was ist mit Euch?"},
			Answer{Tag = "cenwen113_009PC", String = "Ich habe eigene Wege zu gehen.", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "cenwen113_010", String = "Dann treffen wir uns im Norden! Eilt euch, Aryn muss besänftigt werden!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
				
	SetGlobalFlagFalse{Name = "P113DialogCenwenAn"},
	SetGlobalFlagTrue{Name = "P113CenwenDespawn"},
	QuestSolve{QuestId = 699, ActivateNextQuest = FALSE}
	,
			Say{Tag = "", String = ""},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end