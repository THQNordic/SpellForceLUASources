-->INFO: Mordquest_Aileen
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--MordQuest wird erst aktiv, wenn der Spieler auf Fastholm Windjaf gerettet hat!
OnOneTimeEvent
{
	Conditions = 
	{
		
		
	},
	Actions = 
	{
		
		RemoveDialog{NpcId = self},
		
	},
}



OnOneTimeEvent
{
	Conditions = 
	{
		QuestState { QuestId = 611, State = StateSolved},
		
	},
	Actions = 
	{
		
		SetDialogType{ NpcId = 6591, Type = SideQuest},
		SetGlobalFlagTrue{Name = "MordTeilnehmerSpawnenP105"},
	},
}

OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{ Name = "MordQuestAngenommen"},
		
	},
	Actions = 
	{
		QuestBegin {QuestId = 765},
		QuestBegin {QuestId = 766},
		QuestBegin {QuestId = 767},
		QuestBegin {QuestId = 768},
		QuestBegin {QuestId = 769},
		SetGlobalFlagTrue{Name = "StartMordquestP105"},
	},
}






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P105\n6591_Mordquest_Aileen.txt


	

	OnBeginDialog{
		Conditions = {
			IsGlobalFlagTrue{Name = "MordQuestAngenommen"},
		},
		Actions = {
			Say{Tag = "aileen105_001", String = "Habt Ihr herausgefunden, wer Aedale ermordet hat?"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "MordQuestAngenommen"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 56},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aileen105_002PC", String = "Ich glaube, ich habe die Wahrheit erkannt.", AnswerId = 2},
			OfferAnswer{Tag = "aileen105_036PC", String = "Nein. Ich glaube nicht. Gebt mir noch etwas Zeit.", AnswerId = 38},
			OfferAnswer{Tag = "aileen105_038PC", String = "Ich bin hier, um Euch Fragen zu stellen.", AnswerId = 40},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aileen105_003", String = "Lasst hören."},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aileen105_004PC", String = "Ich denke, es war die Priesterin Lithere!", AnswerId = 5},
			OfferAnswer{Tag = "aileen105_009PC", String = "Baetha stürzte Aedale tatsächlich von der Klippe!", AnswerId = 11},
			OfferAnswer{Tag = "aileen105_014PC", String = "Es ist anders, als Ihr denkt!", AnswerId = 17},
			OfferAnswer{Tag = "aileen105_034PC", String = "Darüber habe ich noch keine ausreichende Erkenntnis.", AnswerId = 36},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aileen105_005", String = "Seid Ihr sicher?"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aileen105_006PC", String = "Lithere tötete Aedale, um ihre Stellung einer Hohen Priesterin einnehmen zu können.", AnswerId = 7},
			OfferAnswer{Tag = "aileen105_008PC", String = "Nein ... Es ist nur eine Vermutung.", AnswerId = 10},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aileen105_007", String = "Ich verstehe. Ihr habt wohl Recht, Lithere hat ein hartes Herz. Und ihre Klage gegen Baetha wirkte allzu eifrig. Sie wird sich verantworten müssen."},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId=765},
			QuestSolve{QuestId=766},
			QuestSolve{QuestId=767},
			QuestSolve{QuestId=768},
			QuestSolve{QuestId=769},				
			QuestSolve{QuestId=771},
			SetRewardFlagTrue { Name = "SQTiondriaMordfallNotSolved" },				
			RemoveDialog{NpcId = 6591},
			RemoveDialog{NpcId = 8122},
			RemoveDialog{NpcId = 8123},
			RemoveDialog{NpcId = 8121},
			RemoveDialog{NpcId = 8120},
			SetGlobalFlagTrue{Name = "LithereDespawnP105"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aileen105_010", String = "Ihr seid Euch sicher?"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aileen105_011PC", String = "Baetha musste lange unter der Hohen Priesterin leiden. Sie hat Aedale im Streit in den Abgrund gestoßen.", AnswerId = 13},
			OfferAnswer{Tag = "aileen105_013PC", String = "Nein ... Nicht wirklich.", AnswerId = 16},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aileen105_012", String = "Warum sollte Lithere auch lügen. Ihr habt Recht, die Novizin ist schuldig!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId=765},
			QuestSolve{QuestId=766},
			QuestSolve{QuestId=767},
			QuestSolve{QuestId=768},
			QuestSolve{QuestId=769},				
			QuestSolve{QuestId=771},
			SetRewardFlagTrue { Name = "SQTiondriaMordfallNotSolved" },		
			RemoveDialog{NpcId = 6591},
			RemoveDialog{NpcId = 8122},
			RemoveDialog{NpcId = 8123},
			RemoveDialog{NpcId = 8121},
			RemoveDialog{NpcId = 8120},
			SetGlobalFlagTrue{Name = "BatheaDespawnP105"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aileen105_015", String = "Sprecht, was habt Ihr herausgefunden?"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aileen105_016PC", String = "Es war tatsächlich ein Unfall.", AnswerId = 19},
			OfferAnswer{Tag = "aileen105_021PC", String = "Es war die Wache Fennair.", AnswerId = 24},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aileen105_017", String = "Also ist niemand schuldig?"},
			OfferAnswer{Tag = "aileen105_018PC", String = "Ja! Aedale muss die Klippe hinabgestürzt sein.", AnswerId = 20},
			OfferAnswer{Tag = "aileen105_020PC", String = "Nein ... wartet, ich muss darüber nachdenken ...", AnswerId = 23},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aileen105_019", String = "Ihr ahnt ja gar nicht, wie mich das erleichtert! Ich hätte ungern eine Schwester verurteilt."},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId=765},
			 QuestSolve{QuestId=766},
			 QuestSolve{QuestId=767},
			 QuestSolve{QuestId=768},
			 QuestSolve{QuestId=769},				
			 QuestSolve{QuestId=771},
			 SetRewardFlagTrue { Name = "SQTiondriaMordfallHalfSolved" },						
			 RemoveDialog{NpcId = 6591},
			 RemoveDialog{NpcId = 8122},
			 RemoveDialog{NpcId = 8123},
			 RemoveDialog{NpcId = 8121},
			 RemoveDialog{NpcId = 8120},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
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
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aileen105_022", String = "Fennair, diese treue Seele? Er soll sie ermordet haben?"},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aileen105_023PC", String = "Ja, das hat er.", AnswerId = 26},
			OfferAnswer{Tag = "aileen105_033PC", String = "Nun ... vielleicht nicht ...", AnswerId = 35},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aileen105_024", String = "Wie kommt Ihr darauf?"},
			Answer{Tag = "aileen105_025PC", String = "Ihr wart es, die mir berichtet hat, dass Fennair ein Auge auf Baetha geworfen hat.", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "aileen105_026PC", String = "Aedales Umgang mit Baetha hat ihn wohl mehr in Zorn versetzt, als er zugeben will ... aber er kann es nicht verbergen.", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "aileen105_027PC", String = "Er kam wohl früher von seinem Spürgang zurück als erwartet. Und als er Aedale zur Rede stellte, gerieten sie in Streit.", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aileen105_028", String = "Das vermutet Ihr doch nur."},
			Answer{Tag = "aileen105_029PC", String = "Zum Teil, wir werden es nie erfahren. Aber wir wissen, dass niemand einen Schrei vernommen hat. Aedale muss schweigend hinabgestürzt sein.", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "aileen105_030PC", String = "Das ist sie, weil Fennair sie im Zorn erwürgt hat! Wenn Ihr Aedales Leiche untersucht, werdet Ihr am Hals mehrere Schnittwunden finden. Wunden, die von Panzerhandschuhen stammen könnten, wie zum Beispiel denen von Fennair.", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "aileen105_031PC", String = "Und er ist der Einzige, der solche Handschuhe trägt!", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aileen105_032", String = "Ihr habt Recht! Ich habe die Male bemerkt, aber nicht an Fennairs Handschuhe gedacht! Dieser arme Narr ... er hat ein gutes Herz, aber er ist doch nur ein Mensch."},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId=765},
			QuestSolve{QuestId=766},
			QuestSolve{QuestId=767},
			QuestSolve{QuestId=768},
			QuestSolve{QuestId=769},				
			QuestSolve{QuestId=771},
			SetRewardFlagTrue { Name = "SQTiondriaMordfallSolved" },
			RemoveDialog{NpcId = 6591},
			RemoveDialog{NpcId = 8122},
			RemoveDialog{NpcId = 8123},
			RemoveDialog{NpcId = 8121},
			RemoveDialog{NpcId = 8120},
			SetGlobalFlagTrue{Name = "FennairDespawnP105"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aileen105_035", String = "Dann lasst uns keine Zeit mit langen Reden verlieren!"},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aileen105_037", String = "Gut. Aber unsere Zeit wird knapp. Man erwartet eine Entscheidung von mir!"},
			Answer{Tag = "", String = "", AnswerId = 39},
		}}

	OnAnswer{39;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{39;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aileen105_039", String = "Fragt, was Ihr wissen wollt."},
			Answer{Tag = "", String = "", AnswerId = 41},
		}}

	OnAnswer{41;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aileen105_040PC", String = "Was genau ist vorgefallen?", AnswerId = 42},
			OfferAnswer{Tag = "aileen105_045PC", String = "Erzählt mir von den Verdächtigen.", AnswerId = 47},
			OfferAnswer{Tag = "aileen105_048PC", String = "Wen haltet Ihr für schuldig?", AnswerId = 50},
			OfferAnswer{Tag = "aileen105_052PC", String = "Das war im Moment alles. Ich danke Euch.", AnswerId = 54},
		}}

	OnAnswer{42;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aileen105_041", String = "Aedale wollte das Land der Ostberge wieder Aryn weihen, nachdem es von den aufgescheuchten Kreaturen verunreinigt worden war."},
			Answer{Tag = "", String = "", AnswerId = 43},
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aileen105_042", String = "Sie nahm ihre rechte Hand Lithere und ihre persönliche Novizin Baetha mit auf den Berg, um das Reinigungsritual zu vollziehen."},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{44;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aileen105_043", String = "Ich gab ihnen die Wache Fennair mit, da der Osten immer noch nicht sicher ist. Außerdem denkt der arme Kerl sowieso ständig nur an Baetha. Also schien er mir geeignet."},
			Answer{Tag = "", String = "", AnswerId = 45},
		}}

	OnAnswer{45;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aileen105_044", String = "Es verging nicht viel Zeit, da kehrte Fennair zurück. Er berichtete, dass Aedale in den Abgrund gestürzt sei. Mehr wissen wir nicht."},
			Answer{Tag = "", String = "", AnswerId = 46},
		}}

	OnAnswer{46;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aileen105_040PC", String = "Was genau ist vorgefallen?", AnswerId = 42},
			OfferAnswer{Tag = "aileen105_045PC", String = "Erzählt mir von den Verdächtigen.", AnswerId = 47},
			OfferAnswer{Tag = "aileen105_048PC", String = "Wen haltet Ihr für schuldig?", AnswerId = 50},
			OfferAnswer{Tag = "aileen105_052PC", String = "Das war im Moment alles. Ich danke Euch.", AnswerId = 54},
		}}

	OnAnswer{47;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aileen105_046", String = "Die Verdächtigen sind Lithere und Baetha, beide gehören zum Orden Aryns."},
			Answer{Tag = "", String = "", AnswerId = 48},
		}}

	OnAnswer{48;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aileen105_047", String = "Die junge Baetha ist eine Novizin, während Lithere bereits den Rang einer erfahreneren Priesterin bekleidet."},
			Answer{Tag = "", String = "", AnswerId = 49},
		}}

	OnAnswer{49;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aileen105_040PC", String = "Was genau ist vorgefallen?", AnswerId = 42},
			OfferAnswer{Tag = "aileen105_045PC", String = "Erzählt mir von den Verdächtigen.", AnswerId = 47},
			OfferAnswer{Tag = "aileen105_048PC", String = "Wen haltet Ihr für schuldig?", AnswerId = 50},
			OfferAnswer{Tag = "aileen105_052PC", String = "Das war im Moment alles. Ich danke Euch.", AnswerId = 54},
		}}

	OnAnswer{50;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aileen105_049", String = "Ich weiß es wirklich nicht. Lithere beschuldigt Baetha und das Wort einer Priesterin hat Macht wie ein Gesetz."},
			Answer{Tag = "", String = "", AnswerId = 51},
		}}

	OnAnswer{51;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aileen105_050", String = "Aber ich kann es kaum glauben, dass eine meiner Schwestern so etwas tun würde. Vor allem nicht die kleine Baetha."},
			Answer{Tag = "", String = "", AnswerId = 52},
		}}

	OnAnswer{52;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aileen105_051", String = "Aber Aedale und Baetha haben sich nie gut verstanden. Aedale hat ihr sogar den Umgang mit Fennair verboten."},
			Answer{Tag = "", String = "", AnswerId = 53},
		}}

	OnAnswer{53;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aileen105_040PC", String = "Was genau ist vorgefallen?", AnswerId = 42},
			OfferAnswer{Tag = "aileen105_045PC", String = "Erzählt mir von den Verdächtigen.", AnswerId = 47},
			OfferAnswer{Tag = "aileen105_048PC", String = "Wen haltet Ihr für schuldig?", AnswerId = 50},
			OfferAnswer{Tag = "aileen105_052PC", String = "Das war im Moment alles. Ich danke Euch.", AnswerId = 54},
		}}

	OnAnswer{54;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aileen105_053", String = "Gut!"},
			Answer{Tag = "", String = "", AnswerId = 55},
		}}

	OnAnswer{55;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{55;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{56;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aileen105_055", String = "Elen gebe uns Frieden."},
			Answer{Tag = "", String = "", AnswerId = 57},
		}}

	OnAnswer{57;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 58},
		}}

	OnAnswer{58;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aileen105_056PC", String = "Was ist mit Aedale geschehen?", AnswerId = 59},
			OfferAnswer{Tag = "aileen105_063PC", String = "Soll ich Euch bei den Ermittlungen helfen?", AnswerId = 65},
			OfferAnswer{Tag = "aileen105_067PC", String = "Was soll ich tun, um Aedales Tod aufzuklären?", AnswerId = 70},
		}}

	OnAnswer{59;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aileen105_057", String = "Sie stürzte von einer Klippe am Ostberg. Wir wissen nicht, wie es geschah. Aber kaum jemand glaubt, dass Aedale einfach den Halt verloren hat."},
			Answer{Tag = "aileen105_058PC", String = "Eine Kreatur?", AnswerId = 60},
		}}

	OnAnswer{60;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aileen105_059", String = "Wir wissen es nicht. Aber Lithere, eine der Schwestern, die sie begleitet haben, behauptet, eine Novizin hätte sie hinunter gestoßen."},
			Answer{Tag = "aileen105_060PC", String = "Eine Elfe soll eine Elfe getötet haben?", AnswerId = 61},
		}}

	OnAnswer{61;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aileen105_061", String = "Es ist lange her, aber es gibt solche dunklen Kapitel in unserer Vergangenheit. Wir haben kaum Gesetze, aber Lithere verlangt von mir, Baetha einzusperren."},
			Answer{Tag = "", String = "", AnswerId = 62},
		}}

	OnAnswer{62;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aileen105_062", String = "Lithere ist eine Priesterin, ich kann ihr kaum widersprechen. Aber ich habe das Gefühl, dass hier mehr als eine Lüge am Werk ist!"},
			Answer{Tag = "", String = "", AnswerId = 63},
		}}

	OnAnswer{63;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 64},
		}}

	OnAnswer{64;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 58},
		}}

	OnAnswer{65;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aileen105_064", String = "Ihr seid ein Fremder. Sie werden Euch kaum etwas erzählen. Andererseits habt Ihr keine Bräuche und Ordensregeln, die Euch binden."},
			Answer{Tag = "", String = "", AnswerId = 66},
		}}

	OnAnswer{66;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aileen105_065", String = "Befragt Baetha, Lithere und die Wache Fennair. Alle drei waren mit der Hohen Priesterin Aedale auf dem Ostberg."},
			Answer{Tag = "", String = "", AnswerId = 67},
		}}

	OnAnswer{67;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aileen105_066", String = "Versucht zu ermitteln, wer von ihnen für den Tod Aedales verantwortlich ist. Wenn Ihr Euch eine Meinung gebildet habt, kehrt zu mir zurück."},
			Answer{Tag = "", String = "", AnswerId = 68},
		}}

	OnAnswer{68;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "MordQuestAngenommen"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 69},
		}}

	OnAnswer{69;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{69;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{70;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 71},
		}}

	OnAnswer{71;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 66},
		}}


	EndDefinition()
end