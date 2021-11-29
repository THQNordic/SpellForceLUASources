-->INFO: Urias
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{ 
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		ODER9
		{
			IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler"},
			IsGlobalFlagTrue{Name = "g_P205_UriasSpawntBeiAlyah"},
		}
	},
	Actions = 
	{
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8791"},
	},
}


OnFollowForever
{
	Target = Avatar, NpcId = self,
	
	Conditions =
	{
	 	IsGlobalFlagFalse{Name = "g_P204_UriasBeiAlyah"},
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler"},
		IsGlobalFlagFalse{Name = "g_P204_UriasInEmpyria"},	
	},
	Actions = {},
}


-- Wenn Schattenklinge spawn bei Alyah nach Dryadengarten
Umspawn
{
	UnitId = self, X = 166, Y = 200, NoSpawnEffect = TRUE, OnlyOnce = TRUE, PlayDeathAnim = FALSE,

	Conditions =
	{
		IsGlobalFlagFalse{Name = "g_nP201_PhoenixSteinSpieler", UpdateInterval = 60},
		IsGlobalFlagTrue{Name = "g_P205_UriasSpawntBeiAlyah", UpdateInterval = 60},
	},


	Actions =
	{
	 	SetGlobalFlagTrue{Name = "g_P204_UriasBeiAlyah"},
		SetGlobalFlagTrue{Name = "g_P204_UriasHomepoint"},	 	
	 	SetGlobalFlagFalse{Name = "g_P205_UriasSpawntBeiAlyah"},
	 	SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8791"},
	}
} 



-- Zu Alyah stellen wenn in Range
OnIdleGoHome
{

	X = 166, Y = 200, WalkMode = Run, Direction = South,
	
	Conditions =
	{
			IsGlobalFlagFalse {Name = "g_P204_UriasSollSterben"},		
			IsGlobalFlagFalse {Name = "g_P204_UriasBeiAlyah"},
			IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler"},
			IsGlobalFlagTrue {Name = "g_P204_UriasHaltAn"},			
	},
	
	HomeActions =
	{
		StopFollow{Target = Avatar, NpcId = self},
		SetGlobalFlagTrue{Name = "g_P204_UriasInEmpyria"},
		SetGlobalFlagTrue{Name = "g_P204_UriasHomepoint"},	
		SetGlobalFlagTrue{Name = "g_P204_UriasDialogAn"},			
	}
}


-- Urias Dialog anschalten
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P204_UriasDialogAn", UpdateInterval = 10},
	},

	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_8791"},
	}
}



OnIdleGoHome
{
X = 166, Y = 200, Direction = South, Range = 0 , WalkRange = 0 , WaitTime = 0 , WalkMode = Walk , GotoMode = GotoNormal,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P204_UriasHomepoint", UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "g_P204_UriasSollSterben", UpdateInterval = 10},		
	},
	Actions = {},
	HomeActions = 
	{
--		HoldPosition {NpcId = self},
	},
}


-- Urias geht zum Tor nach Red Waste
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P204_UriasZumTor", UpdateInterval = 10},
	},

	Actions =
	{
		SetGlobalFlagFalse{Name = "g_P204_UriasHomepoint"},		
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8791"},
	}
}

OnIdleGoHome
{

	X = 327, Y = 166, WalkMode = Run, Direction = East,
	
	Conditions =
	{
			IsGlobalFlagTrue {Name = "g_P204_UriasZumTor", UpdateInterval = 10},
	},
	
	HomeActions = 
	{
		Stop {Target = self},	
		SetGlobalFlagFalse {Name = "g_P204_UriasZumTor"},
		SetGlobalFlagFalse{Name = "g_P204_UriasHomepoint"},			
		SetGlobalFlagTrue {Name = "g_P204_UriasAngekommen"},
		SetGlobalFlagTrue {Name = "g_P204_UriasSollSterben"},					
	},
}

