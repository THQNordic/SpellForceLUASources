-->INFO: Rigour
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 2}
--!EDS ONIDLEGOHOME END


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
-- Source: C:\project\main\mission\dialoge\p21\n2797_Rigour.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagTrue{Name = "FlagRigourKnown"},
		},
		Actions = {
			Say{Tag = "rigour001", String = "Was ist jetzt schon wieder?"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "FlagRigourKnown"}),
		},
		Actions = {
			Say{Tag = "rigour002", String = "Verdammtes Land... verdammte Hitze... verdammte Schwachköpfe..."},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "rigour003", String = "Und was wollt Ihr jetzt? Nur zu! Macht einen schlechten Tag noch schlechter..."},
			Answer{Tag = "rigour003PC", String = "Die Höflichkeit in diesem Land versetzt mich immer wieder aufs Neue in Erstaunen!", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagRigourKnown"},
			Say{Tag = "rigour004", String = "Ich werde Euch Eure Höflichkeit gleich in den Hals stopfen, wenn Ihr nicht verschwindet!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "rigour005", String = "Problem? Kein Problem! Ich bin nur zur verflucht falschen Zeit am verflucht falschen Ort... ich verfolgte einen Feind unserer Gilde, einen Dunkelelfen namens Thar!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "rigour006", String = "Aber dieser Bastard hat sich irgendwo in Mulandir verkrochen! Und ich hänge hier fest! Verdammtes Land!"},
			Answer{Tag = "rigour006PC", String = "Wer ist dieser Thar?", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "rigour007", String = "Er ist der wandelnde Tod! Ein Mörder, ein Abtrünniger, der sich an keine Regeln hält! Deshalb fordert meine Gilde seinen Kopf!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 512} , QuestBegin{QuestId = 513},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "rigour008", String = "Ach ja? Natürlich, und ich bin ein Priester Aonirs! Ihr glaubt wohl, Ihr könnt mich hinters Licht führen..."},
			Answer{Tag = "rigour008PC", String = "Hier ist sein Kopf! Glaubt Ihr mir jetzt?", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "rigour009", String = "Nors Auge! Tatsächlich! Der Schlächter ist hinab zum Seelenfluss gefahren!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "rigour010", String = "Gute Arbeit, Krieger! Ich erkenne an, dass Ihr etwas taugt... Hier, nehmt das Kopfgeld! Ihr habt es Euch verdient!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 514} , QuestSolve{QuestId = 512},
				SetRewardFlagTrue{ Name = "Thar"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "rigour011", String = "Der Schattenring! Ich kann es nicht glauben! Woher habt Ihr ihn?"},
			Answer{Tag = "rigour011PC", String = "Ein schemenhafter Untoter trug ihn bei sich!", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "rigour012", String = "Endlich! Ihr wisst gar nicht, was Ihr da in Euren Händen haltet!"},
			Answer{Tag = "rigour012PC", String = "Was hat es mit diesem Ring auf sich?", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "rigour013", String = "Er ist das Tor in die Welt der Schatten! Seine Magie ist verbraucht! Doch ich kenne den Zauber, um ihm wieder neue Kräfte einzuhauchen! Wartet..."},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "rigour014", String = "Hier, habt Ihr ihn zurück! Der Ring ist zu Euch gekommen! Ihr habt ihn gefunden, Ihr müsst ihn auch tragen! So ist es vom Schicksal vorher bestimmt!"},
			Answer{Tag = "rigour014PC", String = "Und was soll ich damit tun? Macht er mich vielleicht unsichtbar?", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "rigour015", String = "Nein, im Gegenteil! Er macht Unsichtbares sichtbar! Wenn Ihr diesen Ring tragt, seid Ihr dazu in der Lage, die Schattenwesen zu sehen!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "rigour016", String = "Sucht nach ihnen! Vernichtet die schwarzen Phantome, wo immer Ihr sie auch antreffen mögt! Niemand weiß, wie weit sie bereits in unsere Welt vorgedrungen sind! Nur Ihr könnt sie sehen! Findet sie - und bekämpft sie!"},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "rigour017", String = "Und sucht nach Hinweisen, die uns verraten könnten, was sie vorhaben! Solltet Ihr etwas finden, bringt es zu mir!"},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
				TransferItem{TakeItem = 2390 , GiveItem = 3226 , Flag = Exchange}, 
							QuestSolve{QuestId = 418},
							QuestBegin{QuestId = 419},
							SetRewardFlagTrue{ Name = "Schattenwelt2Rigour"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "rigour018", String = "Ein Buch? Was sollte ein Phantom mit einem Buch anfangen? Ihr müsst Euch irren..."},
			Answer{Tag = "rigour018PC", String = "Seht selbst!", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "rigour019", String = "Das Manifest der Schatten! Dann stimmt die Legende also doch!"},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "rigour020", String = "Dieses Buch wurde einst von einem wahnsinnigen Dunkelelfen verfasst. Es lagerte in den Archiven von Graufurt... bis es eines Tages auf geheimnisvolle Weise verschwand. Man fand den Bibliothekar erfroren im Archiv..."},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "rigour021", String = "Die Schatten selbst müssen es geraubt haben!"},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "rigour022", String = "Hier, der Text berichtet von einem Schattenkristall... der Quelle ihrer Macht! In einer alten Feste des Lichts, verfallen und verflucht, steckt er in einer Wand... von hier aus strömen die Schatten in unsere Welt!"},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "rigour023", String = "Wo immer auch dieser Ort ist, Ihr müsst Euch dorthin begeben! Findet den Kristall - und reißt ihn heraus! Dann hat der Spuk ein Ende..."},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
				TransferItem{TakeItem = 3201 , Flag = Take}, 
						QuestSolve{QuestId = 420},
						QuestBegin{QuestId = 421},
						SetRewardFlagTrue{ Name = "Schattenwelt2aRigour"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{31;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{31;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{31;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
		}}

	OnAnswer{31;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{31;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{31;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{31;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
		}}

	OnAnswer{31;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{31;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{31;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{31;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
		}}

	OnAnswer{31;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{31;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{31;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{31;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "rigour024", String = "Wahrhaftig! Ihr habt den Kristall entfernt und die Macht der Schatten gebrochen!"},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "rigour025", String = "Ich muss zugeben, ich bin beeindruckt!"},
			Answer{Tag = "rigour025PC", String = "Wollt Ihr den Kristall haben?", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "rigour026", String = "Ich? Oh nein, bleibt mir vom Leibe damit! Ich bin ja nicht von Sinnen! Bringt ihn nur Castagir! Er ist verrückt genug, ihn an sich zu nehmen!"},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
				TransferItem{TakeItem = 3226 , Flag = Take},
						QuestSolve{QuestId = 422},
						QuestBegin{QuestId = 530},
						SetRewardFlagTrue{ Name = "Schattenwelt2bRigour"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{36;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{36;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{36;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{36;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
		}}

	OnAnswer{36;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{36;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{36;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{36;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
		}}

	OnAnswer{36;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{36;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{36;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{36;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
		}}

	OnAnswer{36;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{36;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{36;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{36;
		Conditions = {
			QuestState{QuestId = 512 , State = StateUnknown},
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour004PC", String = "Was ist Euer Problem?", AnswerId = 5},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			QuestState{QuestId = 514 , State = StateActive},
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour007PC", String = "Thar ist tot!", AnswerId = 10},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			PlayerHasItem{ItemId = 2390},
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour010PC", String = "Castagir schickt mich mit diesem Ring zu Euch!", AnswerId = 15},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			PlayerHasItem{ItemId = 3201},
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour017PC", String = "Bei einem der Schatten fand ich dieses Buch!", AnswerId = 24},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			PlayerHasItem{ItemId = 3200},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "rigour023PC", String = "Rigour, ich bringe Euch den Schattenkristall!", AnswerId = 32},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(QuestState{QuestId = 512 , State = StateUnknown}),
			Negated(QuestState{QuestId = 514 , State = StateActive}),
			Negated(PlayerHasItem{ItemId = 2390}),
			Negated(PlayerHasItem{ItemId = 3201}),
			Negated(PlayerHasItem{ItemId = 3200}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end