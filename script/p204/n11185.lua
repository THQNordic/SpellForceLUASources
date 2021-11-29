-->INFO: Brigor
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{ 
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
	    IsGlobalTimeElapsed{Name = "g_P204_CounterBrigorSpawnt", Seconds = 2, UpdateInterval = 10},	
	   	FigureDead {NpcId = 11187},
	   	FigureDead {NpcId = 11188},
	   	FigureDead {NpcId = 11189},
	},
	Actions = 
	{
		SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_11185"},
		SetGlobalFlagTrue{Name = "g_P204_BrigorLebt"},
		LookAtDirection{Direction = South},
	},
}


OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = self},
	}
}


OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P204_BrigorKampf", UpdateInterval = 10},
	},

	Actions =
	{
		ChangeRace{Race = 150, NpcId = self},
	}
}


OnIdleGoHome
{

	X = 132, Y = 245, WalkMode = Run, Direction = North,
	
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P204_BrigorVerduftet"},
	},
	
	HomeActions =
	{
		SetGlobalFlagTrue{Name = "g_P204_BrigorDespawnt"},
	}
}


Despawn
{
	PlayDeathAnim = FALSE,

	Conditions =
	{
	   		IsGlobalFlagTrue{Name = "g_P204_BrigorDespawnt", UpdateInterval = 10}, 
	}
}

KillOnDominate{NpcId = self}

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n11185_Brigor.txt


	

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
			Say{Tag = "brigorP204_001", String = "Halt! Nicht! Zerbos Gnade, wer seid Ihr denn? Der Schlächter von Connach? Das Monster von Draugh'Lur?"},
			Answer{Tag = "brigorP204_002PC", String = "Nur ein Runenkrieger auf der Suche nach Euch!", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brigorP204_003", String = "Nach mir?"},
			Answer{Tag = "brigorP204_004PC", String = "Hauptmann Ishtar möchte Euch zu einigen Trausmtaublagern befragen, Birgor!", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brigorP204_005", String = "Ihr täuscht Euch, ich bin nicht Brigor! Birgor war der da drüben, den Ihr erschlagen habt! Da, der in seinem Blut liegt! Ich ... ich bin ... Borgar!"},
			Answer{Tag = "brigorP204_006PC", String = "Netter Versuch. Kommt, lassen wir Ishtar nicht warten!", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brigorP204_007", String = "Halt, halt, halt! Ich mache Euch ein Angebot! Ihr lasst mich laufen und ich sage Euch ...wie Ihr die Bank von Empyria ausrauben könnt! Na, was sagt Ihr?"},
			OfferAnswer{Tag = "brigorP204_008PC", String = "Gut, ich lasse Euch gehen. Wie komme ich in die Bank?", AnswerId = 4},
			OfferAnswer{Tag = "brigorP204_020PC", String = "Erspart mir Euer verlogenes Gewinsel! Los, kommt mit!", AnswerId = 14},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brigorP204_009", String = "Hört zu: Jeder kann die Tür zum Schatzraum in der Bank öffnen, aber dadurch wird der Alarm ausgelöst und die Wächter der Bank erwachen zum Leben!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brigorP204_010", String = "Und die hauen noch schlimmer zu als Ihr, glaubt mir das! Also, Ihr wollt nicht, dass die Wächter erwachen! Aber Ihr wollt an die leckern Schätze im Lager der Bank ..."},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brigorP204_011", String = "Ihr müsst also verhindern, das der Alarm ausgelöst wird! Aber wie? Ich und vier meiner Freunde haben da mal zeimlich viel Denkschmalz reingesteckt ...!"},
			Answer{Tag = "brigorP204_012PC", String = "Ihr redet zuviel.", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brigorP204_013", String = "Ehm, wartet, wartet! Also die Leute der Bank verwenden vier Siegel, um den Alarm auszuschalten! Wir haben diese Siegel nachgefertigt!"},
			Answer{Tag = "brigorP204_014PC", String = "Und, hattet Ihr Erfolg?", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brigorP204_015", String = "Nein, verdammt! Irgendwer hat uns verpfiffen! Ich konnte mich hier verstecken, aber die anderen vier mussten aus Emypria fliehen!"},
			Answer{Tag = "brigorP204_016PC", String = "Sind sie tot?", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brigorP204_017", String = "Ich fürchte ja, sonst wären sie schon längst wieder aufgetaucht! Denn sie hatten ja unsere wertvollen Siegel!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brigorP204_018", String = "Also, wenn Ihr es schafft die vier Siegel zu finden, müsst Ihr sie nur noch in der Bank an den richtigen Stellen einsetzen und der Schatz gehört Euch! Das ist ein todsicherer Dreh, glaubt mir!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brigorP204_019", String = "Wo die Siegel sind, weiss ich nicht, nur dass meine Kameraden damals in Richtung Süden geflohen sind! Das werde ich jetzt am besten auch tun. Viel Glück!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P204_BrigorVerduftet"}, QuestBegin {QuestId = 1027}, QuestBegin {QuestId = 1082}, QuestChangeState {QuestId = 1026, State = StateUnsolvable},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brigorP204_021", String = "Verdammt! Ich gehe nicht wieder in das stinkende Loch von einem Kerker!  Lieber sterbe ich!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P204_BrigorKampf"},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end