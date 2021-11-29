-->INFO: Darius
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 4}
--!EDS ONIDLEGOHOME END





--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P105\n6803_Darius.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "Known"},
		},
		Actions = {
			Say{Tag = "darius105_001", String = "War das nicht ein Falke dort oben? Ich kann es nicht erkennen ..."},
			Answer{Tag = "darius105_002PC", String = "Wer seid Ihr, Ihr wart nicht unter den Flüchtlingen?", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
		},
		Actions = {
			Say{Tag = "darius105_005", String = "Was gibt es, Freund?"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius105_003", String = "Nein, ich gehöre nicht zu Euren Schafen. Ich fliehe andere Mächte."},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius105_004", String = "Darius ist mein Name. Kartograph und Schreiber. Was kann ich für Euch tun, Runenkrieger?"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
			UND(UND(IsNpcFlagFalse{Name = "Known2"},Negated(QuestState{QuestId = 702, State = StateSolved})),
		    QuestState{QuestId = 698, State = StateActive}),
			IsItemFlagTrue{Name = "PlayerHasItemDariusBook"},
			QuestState{QuestId = 707, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius105_006PC", String = "Vor wem seid Ihr auf der Flucht?", AnswerId = 6},
			OfferAnswer{Tag = "darius105_010PC", String = "Ich komme wegen Flink ...", AnswerId = 10},
			OfferAnswer{Tag = "darius105_016PC", String = "Euer Buch, Darius.", AnswerId = 15},
			OfferAnswer{Tag = "darius105_020PC", String = "So, nun sollte das Buch vollständig sein.", AnswerId = 19},
			OfferAnswer{Tag = "darius105_022PC", String = "Was wisst Ihr über die Fial Darg?", AnswerId = 21},
			OfferAnswer{Tag = "darius105_031PC", String = "Was wisst Ihr über Aryn?", AnswerId = 29},
		}}

	OnAnswer{5;
		Conditions = {
			UND(UND(IsNpcFlagFalse{Name = "Known2"},Negated(QuestState{QuestId = 702, State = StateSolved})),
		    QuestState{QuestId = 698, State = StateActive}),
			IsItemFlagTrue{Name = "PlayerHasItemDariusBook"},
			Negated(QuestState{QuestId = 707, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius105_006PC", String = "Vor wem seid Ihr auf der Flucht?", AnswerId = 6},
			OfferAnswer{Tag = "darius105_010PC", String = "Ich komme wegen Flink ...", AnswerId = 10},
			OfferAnswer{Tag = "darius105_016PC", String = "Euer Buch, Darius.", AnswerId = 15},
			OfferAnswer{Tag = "darius105_022PC", String = "Was wisst Ihr über die Fial Darg?", AnswerId = 21},
			OfferAnswer{Tag = "darius105_031PC", String = "Was wisst Ihr über Aryn?", AnswerId = 29},
		}}

	OnAnswer{5;
		Conditions = {
			UND(UND(IsNpcFlagFalse{Name = "Known2"},Negated(QuestState{QuestId = 702, State = StateSolved})),
		    QuestState{QuestId = 698, State = StateActive}),
			Negated(IsItemFlagTrue{Name = "PlayerHasItemDariusBook"}),
			QuestState{QuestId = 707, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius105_006PC", String = "Vor wem seid Ihr auf der Flucht?", AnswerId = 6},
			OfferAnswer{Tag = "darius105_010PC", String = "Ich komme wegen Flink ...", AnswerId = 10},
			OfferAnswer{Tag = "darius105_020PC", String = "So, nun sollte das Buch vollständig sein.", AnswerId = 19},
			OfferAnswer{Tag = "darius105_022PC", String = "Was wisst Ihr über die Fial Darg?", AnswerId = 21},
			OfferAnswer{Tag = "darius105_031PC", String = "Was wisst Ihr über Aryn?", AnswerId = 29},
		}}

	OnAnswer{5;
		Conditions = {
			UND(UND(IsNpcFlagFalse{Name = "Known2"},Negated(QuestState{QuestId = 702, State = StateSolved})),
		    QuestState{QuestId = 698, State = StateActive}),
			Negated(IsItemFlagTrue{Name = "PlayerHasItemDariusBook"}),
			Negated(QuestState{QuestId = 707, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius105_006PC", String = "Vor wem seid Ihr auf der Flucht?", AnswerId = 6},
			OfferAnswer{Tag = "darius105_010PC", String = "Ich komme wegen Flink ...", AnswerId = 10},
			OfferAnswer{Tag = "darius105_022PC", String = "Was wisst Ihr über die Fial Darg?", AnswerId = 21},
			OfferAnswer{Tag = "darius105_031PC", String = "Was wisst Ihr über Aryn?", AnswerId = 29},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(UND(UND(IsNpcFlagFalse{Name = "Known2"},Negated(QuestState{QuestId = 702, State = StateSolved})),
		    QuestState{QuestId = 698, State = StateActive})),
			IsItemFlagTrue{Name = "PlayerHasItemDariusBook"},
			QuestState{QuestId = 707, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius105_006PC", String = "Vor wem seid Ihr auf der Flucht?", AnswerId = 6},
			OfferAnswer{Tag = "darius105_016PC", String = "Euer Buch, Darius.", AnswerId = 15},
			OfferAnswer{Tag = "darius105_020PC", String = "So, nun sollte das Buch vollständig sein.", AnswerId = 19},
			OfferAnswer{Tag = "darius105_022PC", String = "Was wisst Ihr über die Fial Darg?", AnswerId = 21},
			OfferAnswer{Tag = "darius105_031PC", String = "Was wisst Ihr über Aryn?", AnswerId = 29},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(UND(UND(IsNpcFlagFalse{Name = "Known2"},Negated(QuestState{QuestId = 702, State = StateSolved})),
		    QuestState{QuestId = 698, State = StateActive})),
			IsItemFlagTrue{Name = "PlayerHasItemDariusBook"},
			Negated(QuestState{QuestId = 707, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius105_006PC", String = "Vor wem seid Ihr auf der Flucht?", AnswerId = 6},
			OfferAnswer{Tag = "darius105_016PC", String = "Euer Buch, Darius.", AnswerId = 15},
			OfferAnswer{Tag = "darius105_022PC", String = "Was wisst Ihr über die Fial Darg?", AnswerId = 21},
			OfferAnswer{Tag = "darius105_031PC", String = "Was wisst Ihr über Aryn?", AnswerId = 29},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(UND(UND(IsNpcFlagFalse{Name = "Known2"},Negated(QuestState{QuestId = 702, State = StateSolved})),
		    QuestState{QuestId = 698, State = StateActive})),
			Negated(IsItemFlagTrue{Name = "PlayerHasItemDariusBook"}),
			QuestState{QuestId = 707, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius105_006PC", String = "Vor wem seid Ihr auf der Flucht?", AnswerId = 6},
			OfferAnswer{Tag = "darius105_020PC", String = "So, nun sollte das Buch vollständig sein.", AnswerId = 19},
			OfferAnswer{Tag = "darius105_022PC", String = "Was wisst Ihr über die Fial Darg?", AnswerId = 21},
			OfferAnswer{Tag = "darius105_031PC", String = "Was wisst Ihr über Aryn?", AnswerId = 29},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(UND(UND(IsNpcFlagFalse{Name = "Known2"},Negated(QuestState{QuestId = 702, State = StateSolved})),
		    QuestState{QuestId = 698, State = StateActive})),
			Negated(IsItemFlagTrue{Name = "PlayerHasItemDariusBook"}),
			Negated(QuestState{QuestId = 707, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "darius105_006PC", String = "Vor wem seid Ihr auf der Flucht?", AnswerId = 6},
			OfferAnswer{Tag = "darius105_022PC", String = "Was wisst Ihr über die Fial Darg?", AnswerId = 21},
			OfferAnswer{Tag = "darius105_031PC", String = "Was wisst Ihr über Aryn?", AnswerId = 29},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius105_007", String = "Einer meiner Brüder ist sehr zornig auf mich. Er ist ein guter Reiter und ich hoffe, dass er mich hier oben, bei den Unsterblichen, nicht suchen wird."},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius105_008", String = "Aber das ist eine andere Geschichte. Jetzt ist die Eure wichtiger."},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius105_011", String = "Dieser Windbeutel! Alles, was er hätte tun müssen, ist fragen!"},
			Answer{Tag = "darius105_012PC", String = "Nun, er bereut seine Tat ...", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius105_013", String = "Das glaubt Ihr ja selbst nicht!"},
			Answer{Tag = "darius105_014PC", String = "Und wenn ich Euch das Buch zurückbringen würde?", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius105_015", String = "Hm. Ja nun, ich bin kein Unmensch. Dann soll er frei sein."},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known2"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius105_017", String = "Hm. Gut, ich gebe Euch den Schlüssel ... Moment! Da hat ja jemand ein paar Seiten herausgerissen!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius105_018", String = "Ich hätte nicht übel Lust, diesen Zellenschlüssel dort im See zu versenken ... und den kleinen Dieb gleich mit!"},
			Answer{Tag = "darius105_019PC", String = "Beruhigt Euch, ich frage Flink, wo die Seiten sind.", AnswerId = 17},
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
			QuestSolve {QuestId = 702},
			     QuestBegin {QuestId = 703},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius105_021", String = "Gut. Hier habt Ihr nun den Schlüssel. Seht zu, dass er seine Finger bei sich behält!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			SetItemFlagTrue {Name = "PlayerHasItemFlinksCellKey"},
			 QuestSolve {QuestId = 700},
			 QuestSolve {QuestId = 707},
			 SetRewardFlagTrue { Name = "SQTiondriaBuchDariusZurueck" },
			 QuestBegin {QuestId = 708},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius105_023", String = "Sie sind die Prinzen der Finsternis. Sie waren die letzte Schöpfung Zarachs, bevor die dunklen Götter aus der Welt vertrieben wurden."},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius105_024", String = "Sie sind kein eigenes Volk, wie die anderen Kinder der Dunklen, sondern jeder von Ihnen ist einzigartig und unsterblich!"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius105_025", String = "Einst führten sie die dunklen Heere im Sechsvölkerkrieg, und sie hätten das Licht niedergeworfen, wären nicht die Wächtergötter selbst herabgestiegen, um sie aufzuhalten."},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius105_026", String = "Die Fial Darg wurden besiegt und unter dem Tor der Könige, tief unter der Erde, in Bannketten geschlagen. Die Paladine der ehernen Falken wachten über ihren Bannschlaf."},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius105_027", String = "Doch es kam, wie es kommen musste, Kriege und dunkle Streiter zerstörten die Festen der Paladine. Heute stehen nur noch Ruinen davon. Man nennt diesen Ort die klagenden Steine."},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius105_028", String = "Wie es scheint, hat die Konvokation die alten Kavernen geöffnet und ein Fial Darg konnte entfliehen."},
			Answer{Tag = "darius105_029PC", String = "Nur einer ... oder mehrere?", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius105_030", String = "Es könnten mehr sein, viel mehr. Wir werden es früh genug erfahren, fürchte ich."},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius105_032", String = "Der Sage nach kam er von den Grimwargbergen, aber genau weiß es niemand. Er ist der Einzige seiner Art, ein Drache von fast gottgleicher Macht."},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius105_033", String = "Seine Kälte tötet alles Leben in seinem Umfeld, und so war er stets allein. Er hätte wohl die ganze Welt mit seinem Frost überzogen, wäre nicht die letzte Elfenkönigin aufgebrochen, um ihm die Stirn zu bieten."},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius105_034", String = "Ihr Lied gab ihr die Kraft, seiner Kälte zu widerstehen und auch sein Herz zu erwärmen. Seitdem sang sie dort unter dem Eis für den Winterdrachen, damit die Welt wieder einen Frühling erleben durfte."},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "darius105_035", String = "Wir streben nach neuen Erkenntnissen und hohen Schulen der Magie, aber die Kraft der Hoffnung und der Güte entschwindet aus unseren Herzen. Die Lieder der Götter sind vergessen. Ihre Stimme ist die letzte, die uns geblieben ist."},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}


	EndDefinition()
end