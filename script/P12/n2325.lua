-->INFO: jon
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 0}
--!EDS ONIDLEGOHOME END



--!EDS RESPAWN BEGIN
Respawn{WaitTime=120}
--!EDS RESPAWN END


--Dialogsteuerung

OnOneTimeEvent
{
Conditions = {},
Actions = {
		SetDialogType{Type = SideQuest}
		}
}







--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p12\n2325_jon.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagJonKnown"},
		},
		Actions = {
			Say{Tag = "jon001", String = "Ah, noch ein Krieger, der unser Schicksal teilen will! Willkommen in der Feste der Verdammten!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagJonKnown"}),
			UND(Negated(QuestState{QuestId = 190 , State = StateSolved}) , IsNpcFlagFalse{Name = "TravelsOff"}),
			 IsPlayerFlagFalse{Name = "MosaicGiven"} ,
		},
		Actions = {
			Say{Tag = "jon003", String = "Willkommen zurück!"},
			OfferAnswer{Tag = "jon003PC", String = "Was hat Euch hierher verschlagen?", AnswerId = 2},
			OfferAnswer{Tag = "jon007PC", String = "Kennt Ihr Euch in diesen Landen aus?", AnswerId = 8},
			OfferAnswer{Tag = "jon018PC", String = "Was habt Ihr da in der Hand?", AnswerId = 18},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagJonKnown"}),
			UND(Negated(QuestState{QuestId = 190 , State = StateSolved}) , IsNpcFlagFalse{Name = "TravelsOff"}),
			Negated( IsPlayerFlagFalse{Name = "MosaicGiven"} ),
		},
		Actions = {
			Say{Tag = "jon003", String = "Willkommen zurück!"},
			OfferAnswer{Tag = "jon003PC", String = "Was hat Euch hierher verschlagen?", AnswerId = 2},
			OfferAnswer{Tag = "jon007PC", String = "Kennt Ihr Euch in diesen Landen aus?", AnswerId = 8},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagJonKnown"}),
			Negated(UND(Negated(QuestState{QuestId = 190 , State = StateSolved}) , IsNpcFlagFalse{Name = "TravelsOff"})),
			 IsPlayerFlagFalse{Name = "MosaicGiven"} ,
		},
		Actions = {
			Say{Tag = "jon003", String = "Willkommen zurück!"},
			OfferAnswer{Tag = "jon007PC", String = "Kennt Ihr Euch in diesen Landen aus?", AnswerId = 8},
			OfferAnswer{Tag = "jon018PC", String = "Was habt Ihr da in der Hand?", AnswerId = 18},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagJonKnown"}),
			Negated(UND(Negated(QuestState{QuestId = 190 , State = StateSolved}) , IsNpcFlagFalse{Name = "TravelsOff"})),
			Negated( IsPlayerFlagFalse{Name = "MosaicGiven"} ),
		},
		Actions = {
			Say{Tag = "jon003", String = "Willkommen zurück!"},
			OfferAnswer{Tag = "jon007PC", String = "Kennt Ihr Euch in diesen Landen aus?", AnswerId = 8},
		}}

	OnAnswer{1;
		Conditions = {
			UND(Negated(QuestState{QuestId = 190 , State = StateSolved}) , IsNpcFlagFalse{Name = "TravelsOff"}),
			 IsPlayerFlagFalse{Name = "MosaicGiven"} ,
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagJonKnown"},
			Say{Tag = "jon002", String = "Verzeiht meine giftige Zunge! Diese Burg ist ein Grab, und wir sind darin gefangen! Ich bin Jon! Sie nennen mich einen Fährtensucher!"},
			OfferAnswer{Tag = "jon003PC", String = "Was hat Euch hierher verschlagen?", AnswerId = 2},
			OfferAnswer{Tag = "jon007PC", String = "Kennt Ihr Euch in diesen Landen aus?", AnswerId = 8},
			OfferAnswer{Tag = "jon018PC", String = "Was habt Ihr da in der Hand?", AnswerId = 18},
		}}

	OnAnswer{1;
		Conditions = {
			UND(Negated(QuestState{QuestId = 190 , State = StateSolved}) , IsNpcFlagFalse{Name = "TravelsOff"}),
			Negated( IsPlayerFlagFalse{Name = "MosaicGiven"} ),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagJonKnown"},
			Say{Tag = "jon002", String = "Verzeiht meine giftige Zunge! Diese Burg ist ein Grab, und wir sind darin gefangen! Ich bin Jon! Sie nennen mich einen Fährtensucher!"},
			OfferAnswer{Tag = "jon003PC", String = "Was hat Euch hierher verschlagen?", AnswerId = 2},
			OfferAnswer{Tag = "jon007PC", String = "Kennt Ihr Euch in diesen Landen aus?", AnswerId = 8},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 190 , State = StateSolved}) , IsNpcFlagFalse{Name = "TravelsOff"})),
			 IsPlayerFlagFalse{Name = "MosaicGiven"} ,
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagJonKnown"},
			Say{Tag = "jon002", String = "Verzeiht meine giftige Zunge! Diese Burg ist ein Grab, und wir sind darin gefangen! Ich bin Jon! Sie nennen mich einen Fährtensucher!"},
			OfferAnswer{Tag = "jon007PC", String = "Kennt Ihr Euch in diesen Landen aus?", AnswerId = 8},
			OfferAnswer{Tag = "jon018PC", String = "Was habt Ihr da in der Hand?", AnswerId = 18},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 190 , State = StateSolved}) , IsNpcFlagFalse{Name = "TravelsOff"})),
			Negated( IsPlayerFlagFalse{Name = "MosaicGiven"} ),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagJonKnown"},
			Say{Tag = "jon002", String = "Verzeiht meine giftige Zunge! Diese Burg ist ein Grab, und wir sind darin gefangen! Ich bin Jon! Sie nennen mich einen Fährtensucher!"},
			OfferAnswer{Tag = "jon007PC", String = "Kennt Ihr Euch in diesen Landen aus?", AnswerId = 8},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jon004", String = "Tana und ich waren in eigener Sache auf dem Weg in die Düsterlande! Wir hatten gerade unsere Vorräte aufgefüllt, als der Angriff erfolgte!"},
			Answer{Tag = "jon004PC", String = "Was genau ist geschehen?", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jon005", String = "Es war ein gigantischer Schlag! Wie eine graue Welle strömten sie vom Osten her über das Land und brandeten gegen die Mauern!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jon006", String = "Der äußere Ring und die Nordfeste wurden beim ersten Angriff zerstört! Seitdem halten wir hier aus!"},
			Answer{Tag = "jon006PC", String = "Warum hat niemand versucht, nach Osten durchzudringen?", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jon007", String = "Wir wissen nur, dass der Weg durch den Schlangenpass eine Todesfalle ist! Urias sprach immer wieder von einer Verstärkung des Ordens! Aber niemand kam!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "TravelsOff"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
			UND(Negated(QuestState{QuestId = 190 , State = StateSolved}) , IsNpcFlagFalse{Name = "TravelsOff"}),
			 IsPlayerFlagFalse{Name = "MosaicGiven"} ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jon003PC", String = "Was hat Euch hierher verschlagen?", AnswerId = 2},
			OfferAnswer{Tag = "jon007PC", String = "Kennt Ihr Euch in diesen Landen aus?", AnswerId = 8},
			OfferAnswer{Tag = "jon018PC", String = "Was habt Ihr da in der Hand?", AnswerId = 18},
		}}

	OnAnswer{7;
		Conditions = {
			UND(Negated(QuestState{QuestId = 190 , State = StateSolved}) , IsNpcFlagFalse{Name = "TravelsOff"}),
			Negated( IsPlayerFlagFalse{Name = "MosaicGiven"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jon003PC", String = "Was hat Euch hierher verschlagen?", AnswerId = 2},
			OfferAnswer{Tag = "jon007PC", String = "Kennt Ihr Euch in diesen Landen aus?", AnswerId = 8},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 190 , State = StateSolved}) , IsNpcFlagFalse{Name = "TravelsOff"})),
			 IsPlayerFlagFalse{Name = "MosaicGiven"} ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jon007PC", String = "Kennt Ihr Euch in diesen Landen aus?", AnswerId = 8},
			OfferAnswer{Tag = "jon018PC", String = "Was habt Ihr da in der Hand?", AnswerId = 18},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 190 , State = StateSolved}) , IsNpcFlagFalse{Name = "TravelsOff"})),
			Negated( IsPlayerFlagFalse{Name = "MosaicGiven"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jon007PC", String = "Kennt Ihr Euch in diesen Landen aus?", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jon008", String = "Ein wenig. An diese Gebiete grenzen die nördlichen und südlichen Windwallberge und die klagenden Steine!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jon009", String = "Über welches Land soll ich Euch berichten?"},
			OfferAnswer{Tag = "jon009PC", String = "Die nördlichen Windwallberge!", AnswerId = 10},
			OfferAnswer{Tag = "jon012PC", String = "Die südlichen Windwallberge!", AnswerId = 13},
			OfferAnswer{Tag = "jon015PC", String = "Die klagenden Steine!", AnswerId = 16},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jon010", String = "Das Haus Hallit hat dort seinen Sitz, in der Burg Brunnenfels! Sie sind mit den Zwergen aus Windholme, in den südlichen Windwallbergen, verbündet!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jon011", String = "Die ältesten Söhne der Herrscher erneuern diesen Schwur jede Generation! Seit jeher kämpfen sie Seite an Seite!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
			UND(Negated(QuestState{QuestId = 190 , State = StateSolved}) , IsNpcFlagFalse{Name = "TravelsOff"}),
			 IsPlayerFlagFalse{Name = "MosaicGiven"} ,
		},
		Actions = {
			Say{Tag = "jon012", String = "Die Halliten sind ein einfaches Volk, und geradeheraus! Nicht so verbissen, wie die Utraner oder so düster wie die Grauen von Wulfgar!"},
			OfferAnswer{Tag = "jon003PC", String = "Was hat Euch hierher verschlagen?", AnswerId = 2},
			OfferAnswer{Tag = "jon007PC", String = "Kennt Ihr Euch in diesen Landen aus?", AnswerId = 8},
			OfferAnswer{Tag = "jon018PC", String = "Was habt Ihr da in der Hand?", AnswerId = 18},
		}}

	OnAnswer{12;
		Conditions = {
			UND(Negated(QuestState{QuestId = 190 , State = StateSolved}) , IsNpcFlagFalse{Name = "TravelsOff"}),
			Negated( IsPlayerFlagFalse{Name = "MosaicGiven"} ),
		},
		Actions = {
			Say{Tag = "jon012", String = "Die Halliten sind ein einfaches Volk, und geradeheraus! Nicht so verbissen, wie die Utraner oder so düster wie die Grauen von Wulfgar!"},
			OfferAnswer{Tag = "jon003PC", String = "Was hat Euch hierher verschlagen?", AnswerId = 2},
			OfferAnswer{Tag = "jon007PC", String = "Kennt Ihr Euch in diesen Landen aus?", AnswerId = 8},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 190 , State = StateSolved}) , IsNpcFlagFalse{Name = "TravelsOff"})),
			 IsPlayerFlagFalse{Name = "MosaicGiven"} ,
		},
		Actions = {
			Say{Tag = "jon012", String = "Die Halliten sind ein einfaches Volk, und geradeheraus! Nicht so verbissen, wie die Utraner oder so düster wie die Grauen von Wulfgar!"},
			OfferAnswer{Tag = "jon007PC", String = "Kennt Ihr Euch in diesen Landen aus?", AnswerId = 8},
			OfferAnswer{Tag = "jon018PC", String = "Was habt Ihr da in der Hand?", AnswerId = 18},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 190 , State = StateSolved}) , IsNpcFlagFalse{Name = "TravelsOff"})),
			Negated( IsPlayerFlagFalse{Name = "MosaicGiven"} ),
		},
		Actions = {
			Say{Tag = "jon012", String = "Die Halliten sind ein einfaches Volk, und geradeheraus! Nicht so verbissen, wie die Utraner oder so düster wie die Grauen von Wulfgar!"},
			OfferAnswer{Tag = "jon007PC", String = "Kennt Ihr Euch in diesen Landen aus?", AnswerId = 8},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jon013", String = "Dort liegt die Heimat der hallitischen Zwerge, Windholme! Die Wiege der Freundschaft zwischen Menschen und Zwergen..."},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jon014", String = "Das Land dort ist rau und seine Einwohner nicht minder! Aber wer sich einmal den Respekt der Zwerge verdient hat, wird in ihnen die ehrlichsten und treuesten Freunde finden!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
			UND(Negated(QuestState{QuestId = 190 , State = StateSolved}) , IsNpcFlagFalse{Name = "TravelsOff"}),
			 IsPlayerFlagFalse{Name = "MosaicGiven"} ,
		},
		Actions = {
			Say{Tag = "jon015", String = "Die Minen bringen Metalle wie Iridian und Mondsilber an die Oberfläche! Die Zwerge verteidigen sie allzeit gegen die Urwesen, die immer wieder aus den Bergen herabsteigen!"},
			OfferAnswer{Tag = "jon003PC", String = "Was hat Euch hierher verschlagen?", AnswerId = 2},
			OfferAnswer{Tag = "jon007PC", String = "Kennt Ihr Euch in diesen Landen aus?", AnswerId = 8},
			OfferAnswer{Tag = "jon018PC", String = "Was habt Ihr da in der Hand?", AnswerId = 18},
		}}

	OnAnswer{15;
		Conditions = {
			UND(Negated(QuestState{QuestId = 190 , State = StateSolved}) , IsNpcFlagFalse{Name = "TravelsOff"}),
			Negated( IsPlayerFlagFalse{Name = "MosaicGiven"} ),
		},
		Actions = {
			Say{Tag = "jon015", String = "Die Minen bringen Metalle wie Iridian und Mondsilber an die Oberfläche! Die Zwerge verteidigen sie allzeit gegen die Urwesen, die immer wieder aus den Bergen herabsteigen!"},
			OfferAnswer{Tag = "jon003PC", String = "Was hat Euch hierher verschlagen?", AnswerId = 2},
			OfferAnswer{Tag = "jon007PC", String = "Kennt Ihr Euch in diesen Landen aus?", AnswerId = 8},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 190 , State = StateSolved}) , IsNpcFlagFalse{Name = "TravelsOff"})),
			 IsPlayerFlagFalse{Name = "MosaicGiven"} ,
		},
		Actions = {
			Say{Tag = "jon015", String = "Die Minen bringen Metalle wie Iridian und Mondsilber an die Oberfläche! Die Zwerge verteidigen sie allzeit gegen die Urwesen, die immer wieder aus den Bergen herabsteigen!"},
			OfferAnswer{Tag = "jon007PC", String = "Kennt Ihr Euch in diesen Landen aus?", AnswerId = 8},
			OfferAnswer{Tag = "jon018PC", String = "Was habt Ihr da in der Hand?", AnswerId = 18},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 190 , State = StateSolved}) , IsNpcFlagFalse{Name = "TravelsOff"})),
			Negated( IsPlayerFlagFalse{Name = "MosaicGiven"} ),
		},
		Actions = {
			Say{Tag = "jon015", String = "Die Minen bringen Metalle wie Iridian und Mondsilber an die Oberfläche! Die Zwerge verteidigen sie allzeit gegen die Urwesen, die immer wieder aus den Bergen herabsteigen!"},
			OfferAnswer{Tag = "jon007PC", String = "Kennt Ihr Euch in diesen Landen aus?", AnswerId = 8},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jon016", String = "Einst stand dort eine mächtige Feste der ehernen Falken! Sie wachten über den Schlaf der Fial Darg, die tief unter diesem Lande unter dem Bann der Götter schlafen! Zumindest taten sie dies bis zur Konvokation! Wer weiß, was aus ihnen geworden ist!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
			UND(Negated(QuestState{QuestId = 190 , State = StateSolved}) , IsNpcFlagFalse{Name = "TravelsOff"}),
			 IsPlayerFlagFalse{Name = "MosaicGiven"} ,
		},
		Actions = {
			Say{Tag = "jon017", String = "Die Feste wurde im Konvokationskrieg zerstört und ist nun ein schauriger Ort! Von hier aus strömen die Horden der Untoten ins Land! Denn dort befindet sich das einzige Portal nach Wisper, der Stadt des Todes!"},
			OfferAnswer{Tag = "jon003PC", String = "Was hat Euch hierher verschlagen?", AnswerId = 2},
			OfferAnswer{Tag = "jon007PC", String = "Kennt Ihr Euch in diesen Landen aus?", AnswerId = 8},
			OfferAnswer{Tag = "jon018PC", String = "Was habt Ihr da in der Hand?", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			UND(Negated(QuestState{QuestId = 190 , State = StateSolved}) , IsNpcFlagFalse{Name = "TravelsOff"}),
			Negated( IsPlayerFlagFalse{Name = "MosaicGiven"} ),
		},
		Actions = {
			Say{Tag = "jon017", String = "Die Feste wurde im Konvokationskrieg zerstört und ist nun ein schauriger Ort! Von hier aus strömen die Horden der Untoten ins Land! Denn dort befindet sich das einzige Portal nach Wisper, der Stadt des Todes!"},
			OfferAnswer{Tag = "jon003PC", String = "Was hat Euch hierher verschlagen?", AnswerId = 2},
			OfferAnswer{Tag = "jon007PC", String = "Kennt Ihr Euch in diesen Landen aus?", AnswerId = 8},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 190 , State = StateSolved}) , IsNpcFlagFalse{Name = "TravelsOff"})),
			 IsPlayerFlagFalse{Name = "MosaicGiven"} ,
		},
		Actions = {
			Say{Tag = "jon017", String = "Die Feste wurde im Konvokationskrieg zerstört und ist nun ein schauriger Ort! Von hier aus strömen die Horden der Untoten ins Land! Denn dort befindet sich das einzige Portal nach Wisper, der Stadt des Todes!"},
			OfferAnswer{Tag = "jon007PC", String = "Kennt Ihr Euch in diesen Landen aus?", AnswerId = 8},
			OfferAnswer{Tag = "jon018PC", String = "Was habt Ihr da in der Hand?", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 190 , State = StateSolved}) , IsNpcFlagFalse{Name = "TravelsOff"})),
			Negated( IsPlayerFlagFalse{Name = "MosaicGiven"} ),
		},
		Actions = {
			Say{Tag = "jon017", String = "Die Feste wurde im Konvokationskrieg zerstört und ist nun ein schauriger Ort! Von hier aus strömen die Horden der Untoten ins Land! Denn dort befindet sich das einzige Portal nach Wisper, der Stadt des Todes!"},
			OfferAnswer{Tag = "jon007PC", String = "Kennt Ihr Euch in diesen Landen aus?", AnswerId = 8},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jon019", String = "Dieses seltsame Bruchstück hier? Fragt nicht..."},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jon020", String = "Ein Sterbender, dem ich helfen wollte, drückte es mir in die Hand! Er kam aus Wisper, wo die Verdammten herrschen..."},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jon021", String = "Er flüsterte noch, das Bruchstück gehöre zu einem großen Steinbild - dem Mosaik des Todes!"},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jon022", String = "Solange das Bild zerbrochen ist, besteht keine Gefahr! Doch wird das Mosaik wieder zusammengesetzt, dann öffnet sich ein Tor ins Reich der Untoten!"},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jon023", String = "Mehr kann ich Euch auch nicht sagen! Aber wenn es Euch so interessiert... bitte, nehmt das Stück nur an Euch! Ich will es gar nicht haben!"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jon024", String = "Und denkt an meine Warnung! Sollten die Bruchstücke wieder vereint werden, droht große Gefahr!"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			 TransferItem{GiveItem = 3233 , Flag = Give}, SetPlayerFlagTrue{Name = "MosaicGiven"} ,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
			UND(Negated(QuestState{QuestId = 190 , State = StateSolved}) , IsNpcFlagFalse{Name = "TravelsOff"}),
			 IsPlayerFlagFalse{Name = "MosaicGiven"} ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jon003PC", String = "Was hat Euch hierher verschlagen?", AnswerId = 2},
			OfferAnswer{Tag = "jon007PC", String = "Kennt Ihr Euch in diesen Landen aus?", AnswerId = 8},
			OfferAnswer{Tag = "jon018PC", String = "Was habt Ihr da in der Hand?", AnswerId = 18},
		}}

	OnAnswer{25;
		Conditions = {
			UND(Negated(QuestState{QuestId = 190 , State = StateSolved}) , IsNpcFlagFalse{Name = "TravelsOff"}),
			Negated( IsPlayerFlagFalse{Name = "MosaicGiven"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jon003PC", String = "Was hat Euch hierher verschlagen?", AnswerId = 2},
			OfferAnswer{Tag = "jon007PC", String = "Kennt Ihr Euch in diesen Landen aus?", AnswerId = 8},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 190 , State = StateSolved}) , IsNpcFlagFalse{Name = "TravelsOff"})),
			 IsPlayerFlagFalse{Name = "MosaicGiven"} ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jon007PC", String = "Kennt Ihr Euch in diesen Landen aus?", AnswerId = 8},
			OfferAnswer{Tag = "jon018PC", String = "Was habt Ihr da in der Hand?", AnswerId = 18},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(UND(Negated(QuestState{QuestId = 190 , State = StateSolved}) , IsNpcFlagFalse{Name = "TravelsOff"})),
			Negated( IsPlayerFlagFalse{Name = "MosaicGiven"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jon007PC", String = "Kennt Ihr Euch in diesen Landen aus?", AnswerId = 8},
		}}


	EndDefinition()
end