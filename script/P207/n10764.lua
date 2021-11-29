-->INFO: Zwergen_Gefangener
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-------------------------------------------------------------
-- Zwerg wird auf Race 4 für Trolle gestellt, bei Mapstart --
-------------------------------------------------------------

OnOneTimeEvent
{
	Conditions =
	{
	},
	Actions =
	{
		ChangeRace {Race = 4, NpcId = 10764}, -- Race Troll
	},
}

---------------------------------------------------
-- Zwerg folgt nach seiner Befreiung dem Spieler --
---------------------------------------------------

OnFollowToggle
{
		Target = Avatar, NpcId = self, FollowOnlyOnce = FALSE,
		FollowConditions = 
		{
			IsGlobalFlagTrue {Name = "g_p207_Zwerg_Befreit"},
		},
		FollowActions = 
		{
			QuestSolve {QuestId = 977},
			QuestSolve {QuestId = 973},
			QuestBegin {QuestId = 978},
			QuestBegin {QuestId = 979},
		},
		StopFollowConditions = 
		{
			IsGlobalFlagTrue {Name = "g_p207_Sprengfaesser_Erreicht"},
		},
		StopFollowActions = 
		{
			SetGlobalFlagFalse {Name = "g_p207_Zwerg_Befreit"},
		},
}

---------------------------------------------------------------------------------------
-- Zwerg folgt dem Avatar nach der Sprengung, verschwindet nach Einnahme der Festung --
---------------------------------------------------------------------------------------

OnFollowToggle
{
		Target = Avatar, NpcId = self, FollowOnlyOnce = FALSE,
		FollowConditions = 
		{
			IsGlobalFlagTrue {Name = "g_p207_Zwerg_Folgt_Avatar"},
		},
		FollowActions = 
		{			
		},
		StopFollowConditions = 
		{
			IsGlobalFlagTrue{Name = "g_P207_Zweite_Festung_Camp_Besiegt"},
		},
		StopFollowActions = 
		{
			--SetEffect {Effect = "Spawnboss", Length = 0},
			ChangeRace {Race = 152},
			SetGlobalFlagTrue {Name = "oc_P207_Zwerg_Hat_Schuld_Beglichen"},
			SetGlobalFlagFalse {Name = "g_p207_Zwerg_Folgt_Avatar"},
			SetGlobalFlagTrue {Name = "g_p207_Zwerg_Verschwindet_Wieder"},
		},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_p207_Zwerg_Verschwindet_Wieder"},
	},
	Actions =
	{
		Goto{X = 342, Y = 313, NpcId = self, Range = 0, WalkMode = Run, GotoMode = GotoContinuous},
	},
}

-------------------------------------------------------------------------
-- Spieler ist in Reichweite der Sprengfässer / Zwerg hat neuen Dialog --
-------------------------------------------------------------------------

OnOneTimeEvent
{
	Conditions =
	{
		FigureInRange {NpcId = self, X = 377, Y = 312, Range = 6},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_p207_Sprengfaesser_Erreicht"},
		EnableDialog {NpcId = self},
	},
}

---------------------------------------------------------------
-- Zwerg rennt nach Sprengung, durch eine Höhle, von der Map --
---------------------------------------------------------------

Despawn
{
	Conditions = 
	{
		FigureInRange {NpcId = self, X = 342, Y = 313, Range = 0},
	},
	Actions = 
	{
	},
}




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P207\n10764_Zwergen_Gefangener.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsGlobalFlagTrue{Name = "g_p207_Sprengfaesser_Erreicht"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_p207_Sprengfaesser_Erreicht"}),
		},
		Actions = {
			Say{Tag = "jarlP207_011", String = "Niethalfs Bart, bin ich froh Euch zu sehen! Hatte schon nicht mehr auf Rettung gehofft! Seid Ihr mit Uram hier?"},
			Answer{Tag = "jarlP207_012PC", String = "Nein, ich kämpfe mich nach Kathai durch! Aber ich habe Uram in der Onyxbucht getroffen, er war dort den Hazim in die Hände gefallen!", AnswerId = 10},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_p207_Hilfe_Abgelehnt"}),
		},
		Actions = {
			Say{Tag = "jarlP207_004", String = "Seht Ihr die Fässer dort drüben? Das war der Platz, an dem wir unsere erste Sprengung machen wollten! Ein Teil der Sprengfässer steht noch da!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{1;
		Conditions = {
			IsGlobalFlagTrue{Name = "g_p207_Hilfe_Abgelehnt"},
		},
		Actions = {
			Say{Tag = "jarlP207_001", String = "Wie sieht es aus, braucht Ihr doch meine Hilfe?"},
			Answer{Tag = "jarlP207_002PC", String = "Ja, die Mauern sind unüberwindlich!", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jarlP207_003", String = "Ha! Diese wackligen Norcaineruinen? Passt mal auf ..."},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_p207_Sprengung_Einleiten"},
			RemoveDialog{},
			EndDialog(),
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jarlP207_005", String = "Die Untoten wissen ja nicht, was sie da vor Ihrer Haustüre stehen haben! Ha, ha! Diese Fässer sind randvoll mit Feuerpulver!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jarlP207_006", String = "Ich habe zwar nicht Urams Wissen, aber ich kann versuchen, sie zu zünden! Das sollte ein hübsches Loch in der Mauer geben, dann habt Ihr freie Bahn! Was meint Ihr?"},
			OfferAnswer{Tag = "jarlP207_007PC", String = "Tut euer Werk, Jarl! Sprengt die Mauer!", AnswerId = 6},
			OfferAnswer{Tag = "jarlP207_009PC", String = "Ich brauche Euer Feuerpulver nicht! Ich finde einen anderen Weg!", AnswerId = 8},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jarlP207_008", String = "So hab ichs gern! Gebt acht!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_p207_Sprengung_Einleiten"},
			RemoveDialog{},
			EndDialog(),
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jarlP207_010", String = "Was wollt Ihr tun? Die Mauern niederstarren? Na gut, wie Ihr meint, Mensch, viel Glück!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_p207_Hilfe_Abgelehnt"},
			EndDialog(),
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jarlP207_013", String = "Uram wurde aufgehalten? Also keine Hilfe aus Fastholme! Ach, das Pech verfolgt uns wie ein hungriger Köter! Verdammt!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jarlP207_014", String = "Wir sollten unter der Leitung von Uram die alten Norcaine-Festen aus diesem Pass sprengen! Wir waren nicht schlecht überrascht, als wir herausfanden, dass sie voller Untoter sind!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jarlP207_015", String = "Die meisten meiner Gefährten fielen im ersten Kampf, die anderen wurden versprengt oder gefangen! Aber Uram entkam! Ich hatte gehofft er wäre mit Hilfe zurück."},
			Answer{Tag = "jarlP207_016PC", String = "Ihr solltet Euch mir anschließen, Zwerg! Dann kommt Ihr wenigstens lebend hier heraus!", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jarlP207_017", String = "Wahr gesprochen! Ich folge Euch, Runenkrieger! Übrigens, man nennt mich Jarl!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_p207_Zwerg_Befreit"},
			RemoveDialog{},
			EndDialog(),
		}}


	EndDefinition()
end