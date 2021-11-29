-->INFO: TestDialog
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X,
	Y = _Y,
	NoSpawnEffect = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "p207Death"}
	},
	Actions = 
	{
	},
}

OnOneTimeEvent
{
Conditions = {},
Actions =	
		{
			ChangeRace{Race = 192},
		}
}


OnFollowToggle
{
		Target = Avatar, NpcId = self, FollowOnlyOnce = TRUE,
		FollowConditions = 
		{
			IsGlobalFlagTrue {Name = "p207_FolgeMirUndHilfMir"},
		},
		FollowActions = 
		{
			ChangeRace{Race = 192},
		},
		StopFollowConditions = 
		{
			IsGlobalFlagTrue {Name = "p207_BewacheGebiet"},
		},
		StopFollowActions = 
		{
			ChangeRace{Race = 192},
		},
}

OnFollowToggle
{
		Target = Avatar, NpcId = self, FollowOnlyOnce = TRUE,
		FollowConditions = 
		{
			IsGlobalFlagTrue {Name = "p207_FolgeMirAberFassNixAn"},
		},
		FollowActions = 
		{
			ChangeRace{Race = 152},
		},
		StopFollowConditions = 
		{
			IsGlobalFlagTrue {Name = "p207_WarteHierAberFassJaNixAn"},
		},
		StopFollowActions =
		{
			ChangeRace{Race = 152},
		},
}


--	Umspawn 
--	{
--		UnitId = self, 
--		Clan = 0, 
--		X = startX, 
--		Y = startY,
--		Target = Avatar,
--		NoSpawnEffect = FALSE,
--		OnlyOnce = FALSE,
--		Conditions = 
--		{
--			IsGlobalFlagTrue {Name = "g_sP201UriasBefreitVorOrt"},
--			ODER                                       
--			(                                  
--				AvatarLocalTeleport{},
--				FigureDead {NpcId = Avatar}
--			),
--			IsGlobalFlagTrue {Name = "g_sP201UriasFollow"}, 
--			
--		}, 
--		Actions = 
--		{
--			SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8404"},
--			Follow { NpcId = self, Target = Avatar},
--		}
--	
--	}






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P207\n10036_TestDialog.txt


	

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
			Say{Tag = "", String = "Was willst du?"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Folge mir, und hilf mir!", AnswerId = 2},
			OfferAnswer{Tag = "", String = "Folge mir, aber fass bloß nichts an!", AnswerId = 5},
			OfferAnswer{Tag = "", String = "Warte hier auf mich, und mach ja nix!", AnswerId = 8},
			OfferAnswer{Tag = "", String = "Warte hier und bewache das Gebiet!", AnswerId = 12},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "p207_FolgeMirUndHilfMir"},
			Say{Tag = "", String = "Ok, ich folge und helfe dir."},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			EndDialog(),
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "p207_FolgeMirAberFassNixAn"},
			Say{Tag = "", String = "Ok, ich folge dir, und fasse auch ganz sicher nichts an."},
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
			Say{Tag = "", String = ""},
			EndDialog(),
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "p207_WarteHierAberFassJaNixAn"},
			Say{Tag = "", String = "Ja Meister. Ich warte und mache nix... bla bla..."},
			Answer{Tag = "", String = "Was hast du gesagt?", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = "Ach, nichts nichts."},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			EndDialog(),
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "p207_BewacheGebiet"},
			Say{Tag = "", String = "Na klar, ich mach die ganze Arbeit..."},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end