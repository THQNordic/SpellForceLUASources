-->INFO: urias
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 4}
--!EDS ONIDLEGOHOME END

--Dialogsteuerung
--Umschalter
OnToggleEvent
{
OnConditions = {
			IsNpcFlagTrue{Name = "HasMainquest"},
			},
OnActions = {
		SetDialogType{Type = MainQuest}
		},
OffConditions = {
			IsNpcFlagFalse{Name = "HasMainquest"},
			},
OffActions = {
		SetDialogType{Type = SideQuest}
		},
}
--initial
OnOneTimeEvent
{
Conditions = {},
Actions = {
		SetNpcFlagTrue{Name = "HasMainquest"},
		}
}

Despawn
{
Conditions = {
			IsGlobalFlagTrue {Name = "CraighUriasDespawnIcegate"},	
			}
}



--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p7\n4009_urias.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "FlagUriasIcegateKnown"},
		},
		Actions = {
			Say{Tag = "uriasIcegate001", String = "Ich wusste es! Wenn jemand es bis hierher schaffen würde, dann Ihr!"},
			Answer{Tag = "uriasIcegate001PV", String = "Ein düsteres Wiedersehen, Urias! Was ist geschehen?", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagUriasIcegateKnown"}),
			IsNpcFlagFalse{Name = "ArmyAsked"},
			UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"}),
			UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"}),
		},
		Actions = {
			Say{Tag = "uriasIcegate004", String = "Für den Orden!"},
			OfferAnswer{Tag = "uriasIcegate004PC", String = "Wo ist Sartarius?", AnswerId = 5},
			OfferAnswer{Tag = "uriasIcegate008PC", String = "Was habt Ihr über die Eisernen herausgefunden?", AnswerId = 11},
			OfferAnswer{Tag = "uriasIcegate013PC", String = "Was wird nun aus dem Orden?", AnswerId = 18},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagUriasIcegateKnown"}),
			IsNpcFlagFalse{Name = "ArmyAsked"},
			UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"}),
			Negated(UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"})),
		},
		Actions = {
			Say{Tag = "uriasIcegate004", String = "Für den Orden!"},
			OfferAnswer{Tag = "uriasIcegate004PC", String = "Wo ist Sartarius?", AnswerId = 5},
			OfferAnswer{Tag = "uriasIcegate008PC", String = "Was habt Ihr über die Eisernen herausgefunden?", AnswerId = 11},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagUriasIcegateKnown"}),
			IsNpcFlagFalse{Name = "ArmyAsked"},
			Negated(UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"})),
			UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"}),
		},
		Actions = {
			Say{Tag = "uriasIcegate004", String = "Für den Orden!"},
			OfferAnswer{Tag = "uriasIcegate004PC", String = "Wo ist Sartarius?", AnswerId = 5},
			OfferAnswer{Tag = "uriasIcegate013PC", String = "Was wird nun aus dem Orden?", AnswerId = 18},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagUriasIcegateKnown"}),
			IsNpcFlagFalse{Name = "ArmyAsked"},
			Negated(UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"})),
			Negated(UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"})),
		},
		Actions = {
			Say{Tag = "uriasIcegate004", String = "Für den Orden!"},
			OfferAnswer{Tag = "uriasIcegate004PC", String = "Wo ist Sartarius?", AnswerId = 5},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagUriasIcegateKnown"}),
			Negated(IsNpcFlagFalse{Name = "ArmyAsked"}),
			UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"}),
			UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"}),
		},
		Actions = {
			Say{Tag = "uriasIcegate004", String = "Für den Orden!"},
			OfferAnswer{Tag = "uriasIcegate008PC", String = "Was habt Ihr über die Eisernen herausgefunden?", AnswerId = 11},
			OfferAnswer{Tag = "uriasIcegate013PC", String = "Was wird nun aus dem Orden?", AnswerId = 18},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagUriasIcegateKnown"}),
			Negated(IsNpcFlagFalse{Name = "ArmyAsked"}),
			UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"}),
			Negated(UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"})),
		},
		Actions = {
			Say{Tag = "uriasIcegate004", String = "Für den Orden!"},
			OfferAnswer{Tag = "uriasIcegate008PC", String = "Was habt Ihr über die Eisernen herausgefunden?", AnswerId = 11},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagUriasIcegateKnown"}),
			Negated(IsNpcFlagFalse{Name = "ArmyAsked"}),
			Negated(UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"})),
			UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"}),
		},
		Actions = {
			Say{Tag = "uriasIcegate004", String = "Für den Orden!"},
			OfferAnswer{Tag = "uriasIcegate013PC", String = "Was wird nun aus dem Orden?", AnswerId = 18},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagUriasIcegateKnown"}),
			Negated(IsNpcFlagFalse{Name = "ArmyAsked"}),
			Negated(UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"})),
			Negated(UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"})),
		},
		Actions = {
			Say{Tag = "uriasIcegate004", String = "Für den Orden!"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uriasIcegate002", String = "Es war ein Gemetzel! Es gelang uns zwar, ihre Blockade zu zerschlagen! Doch ihr Strom wollte einfach nicht versiegen!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uriasIcegate003", String = "Noch ehe der Tag sich neigte, fielen unsere Reihen! Sie sind alle tot, Runenkrieger! Der Orden ist besiegt..."},
			Answer{Tag = "uriasIcegate003PC", String = "Noch nicht ganz, Urias!", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
			IsNpcFlagFalse{Name = "ArmyAsked"},
			UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"}),
			UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagUriasIcegateKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uriasIcegate004PC", String = "Wo ist Sartarius?", AnswerId = 5},
			OfferAnswer{Tag = "uriasIcegate008PC", String = "Was habt Ihr über die Eisernen herausgefunden?", AnswerId = 11},
			OfferAnswer{Tag = "uriasIcegate013PC", String = "Was wird nun aus dem Orden?", AnswerId = 18},
		}}

	OnAnswer{4;
		Conditions = {
			IsNpcFlagFalse{Name = "ArmyAsked"},
			UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"}),
			Negated(UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagUriasIcegateKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uriasIcegate004PC", String = "Wo ist Sartarius?", AnswerId = 5},
			OfferAnswer{Tag = "uriasIcegate008PC", String = "Was habt Ihr über die Eisernen herausgefunden?", AnswerId = 11},
		}}

	OnAnswer{4;
		Conditions = {
			IsNpcFlagFalse{Name = "ArmyAsked"},
			Negated(UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"})),
			UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagUriasIcegateKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uriasIcegate004PC", String = "Wo ist Sartarius?", AnswerId = 5},
			OfferAnswer{Tag = "uriasIcegate013PC", String = "Was wird nun aus dem Orden?", AnswerId = 18},
		}}

	OnAnswer{4;
		Conditions = {
			IsNpcFlagFalse{Name = "ArmyAsked"},
			Negated(UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"})),
			Negated(UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagUriasIcegateKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uriasIcegate004PC", String = "Wo ist Sartarius?", AnswerId = 5},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "ArmyAsked"}),
			UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"}),
			UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagUriasIcegateKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uriasIcegate008PC", String = "Was habt Ihr über die Eisernen herausgefunden?", AnswerId = 11},
			OfferAnswer{Tag = "uriasIcegate013PC", String = "Was wird nun aus dem Orden?", AnswerId = 18},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "ArmyAsked"}),
			UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"}),
			Negated(UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagUriasIcegateKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uriasIcegate008PC", String = "Was habt Ihr über die Eisernen herausgefunden?", AnswerId = 11},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "ArmyAsked"}),
			Negated(UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"})),
			UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagUriasIcegateKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uriasIcegate013PC", String = "Was wird nun aus dem Orden?", AnswerId = 18},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "ArmyAsked"}),
			Negated(UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"})),
			Negated(UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagUriasIcegateKnown"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uriasIcegate005", String = "Gefangen und verschleppt! Sie haben ihn durch das Portal im Süden gebracht! In die Gottmark..."},
			Answer{Tag = "uriasIcegate005PC", String = "Dann ist das unser nächstes Ziel!", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uriasIcegate006", String = "Sie haben alle außer Sartarius getötet! Irgendetwas steckt dahinter! Das muss eine Falle sein! Ich rieche es förmlich!"},
			Answer{Tag = "uriasIcegate006PC", String = "Falle oder nicht, Sartarius braucht unsere Hilfe! Und Ihr seid ja auch noch am Leben!", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uriasIcegate007", String = "Nur durch die Hilfe dieses Dunkelelfen! Sonst wäre ich jetzt ebenso tot wie der Rest meiner Leute!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uriasIcegate008", String = "Wenn Ihr wirklich in die Gottmark wollt, dann sprecht mit ihm! Er kennt dieses Land wahrhaftig besser als ich!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "ArmyAsked"} , SetGlobalFlagTrue{Name = "IcegateDarkElfOn"} , 
					QuestBegin{QuestId = 521} , QuestSolve{QuestId = 520},
					SetRewardFlagTrue{ Name = "EndeDesOrdens1Erreichen"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse{Name = "ArmyAsked"},
			UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"}),
			UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uriasIcegate004PC", String = "Wo ist Sartarius?", AnswerId = 5},
			OfferAnswer{Tag = "uriasIcegate008PC", String = "Was habt Ihr über die Eisernen herausgefunden?", AnswerId = 11},
			OfferAnswer{Tag = "uriasIcegate013PC", String = "Was wird nun aus dem Orden?", AnswerId = 18},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse{Name = "ArmyAsked"},
			UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"}),
			Negated(UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uriasIcegate004PC", String = "Wo ist Sartarius?", AnswerId = 5},
			OfferAnswer{Tag = "uriasIcegate008PC", String = "Was habt Ihr über die Eisernen herausgefunden?", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse{Name = "ArmyAsked"},
			Negated(UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"})),
			UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uriasIcegate004PC", String = "Wo ist Sartarius?", AnswerId = 5},
			OfferAnswer{Tag = "uriasIcegate013PC", String = "Was wird nun aus dem Orden?", AnswerId = 18},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse{Name = "ArmyAsked"},
			Negated(UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"})),
			Negated(UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uriasIcegate004PC", String = "Wo ist Sartarius?", AnswerId = 5},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "ArmyAsked"}),
			UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"}),
			UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uriasIcegate008PC", String = "Was habt Ihr über die Eisernen herausgefunden?", AnswerId = 11},
			OfferAnswer{Tag = "uriasIcegate013PC", String = "Was wird nun aus dem Orden?", AnswerId = 18},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "ArmyAsked"}),
			UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"}),
			Negated(UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uriasIcegate008PC", String = "Was habt Ihr über die Eisernen herausgefunden?", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "ArmyAsked"}),
			Negated(UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"})),
			UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uriasIcegate013PC", String = "Was wird nun aus dem Orden?", AnswerId = 18},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "ArmyAsked"}),
			Negated(UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"})),
			Negated(UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uriasIcegate009", String = "Sie sind tödliche Nahkämpfer! Einige von ihnen schleudern auch Magie! Die Bolzen unserer Armbrüste schienen ihnen nicht viel anhaben zu können!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uriasIcegate010", String = "Und nehmt Euch in Acht vor ihren turmartigen Bauten! Sie schleudern tödliche Blitze, die selbst einen gestandenen Krieger mit einem Schlag niederwerfen!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uriasIcegate011", String = "Sartarius glaubt, dass sie aus Urgath gekommen sind! Wahrscheinlich durch das große Portal im Nachtflüstertal!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uriasIcegate012", String = "Was sie planen? Bei Zarrach, ich weiß es nicht! Sie metzelten uns nieder und nahmen Sartarius gefangen! Doch merkwürdigerweise drangen sie nicht weiter vor..."},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uriasIcegate013", String = "Sie scheinen auf etwas zu warten... Vielleicht auf Euch, mein Freund!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "TacticsAsked"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
			IsNpcFlagFalse{Name = "ArmyAsked"},
			UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"}),
			UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uriasIcegate004PC", String = "Wo ist Sartarius?", AnswerId = 5},
			OfferAnswer{Tag = "uriasIcegate008PC", String = "Was habt Ihr über die Eisernen herausgefunden?", AnswerId = 11},
			OfferAnswer{Tag = "uriasIcegate013PC", String = "Was wird nun aus dem Orden?", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			IsNpcFlagFalse{Name = "ArmyAsked"},
			UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"}),
			Negated(UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uriasIcegate004PC", String = "Wo ist Sartarius?", AnswerId = 5},
			OfferAnswer{Tag = "uriasIcegate008PC", String = "Was habt Ihr über die Eisernen herausgefunden?", AnswerId = 11},
		}}

	OnAnswer{17;
		Conditions = {
			IsNpcFlagFalse{Name = "ArmyAsked"},
			Negated(UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"})),
			UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uriasIcegate004PC", String = "Wo ist Sartarius?", AnswerId = 5},
			OfferAnswer{Tag = "uriasIcegate013PC", String = "Was wird nun aus dem Orden?", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			IsNpcFlagFalse{Name = "ArmyAsked"},
			Negated(UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"})),
			Negated(UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uriasIcegate004PC", String = "Wo ist Sartarius?", AnswerId = 5},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "ArmyAsked"}),
			UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"}),
			UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uriasIcegate008PC", String = "Was habt Ihr über die Eisernen herausgefunden?", AnswerId = 11},
			OfferAnswer{Tag = "uriasIcegate013PC", String = "Was wird nun aus dem Orden?", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "ArmyAsked"}),
			UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"}),
			Negated(UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uriasIcegate008PC", String = "Was habt Ihr über die Eisernen herausgefunden?", AnswerId = 11},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "ArmyAsked"}),
			Negated(UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"})),
			UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uriasIcegate013PC", String = "Was wird nun aus dem Orden?", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "ArmyAsked"}),
			Negated(UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"})),
			Negated(UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uriasIcegate014", String = "Ihr und ich - das ist alles, was vom Orden noch übrig ist! Es liegt deshalb an uns, was aus ihm wird!"},
			Answer{Tag = "uriasIcegate014PC", String = "Dann lasst uns diese Schlacht zu Ende führen!", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uriasIcegate015", String = "Habt Ihr den Phönix?"},
			Answer{Tag = "uriasIcegate015PC", String = "Aye!", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uriasIcegate016", String = "Dann gibt es noch Hoffnung! Gut! Lasst es uns zu Ende bringen!"},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "OrderAsked"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
			IsNpcFlagFalse{Name = "ArmyAsked"},
			UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"}),
			UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uriasIcegate004PC", String = "Wo ist Sartarius?", AnswerId = 5},
			OfferAnswer{Tag = "uriasIcegate008PC", String = "Was habt Ihr über die Eisernen herausgefunden?", AnswerId = 11},
			OfferAnswer{Tag = "uriasIcegate013PC", String = "Was wird nun aus dem Orden?", AnswerId = 18},
		}}

	OnAnswer{22;
		Conditions = {
			IsNpcFlagFalse{Name = "ArmyAsked"},
			UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"}),
			Negated(UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uriasIcegate004PC", String = "Wo ist Sartarius?", AnswerId = 5},
			OfferAnswer{Tag = "uriasIcegate008PC", String = "Was habt Ihr über die Eisernen herausgefunden?", AnswerId = 11},
		}}

	OnAnswer{22;
		Conditions = {
			IsNpcFlagFalse{Name = "ArmyAsked"},
			Negated(UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"})),
			UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uriasIcegate004PC", String = "Wo ist Sartarius?", AnswerId = 5},
			OfferAnswer{Tag = "uriasIcegate013PC", String = "Was wird nun aus dem Orden?", AnswerId = 18},
		}}

	OnAnswer{22;
		Conditions = {
			IsNpcFlagFalse{Name = "ArmyAsked"},
			Negated(UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"})),
			Negated(UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uriasIcegate004PC", String = "Wo ist Sartarius?", AnswerId = 5},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "ArmyAsked"}),
			UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"}),
			UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uriasIcegate008PC", String = "Was habt Ihr über die Eisernen herausgefunden?", AnswerId = 11},
			OfferAnswer{Tag = "uriasIcegate013PC", String = "Was wird nun aus dem Orden?", AnswerId = 18},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "ArmyAsked"}),
			UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"}),
			Negated(UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uriasIcegate008PC", String = "Was habt Ihr über die Eisernen herausgefunden?", AnswerId = 11},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "ArmyAsked"}),
			Negated(UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"})),
			UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uriasIcegate013PC", String = "Was wird nun aus dem Orden?", AnswerId = 18},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "ArmyAsked"}),
			Negated(UND(IsNpcFlagFalse{Name = "TacticsAsked"} , IsGlobalFlagTrue{Name = "IcegateDarkElfOn"})),
			Negated(UND(IsNpcFlagTrue{Name = "ArmyAsked"} , IsNpcFlagFalse{Name = "OrderAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end