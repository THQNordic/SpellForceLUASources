-->INFO: Ashgork_Sumpf2
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--erst wenn Statthalter tot und Stadt befreit
SpawnOnlyWhen
{
	X = 458 , Y = 468 , Clan = 0 , UnitId = 0 , NoSpawnEffect = FALSE , 
	Conditions = 
	{
		
		IsGlobalFlagTrue{ Name = "P101_DunkelElfBossKilled", UpdateInterval = 30}
		
	} , 
	Actions = 
	{
		Goto{ X = 293, Y = 284, NpcId = self , Range = 2 , WalkMode = Run , GotoMode = GotoContinuous , XRand = 0 , YRand = 0},
		--Goto{ X = 405, Y = 446, NpcId = self , Range = 2 , WalkMode = Run , GotoMode = GotoContinuous , XRand = 0 , YRand = 0},
	}, 
}

--Dialog an, wenn in Stadt
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 60 ,
	Conditions = 
	{ 
		FigureInRange{X = 293, Y = 284 , NpcId = self , Range = 5},
	},
	Actions = 
	{ 
		SetGlobalFlagTrue{Name = "P101_AshgorkKannSprechen"},
	},
}	

--Wenn Ashgork sauer wird, rennt er zurück ans Portal und spawnt dort Skelette
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 60 ,
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "P101_AshgorkRunPortal"},
	},
	Actions = 
	{ 
		Goto{ X = 458, Y = 468, NpcId = self , Range = 2 , WalkMode = Run , GotoMode = GotoContinuous , XRand = 0 , YRand = 0},
	},
}	

OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "P101_AshgorkRunPortal"},
		FigureInRange{X = 458, Y = 468 , NpcId = self , Range = 2},
		
	},
	Actions = 
	{ 
		CastSpell{Spell = 1292, Target = 6510, TargetType = Figure, X = 0, Y = 0, NpcId = 6510}, --für den Effekt
		ChangeRace{Race = 115, NpcId = self},
		SetGlobalFlagTrue{Name = "P101_AshgorkSpawnMonsters"}, 
		
	},
}

