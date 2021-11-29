-->INFO: TotemMugwar
-->INFO: _TotemMugwar
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P105\n7202_TotemMugwar.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "totemmugwar105_001", String = "(Dies scheint die Statue einer primitiven Gottheit zu sein. Opfergaben verraten, dass sie von den Trollen angebetet wird.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "totemmugwar105_002", String = "(In den Rücken der Statue ist ein Trichter eingelassen.)"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "totemmugwar105_003PC", String = "(Durch den Trichter sprechen)", AnswerId = 3},
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
			Negated(IsGlobalFlagFalse{ Name = "P105_TrollsNightFever"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{4;
		Conditions = {
			IsGlobalFlagFalse{ Name = "P105_TrollsNightFever"},
		},
		Actions = {
			Say{Tag = "totemmugwar105_004", String = "(Das Lager ist leer. Niemand würde die Worte jetzt hören können.)"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsGlobalFlagTrue{ Name = "P105_TrollsWorkingForMugwar"}),
		},
		Actions = {
			Say{Tag = "totemmugwar105_006", String = "(Welchen Befehl sollen die Trolle erhalten?)"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{6;
		Conditions = {
			IsGlobalFlagTrue{ Name = "P105_TrollsWorkingForMugwar"},
		},
		Actions = {
			Say{Tag = "totemmugwar105_005", String = "(Die Trolle erhielten bereits eine Aufgabe, die sie noch nicht erfüllt haben.)"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{8;
		Conditions = {
			UND
							(
							FigureAlive{NpcId = 7231},
							FigureAlive{NpcId = 7205}
							),
			UND(
									FigureAlive{NpcId = 7205},
								  	IsPlayerFlagFalse{Name = "P105_GotMightyTrollItem"}
								  	),
			IsGlobalFlagFalse{ Name = "P105_TrollsClearedEast"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "totemmugwar105_007PC", String = "(Die Trolle gegen die Wölfe schicken)", AnswerId = 9},
			OfferAnswer{Tag = "totemmugwar105_010PC", String = "(Von den Trollen einen Gegenstand fordern.)", AnswerId = 13},
			OfferAnswer{Tag = "totemmugwar105_012PC", String = "(Die Trolle die Gegner in Richtung Osten angreifen lassen.)", AnswerId = 16},
			OfferAnswer{Tag = "totemmugwar105_015PC", String = "(Die Trolle in ihren Untergang schicken.)", AnswerId = 19},
		}}

	OnAnswer{8;
		Conditions = {
			UND
							(
							FigureAlive{NpcId = 7231},
							FigureAlive{NpcId = 7205}
							),
			UND(
									FigureAlive{NpcId = 7205},
								  	IsPlayerFlagFalse{Name = "P105_GotMightyTrollItem"}
								  	),
			Negated(IsGlobalFlagFalse{ Name = "P105_TrollsClearedEast"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "totemmugwar105_007PC", String = "(Die Trolle gegen die Wölfe schicken)", AnswerId = 9},
			OfferAnswer{Tag = "totemmugwar105_010PC", String = "(Von den Trollen einen Gegenstand fordern.)", AnswerId = 13},
			OfferAnswer{Tag = "totemmugwar105_015PC", String = "(Die Trolle in ihren Untergang schicken.)", AnswerId = 19},
		}}

	OnAnswer{8;
		Conditions = {
			UND
							(
							FigureAlive{NpcId = 7231},
							FigureAlive{NpcId = 7205}
							),
			Negated(UND(
									FigureAlive{NpcId = 7205},
								  	IsPlayerFlagFalse{Name = "P105_GotMightyTrollItem"}
								  	)),
			IsGlobalFlagFalse{ Name = "P105_TrollsClearedEast"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "totemmugwar105_007PC", String = "(Die Trolle gegen die Wölfe schicken)", AnswerId = 9},
			OfferAnswer{Tag = "totemmugwar105_012PC", String = "(Die Trolle die Gegner in Richtung Osten angreifen lassen.)", AnswerId = 16},
			OfferAnswer{Tag = "totemmugwar105_015PC", String = "(Die Trolle in ihren Untergang schicken.)", AnswerId = 19},
		}}

	OnAnswer{8;
		Conditions = {
			UND
							(
							FigureAlive{NpcId = 7231},
							FigureAlive{NpcId = 7205}
							),
			Negated(UND(
									FigureAlive{NpcId = 7205},
								  	IsPlayerFlagFalse{Name = "P105_GotMightyTrollItem"}
								  	)),
			Negated(IsGlobalFlagFalse{ Name = "P105_TrollsClearedEast"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "totemmugwar105_007PC", String = "(Die Trolle gegen die Wölfe schicken)", AnswerId = 9},
			OfferAnswer{Tag = "totemmugwar105_015PC", String = "(Die Trolle in ihren Untergang schicken.)", AnswerId = 19},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND
							(
							FigureAlive{NpcId = 7231},
							FigureAlive{NpcId = 7205}
							)),
			UND(
									FigureAlive{NpcId = 7205},
								  	IsPlayerFlagFalse{Name = "P105_GotMightyTrollItem"}
								  	),
			IsGlobalFlagFalse{ Name = "P105_TrollsClearedEast"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "totemmugwar105_010PC", String = "(Von den Trollen einen Gegenstand fordern.)", AnswerId = 13},
			OfferAnswer{Tag = "totemmugwar105_012PC", String = "(Die Trolle die Gegner in Richtung Osten angreifen lassen.)", AnswerId = 16},
			OfferAnswer{Tag = "totemmugwar105_015PC", String = "(Die Trolle in ihren Untergang schicken.)", AnswerId = 19},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND
							(
							FigureAlive{NpcId = 7231},
							FigureAlive{NpcId = 7205}
							)),
			UND(
									FigureAlive{NpcId = 7205},
								  	IsPlayerFlagFalse{Name = "P105_GotMightyTrollItem"}
								  	),
			Negated(IsGlobalFlagFalse{ Name = "P105_TrollsClearedEast"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "totemmugwar105_010PC", String = "(Von den Trollen einen Gegenstand fordern.)", AnswerId = 13},
			OfferAnswer{Tag = "totemmugwar105_015PC", String = "(Die Trolle in ihren Untergang schicken.)", AnswerId = 19},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND
							(
							FigureAlive{NpcId = 7231},
							FigureAlive{NpcId = 7205}
							)),
			Negated(UND(
									FigureAlive{NpcId = 7205},
								  	IsPlayerFlagFalse{Name = "P105_GotMightyTrollItem"}
								  	)),
			IsGlobalFlagFalse{ Name = "P105_TrollsClearedEast"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "totemmugwar105_012PC", String = "(Die Trolle die Gegner in Richtung Osten angreifen lassen.)", AnswerId = 16},
			OfferAnswer{Tag = "totemmugwar105_015PC", String = "(Die Trolle in ihren Untergang schicken.)", AnswerId = 19},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND
							(
							FigureAlive{NpcId = 7231},
							FigureAlive{NpcId = 7205}
							)),
			Negated(UND(
									FigureAlive{NpcId = 7205},
								  	IsPlayerFlagFalse{Name = "P105_GotMightyTrollItem"}
								  	)),
			Negated(IsGlobalFlagFalse{ Name = "P105_TrollsClearedEast"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "totemmugwar105_015PC", String = "(Die Trolle in ihren Untergang schicken.)", AnswerId = 19},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "totemmugwar105_008PC", String = "Hört mich Krieger! Ich gebiete Euch, mir ein weißes Wolfsfell darzubringen!", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "totemmugwar105_009PC", String = "Es soll das Fell des größten weißen Wolfes sein, der in diesen Bergen lebt!", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{ Name = "P105_TrollsWorkingForMugwar"},
						IncreaseGlobalCounter{Name = "TogoKillWolf"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "totemmugwar105_011PC", String = "Hört mich Krieger! Ich gebiete Euch, mir ein mächtiges Artefakt darzubringen!", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{ Name = "P105_TrollsWorkingForMugwar"},
					 SetGlobalFlagTrue{Name = "P105_TrollsGiveMightyItem"},
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
			Answer{Tag = "totemmugwar105_013PC", String = "Hört mich Krieger! Der Ostberg ist mir ein heiliger Ort!", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{ Name = "P105_TrollsWorkingForMugwar"},
							  SetGlobalFlagTrue{Name = "P105_TrollsGoToPortal"},
							  SetGlobalFlagTrue{ Name = "P105_TrollsClearedEast"},
			Say{Tag = "", String = ""},
			Answer{Tag = "totemmugwar105_014PC", String = "Die Kreaturen dort entweihen ihn! Macht sie nieder! Ich gebiete es!", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "totemmugwar105_016PC", String = "Hört mich Krieger! Die Elfen entweihen mein Land!", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{ Name = "P105_TrollsWorkingForMugwar"},
							SetGlobalFlagTrue{Name = "P105_TrollsGoToElfMassacre"},
			Say{Tag = "", String = ""},
			Answer{Tag = "totemmugwar105_017PC", String = "Sie sind mächtige Gegner, aber mit meinem Segen werdet ihr siegreich bleiben! Geht hin und vernichtet sie!", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end