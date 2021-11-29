-->INFO: Nebenquest_Carvus
--> INFO CARVUS

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPlatformOneTimeEvent
{
	Conditions =
	{
	},
	Actions =
	{
		ChangeRace { Race =  152, NpcId = self},
		
	}
}

Despawn
{
	PlayDeathAnim = FALSE ,
	Conditions = 
	{
		TimeNight(),
		Negated(QuestState{ QuestId = 652, State = StateSolved, UpdateInterval = 1}), 
	} ,
	Actions = 
	{
		
	}
}

Respawn
{
	WaitTime = 1,
	UnitId = self ,
	Clan = 0 ,
	NoSpawnEffect = FALSE ,
	
	Conditions = 
	{
		Negated(QuestState{QuestId = 646, State = StateSolved, UpdateInterval = 1}),
		ODER(TimeDay(),QuestState {QuestId = 652, State = StateSolved, UpdateInterval = 1}),
	} , 
	Actions = 
	{
		SetDialogType{ NpcId = 7257, Type = SideQuest},
		ChangeRace { Race =  152, NpcId = self},
	} , 
	DeathActions = 
	{
	}
} 





--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P109\n7257_Nebenquest_Carvus.txt


	

	OnBeginDialog{
		Conditions = {
			QuestState{QuestId = 652, State = StateSolved},
		},
		Actions = {
			Say{Tag = "carvus109_001", String = "Der Fluch ist von uns genommen! Das Licht hat wieder Farbe, der Wind schmeckt nach Freiheit. Keine Morde mehr! Ich danke Euch!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(QuestState{QuestId = 652, State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "carvus109_002", String = "Dies ist das einzig wertvolle, das wir noch haben. Es gehört Euch!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 731},
			QuestSolve{QuestId = 646},
			SetRewardFlagTrue{Name = "WerwolfGesamt"},
			RemoveDialog{NpcId = 7226},
			RemoveDialog{NpcId = 7257},
			EndDialog(),
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 646, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 646, State = StateActive},
		},
		Actions = {
			Say{Tag = "carvus109_003", String = "Habt Ihr es geschafft?"},
			Answer{Tag = "carvus109_004PC", String = "Nein, es tut mir leid.", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "carvus109_005", String = "Ich hatte einen Funken Hoffnung ...."},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{5;
		Conditions = {
			IsNpcFlagTrue{Name = "angesprochen"},
		},
		Actions = {
			Say{Tag = "carvus109_006", String = "Haltet Euch fern von diesem Ort. Wenn es Nacht wird ... seid Ihr nicht mehr sicher!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "angesprochen"}),
		},
		Actions = {
			Say{Tag = "carvus109_007", String = "Verschwindet! Wenn Euch Euer Leben lieb ist, geht, Fremdling!"},
			Answer{Tag = "carvus109_008PC", String = "Was habt Ihr?", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "carvus109_009", String = "Wenn die Sonne untergeht, regiert hier der Tod! Ein Fluch liegt über diesem Dorf!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "carvus109_010", String = "Sobald der Mond aufgegangen ist, verwandeln sich unsere Körper in rasende Bestien. Was nicht zu uns gehört, wird zerfleischt!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "angesprochen"},
			Say{Tag = "carvus109_011", String = "Keine Magie, kein Gebet kann diesen Fluch brechen! Ich bitte Euch, geht, bevor es dunkel wird! Oder Euer Leben ist verwirkt!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "angesprochen"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "carvus109_012PC", String = "Was wisst Ihr über den Fluch?", AnswerId = 12},
			OfferAnswer{Tag = "carvus109_017PC", String = "Gut. Ich werde weg sein, bevor es Nacht wird.", AnswerId = 16},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "carvus109_013", String = "Es begann, als Keram unser Schmied verschwand. Er ging eines Tages auf die Suche nach Brennholz und kehrte nie zurück."},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "carvus109_014", String = "Und als die Nacht hereinbrach, traf uns der Fluch! Als Bestien mordeten wir wie leibhaftige Dämonen!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "carvus109_015", String = "Zwar ist keiner von uns seit dem mehr gealtert, aber wir fristen ein trostloses Leben, nichts vermag uns mehr Freude zu schenken."},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "carvus109_016", String = "Nur die Jagd bleibt uns, kein Schlaf des nachts. Noch nicht einmal der Tod. Was auch immer Keram angerichtet hat, die Götter mögen ihn verfluchen!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 646},
		QuestBegin{QuestId = 647},
			EndDialog(),
		}}


	EndDefinition()
end