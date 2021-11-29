-->INFO: TorwacheOrdensritter
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler"},
		
	},
	Actions = 
	{
		ChangeRace {Race = 152, NpcId = self},
	}
} 

OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue { Name = "g_sP201PalisadentorOeffnen" }, 
	},
	Actions = 
	{ 
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8400"},
	}
}



--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P201\n8400_TorwacheOrdensritter.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsGlobalFlagTrue{Name = "g_sP201UriasBefreitVorOrt"},
		},
		Actions = {
			Say{Tag = "gatewatch201_001", String = "Ihr habt Meister Urias gerettet! Ihr beschämt uns, Runenkrieger."},
			Answer{Tag = "gatewatch201_002PC", String = "Lasst gut sein, Ritter. Öffnet das Tor.", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_sP201UriasBefreitVorOrt"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatewatch201_003", String = "Natürlich! Wie Ihr wünscht! Öffnet das Tor!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_sP201PalisadentorOeffnen"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{4;
		Conditions = {
			IsGlobalFlagTrue{Name = "g_sP201AlreadyTalkedToGateKeeper"},
		},
		Actions = {
			Say{Tag = "gatewatch201_012", String = "Meister Urias ist immer noch verschollen!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_sP201AlreadyTalkedToGateKeeper"}),
		},
		Actions = {
			Say{Tag = "gatewatch201_004", String = "Was wollt Ihr, Fremder?"},
			Answer{Tag = "gatewatch201_005PC", String = "Öffnet das Tor, Ritter! Ich bin ein Freund des Ordens!", AnswerId = 7},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatewatch201_013", String = "Mögen die Götter Euch zu ihm führen, bevor es zu spät ist!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatewatch201_006", String = "Ich habe strikte Anweisung niemand passieren zu lassen, bis Meister Urias von seiner Suche zurück ist!"},
			Answer{Tag = "gatewatch201_007PC", String = "Stur wie eh und je ... Wohin ist Euer Meister aufgebrochen, Wachmann?", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatewatch201_008", String = "Er durchstreift den nördlichen Teil des Landes. Wir haben geraume Zeit nichts mehr von ihm gehört! Unsere Suchtrupps sind nicht zurückgekehrt!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatewatch201_009", String = "Keiner von uns wird ruhen, bis Meister Urias gefunden ist!"},
			Answer{Tag = "gatewatch201_0010PC", String = "Urias ist ein guter Kämpfer, aber sein Wagemut wird ihn noch den Kopf kosten. Ich werde sehen, ob ich ihn finden kann.", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatewatch201_0011", String = "Dann nehmt diese drei Männer mit, das sind alle, die wir noch entbehren können. Viel Glück!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_sP201OrdensritterSpawn"},
			SetGlobalFlagTrue{Name = "g_sP201AlreadyTalkedToGateKeeper"},
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