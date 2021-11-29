-->INFO: SergEinar
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

PlatformInitAction( SetNpcFlagFalse{Name = "EinarToggelSimul"} )

OnDeadPlayerGoHome
{
	X = 159, Y = 158, Direction = NorthEast, KeepFollowing = FALSE ,
	Conditions = { IsGlobalFlagFalse{Name = "Q18EinarToPortalFinal"} },
	Actions = { 
		SetGlobalFlagFalse{Name = "Q18EinarFollow"},
		SetGlobalFlagTrue{Name = "Q18EinarDied"},
		EnableDialog{NpcId = self},
		SetNpcFlagFalse{Name = "EinarToggelSimul"},
	},
	HomeActions = { 
	},
}

--Idle f�r Bindstone
OnIdleGoHome{X = 159, Y = 158, Direction = NorthEast , 
Conditions = {
	IsGlobalFlagFalse{Name = "Q18EinarFollow"} , 
	IsGlobalFlagFalse{Name = "Q18EinarToPortal"} , 
	IsGlobalFlagFalse{Name = "Q18EinarToPortalFinal"}
	},
}

--Idle f�r Portal Endsatz
OnIdleGoHome{X = 442, Y = 245, Direction = North , 
Conditions = {
	IsGlobalFlagFalse{Name = "Q18EinarFollow"} ,
	QuestState{QuestId = 22 , State = StateActive}
	},
Actions = {
	SetGlobalFlagFalse{Name = "Q18EinarDied"},
	SetNpcFlagFalse{Name = "DeadPlayerGoHome"},
	},
}
--Idle f�r Portal
OnIdleGoHome{X = 461, Y = 236, Direction = North , 
Conditions = {IsGlobalFlagTrue{Name = "Q18EinarToPortalFinalGo"}}
}


Despawn
{
Conditions = {
			IsGlobalFlagTrue{Name = "Q18EinarToPortalFinal"},
			FigureInRange{X = 461 , Y = 236 , NpcId = 1362 , Range = 1}
			}
}

--Toggle Simulation
--on
OnEvent
{
Conditions = {
				IsGlobalFlagTrue{Name = "Q18EinarFollow"},
				IsNpcFlagFalse{Name = "EinarToggelSimul" , UpdateInterval = 10},
				FigureJob{Job = JobIdle , NpcId = self},
				IsGlobalFlagFalse{Name = "GDS_PlayerIsTalking", UpdateInterval = 10},
				FigureAlive{NpcId = Avatar},
				},
Actions = 	{
				-- ist safe, da automatisch bei non-aggro und dem Q18EinarFollow flag follow wieder aktiv wird
				Follow{Target = Avatar , NpcId = self},
				SetNpcFlagTrue{Name = "EinarToggelSimul"},
				}
}
--off
OnEvent
{
Conditions = {
				IsNpcFlagTrue{Name = "EinarToggelSimul" , UpdateInterval = 10},
				FigureHasAggro{NpcId = self , UpdateInterval = 10},
				IsGlobalFlagFalse{Name = "GDS_PlayerIsTalking", UpdateInterval = 10},
				FigureAlive{NpcId = Avatar},
				},		
Actions = 	{
				StopFollow{Target = Avatar , NpcId = self},
				SetNpcFlagFalse{Name = "EinarToggelSimul"},
				}
}

rem = [[
Respawn
{
WaitTime = 10, 
Conditions = {IsGlobalFlagFalse{Name = "Q18EinarToPortalFinal"}},
DeathActions = {
				SetGlobalFlagFalse{Name = "Q18EinarFollow"},
				SetGlobalFlagTrue{Name = "Q18EinarDied"},
				EnableDialog{NpcId = self},
				SetNpcFlagFalse{Name = "EinarToggelSimul"},
				} 
}
]]