-- Effekt und Despawn beim Portal
OnOneTimeEvent
{
	Conditions = 
	{
	   	FigureInRange {X = 362, Y = 169, Range = 0, NpcId = self, UpdateInterval = 10},
	},
	
	Actions =
	{
		SetEffect {Effect = "DeMaterialize", NpcId = 8791, Length = 5000},	
	}
}

Despawn
{
	PlayDeathAnim = FALSE,

	Conditions =
	{
		ODER9
		{
		IsGlobalTimeElapsed{Name = "c_P205_CounterUriasDespawnt", Seconds = 8, UpdateInterval = 10}, 
		IsGlobalFlagTrue {Name = "g_sP209UriasStirbt"},
		}
	}
}

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n8791_Urias.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsGlobalFlagTrue {Name = "g_P204_UriasNebenquest"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_P204_UriasNebenquest"}),
		},
		Actions = {
			Say{Tag = "uriasP204_033", String = "Diese Stadt ist ein Ort des Lasters! Lasst uns weiterziehen!"},
			Answer{Tag = "uriasP204_034PC", String = "Urias, wir brauchen die Hilfe dieser Leute. Uns bleibt nicht anders überig, als uns anzupassen.", AnswerId = 27},
		}}

	OnAnswer{1;
		Conditions = {
			IsGlobalFlagFalse {Name = "g_nP201_PhoenixSteinSpieler"},
		},
		Actions = {
			Say{Tag = "uriasP204_001", String = "Seid gegrüßt, ich bin Urias, ein Ritter vom Orden des Erwachens. Ihr seid ein Runenkrieger?"},
			Answer{Tag = "uriasP204_002PC", String = "Pass Euch das nicht?", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsGlobalFlagFalse {Name = "g_nP201_PhoenixSteinSpieler"}),
		},
		Actions = {
			Say{Tag = "uriasP204_028", String = "Ich höre wir müssen nach Kathai? Gut! Endlich Aufbruch! "},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uriasP204_003", String = "Doch, im Gegenteil! Das ich heute hier stehe und atme, verdanke ich einem Runenkrieger! Er hat uns damals alle gerettet!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uriasP204_004", String = "Und ich hoffe, Ihr seid aus dem gleichen Holz geschnitzt! Denn ich brauche Eure Hilfe!"},
			Answer{Tag = "uriasP204_005PC", String = "Lasst hören.", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uriasP204_006", String = "Ein alter Freund und Mentor von mir, Darius, ist verschwunden."},
			Answer{Tag = "uriasP204_007PC", String = "Darius ... stimmt er erwähnte einen Urias in seinem Brief.", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uriasP204_008", String = "Ein Brief von Darius ? Ihr kennt ihn?"},
			Answer{Tag = "uriasP204_009PC", String = "Flüchtig, ja. In seinem Brief sprach er davon, dass er nach Süden gehen wollte, um dem Maskierten Hokan Ashir zu folgen.", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uriasP204_010", String = "Weiter nach Süden also! Werdet Ihr mir helfen, ihn zu finden?"},
			Answer{Tag = "uriasP204_011PC", String = "Wir haben den gleichen Weg, Urias, helfen wir uns gegenseitig. Ziehen wir gemiensam mit Alyah bis Kathai, dort entscheiden wir dann, wie es weiter geht.", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uriasP204_012", String = "Gut! Aber ... mit dieser ... Diebin wollt Ihr ziehen?"},
			Answer{Tag = "uriasP204_013PC", String = "Sie kennt dieses Land. Wir werden sie brauchen!", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uriasP204_014", String = "Nun, wie Ihr meint. Ich traue ihr nicht!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uriasP204_015", String = "Ah, Freund, eins noch!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uriasP204_016", String = "Meine Leute lagern immer noch an der schwarzen Küste!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uriasP204_017", String = "Zwar sind dort die schlimmsten Gefahren gebannt, aber ich sollte ihnen Nachricht geben, das sie nach Nortander heimkehren können."},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uriasP204_018", String = "Dort werden sie mehr gebraucht."},
			Answer{Tag = "uriasP204_019PC", String = "Wollt ihr gleich dorthin aufbechen?", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
			IsGlobalFlagTrue {Name = "DiesesFlagWirdNiemalsTrue"},
		},
		Actions = {
			QuestSolve {QuestId = 1057},
			Say{Tag = "uriasP204_020", String = "Nein, wir sollten erst einmal unsere Aufgabe hier abschließen. Aber ich wäre Euch dankbar, wenn wir irgendwann noch einmal die schwarzen Küste aufsuchen könnten."},
			OfferAnswer{Tag = "uriasP204_021PC", String = "Gut! Vielleicht finden wir später Zeit, um uns darum zu kümmern.", AnswerId = 14},
			OfferAnswer{Tag = "uriasP204_026PC", String = "Wir haben keine Zeit! Eure Leute sollen selbst zurecht kommen!", AnswerId = 22},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "DiesesFlagWirdNiemalsTrue"}),
		},
		Actions = {
			QuestSolve {QuestId = 1057},
			Say{Tag = "uriasP204_020", String = "Nein, wir sollten erst einmal unsere Aufgabe hier abschließen. Aber ich wäre Euch dankbar, wenn wir irgendwann noch einmal die schwarzen Küste aufsuchen könnten."},
			OfferAnswer{Tag = "uriasP204_021PC", String = "Gut! Vielleicht finden wir später Zeit, um uns darum zu kümmern.", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uriasP204_022", String = "Ich danke Euch. Begebt Euch einfach zur schwarzen Küste, wenn Ihr den Zeitpunkt als geeignet seht."},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
			IsGlobalFlagFalse {Name = "g_nP201_PhoenixSteinSpieler"},
		},
		Actions = {
			Say{Tag = "uriasP204_023", String = "Die schwarze Küste liegt weit nördlich von hier, noch in Fiara!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsGlobalFlagFalse {Name = "g_nP201_PhoenixSteinSpieler"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uriasP204_024", String = "Ihr solltet zuerst in die Onyxbucht und dort ganz nach Nordwesten reisen, dort sollte ein Portal zur schwarzen Küste zu finden sein."},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uriasP204_025", String = "Aber lasst uns zuerst Alyah und den Botschafter sicher aus der Stadt bringen. Gebt Alyah Bescheid, wenn Ihr bereit zum Aufbruch seit."},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P204_TorOnyxOffen"}, QuestBegin {QuestId = 894}, QuestBegin {QuestId = 895}, SetGlobalFlagTrue{Name = "g_P204_UriasNebenquestAktiv"}, SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8791"},
			QuestBegin {QuestId = 896},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uriasP204_027", String = "Wie Ihr meint, Freund. Dann also weiter nach Süden! Gebt Alyah Bescheid, sobald Ihr bereit zum Aufbruch seit"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			QuestBegin {QuestId = 896},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uriasP204_029", String = "Aber Ihr wollt im Ernst mit diesem Weibsbild Alyah ziehen? Sie ist ehrlos durch und druch!"},
			Answer{Tag = "uriasP204_030PC", String = "Sie wird unsere Führerin sein, Urias!", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uriasP204_031", String = "Ich werde ein waches Auge auf sie haben! Vielleicht kann ich ihr den rechten Gesit noch beibringen!"},
			Answer{Tag = "uriasP204_032PC", String = "Herrje, das kann ja heiter werden.", AnswerId = 9},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uriasP204_035", String = "Pah! Ich schätze ich wäre Euch hier keine große Hilfe, Freund ... ich habe zu lange gegen Unrecht gekämpft um jetzt tatenlos daran vorbei zu gehen!"},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uriasP204_036", String = "Ich werde hier auf Euch warten ... und hoffen, dass Euch dieser Sündenpfuhl nicht verschlingt!"},
			Answer{Tag = "uriasP204_037PC", String = "Gut, wie Ihr wünscht, Urias. Passt gut auf Alyah auf.", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end