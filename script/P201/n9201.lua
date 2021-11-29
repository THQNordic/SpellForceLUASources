-->INFO: Gurim
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	Conditions = 
	{
		ODER9
		{
			IsGlobalFlagTrue {Name = "g_nP202_SchattenklingeSpieler"},
			UND(QuestState {QuestId = 777, State = StateSolved}, IsGlobalFlagTrue{Name = "GDS_PlayerWasOnPlatform_P203"}),
		},	
	},
	Actions = 
	{
		ChangeRace {Race = 152, NpcId = self},
	}
} 

--Outcry Gurim:
--Sheeha tot, Andar erscheint.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP201SheehaAmLeben"},
		IsGlobalFlagTrue {Name = "g_sP201AndarAmLeben"},
		FigureDead {NpcId = 9207},
		
	},
	Actions = 
	{ 
		Outcry {NpcId = 9201, String = "Wehe, Andar ist erschienen!" , Tag = "oca2gurimP201_005" , Delay = TRUE , Color = ColorWhite},
	}
}

--Andar tot.
OnOneTimeEvent
{
	Conditions = 
	{ 
		
		IsGlobalFlagTrue {Name = "g_sP201AndarAmLeben"},
		FigureDead {NpcId = 9208},
		
	},
	Actions = 
	{ 
		Outcry {NpcId = 9201, String = "Kommt her, Runenkrieger, ich muss Euch mehr berichten!" , Tag = "oca2gurimP201_006" , Delay = TRUE , Color = ColorWhite},
	}
}

--Outcry Gurim wenn Laurin erscheint.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP201LaurinAmLeben"},
	},
	Actions = 
	{ 
		Outcry {NpcId = 9201, String = "Da! Der Blender naht! Ich spüre es!" , Tag = "oca2gurimP201_007" , Delay = FALSE , Color = ColorWhite},
		Outcry {NpcId = 9201, String = "Laurin! Endlich! Meine Axt wartet auf dich!" , Tag = "oca2gurimP201_008" , Delay = FALSE , Color = ColorWhite},
		Outcry {NpcId = 9201, String = "Niethalf, bezeuge meine Rache!" , Tag = "oca2gurimP201_009" , Delay = FALSE , Color = ColorWhite},
		Goto {X = 159, Y = 221, NpcId = self , Range = 5 , WalkMode = Walk, GotoMode = GotoContinuous},	
	}
}

--Gurim beginnt zu rennen.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP201LaurinAmLeben"},
		Negated(FigureInRange {X = 159, Y = 221, NpcId = self, Range = 15}),
		IsGlobalFlagTrue {Name = "g_sP201DoppelgaengerLaurinStart"},
		
	},
	Actions = 
	{ 
		Goto {X = 159, Y = 221, NpcId = self , Range = 5 , WalkMode = Run, GotoMode = GotoContinuous},	
	}
}


--Wenn Gurim Laurin erreicht kommt es zum Kampf der beiden.
OnOneTimeEvent
{
	Conditions = 
	{ 
		FigureInRange {X = 159, Y = 221, NpcId = self , Range = 10},
		IsGlobalFlagTrue {Name = "g_sP201LaurinAmLeben"},
	},
	Actions = 
	{ 
		ChangeRace {Race = 135, NpcId = self},
		AttackTarget {Target = 9214, NpcId = self, FriendlyFire = FALSE},
		--SetGlobalFlagTrue {Name = "g_sP201SQGurimAngekommen"},
	}
}


--Ist Laurin tot und wird gelootet.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP201LaurinTot", UpdateInterval = 20}, 
		--IsGlobalFlagTrue {Name = "g_sP201SQGurimAngekommen", UpdateInterval = 20}, 
		PlayerHasItem {ItemId = 4785, Amount = 1, Equipment = EquipmentAll, UpdateInterval = 20},
		
	},
	Actions = 
	{ 
		
		Outcry {NpcId = 9201, String = "Da ist sie! Sie wird meinen Bruder nie freigeben, das weiß ich jetzt!" , Tag = "oca2gurimP201_013" , Delay = FALSE , Color = ColorWhite},
		Outcry {NpcId = 9201, String = "Aber er soll mit Euch einen würdigen und guten Meister haben!" , Tag = "oca2gurimP201_014" , Delay = FALSE , Color = ColorWhite},
		Outcry {NpcId = 9201, String = "Nun kann ich endlich in Frieden ruhen! Lebt wohl, Runenkrieger!" , Tag = "oca2gurimP201_015" , Delay = FALSE , Color = ColorWhite},
		SetNpcTimeStamp {Name = "npc_tsP201DespawnGurim"},
	}
}

