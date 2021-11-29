-->INFO: Swansong
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 1}
--!EDS ONIDLEGOHOME END


--!EDS RESPAWN BEGIN
Respawn{WaitTime=3}
--!EDS RESPAWN END


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




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p6\n1986_Swansong.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagSwansongKnown"},
		},
		Actions = {
			Say{Tag = "swansong001", String = "Was führt Euch hierher?"},
			Answer{Tag = "swansong001PC", String = "Eine Nachricht für Rohen! Meister Sartarius sendet mich mit eiligen Dokumenten und einer Warnung!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSwansongKnown"}),
			QuestState{QuestId = 102 , State = StateActive},
			UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"}),
			UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"}),
		},
		Actions = {
			Say{Tag = "swansong005", String = "Aonirs Licht!"},
			OfferAnswer{Tag = "swansong005PC", String = "Wo ist Rohen jetzt?", AnswerId = 4},
			OfferAnswer{Tag = "swansong009PC", String = "Beginnt Euren Angriff!", AnswerId = 10},
			OfferAnswer{Tag = "swansong011PC", String = "Meister Rohen ist tot!", AnswerId = 15},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSwansongKnown"}),
			QuestState{QuestId = 102 , State = StateActive},
			UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"})),
		},
		Actions = {
			Say{Tag = "swansong005", String = "Aonirs Licht!"},
			OfferAnswer{Tag = "swansong005PC", String = "Wo ist Rohen jetzt?", AnswerId = 4},
			OfferAnswer{Tag = "swansong009PC", String = "Beginnt Euren Angriff!", AnswerId = 10},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSwansongKnown"}),
			QuestState{QuestId = 102 , State = StateActive},
			Negated(UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"})),
			UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"}),
		},
		Actions = {
			Say{Tag = "swansong005", String = "Aonirs Licht!"},
			OfferAnswer{Tag = "swansong005PC", String = "Wo ist Rohen jetzt?", AnswerId = 4},
			OfferAnswer{Tag = "swansong011PC", String = "Meister Rohen ist tot!", AnswerId = 15},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSwansongKnown"}),
			QuestState{QuestId = 102 , State = StateActive},
			Negated(UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"})),
		},
		Actions = {
			Say{Tag = "swansong005", String = "Aonirs Licht!"},
			OfferAnswer{Tag = "swansong005PC", String = "Wo ist Rohen jetzt?", AnswerId = 4},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSwansongKnown"}),
			Negated(QuestState{QuestId = 102 , State = StateActive}),
			UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"}),
			UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"}),
		},
		Actions = {
			Say{Tag = "swansong005", String = "Aonirs Licht!"},
			OfferAnswer{Tag = "swansong009PC", String = "Beginnt Euren Angriff!", AnswerId = 10},
			OfferAnswer{Tag = "swansong011PC", String = "Meister Rohen ist tot!", AnswerId = 15},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSwansongKnown"}),
			Negated(QuestState{QuestId = 102 , State = StateActive}),
			UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"})),
		},
		Actions = {
			Say{Tag = "swansong005", String = "Aonirs Licht!"},
			OfferAnswer{Tag = "swansong009PC", String = "Beginnt Euren Angriff!", AnswerId = 10},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSwansongKnown"}),
			Negated(QuestState{QuestId = 102 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"})),
			UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"}),
		},
		Actions = {
			Say{Tag = "swansong005", String = "Aonirs Licht!"},
			OfferAnswer{Tag = "swansong011PC", String = "Meister Rohen ist tot!", AnswerId = 15},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSwansongKnown"}),
			Negated(QuestState{QuestId = 102 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"})),
		},
		Actions = {
			Say{Tag = "swansong005", String = "Aonirs Licht!"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "swansong002", String = "Und Ihr habt Euch bis hierher durchgeschlagen? Kein schlechtes Stück Arbeit! Seit Tagen marschieren die Horden der Faust nach Westen!"},
			Answer{Tag = "swansong002PC", String = "Das habe ich gemerkt! Wie, bei Aonirs Licht, habt Ihr es geschafft, Euch hier zu halten?", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "swansong003", String = "Mit dem Herzen, mein Freund! Und dem Stahl! Zugegeben, sie haben sich bislang nicht allzu viel Mühe mit uns gemacht! Sie wissen, dass wir ihnen nicht entkommen können! Momentan sind sie mit Wichtigerem beschäftigt..."},
			Answer{Tag = "swansong003PC", String = "Rohen!", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 102 , State = StateActive},
			UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"}),
			UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSwansongKnown"},
			Say{Tag = "swansong004", String = "Aye!"},
			OfferAnswer{Tag = "swansong005PC", String = "Wo ist Rohen jetzt?", AnswerId = 4},
			OfferAnswer{Tag = "swansong009PC", String = "Beginnt Euren Angriff!", AnswerId = 10},
			OfferAnswer{Tag = "swansong011PC", String = "Meister Rohen ist tot!", AnswerId = 15},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 102 , State = StateActive},
			UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSwansongKnown"},
			Say{Tag = "swansong004", String = "Aye!"},
			OfferAnswer{Tag = "swansong005PC", String = "Wo ist Rohen jetzt?", AnswerId = 4},
			OfferAnswer{Tag = "swansong009PC", String = "Beginnt Euren Angriff!", AnswerId = 10},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 102 , State = StateActive},
			Negated(UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"})),
			UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSwansongKnown"},
			Say{Tag = "swansong004", String = "Aye!"},
			OfferAnswer{Tag = "swansong005PC", String = "Wo ist Rohen jetzt?", AnswerId = 4},
			OfferAnswer{Tag = "swansong011PC", String = "Meister Rohen ist tot!", AnswerId = 15},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 102 , State = StateActive},
			Negated(UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSwansongKnown"},
			Say{Tag = "swansong004", String = "Aye!"},
			OfferAnswer{Tag = "swansong005PC", String = "Wo ist Rohen jetzt?", AnswerId = 4},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 102 , State = StateActive}),
			UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"}),
			UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSwansongKnown"},
			Say{Tag = "swansong004", String = "Aye!"},
			OfferAnswer{Tag = "swansong009PC", String = "Beginnt Euren Angriff!", AnswerId = 10},
			OfferAnswer{Tag = "swansong011PC", String = "Meister Rohen ist tot!", AnswerId = 15},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 102 , State = StateActive}),
			UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSwansongKnown"},
			Say{Tag = "swansong004", String = "Aye!"},
			OfferAnswer{Tag = "swansong009PC", String = "Beginnt Euren Angriff!", AnswerId = 10},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 102 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"})),
			UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSwansongKnown"},
			Say{Tag = "swansong004", String = "Aye!"},
			OfferAnswer{Tag = "swansong011PC", String = "Meister Rohen ist tot!", AnswerId = 15},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 102 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSwansongKnown"},
			Say{Tag = "swansong004", String = "Aye!"},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "swansong006", String = "Irgendwo auf der anderen Seite des Passes! Wir können nur warten, bis er wieder zurückkehrt! Es ist völlig unmöglich, zu ihm durchzubrechen!"},
			Answer{Tag = "swansong006PC", String = "Nicht völlig unmöglich!", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "swansong007", String = "Ihr nehmt Eure Aufgabe wahrhaftig ernst! Falls Ihr wirklich vorhabt, gegen die Faust zu marschieren, werdet Ihr unsere Hilfe brauchen!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "swansong008", String = "Ich nehme an, Ihr benötigt eines dieser Monumente! Wenn Ihr dem Weg nach Osten folgt, werdet Ihr auf eines stoßen! Allerdings streifen dort Plänkler der Faust herum!"},
			Answer{Tag = "swansong008PC", String = "Sendet einige Ritter als Ablenkung nach Osten! Das sollte mir genügend Zeit verschaffen, das Monument zu erreichen!", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "swansong009", String = "Aye, so soll es sein! Gebt Nachricht, wenn Ihr bereit seid! Dann sollt Ihr Eure Ablenkung erhalten!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 102} , QuestBegin{QuestId = 103} , QuestBegin{QuestId = 348},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 102 , State = StateActive},
			UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"}),
			UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "swansong005PC", String = "Wo ist Rohen jetzt?", AnswerId = 4},
			OfferAnswer{Tag = "swansong009PC", String = "Beginnt Euren Angriff!", AnswerId = 10},
			OfferAnswer{Tag = "swansong011PC", String = "Meister Rohen ist tot!", AnswerId = 15},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 102 , State = StateActive},
			UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "swansong005PC", String = "Wo ist Rohen jetzt?", AnswerId = 4},
			OfferAnswer{Tag = "swansong009PC", String = "Beginnt Euren Angriff!", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 102 , State = StateActive},
			Negated(UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"})),
			UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "swansong005PC", String = "Wo ist Rohen jetzt?", AnswerId = 4},
			OfferAnswer{Tag = "swansong011PC", String = "Meister Rohen ist tot!", AnswerId = 15},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 102 , State = StateActive},
			Negated(UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "swansong005PC", String = "Wo ist Rohen jetzt?", AnswerId = 4},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 102 , State = StateActive}),
			UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"}),
			UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "swansong009PC", String = "Beginnt Euren Angriff!", AnswerId = 10},
			OfferAnswer{Tag = "swansong011PC", String = "Meister Rohen ist tot!", AnswerId = 15},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 102 , State = StateActive}),
			UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "swansong009PC", String = "Beginnt Euren Angriff!", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 102 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"})),
			UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "swansong011PC", String = "Meister Rohen ist tot!", AnswerId = 15},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 102 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q103TroopsNotReady"}),
		},
		Actions = {
			Say{Tag = "swansong011", String = "Meine Männer werden Brannigans Plünderer angreifen und sie ablenken! Ihr müsst Euch beeilen! Sichert das Monument so schnell als irgend möglich!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{10;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q103TroopsNotReady"},
		},
		Actions = {
			Say{Tag = "swansong010", String = "Gebt meinen Leuten noch etwas Zeit! Wir müssen uns für die nächste Attacke erst wieder sammeln!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 102 , State = StateActive},
			UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"}),
			UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "swansong005PC", String = "Wo ist Rohen jetzt?", AnswerId = 4},
			OfferAnswer{Tag = "swansong009PC", String = "Beginnt Euren Angriff!", AnswerId = 10},
			OfferAnswer{Tag = "swansong011PC", String = "Meister Rohen ist tot!", AnswerId = 15},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 102 , State = StateActive},
			UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "swansong005PC", String = "Wo ist Rohen jetzt?", AnswerId = 4},
			OfferAnswer{Tag = "swansong009PC", String = "Beginnt Euren Angriff!", AnswerId = 10},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 102 , State = StateActive},
			Negated(UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"})),
			UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "swansong005PC", String = "Wo ist Rohen jetzt?", AnswerId = 4},
			OfferAnswer{Tag = "swansong011PC", String = "Meister Rohen ist tot!", AnswerId = 15},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 102 , State = StateActive},
			Negated(UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "swansong005PC", String = "Wo ist Rohen jetzt?", AnswerId = 4},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 102 , State = StateActive}),
			UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"}),
			UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "swansong009PC", String = "Beginnt Euren Angriff!", AnswerId = 10},
			OfferAnswer{Tag = "swansong011PC", String = "Meister Rohen ist tot!", AnswerId = 15},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 102 , State = StateActive}),
			UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "swansong009PC", String = "Beginnt Euren Angriff!", AnswerId = 10},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 102 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"})),
			UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "swansong011PC", String = "Meister Rohen ist tot!", AnswerId = 15},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 102 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q103AttackCommandGiven"} , 
					SetGlobalFlagTrue{Name = "Q103TroopsNotReady"},
			SetPlayerFlagTrue{Name = "Q103RewardForTroops"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 102 , State = StateActive},
			UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"}),
			UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "swansong005PC", String = "Wo ist Rohen jetzt?", AnswerId = 4},
			OfferAnswer{Tag = "swansong009PC", String = "Beginnt Euren Angriff!", AnswerId = 10},
			OfferAnswer{Tag = "swansong011PC", String = "Meister Rohen ist tot!", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 102 , State = StateActive},
			UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "swansong005PC", String = "Wo ist Rohen jetzt?", AnswerId = 4},
			OfferAnswer{Tag = "swansong009PC", String = "Beginnt Euren Angriff!", AnswerId = 10},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 102 , State = StateActive},
			Negated(UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"})),
			UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "swansong005PC", String = "Wo ist Rohen jetzt?", AnswerId = 4},
			OfferAnswer{Tag = "swansong011PC", String = "Meister Rohen ist tot!", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 102 , State = StateActive},
			Negated(UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "swansong005PC", String = "Wo ist Rohen jetzt?", AnswerId = 4},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 102 , State = StateActive}),
			UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"}),
			UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "swansong009PC", String = "Beginnt Euren Angriff!", AnswerId = 10},
			OfferAnswer{Tag = "swansong011PC", String = "Meister Rohen ist tot!", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 102 , State = StateActive}),
			UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "swansong009PC", String = "Beginnt Euren Angriff!", AnswerId = 10},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 102 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"})),
			UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "swansong011PC", String = "Meister Rohen ist tot!", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 102 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "swansong012", String = "Ihr Götter! Mögen uns die Wächter schützen! Wir haben versagt!"},
			Answer{Tag = "swansong012PC", String = "Nicht Ihr habt versagt, Ritter! Meine Warnung war sein Todesurteil!", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "swansong013", String = "Ihr habt nur Euren Auftrag ausgeführt! Was geschehen ist, ist geschehen! Bringt die Kunde nach Graufurt! Wir werden Euch folgen, sobald die Verwundeten versorgt sind!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "RohenSaid"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 102 , State = StateActive},
			UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"}),
			UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "swansong005PC", String = "Wo ist Rohen jetzt?", AnswerId = 4},
			OfferAnswer{Tag = "swansong009PC", String = "Beginnt Euren Angriff!", AnswerId = 10},
			OfferAnswer{Tag = "swansong011PC", String = "Meister Rohen ist tot!", AnswerId = 15},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 102 , State = StateActive},
			UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "swansong005PC", String = "Wo ist Rohen jetzt?", AnswerId = 4},
			OfferAnswer{Tag = "swansong009PC", String = "Beginnt Euren Angriff!", AnswerId = 10},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 102 , State = StateActive},
			Negated(UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"})),
			UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "swansong005PC", String = "Wo ist Rohen jetzt?", AnswerId = 4},
			OfferAnswer{Tag = "swansong011PC", String = "Meister Rohen ist tot!", AnswerId = 15},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 102 , State = StateActive},
			Negated(UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "swansong005PC", String = "Wo ist Rohen jetzt?", AnswerId = 4},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 102 , State = StateActive}),
			UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"}),
			UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "swansong009PC", String = "Beginnt Euren Angriff!", AnswerId = 10},
			OfferAnswer{Tag = "swansong011PC", String = "Meister Rohen ist tot!", AnswerId = 15},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 102 , State = StateActive}),
			UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"}),
			Negated(UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "swansong009PC", String = "Beginnt Euren Angriff!", AnswerId = 10},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 102 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"})),
			UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "swansong011PC", String = "Meister Rohen ist tot!", AnswerId = 15},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 102 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 103 , State = StateActive} , IsGlobalFlagFalse{Name = "Q103TroopsNotReady"})),
			Negated(UND(QuestState{QuestId = 111 , State = StateActive} , IsNpcFlagFalse{Name = "RohenSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end