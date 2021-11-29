-->INFO: Nebenquest_Keraem
--> INFO KERAEM

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
		SetDialogType{ NpcId = 7226, Type = SideQuest},
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
-- Source: C:\project\main\mission\dialoge\P109\n7226_Nebenquest_Keraem.txt


	

	OnBeginDialog{
		Conditions = {
			QuestState{QuestId = 652, State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "keram109_001PC", String = "Die Siegel sind geschlossen. Euer Dorf ist frei von diesem Fluch.", AnswerId = 1},
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
			Say{Tag = "keram109_002", String = "Es ist ... vorbei? Wie soll ich Euch nur danken? Ich wage nicht, ins Dorf zurück zu kehren. Bitte, geht zu den Leuten und überbringt ihnen die Nachricht!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			RemoveDialog{NpcId = 7226},
			EndDialog(),
		}}

	OnAnswer{3;
		Conditions = {
			UND(QuestState{QuestId = 646, State = StateActive},Negated(QuestState{QuestId = 652, State = StateSolved})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(QuestState{QuestId = 646, State = StateActive},Negated(QuestState{QuestId = 652, State = StateSolved}))),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "Angesprochen2"}),
		},
		Actions = {
			Say{Tag = "keram109_003", String = "Geht! Bleibt mir fern!"},
			Answer{Tag = "keram109_004PC", String = "Ihr seid der Schmied Keram, nicht wahr?", AnswerId = 6},
		}}

	OnAnswer{4;
		Conditions = {
			IsNpcFlagTrue{Name = "Angesprochen2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
			IsNpcFlagFalse{ Name = "QuestOnlyOnceP109"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "keram109_013PC", String = "Wisst Ihr, wo die Artefakte sind?", AnswerId = 14},
			OfferAnswer{Tag = "keram109_016PC", String = "Was sind das für Schreine, von denen die Artefakte stammen?", AnswerId = 17},
			OfferAnswer{Tag = "keram109_019PC", String = "Ich werde mich umsehen.", AnswerId = 20},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(IsNpcFlagFalse{ Name = "QuestOnlyOnceP109"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "keram109_013PC", String = "Wisst Ihr, wo die Artefakte sind?", AnswerId = 14},
			OfferAnswer{Tag = "keram109_016PC", String = "Was sind das für Schreine, von denen die Artefakte stammen?", AnswerId = 17},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "keram109_005", String = "Ihr seid keiner aus dem Dorf ... sie haben Euch geschickt, um mich zu töten, nicht wahr?"},
			Answer{Tag = "keram109_006PC", String = "Nein, ich suche nach dem Ursprung ihres Fluches.", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "keram109_007", String = "Ich, ich bin der Ursprung! Ich habe die Siegel des Leids entfernt!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "keram109_008", String = "Ich wanderte umher, neugierig und unwissend. Dann fand ich diese seltsamen Schreine, einen mit einer goldenen Sanduhr, einen mit einer Phiole aus Glas und einen mit einer brennenden Kerze."},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "keram109_009", String = "Sie sahen wertvoll aus und ohne nachzudenken, nahm ich diese Artefakte an mich. Ich lief zurück ins Dorf, doch die Dunkelheit holte mich ein."},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "keram109_010", String = "Da vernahm ich eine Stimme: Wer die Siegel der Bestie bricht, empfängt ihren Fluch. Rastlos und blutgierig irrt er dann herum. Verflucht durch die Finsternis, wird er nichts anderes mehr kennen, als die ewige Jagd."},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "keram109_011", String = "Und mit ihm alle jene die er liebt und die jene lieben! Dann wurde ich bewusstlos. Als ich erwachte, waren die Artefakte gestohlen!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "keram109_012", String = "Ich muss sie zurückbringen, vielleicht löst das den Fluch!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
			IsNpcFlagFalse{ Name = "QuestOnlyOnceP109"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "Angesprochen2"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "keram109_013PC", String = "Wisst Ihr, wo die Artefakte sind?", AnswerId = 14},
			OfferAnswer{Tag = "keram109_016PC", String = "Was sind das für Schreine, von denen die Artefakte stammen?", AnswerId = 17},
			OfferAnswer{Tag = "keram109_019PC", String = "Ich werde mich umsehen.", AnswerId = 20},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(IsNpcFlagFalse{ Name = "QuestOnlyOnceP109"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Angesprochen2"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "keram109_013PC", String = "Wisst Ihr, wo die Artefakte sind?", AnswerId = 14},
			OfferAnswer{Tag = "keram109_016PC", String = "Was sind das für Schreine, von denen die Artefakte stammen?", AnswerId = 17},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "keram109_014", String = "Gestohlen! Ich fand damals Spuren im Sand, die von Gargoylen stammen müssen!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "keram109_015", String = "Ich habe versucht sie zu verfolgen, aber sie entkommen mir immer und verspotten mich!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagFalse{ Name = "QuestOnlyOnceP109"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "keram109_013PC", String = "Wisst Ihr, wo die Artefakte sind?", AnswerId = 14},
			OfferAnswer{Tag = "keram109_016PC", String = "Was sind das für Schreine, von denen die Artefakte stammen?", AnswerId = 17},
			OfferAnswer{Tag = "keram109_019PC", String = "Ich werde mich umsehen.", AnswerId = 20},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagFalse{ Name = "QuestOnlyOnceP109"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "keram109_013PC", String = "Wisst Ihr, wo die Artefakte sind?", AnswerId = 14},
			OfferAnswer{Tag = "keram109_016PC", String = "Was sind das für Schreine, von denen die Artefakte stammen?", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "keram109_017", String = "Ich vermag mich kaum zu erinnern. Es waren Altäre, seltsame Plätze. Sie schienen ... zornig zu werden, als ich die Artefakte fortnahm."},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "keram109_018", String = "Ich Narr! Die Artefakte müssen in die Schreine zurückgebracht werden! Aber wie? Und welcher gehört  in welchen? Ich bin so verwirrt ... wenn ich doch nur schlafen könnte!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			IsNpcFlagFalse{ Name = "QuestOnlyOnceP109"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "keram109_013PC", String = "Wisst Ihr, wo die Artefakte sind?", AnswerId = 14},
			OfferAnswer{Tag = "keram109_016PC", String = "Was sind das für Schreine, von denen die Artefakte stammen?", AnswerId = 17},
			OfferAnswer{Tag = "keram109_019PC", String = "Ich werde mich umsehen.", AnswerId = 20},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(IsNpcFlagFalse{ Name = "QuestOnlyOnceP109"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "keram109_013PC", String = "Wisst Ihr, wo die Artefakte sind?", AnswerId = 14},
			OfferAnswer{Tag = "keram109_016PC", String = "Was sind das für Schreine, von denen die Artefakte stammen?", AnswerId = 17},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 647},
			QuestBegin{QuestId = 648},
			QuestBegin{QuestId = 651},
			QuestBegin{QuestId = 650},
			QuestBegin{QuestId = 649},
			SetNpcFlagTrue{ Name = "QuestOnlyOnceP109"},
			EndDialog(),
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "Angesprochen"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "keram109_021PC", String = "Ein Mensch hier allein?", AnswerId = 23},
		}}

	OnAnswer{21;
		Conditions = {
			IsNpcFlagTrue{Name = "Angesprochen"},
		},
		Actions = {
			Say{Tag = "keram109_020", String = "Bitte geht."},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "keram109_022", String = "Bleibt fort, kommt mir nicht zu nahe!"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "Angesprochen"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end