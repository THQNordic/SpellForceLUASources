-->INFO: John_Dundred
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)



SpawnOnlyWhen
{
	X = _X, Y = _Y, NoSpawnEffect = TRUE,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "DundredIsInGame"},
	},
}

OnToggleEvent
{
	OnConditions = 
	{
		IsGlobalFlagFalse{Name = "P105_DundredKannSprechen"},
	},
	OnActions = 
	{ 
		RemoveDialog { NpcId = self} ,
	},
	OffConditions = 
	{
		IsGlobalFlagTrue{Name = "P105_DundredKannSprechen"},
	},
	OffActions = 
	{
		EnableDialog { NpcId = self} ,
	},
}


-- Dundred läuft mit Fugis los
OnOneTimeEvent
{
	Conditions = 
	{
		IsNpcCounter{Name = "FugisWalkPath", Value = 0, Operator = IsEqual},
		IsGlobalFlagTrue{ Name = "FugisGo"},
	},
	Actions = 
	{
		IncreaseNpcCounter{Name = "FugisWalkPath"},
	},
}

-- Dundrer läuft zum Elfentor
OnIdleGoHome
{
	X = Fugis1X, Y = Fugis1Y, Range = 4, WalkMode = Walk,
	Conditions = 
	{
		IsNpcCounter{Name = "FugisWalkPath", Value = 1, Operator = IsEqual},
		IsGlobalFlagTrue{ Name = "P105_PlayerReachedPoint1"},
	},
	HomeActions = 
	{
		IncreaseNpcCounter{Name = "FugisWalkPath"},
	},
}


-- Dundred läuft auf Pfadstelle hinter Elfentor (Kosmetik, da sie sonst quer über Schnee laufen)
OnIdleGoHome
{
	X = Fugis1aX, Y = Fugis1aY, Range = 4, WalkMode = Walk,
	Conditions = 
	{
		IsNpcCounter{Name = "FugisWalkPath", Value = 2, Operator = IsEqual},
		IsGlobalFlagTrue { Name = "P105_SouthTorAuf" },
	},
	HomeActions = 
	{
		IncreaseNpcCounter{Name = "FugisWalkPath"},
	},
}

-- nun geht Dundred zur Eistempelfalle
OnIdleGoHome
{
	X = Fugis2X, Y = Fugis2Y, Range = 4, WalkMode = Walk,
	Conditions = 
	{
		IsNpcCounter{Name = "FugisWalkPath", Value = 3, Operator = IsEqual},
		IsGlobalFlagTrue{ Name = "P105_PlayerReachedPoint2"},
	},
	HomeActions = 
	{
		IncreaseNpcCounter{Name = "FugisWalkPath"},
	},
}

-- nun geht Dundred vor die Stadt
OnIdleGoHome
{
	X = Fugis3X, Y = Fugis3Y, Range = 4, WalkMode = Walk,
	Conditions = 
	{
		IsNpcCounter{Name = "FugisWalkPath", Value = 4, Operator = IsEqual},
		
	},
	HomeActions = 
	{
		IncreaseNpcCounter{Name = "FugisWalkPath"},
	},
}

