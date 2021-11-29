-->INFO: Gorin
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 1}
--!EDS ONIDLEGOHOME END

--!EDS RESPAWN BEGIN
Respawn{WaitTime=60}
--!EDS RESPAWN END


OnOneTimeEvent
{
Conditions = {
			FigureDead{NpcId = 2276},
			FigureDead{NpcId = 2274},
			FigureDead{NpcId = 2265},
			},
Actions = {
			SetNpcFlagFalse{Name = "GorinQuestionLandshow"}
			}
}

--initial
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
-- Source: C:\project\main\mission\dialoge\p11\n2664_Gorin.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagGorinKnown"},
		},
		Actions = {
			Say{Tag = "gorin001", String = "Na, wen haben wir denn hier? Willkommen auf dem Schwertfels, Freund!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagGorinKnown"}),
			IsNpcFlagFalse{Name = "GorinAskedFirst"},
			IsNpcFlagTrue{Name = "GorinQuestionLandshow"},
			IsNpcFlagTrue{Name = "GorinQuestionLandshow"},
		},
		Actions = {
			Say{Tag = "gorin003", String = "Nun, habt Ihr's Euch anders überlegt? Dieses Schmauchkraut hier wird Euch ordentlich den Schädel durchpusten!"},
			OfferAnswer{Tag = "gorin003PC", String = "Was führt Euch hierher?", AnswerId = 3},
			OfferAnswer{Tag = "gorin005PC", String = "Was habt Ihr über den Schwertfels zu berichten?", AnswerId = 7},
			OfferAnswer{Tag = "gorin006PC", String = "Ein andermal vielleicht! Ich muss weiter..", AnswerId = 9},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagGorinKnown"}),
			IsNpcFlagFalse{Name = "GorinAskedFirst"},
			IsNpcFlagTrue{Name = "GorinQuestionLandshow"},
			Negated(IsNpcFlagTrue{Name = "GorinQuestionLandshow"}),
		},
		Actions = {
			Say{Tag = "gorin003", String = "Nun, habt Ihr's Euch anders überlegt? Dieses Schmauchkraut hier wird Euch ordentlich den Schädel durchpusten!"},
			OfferAnswer{Tag = "gorin003PC", String = "Was führt Euch hierher?", AnswerId = 3},
			OfferAnswer{Tag = "gorin005PC", String = "Was habt Ihr über den Schwertfels zu berichten?", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagGorinKnown"}),
			IsNpcFlagFalse{Name = "GorinAskedFirst"},
			Negated(IsNpcFlagTrue{Name = "GorinQuestionLandshow"}),
			IsNpcFlagTrue{Name = "GorinQuestionLandshow"},
		},
		Actions = {
			Say{Tag = "gorin003", String = "Nun, habt Ihr's Euch anders überlegt? Dieses Schmauchkraut hier wird Euch ordentlich den Schädel durchpusten!"},
			OfferAnswer{Tag = "gorin003PC", String = "Was führt Euch hierher?", AnswerId = 3},
			OfferAnswer{Tag = "gorin006PC", String = "Ein andermal vielleicht! Ich muss weiter..", AnswerId = 9},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagGorinKnown"}),
			IsNpcFlagFalse{Name = "GorinAskedFirst"},
			Negated(IsNpcFlagTrue{Name = "GorinQuestionLandshow"}),
			Negated(IsNpcFlagTrue{Name = "GorinQuestionLandshow"}),
		},
		Actions = {
			Say{Tag = "gorin003", String = "Nun, habt Ihr's Euch anders überlegt? Dieses Schmauchkraut hier wird Euch ordentlich den Schädel durchpusten!"},
			OfferAnswer{Tag = "gorin003PC", String = "Was führt Euch hierher?", AnswerId = 3},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagGorinKnown"}),
			Negated(IsNpcFlagFalse{Name = "GorinAskedFirst"}),
			IsNpcFlagTrue{Name = "GorinQuestionLandshow"},
			IsNpcFlagTrue{Name = "GorinQuestionLandshow"},
		},
		Actions = {
			Say{Tag = "gorin003", String = "Nun, habt Ihr's Euch anders überlegt? Dieses Schmauchkraut hier wird Euch ordentlich den Schädel durchpusten!"},
			OfferAnswer{Tag = "gorin005PC", String = "Was habt Ihr über den Schwertfels zu berichten?", AnswerId = 7},
			OfferAnswer{Tag = "gorin006PC", String = "Ein andermal vielleicht! Ich muss weiter..", AnswerId = 9},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagGorinKnown"}),
			Negated(IsNpcFlagFalse{Name = "GorinAskedFirst"}),
			IsNpcFlagTrue{Name = "GorinQuestionLandshow"},
			Negated(IsNpcFlagTrue{Name = "GorinQuestionLandshow"}),
		},
		Actions = {
			Say{Tag = "gorin003", String = "Nun, habt Ihr's Euch anders überlegt? Dieses Schmauchkraut hier wird Euch ordentlich den Schädel durchpusten!"},
			OfferAnswer{Tag = "gorin005PC", String = "Was habt Ihr über den Schwertfels zu berichten?", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagGorinKnown"}),
			Negated(IsNpcFlagFalse{Name = "GorinAskedFirst"}),
			Negated(IsNpcFlagTrue{Name = "GorinQuestionLandshow"}),
			IsNpcFlagTrue{Name = "GorinQuestionLandshow"},
		},
		Actions = {
			Say{Tag = "gorin003", String = "Nun, habt Ihr's Euch anders überlegt? Dieses Schmauchkraut hier wird Euch ordentlich den Schädel durchpusten!"},
			OfferAnswer{Tag = "gorin006PC", String = "Ein andermal vielleicht! Ich muss weiter..", AnswerId = 9},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagGorinKnown"}),
			Negated(IsNpcFlagFalse{Name = "GorinAskedFirst"}),
			Negated(IsNpcFlagTrue{Name = "GorinQuestionLandshow"}),
			Negated(IsNpcFlagTrue{Name = "GorinQuestionLandshow"}),
		},
		Actions = {
			Say{Tag = "gorin003", String = "Nun, habt Ihr's Euch anders überlegt? Dieses Schmauchkraut hier wird Euch ordentlich den Schädel durchpusten!"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagGorinKnown"},
			Say{Tag = "gorin002", String = "Ich bin Gorin, Gidions Sohn! Kommt, setzt Euch zu mir! Ihr seht aus, als könntet Ihr eine Pfeife vertragen!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			IsNpcFlagFalse{Name = "GorinAskedFirst"},
			IsNpcFlagTrue{Name = "GorinQuestionLandshow"},
			IsNpcFlagTrue{Name = "GorinQuestionLandshow"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gorin003PC", String = "Was führt Euch hierher?", AnswerId = 3},
			OfferAnswer{Tag = "gorin005PC", String = "Was habt Ihr über den Schwertfels zu berichten?", AnswerId = 7},
			OfferAnswer{Tag = "gorin006PC", String = "Ein andermal vielleicht! Ich muss weiter..", AnswerId = 9},
		}}

	OnAnswer{2;
		Conditions = {
			IsNpcFlagFalse{Name = "GorinAskedFirst"},
			IsNpcFlagTrue{Name = "GorinQuestionLandshow"},
			Negated(IsNpcFlagTrue{Name = "GorinQuestionLandshow"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gorin003PC", String = "Was führt Euch hierher?", AnswerId = 3},
			OfferAnswer{Tag = "gorin005PC", String = "Was habt Ihr über den Schwertfels zu berichten?", AnswerId = 7},
		}}

	OnAnswer{2;
		Conditions = {
			IsNpcFlagFalse{Name = "GorinAskedFirst"},
			Negated(IsNpcFlagTrue{Name = "GorinQuestionLandshow"}),
			IsNpcFlagTrue{Name = "GorinQuestionLandshow"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gorin003PC", String = "Was führt Euch hierher?", AnswerId = 3},
			OfferAnswer{Tag = "gorin006PC", String = "Ein andermal vielleicht! Ich muss weiter..", AnswerId = 9},
		}}

	OnAnswer{2;
		Conditions = {
			IsNpcFlagFalse{Name = "GorinAskedFirst"},
			Negated(IsNpcFlagTrue{Name = "GorinQuestionLandshow"}),
			Negated(IsNpcFlagTrue{Name = "GorinQuestionLandshow"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gorin003PC", String = "Was führt Euch hierher?", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "GorinAskedFirst"}),
			IsNpcFlagTrue{Name = "GorinQuestionLandshow"},
			IsNpcFlagTrue{Name = "GorinQuestionLandshow"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gorin005PC", String = "Was habt Ihr über den Schwertfels zu berichten?", AnswerId = 7},
			OfferAnswer{Tag = "gorin006PC", String = "Ein andermal vielleicht! Ich muss weiter..", AnswerId = 9},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "GorinAskedFirst"}),
			IsNpcFlagTrue{Name = "GorinQuestionLandshow"},
			Negated(IsNpcFlagTrue{Name = "GorinQuestionLandshow"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gorin005PC", String = "Was habt Ihr über den Schwertfels zu berichten?", AnswerId = 7},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "GorinAskedFirst"}),
			Negated(IsNpcFlagTrue{Name = "GorinQuestionLandshow"}),
			IsNpcFlagTrue{Name = "GorinQuestionLandshow"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gorin006PC", String = "Ein andermal vielleicht! Ich muss weiter..", AnswerId = 9},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "GorinAskedFirst"}),
			Negated(IsNpcFlagTrue{Name = "GorinQuestionLandshow"}),
			Negated(IsNpcFlagTrue{Name = "GorinQuestionLandshow"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gorin004", String = "Adamantinum, mein Freund! Das kostbarste Metall unter der Sonne! Man findet es hier oben allerdings nur noch sehr selten!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gorin005", String = "Früher war das anders! Ich könnte Euch Geschichten über dieses Land erzählen..."},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "GorinQuestionLandshow"} , SetNpcFlagTrue{Name = "GorinAskedFirst"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
			IsNpcFlagFalse{Name = "GorinAskedFirst"},
			IsNpcFlagTrue{Name = "GorinQuestionLandshow"},
			IsNpcFlagTrue{Name = "GorinQuestionLandshow"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gorin003PC", String = "Was führt Euch hierher?", AnswerId = 3},
			OfferAnswer{Tag = "gorin005PC", String = "Was habt Ihr über den Schwertfels zu berichten?", AnswerId = 7},
			OfferAnswer{Tag = "gorin006PC", String = "Ein andermal vielleicht! Ich muss weiter..", AnswerId = 9},
		}}

	OnAnswer{6;
		Conditions = {
			IsNpcFlagFalse{Name = "GorinAskedFirst"},
			IsNpcFlagTrue{Name = "GorinQuestionLandshow"},
			Negated(IsNpcFlagTrue{Name = "GorinQuestionLandshow"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gorin003PC", String = "Was führt Euch hierher?", AnswerId = 3},
			OfferAnswer{Tag = "gorin005PC", String = "Was habt Ihr über den Schwertfels zu berichten?", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			IsNpcFlagFalse{Name = "GorinAskedFirst"},
			Negated(IsNpcFlagTrue{Name = "GorinQuestionLandshow"}),
			IsNpcFlagTrue{Name = "GorinQuestionLandshow"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gorin003PC", String = "Was führt Euch hierher?", AnswerId = 3},
			OfferAnswer{Tag = "gorin006PC", String = "Ein andermal vielleicht! Ich muss weiter..", AnswerId = 9},
		}}

	OnAnswer{6;
		Conditions = {
			IsNpcFlagFalse{Name = "GorinAskedFirst"},
			Negated(IsNpcFlagTrue{Name = "GorinQuestionLandshow"}),
			Negated(IsNpcFlagTrue{Name = "GorinQuestionLandshow"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gorin003PC", String = "Was führt Euch hierher?", AnswerId = 3},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "GorinAskedFirst"}),
			IsNpcFlagTrue{Name = "GorinQuestionLandshow"},
			IsNpcFlagTrue{Name = "GorinQuestionLandshow"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gorin005PC", String = "Was habt Ihr über den Schwertfels zu berichten?", AnswerId = 7},
			OfferAnswer{Tag = "gorin006PC", String = "Ein andermal vielleicht! Ich muss weiter..", AnswerId = 9},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "GorinAskedFirst"}),
			IsNpcFlagTrue{Name = "GorinQuestionLandshow"},
			Negated(IsNpcFlagTrue{Name = "GorinQuestionLandshow"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gorin005PC", String = "Was habt Ihr über den Schwertfels zu berichten?", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "GorinAskedFirst"}),
			Negated(IsNpcFlagTrue{Name = "GorinQuestionLandshow"}),
			IsNpcFlagTrue{Name = "GorinQuestionLandshow"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gorin006PC", String = "Ein andermal vielleicht! Ich muss weiter..", AnswerId = 9},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "GorinAskedFirst"}),
			Negated(IsNpcFlagTrue{Name = "GorinQuestionLandshow"}),
			Negated(IsNpcFlagTrue{Name = "GorinQuestionLandshow"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gorin006", String = "Das will ich Euch gern sagen..."},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "GorinStartLandshow"},
			EndDialog(),
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gorin007", String = "Dann seht nur zu, dass Ihr auf Euch aufpasst! Ihr seid ein Diener der Rune, nicht wahr?"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gorin008", String = "Ein Rat von mir... haltet Euch hier gleich rechts! Dort findet Ihr ein fruchtbares Tal... ich glaube, da steht noch eines dieser Monumente!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			SetNpcFlagFalse{Name = "GorinQuestionLandshow"}, RevealUnExplored {X = 298,Y = 124, Range = 20},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
			IsNpcFlagFalse{Name = "GorinAskedFirst"},
			IsNpcFlagTrue{Name = "GorinQuestionLandshow"},
			IsNpcFlagTrue{Name = "GorinQuestionLandshow"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gorin003PC", String = "Was führt Euch hierher?", AnswerId = 3},
			OfferAnswer{Tag = "gorin005PC", String = "Was habt Ihr über den Schwertfels zu berichten?", AnswerId = 7},
			OfferAnswer{Tag = "gorin006PC", String = "Ein andermal vielleicht! Ich muss weiter..", AnswerId = 9},
		}}

	OnAnswer{12;
		Conditions = {
			IsNpcFlagFalse{Name = "GorinAskedFirst"},
			IsNpcFlagTrue{Name = "GorinQuestionLandshow"},
			Negated(IsNpcFlagTrue{Name = "GorinQuestionLandshow"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gorin003PC", String = "Was führt Euch hierher?", AnswerId = 3},
			OfferAnswer{Tag = "gorin005PC", String = "Was habt Ihr über den Schwertfels zu berichten?", AnswerId = 7},
		}}

	OnAnswer{12;
		Conditions = {
			IsNpcFlagFalse{Name = "GorinAskedFirst"},
			Negated(IsNpcFlagTrue{Name = "GorinQuestionLandshow"}),
			IsNpcFlagTrue{Name = "GorinQuestionLandshow"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gorin003PC", String = "Was führt Euch hierher?", AnswerId = 3},
			OfferAnswer{Tag = "gorin006PC", String = "Ein andermal vielleicht! Ich muss weiter..", AnswerId = 9},
		}}

	OnAnswer{12;
		Conditions = {
			IsNpcFlagFalse{Name = "GorinAskedFirst"},
			Negated(IsNpcFlagTrue{Name = "GorinQuestionLandshow"}),
			Negated(IsNpcFlagTrue{Name = "GorinQuestionLandshow"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gorin003PC", String = "Was führt Euch hierher?", AnswerId = 3},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "GorinAskedFirst"}),
			IsNpcFlagTrue{Name = "GorinQuestionLandshow"},
			IsNpcFlagTrue{Name = "GorinQuestionLandshow"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gorin005PC", String = "Was habt Ihr über den Schwertfels zu berichten?", AnswerId = 7},
			OfferAnswer{Tag = "gorin006PC", String = "Ein andermal vielleicht! Ich muss weiter..", AnswerId = 9},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "GorinAskedFirst"}),
			IsNpcFlagTrue{Name = "GorinQuestionLandshow"},
			Negated(IsNpcFlagTrue{Name = "GorinQuestionLandshow"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gorin005PC", String = "Was habt Ihr über den Schwertfels zu berichten?", AnswerId = 7},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "GorinAskedFirst"}),
			Negated(IsNpcFlagTrue{Name = "GorinQuestionLandshow"}),
			IsNpcFlagTrue{Name = "GorinQuestionLandshow"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gorin006PC", String = "Ein andermal vielleicht! Ich muss weiter..", AnswerId = 9},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "GorinAskedFirst"}),
			Negated(IsNpcFlagTrue{Name = "GorinQuestionLandshow"}),
			Negated(IsNpcFlagTrue{Name = "GorinQuestionLandshow"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end