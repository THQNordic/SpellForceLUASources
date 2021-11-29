-->INFO: Ragnar
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "AngriffeAbgewehrt", Seconds = 35},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "RagnarSpricht"},
		SetGlobalFlagTrue {Name = "RagnarWillMitSpielerSprechen"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsNpcFlagTrue{Name = "StoryGorgOff"},
		IsNpcFlagTrue{Name = "UramErzaehlt"}
	},
	Actions =
	{
		SetGlobalFlagFalse {Name = "RagnarSpricht1"},
	}
}

-- Dialoge an und aus schalten
OnEvent
{
	Conditions =
	{
		IsGlobalFlagFalse {Name = "RagnarSpricht1"},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "RagnarSpricht1"},
		RemoveDialog {},
	}
}

OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "RagnarWillMitSpielerSprechen"},
	},
	Actions =
	{
		SetGlobalFlagFalse {Name = "RagnarWillMitSpielerSprechen"},
		EnableDialog {},
	}
}

OnIdleGoHome
{
	WalkMode = Run, X = 145, Y = 379, Direction = 2,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "WindjalfFolgt"},
	},
}
--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P108\n6048_Ragnar.txt


	

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalTimeElapsed {Name = "KarteBetretenP108", Seconds = AngriffswelleVierP108}, IsNpcFlagFalse {Name = "UramErzaehlt"}),
			IsNpcFlagFalse{Name = "StoryGorgOff"},
		},
		Actions = {
			Say{Tag = "ragnar108_001", String = "Ihr habt gut gekämpft, Mensch! Schöpft neue Kraft, bald werden weitere Angriffe beginnen!"},
			OfferAnswer{Tag = "ragnar108_002PC", String = "Ich muss zu Windjalf!", AnswerId = 1},
			OfferAnswer{Tag = "ragnar108_009PC", String = "Was hat es mit Windjalf und diesem Riesen auf sich?", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			UND(IsGlobalTimeElapsed {Name = "KarteBetretenP108", Seconds = AngriffswelleVierP108}, IsNpcFlagFalse {Name = "UramErzaehlt"}),
			Negated(IsNpcFlagFalse{Name = "StoryGorgOff"}),
		},
		Actions = {
			Say{Tag = "ragnar108_001", String = "Ihr habt gut gekämpft, Mensch! Schöpft neue Kraft, bald werden weitere Angriffe beginnen!"},
			OfferAnswer{Tag = "ragnar108_002PC", String = "Ich muss zu Windjalf!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalTimeElapsed {Name = "KarteBetretenP108", Seconds = AngriffswelleVierP108}, IsNpcFlagFalse {Name = "UramErzaehlt"})),
			IsNpcFlagFalse{Name = "StoryGorgOff"},
		},
		Actions = {
			Say{Tag = "ragnar108_001", String = "Ihr habt gut gekämpft, Mensch! Schöpft neue Kraft, bald werden weitere Angriffe beginnen!"},
			OfferAnswer{Tag = "ragnar108_009PC", String = "Was hat es mit Windjalf und diesem Riesen auf sich?", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalTimeElapsed {Name = "KarteBetretenP108", Seconds = AngriffswelleVierP108}, IsNpcFlagFalse {Name = "UramErzaehlt"})),
			Negated(IsNpcFlagFalse{Name = "StoryGorgOff"}),
		},
		Actions = {
			Say{Tag = "ragnar108_001", String = "Ihr habt gut gekämpft, Mensch! Schöpft neue Kraft, bald werden weitere Angriffe beginnen!"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ragnar108_003", String = "Solange die Untoten in Horden heranströmen, ist es unmöglich, zu Windjalf vorzudringen! Aber vielleicht gibt es einen Weg, ihren Ansturm aufzuhalten!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ragnar108_004", String = "Die Angreifer kommen über den Südpass. Wenn wir ihn verschließen, müssen sie über das heilige Feld! Die Statuen unserer Ahnen werden mit ihrer heiligen Macht ihre Zahl verringern!"},
			Answer{Tag = "ragnar108_005PC", String = "Wie kann der Südpass verschlossen werden? Mit einem Steinsturz?", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ragnar108_006", String = "Aye! Dazu braucht Ihr einen Steinbrecher! Es sind schon Leute zu Uram, unserem Steinbrecher, unterwegs, aber wir haben nichts mehr von ihnen gehört!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ragnar108_007", String = "Er hat sein Haus auf der anderen Seite des Berges. Versucht ihn zu erreichen! Aber lasst Eure Truppen hier in der Stadt, es wird sicher neue Angriffe geben!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "SpawnUramP108"} , RevealUnExplored {X = 236, Y = 390, Range = 10}, RevealUnExplored {X = 479, Y = 266, Range = 10}, SetNpcFlagTrue{Name = "UramErzaehlt"},
			Say{Tag = "ragnar108_008", String = "Wenn Uram noch am Leben ist, soll er den Überhang mit seinen Sprengmitteln zerstören! So lässt sich der Südpass verschließen."},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
			UND(IsGlobalTimeElapsed {Name = "KarteBetretenP108", Seconds = AngriffswelleVierP108}, IsNpcFlagFalse {Name = "UramErzaehlt"}),
			IsNpcFlagFalse{Name = "StoryGorgOff"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ragnar108_002PC", String = "Ich muss zu Windjalf!", AnswerId = 1},
			OfferAnswer{Tag = "ragnar108_009PC", String = "Was hat es mit Windjalf und diesem Riesen auf sich?", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			UND(IsGlobalTimeElapsed {Name = "KarteBetretenP108", Seconds = AngriffswelleVierP108}, IsNpcFlagFalse {Name = "UramErzaehlt"}),
			Negated(IsNpcFlagFalse{Name = "StoryGorgOff"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ragnar108_002PC", String = "Ich muss zu Windjalf!", AnswerId = 1},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND(IsGlobalTimeElapsed {Name = "KarteBetretenP108", Seconds = AngriffswelleVierP108}, IsNpcFlagFalse {Name = "UramErzaehlt"})),
			IsNpcFlagFalse{Name = "StoryGorgOff"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ragnar108_009PC", String = "Was hat es mit Windjalf und diesem Riesen auf sich?", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND(IsGlobalTimeElapsed {Name = "KarteBetretenP108", Seconds = AngriffswelleVierP108}, IsNpcFlagFalse {Name = "UramErzaehlt"})),
			Negated(IsNpcFlagFalse{Name = "StoryGorgOff"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ragnar108_010", String = "Als diese Berge hier noch jung waren, da stritten sich die Riesen Gorg von den Eisfelsen und Utrur von den Feuerseen, zwei Brüder, wie sie gegensätzlicher nicht sein können."},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ragnar108_011", String = "Keiner von beiden konnte die Oberhand gewinnen und so dauerte ihr Streit Jahr um Jahr, Jahrzehnt um Jahrzehnt fort. Da erfuhr Gorg von dem Geheimnis des Feuerbanns, das die Zwerge der alten Zeit ergründet hatten."},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ragnar108_012", String = "Ein Zauber, der es den Schmieden erlaubte, an den heißesten Essen im Innern der Erde zu arbeiten! Da ergriff Gorg die Gier, und er drängte einen Schmied der Zwerge, ihm dieses Geheimnis zu verraten. Doch der verharrte in Schweigen."},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ragnar108_013", String = "Gorg ersann eine List und lud die Zwerge zum Fest der Sonnenwende in seine Höhle im ewigen Eis. Als die Zwerge feierten und trunken wurden, da sprangen plötzlich Gorgs getreue Wolflinge hervor und packten sie."},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ragnar108_014", String = "Nun forderte Gorg von ihnen das Geheimnis des Feuerbanns oder er würde sie alle erschlagen! Windjalf ging zum Schein darauf ein und bat den Riesen, näher zu kommen, damit er ihm das Geheimnis ins Ohr flüstern könne."},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ragnar108_015", String = "Als der tumbe Riese sich zu ihm herab beugte, da ergriff Windjalf blitzschnell die Axt eines Wolflings, trennte Gorg den Kopf vom Rumpf und floh! Doch selbst der kopflose Körper taumelte ihm noch nach, so groß war die Gier des Riesen."},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ragnar108_016", String = "Seine Brüder rangen die Wolflinge nieder, doch immer mehr strömten aus den Höhlen hervor und noch immer folgte der kopflose Riese dem Zwerg. Da nahm Windjalf seinen Hammer und schlug mit aller Kraft gegen die Wände der Höhle!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ragnar108_017", String = "Fels und Eis erbebten und die Höhle des Riesen stürzte in sich zusammen. Sie begrub Gorg und seine Diener, aber auch viele Zwergenbrüder unter sich."},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ragnar108_018", String = "Nun haben die Beben die alte Kammer geöffnet. Und selbst nach seinem Tod noch trachtet der gierige, zornige Riese nach  Windjalfs Geheimnis!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "StoryGorgOff"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
			UND(IsGlobalTimeElapsed {Name = "KarteBetretenP108", Seconds = AngriffswelleVierP108}, IsNpcFlagFalse {Name = "UramErzaehlt"}),
			IsNpcFlagFalse{Name = "StoryGorgOff"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ragnar108_002PC", String = "Ich muss zu Windjalf!", AnswerId = 1},
			OfferAnswer{Tag = "ragnar108_009PC", String = "Was hat es mit Windjalf und diesem Riesen auf sich?", AnswerId = 7},
		}}

	OnAnswer{17;
		Conditions = {
			UND(IsGlobalTimeElapsed {Name = "KarteBetretenP108", Seconds = AngriffswelleVierP108}, IsNpcFlagFalse {Name = "UramErzaehlt"}),
			Negated(IsNpcFlagFalse{Name = "StoryGorgOff"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ragnar108_002PC", String = "Ich muss zu Windjalf!", AnswerId = 1},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(UND(IsGlobalTimeElapsed {Name = "KarteBetretenP108", Seconds = AngriffswelleVierP108}, IsNpcFlagFalse {Name = "UramErzaehlt"})),
			IsNpcFlagFalse{Name = "StoryGorgOff"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ragnar108_009PC", String = "Was hat es mit Windjalf und diesem Riesen auf sich?", AnswerId = 7},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(UND(IsGlobalTimeElapsed {Name = "KarteBetretenP108", Seconds = AngriffswelleVierP108}, IsNpcFlagFalse {Name = "UramErzaehlt"})),
			Negated(IsNpcFlagFalse{Name = "StoryGorgOff"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end