OnToggleEvent
{
	OnConditions = 
	{
		IsGlobalFlagFalse {Name ="P101_AshgorkKannSprechen"},
	 },
	OnActions = 
	{
		 RemoveDialog { NpcId = self},
	},
	OffConditions = 
	{
		IsGlobalFlagTrue {Name ="P101_AshgorkKannSprechen"},
	},
	OffActions = 
	{
		EnableDialog { NpcId = self} ,
	},
}






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p101\n6510_Ashgork_Sumpf2.txt


	

	OnBeginDialog{
		Conditions = {
			IsGlobalCounter {Name = "AshgorkKnochenwaffen", Value = 0, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalCounter {Name = "AshgorkKnochenwaffen", Value = 0, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{1;
		Conditions = {
			IsGlobalFlagFalse{Name = "SQ_Ashgork_InfoWeapons"},
		},
		Actions = {
			Say{Tag = "ashgorksumpf2101_001", String = "Gute Arbeit, Runenkrieger! Mein Volk kann heimkehren."},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "SQ_Ashgork_InfoWeapons"}),
		},
		Actions = {
			Say{Tag = "ashgorksumpf2101_020", String = "Habt Ihr es Euch überlegt? 10 Goldstücke und das Wissen gehört Euch."},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ashgorksumpf2101_002", String = "Nun zu unserer Abmachung."},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ashgorksumpf2101_003", String = "Seit Jahrhunderten überliefern die Schmiede der Orks die Kunst der Knochenwaffen. Sie formen sie aus den Gebeinen machtvoller Wesen und machen sie mit ihrer Magie härter als Stahl!"},
			Answer{Tag = "ashgorksumpf2101_004PC", String = "Werden Euch die anderen Schmiede nicht strafen, wenn Ihr das Geheimnis preisgebt?", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ashgorksumpf2101_005", String = "Ich werde einen Preis zu zahlen haben. Doch wenn ich ihnen genug Gold gebe, werden sie mein Leben verschonen. Doch Ihr müsst mir dabei helfen. Ich brauche 10 Goldstücke."},
			Answer{Tag = "ashgorksumpf2101_006PC", String = "Ich habe Eure Feinde vertrieben, nun wollt Ihr noch Gold?", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "SQ_Ashgork_InfoWeapons"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ashgorksumpf2101_007", String = "So steht es, nehmt oder lasst es, Mensch. Ich brauche das Gold, oder mein Leben ist verwirkt!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
			PlayerHasMoney{Gold = 10},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ashgorksumpf2101_008PC", String = "Nehmt das Gold, Ork! Und nun redet!", AnswerId = 9},
			OfferAnswer{Tag = "ashgorksumpf2101_017PC", String = "Der Handel passt mir nicht!", AnswerId = 19},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(PlayerHasMoney{Gold = 10}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ashgorksumpf2101_017PC", String = "Der Handel passt mir nicht!", AnswerId = 19},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ashgorksumpf2101_009", String = "Gut. Hört gut zu, während ich Euch die Handgriffe der Knochenformer zeige."},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ashgorksumpf2101_010", String = "Die Knochen müssen von einer mächtigen Kreatur stammen, nicht jedes Gebein ist dafür geeignet! Man formt sie mit einem Knochenmesser, das bei dieser Arbeit allerdings stumpf und nutzlos wird."},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ashgorksumpf2101_011", String = "Ist der Knochen geformt, muss seine rohe Magie gerichtet werden. Blutedelsteine, die Ihr in diesen Landen findet, vollenden den Zauber und verleihen ihm Wirkung."},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ashgorksumpf2101_012", String = "All dies muss an einem Knochenaltar geschehen. Solch einen Altar findet Ihr hier in Mirraw Thur."},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ashgorksumpf2101_013", String = "Bestimmte Knochenartefakte wirken gemeinsam, was ihnen besondere Macht verleiht. Drei Knochenteile werden für einen Satz benötigt."},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ashgorksumpf2101_014", String = "Eins noch. Die Knochenschmiede sind mächtig, doch diese Macht ist auch ein Fluch. Sobald Ihr Eure erste Knochenwaffe gefertigt habt, werden Eure eigenen Knochen ebenfalls zum Gegenstand der Macht!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ashgorksumpf2101_015", String = "Nehmt Euch also in Acht! So, diese Handgriffe sind alles, was Ihr können müsst. Das Knochenmesser gibt es bei den Händlern, aber Knochen und Blutsteine müsst Ihr schon selbst finden."},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			IncreaseGlobalCounter {Name = "AshgorkKnochenwaffen"},
			TransferMoney{Gold = 10, Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "ashgorksumpf2101_016PC", String = "Welche Knochen kann ich verwenden?", AnswerId = 24},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ashgorksumpf2101_018", String = "Wie Ihr wollt. Kommt zurück, wenn Ihr Eure Meinung ändert. Ich habe meine Schuld nicht vergessen."},
			Answer{Tag = "ashgorksumpf2101_019PC", String = "Nein, nur Euer Preis ist gestiegen, Ork!", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{22;
		Conditions = {
			IsGlobalCounter {Name = "AshgorkKnochenwaffen", Value = 1, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsGlobalCounter {Name = "AshgorkKnochenwaffen", Value = 1, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "SQ_Ashgork_InfoFragment1"}),
		},
		Actions = {
			Say{Tag = "ashgorksumpf2101_024", String = "Habt Ihr den Knochenschmuck von Nazosh?"},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{23;
		Conditions = {
			IsGlobalFlagFalse{Name = "SQ_Ashgork_InfoFragment1"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ashgorksumpf2101_021", String = "Nazosh, einer der Orkführer, trägt die Knochen eines alten Knochenschnitzers um den Hals als Schmuck. Der Narr weiß nicht, was er da hat!"},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ashgorksumpf2101_022", String = "Er brach mit seiner Gruppe in die Echosümpfe auf, um das Schlachtfeld zu plündern, das Ihr dort hinterlassen habt."},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ashgorksumpf2101_023", String = "Lasst Euch die Knochen von ihm geben! Der Dummkopf kann nichts damit anfangen, aber für Euch sind sie entscheidend auf dem Weg zum Knochenformer!"},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "SQ_Ashgork_InfoFragment1"},
								QuestSolve{QuestId = 736},
								QuestBegin{QuestId = 737},
			SetGlobalFlagTrue {Name = "P103_KnochenquestSpawn"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{29;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemFirstFragment"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ashgorksumpf2101_025PC", String = "Ja, hier ist er.", AnswerId = 30},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemFirstFragment"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ashgorksumpf2101_026", String = "Gut! Er ist nur ein einfacher Krieger, Ihr aber könnt viel mehr damit wirken!"},
			Answer{Tag = "ashgorksumpf2101_027PC", String = "Wo sind diese Blutedelsteine zu finden?", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			IncreaseGlobalCounter {Name = "AshgorkKnochenwaffen"},
			Say{Tag = "ashgorksumpf2101_028", String = "Blutedelsteine wurden in den Landen des Feuers und im Norden von Fiara geschürft."},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(IsGlobalCounter {Name = "AshgorkKnochenwaffen", Value = 2, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 49},
		}}

	OnAnswer{33;
		Conditions = {
			IsGlobalCounter {Name = "AshgorkKnochenwaffen", Value = 2, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "SQ_Ashgork_InfoFragment2"}),
		},
		Actions = {
			Say{Tag = "ashgorksumpf2101_036", String = "Habt Ihr den Kreischer gefunden?"},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{35;
		Conditions = {
			IsGlobalFlagFalse{Name = "SQ_Ashgork_InfoFragment2"},
		},
		Actions = {
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
		},
		Actions = {
			Say{Tag = "ashgorksumpf2101_029", String = "Wenn Ihr es wünscht, verrate ich Euch, wo Ihr ein weiteres Knochenstück findet!"},
			Answer{Tag = "ashgorksumpf2101_030PC", String = "Wie viel soll es diesmal kosten?", AnswerId = 38},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ashgorksumpf2101_031", String = "Kein Gold diesmal. Aber gefährlicher wird es!"},
			Answer{Tag = "", String = "", AnswerId = 39},
		}}

	OnAnswer{39;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ashgorksumpf2101_032", String = "Der erste Knochenschnitzer kam von Xu über das Meer nach Mirraw Thur. Er war ein seltsames Wesen, wie wir es noch nie gesehen hatten."},
			Answer{Tag = "", String = "", AnswerId = 40},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ashgorksumpf2101_033", String = "Er lehrte uns die Kunst und ihren Preis. Doch als sein Ende nahte und meine Brüder seine Knochen nehmen wollten, da erschien ein Wächter."},
			Answer{Tag = "", String = "", AnswerId = 41},
		}}

	OnAnswer{41;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ashgorksumpf2101_034", String = "Seither behütet die Wachkreatur seine Gebeine voller Argwohn! Das ist ein Kreischer, ein untotes Monstrum! Ihr findet ihn und das Grab im Norden von Mirraw Thur."},
			Answer{Tag = "", String = "", AnswerId = 42},
		}}

	OnAnswer{42;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ashgorksumpf2101_035", String = "Versucht, den Kreischer zu überlisten und die Knochen zu erringen!"},
			Answer{Tag = "", String = "", AnswerId = 43},
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "SQ_Ashgork_InfoFragment2"},
								QuestSolve{QuestId = 737},
								QuestBegin{QuestId = 741},
			SetGlobalFlagTrue {Name = "P101_KreischerKnochenquestSpawn"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{44;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemSecondFragment"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ashgorksumpf2101_037PC", String = "Ja und die Knochen auch.", AnswerId = 45},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemSecondFragment"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{45;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ashgorksumpf2101_038", String = "Sehr gut, bald haben wir drei Teile zusammen!"},
			Answer{Tag = "", String = "", AnswerId = 46},
		}}

	OnAnswer{46;
		Conditions = {
		},
		Actions = {
			IncreaseGlobalCounter {Name = "AshgorkKnochenwaffen"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 47},
		}}

	OnAnswer{47;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 49},
		}}

	OnAnswer{49;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "ashgorksumpf2101_039PC", String = "Wenn ich euch richtig verstanden haben, ist es Tradition, dass der Lehrling irgendwann die Knochen des Lehrmeisters erbeutet.", AnswerId = 50},
		}}

	OnAnswer{50;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ashgorksumpf2101_040", String = "Das ... habt Ihr richtig erkannt, Mensch ..."},
			Answer{Tag = "ashgorksumpf2101_041PC", String = "Das heißt, der dritte Teil für meinen Satz ... sind Eure Knochen, nicht wahr?", AnswerId = 51},
		}}

	OnAnswer{51;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ashgorksumpf2101_042", String = "Bleibt fern! Ich Narr, was lehre ich Euch auch Traditionen des Blutes!"},
			Answer{Tag = "ashgorksumpf2101_043PC", String = "Nur ruhig.", AnswerId = 52},
		}}

	OnAnswer{52;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ashgorksumpf2101_044", String = "So leicht mache ich es Euch nicht, Mensch!"},
			Answer{Tag = "ashgorksumpf2101_045PC", String = "Wartet ...", AnswerId = 53},
		}}

	OnAnswer{53;
		Conditions = {
		},
		Actions = {
			RemoveDialog{NpcId = self},
			QuestSolve{QuestId = 741},
					 QuestBegin{QuestId = 742},
					 SetGlobalFlagTrue {Name = "P101_AshgorkRunPortal"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 54},
		}}

	OnAnswer{54;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{54;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end