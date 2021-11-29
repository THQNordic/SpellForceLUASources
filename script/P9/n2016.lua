-->INFO: Marcia
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
Respawn{WaitTime=3}
--!EDS RESPAWN END

OnIdleGoHome
{
	WalkMode = Walk, X = _X, Y = _Y, Direction = 7 , 
	Conditions = 
	{
		Negated(QuestState{QuestId = 118 , State = StateActive}),
		IsGlobalFlagTrue {Name = "MarciaJonirIdleOn"},
	}
}

OnIdleGoHome
{
	WalkMode = Run, X = 203 , Y = 477, Direction = 1 , 
	Conditions = 
	{
		QuestState{QuestId = 118 , State = StateActive},
		IsGlobalFlagTrue {Name = "MarciaJonirIdleOn"},		
	}
}

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

-- Brunnnefels bedroht
OnOneTimeEvent
{
Conditions = {
			QuestState{QuestId = 116, State = StateActive}
			},
Actions = {
		SetNpcFlagFalse{Name = "HasMainquest"},
		}
}

-- Brunnnefels safe
OnOneTimeEvent
{
Conditions = {
			QuestState{QuestId = 121, State = StateActive}
			},
Actions = {
		SetNpcFlagTrue{Name = "HasMainquest"},
		}
}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p9\n2016_Marcia.txt


	

	OnBeginDialog{
		Conditions = {
			Negated(QuestState{QuestId = 121 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(Negated(QuestState{QuestId = 121 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "marcia012", String = "Solange diese Schlacht nicht gewonnen ist, m�ssen wir uns auf den Kampf konzentrieren! Danach mag Zeit zum Reden sein...!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMarciaKnown"}),
			QuestState{QuestId = 122 , State = StateActive},
		},
		Actions = {
			Say{Tag = "marcia003", String = "Willkommen zur�ck!"},
			OfferAnswer{Tag = "marcia003PC", String = "Wisst Ihr etwas �ber Hokan Ashir?", AnswerId = 4},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagMarciaKnown"}),
			Negated(QuestState{QuestId = 122 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "marcia003", String = "Willkommen zur�ck!"},
		}}

	OnAnswer{1;
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagMarciaKnown"},
		},
		Actions = {
			Say{Tag = "marcia001", String = "Ihr habt Euch tapfer geschlagen! Entschuldigt, dass ich Euch in diesen Krieg mit hineingezogen habe! Doch ohne Eure Hilfe w�ren wir verloren gewesen!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "marcia002", String = "Ich schulde Euch weit mehr als nur meinen Dank! Nun denn, sprecht! Was steht Euch zu Diensten?"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 122 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMarciaKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "marcia003PC", String = "Wisst Ihr etwas �ber Hokan Ashir?", AnswerId = 4},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 122 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagMarciaKnown"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "marcia004", String = "Hokan Ashir? Durchaus... Er war ein Magier des Zirkels. Der gr��te Nekromant den diese Welt je gesehen hat! Ein ebenso m�chtiger wie grausamer Zauberer!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "marcia005", String = "Er starb w�hrend der Konvokation! So sagt man zumindest..."},
			Answer{Tag = "marcia005PC", String = "Wer befehligt dann diese Angriffe, wenn Hokan tot ist?", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "marcia006", String = "Wir wissen es nicht! Die Untoten haben die Festungen im Grauschattental �berrannt! Seitdem branden sie gegen unsere Heere wie ein nimmerm�der Ozean!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "marcia007", String = "Ohne die Zwergengarde werden wir nicht mehr lange durchhalten! Und nur die G�tter wissen, ob Urias und seine M�nner im Grauschattental noch leben!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "marcia008", String = "Irgend jemand muss nach dorthin durchbrechen! Wir m�ssen wissen, was dort geschieht!"},
			Answer{Tag = "marcia008PC", String = "Wenn dies der einzige Weg ist, mehr �ber Hokan zu erfahren, dann werde ich gehen!", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "marcia009", String = "Unsere Gebete werden Euch begleiten! Das S�dportal ist Euch allerdings versperrt! Zu viele Untote auf der anderen Seite! Ihr m�sst Euch Euren Weg durch das Land der Zwerge bahnen!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "marcia010", String = "Sprecht mit Skarvig, dem Zwergenschmied, in den s�dlichen Windwallbergen! Er wird Euch helfen! Er war stets ein Freund der Menschen und des Hauses Hallit!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "marcia011", String = "Der Weg in ihr Land f�hrt nach S�dwesten! Dieser Schl�ssel wird Euch das Tor �ffnen. Viel Gl�ck!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 465} , QuestSolve{QuestId = 122} , 
					QuestSolve{QuestId = 121} , QuestSolve{QuestId = 112} , 
					QuestBegin{QuestId = 124}, QuestBegin{QuestId = 125} , QuestBegin{QuestId = 464},
			RevealUnExplored{X = 122 , Y = 231 , Range = 10} , 
					RevealUnExplored{X = 71 , Y = 239 , Range = 10} ,
					TransferItem{GiveItem = 3228 , Amount = 1 , Flag = Give},
					SetRewardFlagTrue{ Name = "Marcia1"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 122 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "marcia003PC", String = "Wisst Ihr etwas �ber Hokan Ashir?", AnswerId = 4},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 122 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end