-- nun geht Dundred in die Stadt
OnIdleGoHome
{
	X = 236, Y = 242, Range = 4, WalkMode = Walk,
	Conditions = 
	{
		IsNpcCounter{Name = "FugisWalkPath", Value = 5, Operator = IsEqual},
		
	},
}


                              
               
                              
                           
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P105\n6802_John_Dundred.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "Known"},
		},
		Actions = {
			Say{Tag = "johndundred105_001", String = "Ich muss Euch für mein Leben danken. Euresgleichen wird zu unrecht verurteilt."},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
		},
		Actions = {
			Say{Tag = "johndundred105_004", String = "Ah, Ihr seid zurück."},
			OfferAnswer{Tag = "johndundred105_005PC", String = "Ein Schriftsteller in Urgath?", AnswerId = 4},
			OfferAnswer{Tag = "johndundred105_011PC", String = "Wie kann ich Euch helfen?", AnswerId = 9},
			OfferAnswer{Tag = "johndundred105_017PC", String = "Was für einen Mythos verfolgt ihr?", AnswerId = 14},
			OfferAnswer{Tag = "johndundred105_023PC", String = "Ich habe dieses Pergament bei einem wahnsinnigen Soldaten gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "johndundred105_028PC", String = "Noch einige von Arandirs Aufzeichnungen!", AnswerId = 23},
			OfferAnswer{Tag = "johndundred105_030PC", String = "Diese Rolle wurde von einem Soldaten mit seinem Leben verteidigt.", AnswerId = 25},
			OfferAnswer{Tag = "johndundred105_033PC", String = "Was werdet Ihr nun tun, da Ihr scheinbar alle Teile des Liedes habt?", AnswerId = 27},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "johndundred105_002", String = "Ich glaube, wir werden noch öfters von der Macht der Runenkrieger hören."},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "johndundred105_003", String = "Mein Name ist John Dundred. Ich schreibe Bücher, wenn ich nicht gerade für Orks als Sklave schuften muss."},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			SetNpcFlagTrue{Name = "Reward"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "johndundred105_006", String = "Ich war nicht immer ein Schreiberling. In meiner Jugend landete ich als Soldat an den Küsten Urgaths!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "johndundred105_007", String = "Aber wie viele vor uns, spie uns das finstere Ufer wieder aus. Ich kam nur gerade noch lebend auf das letze Schiff, das den schwarzen Kontinent wieder verließ."},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "johndundred105_008", String = "Aber die Dschungel Urgaths wuchern nicht nur über dunklen Geheimnissen. Wir fanden dort Spuren einer Geschichte, die in Fiara längst zum Mythos geworden war."},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "johndundred105_009", String = "Einen Mythos, der junge Soldaten nicht begeistert, aber alternde Schreiberlinge sehr wohl! Deshalb kam ich zurück nach Urgath."},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "johndundred105_010", String = "Keiner meiner weisesten Entschlüsse, wie ihr seht. Seid Ihr bereit mir in dieser Sache zu helfen?"},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "johndundred105_012", String = "Drei meiner Kameraden und ich fanden damals Hinweise dass Angar Arandir in Urgath das ewige Lied geschrieben hat und das es dort wohl noch zu finden ist."},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "johndundred105_013", String = "Aber wir mussten wieder fort und ich nahm ein paar Dinge mit, die mir helfen sollten, später nach dem ewigen Lied zu suchen."},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "johndundred105_014", String = "Ich habe aber nur noch diesen Schlüssel ... und einen Hinweis, wie Ihr einen alten Tempel in Mirraw Thur öffnen könnt. Hinter ihm liegen die geheimen Stätten verborgen."},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "johndundred105_015", String = "Sucht nach dem Tempel und nach weiteren Hinweisen die dahinter liegen. Soltlet Ihr Aufzeichnungen  von Angar Arandir finden, bringt sie bitte zu mir."},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "johndundred105_016", String = "Dreht das Radschloss des Tempels einmal links und zweimal rechts herum. Viel Glück ... ach verdammt seien diese müden Knochen!"},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "johndundred105_018", String = "Man nennt ihn das ewige Lied. Der Mythos sagt, das der Barde Angar Arandir in seinen letzen Tagen ein Lied schrieb, in das er sein ganzes Leben und all seine Trauer um seine verlorene Liebe webte."},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "johndundred105_019", String = "Er spürte, dass ein Ende nahte und in jenem letzen Moment an der Schwelle des Todes, erlangte er die Vollendung, die kein Sterblicher bis dahin erreichen konnte, oder es je wieder vermochte!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "johndundred105_020", String = "Das Lied war so wundervoll und traurig zu gleich, dass jeder, der es vernahm, unweigerlich in seinen Bann geschlagen wurde. Man sagt auch, die Götter fürchteten das Lied, denn selbst sie waren dagegen nicht gefeit."},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "johndundred105_021", String = "Wir fanden Spuren in Urgath. Ein leeres Grab, Inschriften ... , keiner hätte geahnt, das Arandir sein Ende in Urgath gefunden hat! Wie es scheint hat er das ewige Lied in Gefangenschaft geschrieben!."},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "johndundred105_022", String = "Aber wir waren Soldaten und auf Feldzug ... so ließen wir die Stätten unberührt. Man sagt die Götter haben Arandirs Lied nach seinem Tod in drei Teile gerissen, um seine Macht zu schwächen."},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "johndundred105_024", String = "Ja, ich errinnere mich, einige aus unserer Einheit unter Leutnant Cardigar verschwanden damals, als wir die Stätte fanden."},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "johndundred105_025", String = "Es ist ... Ah! Es muss ein Teil des Liedes sein! Aber wenn es den armen Kerl in den Wahnsinn getrieben hat, sollte ich es besser mit Vorsicht behandeln!"},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "johndundred105_026", String = "Scheinbar besitzt das Lied wirklich Macht! Wartet, da ist etwas ins Pergament eingerollt ... Sieht wie eine kleine Flöte aus."},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "johndundred105_027", String = "Hier nehmt sie, vielleicht wird sie noch zu etwas gut sein. Ich werde das Pergament studieren, sucht weiter bitte, es muss noch mehr geben!"},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "johndundred105_029", String = "Teile des Liedes! Wunderbar, sucht, ob Ihr noch weitere finden könnt!"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "johndundred105_031", String = "Lasst mich sehen ... Das ist Arandirs Schriftbehälter! Er enthält einen Teil des Liedes!"},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "johndundred105_032", String = "Das ist sehr kostbar! ich danke Euch!"},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "johndundred105_034", String = " ... "},
			Answer{Tag = "johndundred105_035PC", String = "Meister Dundred?", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "johndundred105_036", String = " ... "},
			Answer{Tag = "johndundred105_037PC", String = "Hört ihr mich?", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "johndundred105_038", String = "Was? Oh, ich ...hatte ganz vergessen, das Ihr da seid. Ich studiere das Lied ... "},
			Answer{Tag = "johndundred105_039PC", String = "Seid vorsichtig, denkt an die Angst der Götter und die Wahnsinnigen!", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "johndundred105_040", String = "Was? Ja, ich bin vorsichtig ... ich habe Euch gar nichr gedankt, verzeiht! Hier, dies soll Euch gehören."},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "johndundred105_041", String = "Ihr habt den alten Traum eines Mannes erfüllt  .. danke .. obwohl ... es scheint, nicht ganz komplett ..."},
			Answer{Tag = "johndundred105_042PC", String = "Vielleicht nennt man es deshalb das ewige Lied ... weil es nie vollendet wurde?", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "johndundred105_043", String = "Das wird es sein  ... unvollendet ... ein ewige Suche nach dem letzen Vers ..."},
			Answer{Tag = "johndundred105_044PC", String = "Nun, das ist Euer Fachgebiet. Lebt wohl, Schreiberling, passt auf Euch auf!", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end