--Gurim verschwindet.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_sP201LaurinTot"},
		IsNpcTimeElapsed {Name = "npc_tsP201DespawnGurim", Seconds = 45},
	},
	Actions = 
	{ 
		SetEffect {Effect = "DeMaterialize", Length = 2250},
		SetNpcTimeStamp {Name = "npc_tsP201DespawnGurimStart"},
	}
}


--Despawn Gurim, wenn Laurin tot ist.
Despawn
{
	PlayDeathAnim = FALSE ,
	Conditions = 
	{
		IsNpcTimeElapsed {Name = "npc_tsP201DespawnGurimStart", Seconds = 2, UpdateInterval = 10},
	},
	Actions = 
	{
	
	}
}






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P201\n9201_Gurim.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsGlobalFlagTrue{Name = "g_sP201Auftrag1Erfuellt"},
		},
		Actions = {
			Say{Tag = "gurimP201_001", String = "Ein guter Kampf! Ihr habt gesiegt! ... Und die Geschichte geht weiter, so wie damals ..."},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_sP201Auftrag1Erfuellt"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gurimP201_002PC", String = "Was geschah?", AnswerId = 2, Color = ColorDarkOrange},
			OfferAnswer{Tag = "gurimP201_003PC", String = "Haltet mich nicht auf, nennt den nächsten Gegner!", AnswerId = 4},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gurimP201_004", String = "Ich musste noch zwei weitere Seedrachen besiegen, bevor ich schließlich Laurin selbst gegenüber trat! Denn Laruin hatte mich die ganze Zeit belogen!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
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
			Answer{Tag = "gurimP201_012PC", String = "Dann warten nun also wieder zwei Drachen auf mich, bervor ich Laurin gegenüber stehe?", AnswerId = 14},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gurimP201_005", String = "Nachdem ich die beiden Drachen geschlagen hatte, sandte mich Laurin aus, um seine letzten beiden Feinde zu besiegen, die ihm die Herrschaft über die verlorenen Inseln streitig machten!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gurimP201_006", String = "Es waren die Seedrachen Iridon und Zandarh! Lange jagte ich sie über das Meer und viele Male musste auch ich fliehen, bis es mir endlich gelang, sie zu besiegen!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gurimP201_007", String = "Als ich mit ihren Herzen als Beweis zu Laurin zurückkehrte, verlangte er Glamrigs Rune, um seinen Teil der Abmachung zu erfüllen. Doch dann lachte der Winddrache nur und rauschte in einem Sturm davon!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gurimP201_008", String = "Lange Zeit suchte ich das Meer nach ihm ab ...bis ich ihn schließlich seinen Unterschlupf fand, wo er sich von Galmrig die schönsten Edelsteine seines Schatzes zuschleifen ließ."},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gurimP201_009", String = "Als er mich sah, floh er über das Meer! Viele Tage verfolgte ich ihn und als er sich endlich zum Kampf stellte, da tobte ein gewaltiger Wirbelsturm um uns und riß uns empor in die Luft!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gurimP201_010", String = "Viele Male traf ihn meine Axt, doch er ist Laurin der Blender und eine seiner Kräfte erlaubt es ihm, sich zu verfielfältigen! So kämpfte ich schließlich hoch in der Lfut gegen ein wahres Heer von Drachen!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gurimP201_011", String = "Schließlich traf mich ein Hieb und ich stürtzte hinab in die kochende See! Doch der verwundete Laurin stürtzte mit mir, so hat keiner von uns sein Ziel erreicht!"},
			Answer{Tag = "gurimP201_012PC", String = "Dann warten nun also wieder zwei Drachen auf mich, bervor ich Laurin gegenüber stehe?", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gurimP201_013", String = "Ja! Wisset, dass Iridion viele Helfer hat! Achtet auf diejenigen, die seine magische Kraft stärken!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gurimP201_014", String = "Zandarh ist mächtig, aber sein Leben steht und fällt mit seinen Dienern!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gurimP201_015", String = "Und solltet Ihr Laurin gegenüber stehen, dann müsst Ihr die Quelle seiner Kraft unterbrechen, damit er sich nicht verfielfältigen kann!"},
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
			SetGlobalFlagTrue{Name = "g_sP201Auftrag2Erhalten"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{20;
		Conditions = {
			IsNpcFlagTrue{Name = "Known"},
		},
		Actions = {
			Say{Tag = "gurimP201_016", String = "Ich verfluche dich Laurin, und all Euch Drachen!"},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "Known"}),
		},
		Actions = {
			Say{Tag = "gurimP201_017", String = "Ihr Götter, gebt mir meinen Bruder zurück! Isgrimm! Laurin! Ich verfluche euch!"},
			Answer{Tag = "gurimP201_018PC", String = "Eure Flüche verderben dieses Land, Geist! Geht und nehmt sie mit ins Grab!", AnswerId = 24},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[38]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gurimP201_022PC", String = "Erzählt Eure Geschichte.", AnswerId = 26, Color = ColorDarkOrange},
			OfferAnswer{Tag = "gurimP201_035PC", String = "Wie kann ich Euch helfen?", AnswerId = 38},
		}}

	OnAnswer{23;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[38]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gurimP201_022PC", String = "Erzählt Eure Geschichte.", AnswerId = 26, Color = ColorDarkOrange},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[38]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gurimP201_035PC", String = "Wie kann ich Euch helfen?", AnswerId = 38},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[38]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gurimP201_019", String = "Niemals! Ich gebe nicht auf! Ich werde meinen Bruder Glamrig aus seinem Runenbund befreien!"},
			Answer{Tag = "gurimP201_020PC", String = "Glamrig? Ist er ein Runenkrieger?", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[38]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "gurimP201_021", String = "Wollt Ihr meine Geschichte hören? Oder wollt Ihr mir helfen, meine Rache zu vollstrecken?"},
			OfferAnswer{Tag = "gurimP201_022PC", String = "Erzählt Eure Geschichte.", AnswerId = 26, Color = ColorDarkOrange},
			OfferAnswer{Tag = "gurimP201_035PC", String = "Wie kann ich Euch helfen?", AnswerId = 38},
		}}

	OnAnswer{25;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[38]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "gurimP201_021", String = "Wollt Ihr meine Geschichte hören? Oder wollt Ihr mir helfen, meine Rache zu vollstrecken?"},
			OfferAnswer{Tag = "gurimP201_022PC", String = "Erzählt Eure Geschichte.", AnswerId = 26, Color = ColorDarkOrange},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[38]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "gurimP201_021", String = "Wollt Ihr meine Geschichte hören? Oder wollt Ihr mir helfen, meine Rache zu vollstrecken?"},
			OfferAnswer{Tag = "gurimP201_035PC", String = "Wie kann ich Euch helfen?", AnswerId = 38},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[38]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "gurimP201_021", String = "Wollt Ihr meine Geschichte hören? Oder wollt Ihr mir helfen, meine Rache zu vollstrecken?"},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gurimP201_023", String = "Mein Bruder Glamrig und ich, Gurim, waren einst große Felsformer und Edelsteinschnitzer in Windholme. Wir waren berühmt, sogar Isgrimm schätzte unsere Arbeit."},
			Answer{Tag = "gurimP201_024PC", String = "Isgrimm, der Zwergenschmied des Zirkels?", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gurimP201_025", String = "Ja, verflucht sei er! Er hat das Wissen unseres Volkes an den Zirkel verraten und die Zwerge mit dem Wahnsinn des Zirkels vergiftet!"},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gurimP201_026", String = "Mein Bruder kannte Isgrimm gut. Er war es schließlich, der seine Verbindungen zum Zirtkel offenbarte und den Rat der Zwerge gegen ihn aufbrachte!"},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gurimP201_027", String = "Glamrig stellte Isgrimm, den Verräter, auf seinem Turm in Windholme! Zwei Tage lang tanzten die Äxte und Blitze fuhren in den Turm! Doch schließlich siegte Isgrimm!"},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gurimP201_028", String = "Doch er tötete meinen geschwächten Bruder nicht, nein! Mit grausamem Scherz schmiedete er Glamrigs Seele an eine Rune! So wurde mein Bruder sein Sklave!"},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gurimP201_029", String = "Doch mir gelang es in den Wirren des Krieges, die Rune zu rauben! Ich suchte in alten Zauberbücher, bereiste die Welt ... aber niemand konnte meinen Bruder von dem Bund zu ihr erlösen!"},
			Answer{Tag = "gurimP201_030PC", String = "Ich kenne diese Schicksal! Ihr spracht von jemand namens Laurin?", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gurimP201_031", String = "Ja! Laurin der Blender! Ich traf auf ihn, als ich auf meiner Suche das zeitlose Meer befuhr. Er lockte mich zu den verlorenen Inseln und versprach mir, Glamrig zu erlösen, wenn ich seine vier Feinde erschlage!"},
			Answer{Tag = "gurimP201_032PC", String = "Nur ein Magier des Zirkels oder das Allfeuer selbst kann einen Runenbund lösen!", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gurimP201_033", String = "Laurin war ein Winddrache der alten Welt! Er sagte mir, ein alter Drache hätte diese Macht! Aber ich hätte es wissen müssen, Winddrachen sind Täuscher!"},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gurimP201_034", String = "Doch ich fuhr ich aufs Meer und suchte nach Laurins Widersachern, den Seedrachen Sheeha und Andar! In wildem Kampf bezwang ich sie ... doch das war nur der Anfang ...und jetzt spüre ich, wie alles von vorne beginnt!"},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[26]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[38]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gurimP201_022PC", String = "Erzählt Eure Geschichte.", AnswerId = 26, Color = ColorDarkOrange},
			OfferAnswer{Tag = "gurimP201_035PC", String = "Wie kann ich Euch helfen?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[38]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gurimP201_022PC", String = "Erzählt Eure Geschichte.", AnswerId = 26, Color = ColorDarkOrange},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[38]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gurimP201_035PC", String = "Wie kann ich Euch helfen?", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[38]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gurimP201_036", String = "Ich spüre das Isgrimm erwacht! Und mit ihm ich und all das Leid das er verursacht hat! Wir alle kehren zurück, auch Laurin und die Seedrachen, die ich erschlug!"},
			Answer{Tag = "", String = "", AnswerId = 39},
		}}

	OnAnswer{39;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gurimP201_037", String = "Bitte, Ihr müsst vollbringen, was mir nicht gelang! Ihr müsst meine Vergangenheit zum Guten wenden!"},
			Answer{Tag = "gurimP201_038PC", String = "Also muss ich zuerst die Seedrachen besiegen?", AnswerId = 40},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gurimP201_039", String = "Ja, bezwingt Sheeha und Andar! Kehrt dann zu mir zurück!"},
			Answer{Tag = "", String = "", AnswerId = 41},
		}}

	OnAnswer{41;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gurimP201_040", String = "Nehmt noch diesen Rat! Seeha ist nur mit der blanken Waffe zu besiegen, aber Andar kommt man besser nicht zu nahe!"},
			Answer{Tag = "", String = "", AnswerId = 42},
		}}

	OnAnswer{42;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_sP201Auftrag1Erhalten"},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[38]Abgeschaltet"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{42;
		Conditions = {
		},
		Actions = {
			EndDialog(),
			Answer{Tag = "", String = "", AnswerId = 43},
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{44;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[38]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gurimP201_022PC", String = "Erzählt Eure Geschichte.", AnswerId = 26, Color = ColorDarkOrange},
			OfferAnswer{Tag = "gurimP201_035PC", String = "Wie kann ich Euch helfen?", AnswerId = 38},
		}}

	OnAnswer{44;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} ),
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[38]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gurimP201_022PC", String = "Erzählt Eure Geschichte.", AnswerId = 26, Color = ColorDarkOrange},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[38]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gurimP201_035PC", String = "Wie kann ich Euch helfen?", AnswerId = 38},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[26]Abgeschaltet"} )),
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[38]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end