-- Dialog an/aus HQ
OnToggleEvent
{
OnConditions =	{
		IsGlobalFlagTrue{Name = "Q23HQDone"},
		},
OnActions =	{
		EnableDialog{NpcId = self},
		},
OffConditions =	{
		IsGlobalFlagFalse{Name = "Q23HQDone"},
		IsPlayerFlagFalse{Name = "Q453PlayerGotFirstHead"},
		IsPlayerFlagFalse{Name = "Q453PlayerGotAllHeads"},
		Negated(QuestState{QuestId = 22 , State = StateActive}),
		},
OffActions =	{
		RemoveDialog{NpcId = self},
		},
}
---Dialog Ende an/aus
OnToggleEvent
{
OnConditions =	{
		QuestState{QuestId = 22 , State = StateActive},
		},
OnActions =	{
		EnableDialog{NpcId = self},
		SetGlobalFlagFalse{Name = "Q18EinarFollow"},
		SetGlobalFlagTrue{Name = "Q18EinarToPortal"},
		},
OffConditions =	{
		QuestState{QuestId = 22 , State = StateSolved},
		},
OffActions =	{
		RemoveDialog{NpcId = self},
		SetGlobalFlagFalse{Name = "Q18EinarToPortal"},
		SetGlobalFlagTrue{Name = "Q18EinarToPortalFinal"}
		},
}

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p4\n1362_SergEinar.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "FlagEinarKnown"},
		},
		Actions = {
			Say{Tag = "sergEinar001", String = "In Ordnung, Leute! Es ist keiner von ihnen!"},
			Answer{Tag = "sergEinar001PC", String = "Wer seid Ihr?", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagEinarKnown"}),
		},
		Actions = {
			Say{Tag = "sergEinar006", String = "Wie steht es?"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sergEinar002", String = "Sergeant Einar! Truppf�hrer, zweite Schildwache! Und treuer Streiter des Hauses Utran!"},
			Answer{Tag = "sergEinar002PC", String = "Was f�hrt Utraner auf diese Seite des Schattenhains?", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sergEinar003", String = "Die verzweifelte Hoffnung eines verzweifelten Kommandanten... Wir hatten Befehl, Brannigans Nachschublager anzugreifen und niederzubrennen! Doch wir hatten keine Chance!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sergEinar004", String = "Jetzt ist der R�ckweg versperrt! Und selbst wenn er frei w�re - wer k�nnte schon mit leeren H�nden zu sterbenden Kameraden zur�ckkehren?"},
			Answer{Tag = "sergEinar004PC", String = "Vielleicht nicht mit v�llig leeren H�nden!", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagEinarKnown"},
			Say{Tag = "sergEinar005", String = "Was meint Ihr?"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
			QuestState{QuestId = 23 , State = StateUnknown},
			QuestState{QuestId = 23 , State = StateUnknown},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar006PC", String = "Lasst uns gemeinsam den Weg nach Shiel freik�mpfen!", AnswerId = 6},
		}}

	OnAnswer{5;
		Conditions = {
			QuestState{QuestId = 23 , State = StateUnknown},
			Negated(QuestState{QuestId = 23 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(QuestState{QuestId = 23 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sergEinar007", String = "Habt Ihr nicht zugeh�rt? Der Bergpfad, �ber den wir kamen, ist versch�ttet! Wir sind abgeschnitten! Es gibt keinen Weg zur�ck!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sergEinar008", String = "Die einzige M�glichkeit w�re �ber den Nordpass, um die Berge herum! Doch damit w�rden wir mitten durch das Herz von Brannigans Heer marschieren! Drei Lager der Schwarzen Faust halten diesen Pfad!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sergEinar009", String = "Wenn Ihr Shiel erreichen wollt, m�sst Ihr diese Armeen zerschlagen! Wie wollt Ihr das anstellen?"},
			Answer{Tag = "sergEinar009PC", String = "Ich besitze die Macht der Rune! Kommt mit mir! Gemeinsam k�nnen wir es schaffen!", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sergEinar010", String = "Ihr seid ein Narr! Aber irgendwie mag ich Euch! Sch�tze, weil ich ein ebenso gro�er Narr bin!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sergEinar011", String = "Nun denn, so soll es sein! Jagen wir ein paar Gr�nh�ute! Doch wir m�ssen vorsichtig sein! Goblinsp�her �berwachen den Pass nach Norden!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sergEinar012", String = "Sobald diese Sp�her unsere M�nner entdecken, werden sie ihre Lager alarmieren! Wenn unser Heer bis dahin nicht gro� genug ist, werden sie uns geradewegs �berrennen! Also, lasst uns gut vorbereitet sein, ehe wir den Pass durchqueren!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 23} , QuestSolve{QuestId = 449},
			QuestBegin{QuestId = 19 },
			QuestBegin{QuestId = 20 },
			QuestBegin{QuestId = 21},
			Say{Tag = "sergEinar013", String = "Sollten wir uns verlieren, treffen wir uns hier wieder!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sergEinar014", String = "Marcus hier wird Euch zeigen, wo Ihr in dieser Gegend Monumente finden k�nnt! Folgt ihm, ich komme nach!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q18EinarFollow"} ,
					SetGlobalFlagFalse{Name = "Q18EinarDied"} ,
					SetNpcFlagFalse{Name = "DeadPlayerGoHome"},
					RemoveDialog{NpcId = self},
			SetGlobalFlagTrue{Name = "Q18MarcusGo"},
			EndDialog(),
		}}

	OnAnswer{15;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q23HQDone"},
		},
		Actions = {
			Say{Tag = "sergEinar015", String = "Ein guter Kampf, Runenkrieger! Aber noch ist es nicht vorbei!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q23HQDone"}),
			IsGlobalFlagTrue{Name = "Q18EinarDied"},
			QuestState{QuestId = 22 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar017PC", String = "Versuchen wir es noch einmal!", AnswerId = 20},
			OfferAnswer{Tag = "sergEinar018PC", String = "Die Lager sind zerst�rt! Brannigans Armee ist zerschlagen!", AnswerId = 22},
			OfferAnswer{Tag = "sergEinar020PC", String = "Wessen Kopf ist das hier?", AnswerId = 25},
			OfferAnswer{Tag = "sergEinar024PC", String = "Die f�nf Br�der sind wieder vereint - im Jenseits!", AnswerId = 31},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q23HQDone"}),
			IsGlobalFlagTrue{Name = "Q18EinarDied"},
			QuestState{QuestId = 22 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar017PC", String = "Versuchen wir es noch einmal!", AnswerId = 20},
			OfferAnswer{Tag = "sergEinar018PC", String = "Die Lager sind zerst�rt! Brannigans Armee ist zerschlagen!", AnswerId = 22},
			OfferAnswer{Tag = "sergEinar020PC", String = "Wessen Kopf ist das hier?", AnswerId = 25},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q23HQDone"}),
			IsGlobalFlagTrue{Name = "Q18EinarDied"},
			QuestState{QuestId = 22 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar017PC", String = "Versuchen wir es noch einmal!", AnswerId = 20},
			OfferAnswer{Tag = "sergEinar018PC", String = "Die Lager sind zerst�rt! Brannigans Armee ist zerschlagen!", AnswerId = 22},
			OfferAnswer{Tag = "sergEinar024PC", String = "Die f�nf Br�der sind wieder vereint - im Jenseits!", AnswerId = 31},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q23HQDone"}),
			IsGlobalFlagTrue{Name = "Q18EinarDied"},
			QuestState{QuestId = 22 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar017PC", String = "Versuchen wir es noch einmal!", AnswerId = 20},
			OfferAnswer{Tag = "sergEinar018PC", String = "Die Lager sind zerst�rt! Brannigans Armee ist zerschlagen!", AnswerId = 22},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q23HQDone"}),
			IsGlobalFlagTrue{Name = "Q18EinarDied"},
			Negated(QuestState{QuestId = 22 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar017PC", String = "Versuchen wir es noch einmal!", AnswerId = 20},
			OfferAnswer{Tag = "sergEinar020PC", String = "Wessen Kopf ist das hier?", AnswerId = 25},
			OfferAnswer{Tag = "sergEinar024PC", String = "Die f�nf Br�der sind wieder vereint - im Jenseits!", AnswerId = 31},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q23HQDone"}),
			IsGlobalFlagTrue{Name = "Q18EinarDied"},
			Negated(QuestState{QuestId = 22 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar017PC", String = "Versuchen wir es noch einmal!", AnswerId = 20},
			OfferAnswer{Tag = "sergEinar020PC", String = "Wessen Kopf ist das hier?", AnswerId = 25},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q23HQDone"}),
			IsGlobalFlagTrue{Name = "Q18EinarDied"},
			Negated(QuestState{QuestId = 22 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar017PC", String = "Versuchen wir es noch einmal!", AnswerId = 20},
			OfferAnswer{Tag = "sergEinar024PC", String = "Die f�nf Br�der sind wieder vereint - im Jenseits!", AnswerId = 31},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q23HQDone"}),
			IsGlobalFlagTrue{Name = "Q18EinarDied"},
			Negated(QuestState{QuestId = 22 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar017PC", String = "Versuchen wir es noch einmal!", AnswerId = 20},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q23HQDone"}),
			Negated(IsGlobalFlagTrue{Name = "Q18EinarDied"}),
			QuestState{QuestId = 22 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar018PC", String = "Die Lager sind zerst�rt! Brannigans Armee ist zerschlagen!", AnswerId = 22},
			OfferAnswer{Tag = "sergEinar020PC", String = "Wessen Kopf ist das hier?", AnswerId = 25},
			OfferAnswer{Tag = "sergEinar024PC", String = "Die f�nf Br�der sind wieder vereint - im Jenseits!", AnswerId = 31},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q23HQDone"}),
			Negated(IsGlobalFlagTrue{Name = "Q18EinarDied"}),
			QuestState{QuestId = 22 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar018PC", String = "Die Lager sind zerst�rt! Brannigans Armee ist zerschlagen!", AnswerId = 22},
			OfferAnswer{Tag = "sergEinar020PC", String = "Wessen Kopf ist das hier?", AnswerId = 25},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q23HQDone"}),
			Negated(IsGlobalFlagTrue{Name = "Q18EinarDied"}),
			QuestState{QuestId = 22 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar018PC", String = "Die Lager sind zerst�rt! Brannigans Armee ist zerschlagen!", AnswerId = 22},
			OfferAnswer{Tag = "sergEinar024PC", String = "Die f�nf Br�der sind wieder vereint - im Jenseits!", AnswerId = 31},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q23HQDone"}),
			Negated(IsGlobalFlagTrue{Name = "Q18EinarDied"}),
			QuestState{QuestId = 22 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar018PC", String = "Die Lager sind zerst�rt! Brannigans Armee ist zerschlagen!", AnswerId = 22},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q23HQDone"}),
			Negated(IsGlobalFlagTrue{Name = "Q18EinarDied"}),
			Negated(QuestState{QuestId = 22 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar020PC", String = "Wessen Kopf ist das hier?", AnswerId = 25},
			OfferAnswer{Tag = "sergEinar024PC", String = "Die f�nf Br�der sind wieder vereint - im Jenseits!", AnswerId = 31},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q23HQDone"}),
			Negated(IsGlobalFlagTrue{Name = "Q18EinarDied"}),
			Negated(QuestState{QuestId = 22 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar020PC", String = "Wessen Kopf ist das hier?", AnswerId = 25},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q23HQDone"}),
			Negated(IsGlobalFlagTrue{Name = "Q18EinarDied"}),
			Negated(QuestState{QuestId = 22 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar024PC", String = "Die f�nf Br�der sind wieder vereint - im Jenseits!", AnswerId = 31},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q23HQDone"}),
			Negated(IsGlobalFlagTrue{Name = "Q18EinarDied"}),
			Negated(QuestState{QuestId = 22 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sergEinar016", String = "Ihre Lager spannen sich �ber den ganzen Weg von hier bis Shiel! Und ihre Sp�her haben die Schlacht mit Sicherheit bemerkt!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sergEinar017", String = "Wir m�ssen schnell weiter vorsto�en! Im Nordosten liegt ein weiteres Monument - dort k�nnt Ihr Eure Truppen verst�rken! Dann kann uns nichts mehr aufhalten!"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			RevealUnExplored{X = 283 , Y = 371 , Range = 10},
			 SetGlobalFlagFalse{Name = "Q23HQDone"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q18EinarDied"},
			QuestState{QuestId = 22 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar017PC", String = "Versuchen wir es noch einmal!", AnswerId = 20},
			OfferAnswer{Tag = "sergEinar018PC", String = "Die Lager sind zerst�rt! Brannigans Armee ist zerschlagen!", AnswerId = 22},
			OfferAnswer{Tag = "sergEinar020PC", String = "Wessen Kopf ist das hier?", AnswerId = 25},
			OfferAnswer{Tag = "sergEinar024PC", String = "Die f�nf Br�der sind wieder vereint - im Jenseits!", AnswerId = 31},
		}}

	OnAnswer{19;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q18EinarDied"},
			QuestState{QuestId = 22 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar017PC", String = "Versuchen wir es noch einmal!", AnswerId = 20},
			OfferAnswer{Tag = "sergEinar018PC", String = "Die Lager sind zerst�rt! Brannigans Armee ist zerschlagen!", AnswerId = 22},
			OfferAnswer{Tag = "sergEinar020PC", String = "Wessen Kopf ist das hier?", AnswerId = 25},
		}}

	OnAnswer{19;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q18EinarDied"},
			QuestState{QuestId = 22 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar017PC", String = "Versuchen wir es noch einmal!", AnswerId = 20},
			OfferAnswer{Tag = "sergEinar018PC", String = "Die Lager sind zerst�rt! Brannigans Armee ist zerschlagen!", AnswerId = 22},
			OfferAnswer{Tag = "sergEinar024PC", String = "Die f�nf Br�der sind wieder vereint - im Jenseits!", AnswerId = 31},
		}}

	OnAnswer{19;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q18EinarDied"},
			QuestState{QuestId = 22 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar017PC", String = "Versuchen wir es noch einmal!", AnswerId = 20},
			OfferAnswer{Tag = "sergEinar018PC", String = "Die Lager sind zerst�rt! Brannigans Armee ist zerschlagen!", AnswerId = 22},
		}}

	OnAnswer{19;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q18EinarDied"},
			Negated(QuestState{QuestId = 22 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar017PC", String = "Versuchen wir es noch einmal!", AnswerId = 20},
			OfferAnswer{Tag = "sergEinar020PC", String = "Wessen Kopf ist das hier?", AnswerId = 25},
			OfferAnswer{Tag = "sergEinar024PC", String = "Die f�nf Br�der sind wieder vereint - im Jenseits!", AnswerId = 31},
		}}

	OnAnswer{19;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q18EinarDied"},
			Negated(QuestState{QuestId = 22 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar017PC", String = "Versuchen wir es noch einmal!", AnswerId = 20},
			OfferAnswer{Tag = "sergEinar020PC", String = "Wessen Kopf ist das hier?", AnswerId = 25},
		}}

	OnAnswer{19;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q18EinarDied"},
			Negated(QuestState{QuestId = 22 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar017PC", String = "Versuchen wir es noch einmal!", AnswerId = 20},
			OfferAnswer{Tag = "sergEinar024PC", String = "Die f�nf Br�der sind wieder vereint - im Jenseits!", AnswerId = 31},
		}}

	OnAnswer{19;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q18EinarDied"},
			Negated(QuestState{QuestId = 22 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar017PC", String = "Versuchen wir es noch einmal!", AnswerId = 20},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q18EinarDied"}),
			QuestState{QuestId = 22 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar018PC", String = "Die Lager sind zerst�rt! Brannigans Armee ist zerschlagen!", AnswerId = 22},
			OfferAnswer{Tag = "sergEinar020PC", String = "Wessen Kopf ist das hier?", AnswerId = 25},
			OfferAnswer{Tag = "sergEinar024PC", String = "Die f�nf Br�der sind wieder vereint - im Jenseits!", AnswerId = 31},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q18EinarDied"}),
			QuestState{QuestId = 22 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar018PC", String = "Die Lager sind zerst�rt! Brannigans Armee ist zerschlagen!", AnswerId = 22},
			OfferAnswer{Tag = "sergEinar020PC", String = "Wessen Kopf ist das hier?", AnswerId = 25},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q18EinarDied"}),
			QuestState{QuestId = 22 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar018PC", String = "Die Lager sind zerst�rt! Brannigans Armee ist zerschlagen!", AnswerId = 22},
			OfferAnswer{Tag = "sergEinar024PC", String = "Die f�nf Br�der sind wieder vereint - im Jenseits!", AnswerId = 31},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q18EinarDied"}),
			QuestState{QuestId = 22 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar018PC", String = "Die Lager sind zerst�rt! Brannigans Armee ist zerschlagen!", AnswerId = 22},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q18EinarDied"}),
			Negated(QuestState{QuestId = 22 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar020PC", String = "Wessen Kopf ist das hier?", AnswerId = 25},
			OfferAnswer{Tag = "sergEinar024PC", String = "Die f�nf Br�der sind wieder vereint - im Jenseits!", AnswerId = 31},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q18EinarDied"}),
			Negated(QuestState{QuestId = 22 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar020PC", String = "Wessen Kopf ist das hier?", AnswerId = 25},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q18EinarDied"}),
			Negated(QuestState{QuestId = 22 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar024PC", String = "Die f�nf Br�der sind wieder vereint - im Jenseits!", AnswerId = 31},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q18EinarDied"}),
			Negated(QuestState{QuestId = 22 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sergEinar018", String = "Das war knapp! Ich konnte mich erst im allerletzten Moment zur�ckziehen... Ich dachte schon, es w�re aus! Und? Seid Ihr bereit f�r einen neuen Versuch?"},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q18EinarFollow"} ,
					SetGlobalFlagFalse{Name = "Q18EinarDied"} ,
					SetNpcFlagFalse{Name = "DeadPlayerGoHome"},
					RemoveDialog{NpcId = self},
			EndDialog(),
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sergEinar019", String = "Bei den Seelen des Mor Duine! Das sind seltsame Kr�fte, �ber die Ihr verf�gt, Krieger!"},
			Answer{Tag = "sergEinar019PC", String = "Kr�fte, die Euch bei der Erf�llung Eurer Mission geholfen haben! Euer Auftrag hier ist beendet! Ihr k�nnt nach Hause!", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sergEinar020", String = "Ihr seid ein wahrer Freund des Hauses Utran! Jetzt, wo ihre Nachschublager zerst�rt sind, werden wir die schwarze Faust aus Shiel vertreiben! Kommt weiter, rasten k�nnen wir sp�ter!"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "GibRewardSiegelring"},
			QuestSolve{QuestId = 22} , 
						QuestBegin{QuestId = 450} , 
						SetGlobalFlagFalse{Name = "Q18EinarFollow"} , 
						SetGlobalFlagTrue{Name = "Q18EinarToPortal"},
			SetRewardFlagTrue{ Name = "DurchDenSchattenhain"},
			EndDialog(),
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sergEinar021", String = "Dies war einer der Twonks! F�nf Br�der, die Brannigan dienen! Verdammt gef�hrliche Burschen!"},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sergEinar022", String = "W�rde mich nicht wundern, wenn sich die anderen ebenfalls hier im Schattenhain herumtreiben! Ein hohe Belohnung wurde f�r den ausgesetzt, der sie alle f�nf zur Strecke bringt!"},
			Answer{Tag = "sergEinar022PC", String = "Ich werde die Augen offenhalten!", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sergEinar023", String = "Darmor ist ein gef�hrlicher Krieger, er f�hrt die Kampfaxt wie kein zweiter! Sergil mag schw�cher sein, doch er ist verflucht clever! Achtet auf seinen vergifteten Dolch! Brandel dagegen benutzt stets eine Armbrust!"},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sergEinar024", String = "Ragnar ist ein Schwarzmagier, und Elijah beherrscht die Eismagie!"},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 463 },
				 QuestBegin{QuestId = 454 },
				 QuestBegin{QuestId = 455 },
				 QuestBegin{QuestId = 456 },
				 QuestBegin{QuestId = 457 },
				 QuestBegin{QuestId = 458 },
				 QuestBegin{QuestId = 459 },
				 SetPlayerFlagFalse{Name = "Q453PlayerGotFirstHead"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q18EinarDied"},
			QuestState{QuestId = 22 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar017PC", String = "Versuchen wir es noch einmal!", AnswerId = 20},
			OfferAnswer{Tag = "sergEinar018PC", String = "Die Lager sind zerst�rt! Brannigans Armee ist zerschlagen!", AnswerId = 22},
			OfferAnswer{Tag = "sergEinar020PC", String = "Wessen Kopf ist das hier?", AnswerId = 25},
			OfferAnswer{Tag = "sergEinar024PC", String = "Die f�nf Br�der sind wieder vereint - im Jenseits!", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q18EinarDied"},
			QuestState{QuestId = 22 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar017PC", String = "Versuchen wir es noch einmal!", AnswerId = 20},
			OfferAnswer{Tag = "sergEinar018PC", String = "Die Lager sind zerst�rt! Brannigans Armee ist zerschlagen!", AnswerId = 22},
			OfferAnswer{Tag = "sergEinar020PC", String = "Wessen Kopf ist das hier?", AnswerId = 25},
		}}

	OnAnswer{30;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q18EinarDied"},
			QuestState{QuestId = 22 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar017PC", String = "Versuchen wir es noch einmal!", AnswerId = 20},
			OfferAnswer{Tag = "sergEinar018PC", String = "Die Lager sind zerst�rt! Brannigans Armee ist zerschlagen!", AnswerId = 22},
			OfferAnswer{Tag = "sergEinar024PC", String = "Die f�nf Br�der sind wieder vereint - im Jenseits!", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q18EinarDied"},
			QuestState{QuestId = 22 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar017PC", String = "Versuchen wir es noch einmal!", AnswerId = 20},
			OfferAnswer{Tag = "sergEinar018PC", String = "Die Lager sind zerst�rt! Brannigans Armee ist zerschlagen!", AnswerId = 22},
		}}

	OnAnswer{30;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q18EinarDied"},
			Negated(QuestState{QuestId = 22 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar017PC", String = "Versuchen wir es noch einmal!", AnswerId = 20},
			OfferAnswer{Tag = "sergEinar020PC", String = "Wessen Kopf ist das hier?", AnswerId = 25},
			OfferAnswer{Tag = "sergEinar024PC", String = "Die f�nf Br�der sind wieder vereint - im Jenseits!", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q18EinarDied"},
			Negated(QuestState{QuestId = 22 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar017PC", String = "Versuchen wir es noch einmal!", AnswerId = 20},
			OfferAnswer{Tag = "sergEinar020PC", String = "Wessen Kopf ist das hier?", AnswerId = 25},
		}}

	OnAnswer{30;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q18EinarDied"},
			Negated(QuestState{QuestId = 22 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar017PC", String = "Versuchen wir es noch einmal!", AnswerId = 20},
			OfferAnswer{Tag = "sergEinar024PC", String = "Die f�nf Br�der sind wieder vereint - im Jenseits!", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q18EinarDied"},
			Negated(QuestState{QuestId = 22 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar017PC", String = "Versuchen wir es noch einmal!", AnswerId = 20},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q18EinarDied"}),
			QuestState{QuestId = 22 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar018PC", String = "Die Lager sind zerst�rt! Brannigans Armee ist zerschlagen!", AnswerId = 22},
			OfferAnswer{Tag = "sergEinar020PC", String = "Wessen Kopf ist das hier?", AnswerId = 25},
			OfferAnswer{Tag = "sergEinar024PC", String = "Die f�nf Br�der sind wieder vereint - im Jenseits!", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q18EinarDied"}),
			QuestState{QuestId = 22 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar018PC", String = "Die Lager sind zerst�rt! Brannigans Armee ist zerschlagen!", AnswerId = 22},
			OfferAnswer{Tag = "sergEinar020PC", String = "Wessen Kopf ist das hier?", AnswerId = 25},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q18EinarDied"}),
			QuestState{QuestId = 22 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar018PC", String = "Die Lager sind zerst�rt! Brannigans Armee ist zerschlagen!", AnswerId = 22},
			OfferAnswer{Tag = "sergEinar024PC", String = "Die f�nf Br�der sind wieder vereint - im Jenseits!", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q18EinarDied"}),
			QuestState{QuestId = 22 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar018PC", String = "Die Lager sind zerst�rt! Brannigans Armee ist zerschlagen!", AnswerId = 22},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q18EinarDied"}),
			Negated(QuestState{QuestId = 22 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar020PC", String = "Wessen Kopf ist das hier?", AnswerId = 25},
			OfferAnswer{Tag = "sergEinar024PC", String = "Die f�nf Br�der sind wieder vereint - im Jenseits!", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q18EinarDied"}),
			Negated(QuestState{QuestId = 22 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar020PC", String = "Wessen Kopf ist das hier?", AnswerId = 25},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q18EinarDied"}),
			Negated(QuestState{QuestId = 22 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar024PC", String = "Die f�nf Br�der sind wieder vereint - im Jenseits!", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q18EinarDied"}),
			Negated(QuestState{QuestId = 22 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sergEinar025", String = "Bei den Seelen des Mor Duine! Der Lord Kommandant wird hocherfreut sein! Ihr habt Brannigan einen empfindlichen Schlag versetzt!"},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sergEinar026", String = "Ich werde Euch diese blutige Last abnehmen! Hier, nehmt diese Belohnung f�r Eure Tapferkeit."},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			TransferMoney{Silver = 8, Flag = Give},
				 TransferItem{TakeItem = 3202 , Flag = Take},
				 QuestSolve{QuestId = 454},
				 TransferItem{TakeItem = 3203 , Flag = Take},
				 QuestSolve{QuestId = 457},
				 TransferItem{TakeItem = 3204 , Flag = Take},
				 QuestSolve{QuestId = 458},
				 TransferItem{TakeItem = 3205 , Flag = Take},
				 QuestSolve{QuestId = 456},
				 TransferItem{TakeItem = 3206 , Flag = Take},
				 QuestSolve{QuestId = 455},
				 QuestSolve{QuestId = 459},
				 QuestSolve{QuestId = 463},
				 QuestSolve{QuestId = 453},
				 SetPlayerFlagFalse{Name = "Q453PlayerGotFirstHead"},
				 SetPlayerFlagFalse{Name = "Q453PlayerGotAllHeads"},
				 SetRewardFlagTrue{ Name = "Kopfjagd6Complete"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q18EinarDied"},
			QuestState{QuestId = 22 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar017PC", String = "Versuchen wir es noch einmal!", AnswerId = 20},
			OfferAnswer{Tag = "sergEinar018PC", String = "Die Lager sind zerst�rt! Brannigans Armee ist zerschlagen!", AnswerId = 22},
			OfferAnswer{Tag = "sergEinar020PC", String = "Wessen Kopf ist das hier?", AnswerId = 25},
			OfferAnswer{Tag = "sergEinar024PC", String = "Die f�nf Br�der sind wieder vereint - im Jenseits!", AnswerId = 31},
		}}

	OnAnswer{34;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q18EinarDied"},
			QuestState{QuestId = 22 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar017PC", String = "Versuchen wir es noch einmal!", AnswerId = 20},
			OfferAnswer{Tag = "sergEinar018PC", String = "Die Lager sind zerst�rt! Brannigans Armee ist zerschlagen!", AnswerId = 22},
			OfferAnswer{Tag = "sergEinar020PC", String = "Wessen Kopf ist das hier?", AnswerId = 25},
		}}

	OnAnswer{34;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q18EinarDied"},
			QuestState{QuestId = 22 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar017PC", String = "Versuchen wir es noch einmal!", AnswerId = 20},
			OfferAnswer{Tag = "sergEinar018PC", String = "Die Lager sind zerst�rt! Brannigans Armee ist zerschlagen!", AnswerId = 22},
			OfferAnswer{Tag = "sergEinar024PC", String = "Die f�nf Br�der sind wieder vereint - im Jenseits!", AnswerId = 31},
		}}

	OnAnswer{34;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q18EinarDied"},
			QuestState{QuestId = 22 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar017PC", String = "Versuchen wir es noch einmal!", AnswerId = 20},
			OfferAnswer{Tag = "sergEinar018PC", String = "Die Lager sind zerst�rt! Brannigans Armee ist zerschlagen!", AnswerId = 22},
		}}

	OnAnswer{34;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q18EinarDied"},
			Negated(QuestState{QuestId = 22 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar017PC", String = "Versuchen wir es noch einmal!", AnswerId = 20},
			OfferAnswer{Tag = "sergEinar020PC", String = "Wessen Kopf ist das hier?", AnswerId = 25},
			OfferAnswer{Tag = "sergEinar024PC", String = "Die f�nf Br�der sind wieder vereint - im Jenseits!", AnswerId = 31},
		}}

	OnAnswer{34;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q18EinarDied"},
			Negated(QuestState{QuestId = 22 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar017PC", String = "Versuchen wir es noch einmal!", AnswerId = 20},
			OfferAnswer{Tag = "sergEinar020PC", String = "Wessen Kopf ist das hier?", AnswerId = 25},
		}}

	OnAnswer{34;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q18EinarDied"},
			Negated(QuestState{QuestId = 22 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar017PC", String = "Versuchen wir es noch einmal!", AnswerId = 20},
			OfferAnswer{Tag = "sergEinar024PC", String = "Die f�nf Br�der sind wieder vereint - im Jenseits!", AnswerId = 31},
		}}

	OnAnswer{34;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q18EinarDied"},
			Negated(QuestState{QuestId = 22 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar017PC", String = "Versuchen wir es noch einmal!", AnswerId = 20},
		}}

	OnAnswer{34;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q18EinarDied"}),
			QuestState{QuestId = 22 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar018PC", String = "Die Lager sind zerst�rt! Brannigans Armee ist zerschlagen!", AnswerId = 22},
			OfferAnswer{Tag = "sergEinar020PC", String = "Wessen Kopf ist das hier?", AnswerId = 25},
			OfferAnswer{Tag = "sergEinar024PC", String = "Die f�nf Br�der sind wieder vereint - im Jenseits!", AnswerId = 31},
		}}

	OnAnswer{34;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q18EinarDied"}),
			QuestState{QuestId = 22 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar018PC", String = "Die Lager sind zerst�rt! Brannigans Armee ist zerschlagen!", AnswerId = 22},
			OfferAnswer{Tag = "sergEinar020PC", String = "Wessen Kopf ist das hier?", AnswerId = 25},
		}}

	OnAnswer{34;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q18EinarDied"}),
			QuestState{QuestId = 22 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar018PC", String = "Die Lager sind zerst�rt! Brannigans Armee ist zerschlagen!", AnswerId = 22},
			OfferAnswer{Tag = "sergEinar024PC", String = "Die f�nf Br�der sind wieder vereint - im Jenseits!", AnswerId = 31},
		}}

	OnAnswer{34;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q18EinarDied"}),
			QuestState{QuestId = 22 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar018PC", String = "Die Lager sind zerst�rt! Brannigans Armee ist zerschlagen!", AnswerId = 22},
		}}

	OnAnswer{34;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q18EinarDied"}),
			Negated(QuestState{QuestId = 22 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar020PC", String = "Wessen Kopf ist das hier?", AnswerId = 25},
			OfferAnswer{Tag = "sergEinar024PC", String = "Die f�nf Br�der sind wieder vereint - im Jenseits!", AnswerId = 31},
		}}

	OnAnswer{34;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q18EinarDied"}),
			Negated(QuestState{QuestId = 22 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar020PC", String = "Wessen Kopf ist das hier?", AnswerId = 25},
		}}

	OnAnswer{34;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q18EinarDied"}),
			Negated(QuestState{QuestId = 22 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sergEinar024PC", String = "Die f�nf Br�der sind wieder vereint - im Jenseits!", AnswerId = 31},
		}}

	OnAnswer{34;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q18EinarDied"}),
			Negated(QuestState{QuestId = 22 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end