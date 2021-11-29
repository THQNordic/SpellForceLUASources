-->INFO: Ragnar
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 5}
--!EDS ONIDLEGOHOME END


--!EDS RESPAWN BEGIN
Respawn{WaitTime=30}
--!EDS RESPAWN END


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
-- Source: C:\project\main\mission\dialoge\p10\n2180_Ragnar.txt


	

	OnBeginDialog{
		Conditions = {
			IsGlobalFlagTrue{Name = "Q124SkarvigOKGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q124SkarvigOKGiven"}),
		},
		Actions = {
			Say{Tag = "ragnar019", String = "Euresgleichen ist hier nicht gern gesehen, Mensch! Ich rate Euch, rasch weiterzureisen!"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagRagnarKnown"}),
			IsNpcFlagFalse{Name = "QuestionStoneblade"},
			QuestState{QuestId = 148 , State = StateUnknown},
			UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "ragnar005", String = "Niethalfs Segen, Mensch!"},
			OfferAnswer{Tag = "ragnar005PC", String = "Was ist der Schwertfels?", AnswerId = 5},
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das für ein Riese?", AnswerId = 11},
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas über einen weißen Wolf?", AnswerId = 19},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagRagnarKnown"}),
			IsNpcFlagFalse{Name = "QuestionStoneblade"},
			QuestState{QuestId = 148 , State = StateUnknown},
			Negated(UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "ragnar005", String = "Niethalfs Segen, Mensch!"},
			OfferAnswer{Tag = "ragnar005PC", String = "Was ist der Schwertfels?", AnswerId = 5},
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das für ein Riese?", AnswerId = 11},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagRagnarKnown"}),
			IsNpcFlagFalse{Name = "QuestionStoneblade"},
			Negated(QuestState{QuestId = 148 , State = StateUnknown}),
			UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "ragnar005", String = "Niethalfs Segen, Mensch!"},
			OfferAnswer{Tag = "ragnar005PC", String = "Was ist der Schwertfels?", AnswerId = 5},
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas über einen weißen Wolf?", AnswerId = 19},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagRagnarKnown"}),
			IsNpcFlagFalse{Name = "QuestionStoneblade"},
			Negated(QuestState{QuestId = 148 , State = StateUnknown}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "ragnar005", String = "Niethalfs Segen, Mensch!"},
			OfferAnswer{Tag = "ragnar005PC", String = "Was ist der Schwertfels?", AnswerId = 5},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagRagnarKnown"}),
			Negated(IsNpcFlagFalse{Name = "QuestionStoneblade"}),
			QuestState{QuestId = 148 , State = StateUnknown},
			UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "ragnar005", String = "Niethalfs Segen, Mensch!"},
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das für ein Riese?", AnswerId = 11},
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas über einen weißen Wolf?", AnswerId = 19},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagRagnarKnown"}),
			Negated(IsNpcFlagFalse{Name = "QuestionStoneblade"}),
			QuestState{QuestId = 148 , State = StateUnknown},
			Negated(UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "ragnar005", String = "Niethalfs Segen, Mensch!"},
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das für ein Riese?", AnswerId = 11},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagRagnarKnown"}),
			Negated(IsNpcFlagFalse{Name = "QuestionStoneblade"}),
			Negated(QuestState{QuestId = 148 , State = StateUnknown}),
			UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "ragnar005", String = "Niethalfs Segen, Mensch!"},
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas über einen weißen Wolf?", AnswerId = 19},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagRagnarKnown"}),
			Negated(IsNpcFlagFalse{Name = "QuestionStoneblade"}),
			Negated(QuestState{QuestId = 148 , State = StateUnknown}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "ragnar005", String = "Niethalfs Segen, Mensch!"},
		}}

	OnAnswer{1;
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagRagnarKnown"},
		},
		Actions = {
			Say{Tag = "ragnar001", String = "Ich hörte, Skarvig bürgt für Euch! Seid willkommen in diesem Land!"},
			Answer{Tag = "ragnar001PC", String = "Danke! Ihr seid der Hauptmann der Wache?", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ragnar002", String = "Das bin ich! Ragnar Thorginson ist mein Name!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagRagnarKnown"},
			Say{Tag = "ragnar003", String = "Ich weiß nicht, ob ich Euch schon vor dem Riesen gewarnt habe! Falls nicht, dann tue ich es hiermit! Vom Schwertfels her kam er in unser Land!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionStoneblade"},
			QuestState{QuestId = 148 , State = StateUnknown},
			UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "ragnar004", String = "Er ist eine alte, bösartige Kreatur! Solltet Ihr ihn erblicken, dann flüchtet zurück in die Stadt! Versucht nicht, gegen ihn zu kämpfen, hört Ihr!"},
			OfferAnswer{Tag = "ragnar005PC", String = "Was ist der Schwertfels?", AnswerId = 5},
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das für ein Riese?", AnswerId = 11},
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas über einen weißen Wolf?", AnswerId = 19},
		}}

	OnAnswer{4;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionStoneblade"},
			QuestState{QuestId = 148 , State = StateUnknown},
			Negated(UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "ragnar004", String = "Er ist eine alte, bösartige Kreatur! Solltet Ihr ihn erblicken, dann flüchtet zurück in die Stadt! Versucht nicht, gegen ihn zu kämpfen, hört Ihr!"},
			OfferAnswer{Tag = "ragnar005PC", String = "Was ist der Schwertfels?", AnswerId = 5},
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das für ein Riese?", AnswerId = 11},
		}}

	OnAnswer{4;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionStoneblade"},
			Negated(QuestState{QuestId = 148 , State = StateUnknown}),
			UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "ragnar004", String = "Er ist eine alte, bösartige Kreatur! Solltet Ihr ihn erblicken, dann flüchtet zurück in die Stadt! Versucht nicht, gegen ihn zu kämpfen, hört Ihr!"},
			OfferAnswer{Tag = "ragnar005PC", String = "Was ist der Schwertfels?", AnswerId = 5},
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas über einen weißen Wolf?", AnswerId = 19},
		}}

	OnAnswer{4;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionStoneblade"},
			Negated(QuestState{QuestId = 148 , State = StateUnknown}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "ragnar004", String = "Er ist eine alte, bösartige Kreatur! Solltet Ihr ihn erblicken, dann flüchtet zurück in die Stadt! Versucht nicht, gegen ihn zu kämpfen, hört Ihr!"},
			OfferAnswer{Tag = "ragnar005PC", String = "Was ist der Schwertfels?", AnswerId = 5},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionStoneblade"}),
			QuestState{QuestId = 148 , State = StateUnknown},
			UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "ragnar004", String = "Er ist eine alte, bösartige Kreatur! Solltet Ihr ihn erblicken, dann flüchtet zurück in die Stadt! Versucht nicht, gegen ihn zu kämpfen, hört Ihr!"},
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das für ein Riese?", AnswerId = 11},
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas über einen weißen Wolf?", AnswerId = 19},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionStoneblade"}),
			QuestState{QuestId = 148 , State = StateUnknown},
			Negated(UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "ragnar004", String = "Er ist eine alte, bösartige Kreatur! Solltet Ihr ihn erblicken, dann flüchtet zurück in die Stadt! Versucht nicht, gegen ihn zu kämpfen, hört Ihr!"},
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das für ein Riese?", AnswerId = 11},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionStoneblade"}),
			Negated(QuestState{QuestId = 148 , State = StateUnknown}),
			UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "ragnar004", String = "Er ist eine alte, bösartige Kreatur! Solltet Ihr ihn erblicken, dann flüchtet zurück in die Stadt! Versucht nicht, gegen ihn zu kämpfen, hört Ihr!"},
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas über einen weißen Wolf?", AnswerId = 19},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionStoneblade"}),
			Negated(QuestState{QuestId = 148 , State = StateUnknown}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "ragnar004", String = "Er ist eine alte, bösartige Kreatur! Solltet Ihr ihn erblicken, dann flüchtet zurück in die Stadt! Versucht nicht, gegen ihn zu kämpfen, hört Ihr!"},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ragnar006", String = "Der Schwertfels ist eine Insel, südwestlich von hier! Einst besaßen wir dort große Minen und schürften kostbares Adamant aus der Erde!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ragnar007", String = "Doch heute sind die Minen zerstört und der Schwertfels ist in der Hand von Bestien und Trollen! Bis vor kurzem wagte sich noch der ein oder andere Abenteurer dort hinauf, um Schätze aus alten Tagen zu erbeuten!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ragnar008", String = "Mein Bruder Gorin war einer von ihnen! Doch dann kam der Riese Hörgr vom Schwertfels! Er erschlug die Wachen am Steintor, das uns vor den Kreaturen schützen sollte, und nahm ihnen die Schlüssel ab!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ragnar009", String = "Somit ist der Weg zu den Schätzen des Schwertfels für immer versperrt! Es sei denn, jemand findet einen Weg, dem Riesen die Schlüssel wieder abzujagen!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "QuestionStoneblade"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionStoneblade"},
			QuestState{QuestId = 148 , State = StateUnknown},
			UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ragnar005PC", String = "Was ist der Schwertfels?", AnswerId = 5},
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das für ein Riese?", AnswerId = 11},
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas über einen weißen Wolf?", AnswerId = 19},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionStoneblade"},
			QuestState{QuestId = 148 , State = StateUnknown},
			Negated(UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ragnar005PC", String = "Was ist der Schwertfels?", AnswerId = 5},
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das für ein Riese?", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionStoneblade"},
			Negated(QuestState{QuestId = 148 , State = StateUnknown}),
			UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ragnar005PC", String = "Was ist der Schwertfels?", AnswerId = 5},
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas über einen weißen Wolf?", AnswerId = 19},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionStoneblade"},
			Negated(QuestState{QuestId = 148 , State = StateUnknown}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ragnar005PC", String = "Was ist der Schwertfels?", AnswerId = 5},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionStoneblade"}),
			QuestState{QuestId = 148 , State = StateUnknown},
			UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das für ein Riese?", AnswerId = 11},
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas über einen weißen Wolf?", AnswerId = 19},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionStoneblade"}),
			QuestState{QuestId = 148 , State = StateUnknown},
			Negated(UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das für ein Riese?", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionStoneblade"}),
			Negated(QuestState{QuestId = 148 , State = StateUnknown}),
			UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas über einen weißen Wolf?", AnswerId = 19},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionStoneblade"}),
			Negated(QuestState{QuestId = 148 , State = StateUnknown}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ragnar010", String = "Er ist ein uraltes Monstrum von unglaublicher Kraft! Er erschlägt meine Brüder und wischt sie hinweg wie Fliegen! Unser Heer kann ihn nicht besiegen!"},
			Answer{Tag = "ragnar010PC", String = "Wenn Heere versagen, muss man es mit einer List versuchen!", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ragnar011", String = "Wir sind Krieger und keine Strauchdiebe! Täuschungen und Gifte sind etwas für Menschen, nicht für Zwerge!"},
			Answer{Tag = "ragnar011PC", String = "Gifte...", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ragnar012", String = "Was? Welche Narretei brütet Ihr da jetzt aus?"},
			Answer{Tag = "ragnar012PC", String = "Ihr habt mich auf eine Idee gebracht, Freund Ragnar!", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ragnar013", String = "Was? Wie?"},
			Answer{Tag = "ragnar013PC", String = "Sagt, gibt es einen Alchimisten in der Stadt?", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ragnar014", String = "Äh... Lorderic Svartlar befasst sich mit solcherlei... Ihr wollt doch nicht..."},
			Answer{Tag = "ragnar014PC", String = "Vertraut mir! Mit etwas Glück ist Euer Riesenproblem vielleicht bald gelöst!", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ragnar015", String = "Potzdonner! Dann geht doch zu Lorderic! Der hat vielleicht ein Ohr für Eure Späße!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 148} , QuestBegin{QuestId = 150},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionStoneblade"},
			QuestState{QuestId = 148 , State = StateUnknown},
			UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ragnar005PC", String = "Was ist der Schwertfels?", AnswerId = 5},
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das für ein Riese?", AnswerId = 11},
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas über einen weißen Wolf?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionStoneblade"},
			QuestState{QuestId = 148 , State = StateUnknown},
			Negated(UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ragnar005PC", String = "Was ist der Schwertfels?", AnswerId = 5},
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das für ein Riese?", AnswerId = 11},
		}}

	OnAnswer{18;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionStoneblade"},
			Negated(QuestState{QuestId = 148 , State = StateUnknown}),
			UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ragnar005PC", String = "Was ist der Schwertfels?", AnswerId = 5},
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas über einen weißen Wolf?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionStoneblade"},
			Negated(QuestState{QuestId = 148 , State = StateUnknown}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ragnar005PC", String = "Was ist der Schwertfels?", AnswerId = 5},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionStoneblade"}),
			QuestState{QuestId = 148 , State = StateUnknown},
			UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das für ein Riese?", AnswerId = 11},
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas über einen weißen Wolf?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionStoneblade"}),
			QuestState{QuestId = 148 , State = StateUnknown},
			Negated(UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das für ein Riese?", AnswerId = 11},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionStoneblade"}),
			Negated(QuestState{QuestId = 148 , State = StateUnknown}),
			UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas über einen weißen Wolf?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionStoneblade"}),
			Negated(QuestState{QuestId = 148 , State = StateUnknown}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ragnar016", String = "Sprecht Ihr von Tinara? So nennen die Leute sie hier! Sie und ihr Gefährte Tarnar sind die beiden letzten großen Weißwölfe in dieser Gegend!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ragnar017", String = "Und es werden wohl auch die beiden letzten bleiben! Tinara hat vor wenigen Tagen ihr Welpe verloren! Und Tarnar ist alt, er wird nicht mehr lange leben!"},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ragnar018", String = "Diese Wölfe sind edle Tiere! Stark, zäh und elegant! Sie haben die Seele von Kriegern!"},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 161}, QuestBegin{QuestId = 162} , TransferXP{XP = 200 , Flag = Give} , SetPlayerFlagFalse{Name = "Q161HasSeenWolf"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionStoneblade"},
			QuestState{QuestId = 148 , State = StateUnknown},
			UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ragnar005PC", String = "Was ist der Schwertfels?", AnswerId = 5},
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das für ein Riese?", AnswerId = 11},
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas über einen weißen Wolf?", AnswerId = 19},
		}}

	OnAnswer{23;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionStoneblade"},
			QuestState{QuestId = 148 , State = StateUnknown},
			Negated(UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ragnar005PC", String = "Was ist der Schwertfels?", AnswerId = 5},
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das für ein Riese?", AnswerId = 11},
		}}

	OnAnswer{23;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionStoneblade"},
			Negated(QuestState{QuestId = 148 , State = StateUnknown}),
			UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ragnar005PC", String = "Was ist der Schwertfels?", AnswerId = 5},
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas über einen weißen Wolf?", AnswerId = 19},
		}}

	OnAnswer{23;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionStoneblade"},
			Negated(QuestState{QuestId = 148 , State = StateUnknown}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ragnar005PC", String = "Was ist der Schwertfels?", AnswerId = 5},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionStoneblade"}),
			QuestState{QuestId = 148 , State = StateUnknown},
			UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das für ein Riese?", AnswerId = 11},
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas über einen weißen Wolf?", AnswerId = 19},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionStoneblade"}),
			QuestState{QuestId = 148 , State = StateUnknown},
			Negated(UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das für ein Riese?", AnswerId = 11},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionStoneblade"}),
			Negated(QuestState{QuestId = 148 , State = StateUnknown}),
			UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas über einen weißen Wolf?", AnswerId = 19},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionStoneblade"}),
			Negated(QuestState{QuestId = 148 , State = StateUnknown}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ragnar020", String = "Ihr mögt Euch hier frei bewegen und in unserer Stadt Handel treiben! Aber solange Ihr keinen Fürsprecher habt, werdet Ihr bei uns wenig Freundlichkeit vorfinden!"},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ragnar021", String = "Und noch etwas! Im Süden unseres Landes treibt ein Riese sein Unwesen! Wenn Ihr ihn seht, flieht besser in die Stadt zurück!"},
		}}


	EndDefinition()
end