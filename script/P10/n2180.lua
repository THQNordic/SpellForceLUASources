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
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das f�r ein Riese?", AnswerId = 11},
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas �ber einen wei�en Wolf?", AnswerId = 19},
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
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das f�r ein Riese?", AnswerId = 11},
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
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas �ber einen wei�en Wolf?", AnswerId = 19},
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
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das f�r ein Riese?", AnswerId = 11},
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas �ber einen wei�en Wolf?", AnswerId = 19},
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
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das f�r ein Riese?", AnswerId = 11},
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
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas �ber einen wei�en Wolf?", AnswerId = 19},
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
			Say{Tag = "ragnar001", String = "Ich h�rte, Skarvig b�rgt f�r Euch! Seid willkommen in diesem Land!"},
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
			Say{Tag = "ragnar003", String = "Ich wei� nicht, ob ich Euch schon vor dem Riesen gewarnt habe! Falls nicht, dann tue ich es hiermit! Vom Schwertfels her kam er in unser Land!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionStoneblade"},
			QuestState{QuestId = 148 , State = StateUnknown},
			UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "ragnar004", String = "Er ist eine alte, b�sartige Kreatur! Solltet Ihr ihn erblicken, dann fl�chtet zur�ck in die Stadt! Versucht nicht, gegen ihn zu k�mpfen, h�rt Ihr!"},
			OfferAnswer{Tag = "ragnar005PC", String = "Was ist der Schwertfels?", AnswerId = 5},
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das f�r ein Riese?", AnswerId = 11},
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas �ber einen wei�en Wolf?", AnswerId = 19},
		}}

	OnAnswer{4;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionStoneblade"},
			QuestState{QuestId = 148 , State = StateUnknown},
			Negated(UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "ragnar004", String = "Er ist eine alte, b�sartige Kreatur! Solltet Ihr ihn erblicken, dann fl�chtet zur�ck in die Stadt! Versucht nicht, gegen ihn zu k�mpfen, h�rt Ihr!"},
			OfferAnswer{Tag = "ragnar005PC", String = "Was ist der Schwertfels?", AnswerId = 5},
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das f�r ein Riese?", AnswerId = 11},
		}}

	OnAnswer{4;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionStoneblade"},
			Negated(QuestState{QuestId = 148 , State = StateUnknown}),
			UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "ragnar004", String = "Er ist eine alte, b�sartige Kreatur! Solltet Ihr ihn erblicken, dann fl�chtet zur�ck in die Stadt! Versucht nicht, gegen ihn zu k�mpfen, h�rt Ihr!"},
			OfferAnswer{Tag = "ragnar005PC", String = "Was ist der Schwertfels?", AnswerId = 5},
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas �ber einen wei�en Wolf?", AnswerId = 19},
		}}

	OnAnswer{4;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionStoneblade"},
			Negated(QuestState{QuestId = 148 , State = StateUnknown}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "ragnar004", String = "Er ist eine alte, b�sartige Kreatur! Solltet Ihr ihn erblicken, dann fl�chtet zur�ck in die Stadt! Versucht nicht, gegen ihn zu k�mpfen, h�rt Ihr!"},
			OfferAnswer{Tag = "ragnar005PC", String = "Was ist der Schwertfels?", AnswerId = 5},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionStoneblade"}),
			QuestState{QuestId = 148 , State = StateUnknown},
			UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "ragnar004", String = "Er ist eine alte, b�sartige Kreatur! Solltet Ihr ihn erblicken, dann fl�chtet zur�ck in die Stadt! Versucht nicht, gegen ihn zu k�mpfen, h�rt Ihr!"},
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das f�r ein Riese?", AnswerId = 11},
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas �ber einen wei�en Wolf?", AnswerId = 19},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionStoneblade"}),
			QuestState{QuestId = 148 , State = StateUnknown},
			Negated(UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "ragnar004", String = "Er ist eine alte, b�sartige Kreatur! Solltet Ihr ihn erblicken, dann fl�chtet zur�ck in die Stadt! Versucht nicht, gegen ihn zu k�mpfen, h�rt Ihr!"},
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das f�r ein Riese?", AnswerId = 11},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionStoneblade"}),
			Negated(QuestState{QuestId = 148 , State = StateUnknown}),
			UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "ragnar004", String = "Er ist eine alte, b�sartige Kreatur! Solltet Ihr ihn erblicken, dann fl�chtet zur�ck in die Stadt! Versucht nicht, gegen ihn zu k�mpfen, h�rt Ihr!"},
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas �ber einen wei�en Wolf?", AnswerId = 19},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionStoneblade"}),
			Negated(QuestState{QuestId = 148 , State = StateUnknown}),
			Negated(UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "ragnar004", String = "Er ist eine alte, b�sartige Kreatur! Solltet Ihr ihn erblicken, dann fl�chtet zur�ck in die Stadt! Versucht nicht, gegen ihn zu k�mpfen, h�rt Ihr!"},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ragnar006", String = "Der Schwertfels ist eine Insel, s�dwestlich von hier! Einst besa�en wir dort gro�e Minen und sch�rften kostbares Adamant aus der Erde!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ragnar007", String = "Doch heute sind die Minen zerst�rt und der Schwertfels ist in der Hand von Bestien und Trollen! Bis vor kurzem wagte sich noch der ein oder andere Abenteurer dort hinauf, um Sch�tze aus alten Tagen zu erbeuten!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ragnar008", String = "Mein Bruder Gorin war einer von ihnen! Doch dann kam der Riese H�rgr vom Schwertfels! Er erschlug die Wachen am Steintor, das uns vor den Kreaturen sch�tzen sollte, und nahm ihnen die Schl�ssel ab!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ragnar009", String = "Somit ist der Weg zu den Sch�tzen des Schwertfels f�r immer versperrt! Es sei denn, jemand findet einen Weg, dem Riesen die Schl�ssel wieder abzujagen!"},
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
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das f�r ein Riese?", AnswerId = 11},
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas �ber einen wei�en Wolf?", AnswerId = 19},
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
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das f�r ein Riese?", AnswerId = 11},
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
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas �ber einen wei�en Wolf?", AnswerId = 19},
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
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das f�r ein Riese?", AnswerId = 11},
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas �ber einen wei�en Wolf?", AnswerId = 19},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionStoneblade"}),
			QuestState{QuestId = 148 , State = StateUnknown},
			Negated(UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das f�r ein Riese?", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionStoneblade"}),
			Negated(QuestState{QuestId = 148 , State = StateUnknown}),
			UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas �ber einen wei�en Wolf?", AnswerId = 19},
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
			Say{Tag = "ragnar010", String = "Er ist ein uraltes Monstrum von unglaublicher Kraft! Er erschl�gt meine Br�der und wischt sie hinweg wie Fliegen! Unser Heer kann ihn nicht besiegen!"},
			Answer{Tag = "ragnar010PC", String = "Wenn Heere versagen, muss man es mit einer List versuchen!", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ragnar011", String = "Wir sind Krieger und keine Strauchdiebe! T�uschungen und Gifte sind etwas f�r Menschen, nicht f�r Zwerge!"},
			Answer{Tag = "ragnar011PC", String = "Gifte...", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ragnar012", String = "Was? Welche Narretei br�tet Ihr da jetzt aus?"},
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
			Say{Tag = "ragnar014", String = "�h... Lorderic Svartlar befasst sich mit solcherlei... Ihr wollt doch nicht..."},
			Answer{Tag = "ragnar014PC", String = "Vertraut mir! Mit etwas Gl�ck ist Euer Riesenproblem vielleicht bald gel�st!", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ragnar015", String = "Potzdonner! Dann geht doch zu Lorderic! Der hat vielleicht ein Ohr f�r Eure Sp��e!"},
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
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das f�r ein Riese?", AnswerId = 11},
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas �ber einen wei�en Wolf?", AnswerId = 19},
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
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das f�r ein Riese?", AnswerId = 11},
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
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas �ber einen wei�en Wolf?", AnswerId = 19},
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
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das f�r ein Riese?", AnswerId = 11},
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas �ber einen wei�en Wolf?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionStoneblade"}),
			QuestState{QuestId = 148 , State = StateUnknown},
			Negated(UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das f�r ein Riese?", AnswerId = 11},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionStoneblade"}),
			Negated(QuestState{QuestId = 148 , State = StateUnknown}),
			UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas �ber einen wei�en Wolf?", AnswerId = 19},
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
			Say{Tag = "ragnar016", String = "Sprecht Ihr von Tinara? So nennen die Leute sie hier! Sie und ihr Gef�hrte Tarnar sind die beiden letzten gro�en Wei�w�lfe in dieser Gegend!"},
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
			Say{Tag = "ragnar018", String = "Diese W�lfe sind edle Tiere! Stark, z�h und elegant! Sie haben die Seele von Kriegern!"},
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
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das f�r ein Riese?", AnswerId = 11},
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas �ber einen wei�en Wolf?", AnswerId = 19},
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
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das f�r ein Riese?", AnswerId = 11},
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
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas �ber einen wei�en Wolf?", AnswerId = 19},
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
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das f�r ein Riese?", AnswerId = 11},
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas �ber einen wei�en Wolf?", AnswerId = 19},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionStoneblade"}),
			QuestState{QuestId = 148 , State = StateUnknown},
			Negated(UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ragnar009PC", String = "Was ist das f�r ein Riese?", AnswerId = 11},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionStoneblade"}),
			Negated(QuestState{QuestId = 148 , State = StateUnknown}),
			UND(IsPlayerFlagTrue{Name = "Q161HasSeenWolf"} , QuestState{QuestId = 161 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ragnar015PC", String = "Wisst Ihr etwas �ber einen wei�en Wolf?", AnswerId = 19},
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
			Say{Tag = "ragnar020", String = "Ihr m�gt Euch hier frei bewegen und in unserer Stadt Handel treiben! Aber solange Ihr keinen F�rsprecher habt, werdet Ihr bei uns wenig Freundlichkeit vorfinden!"},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ragnar021", String = "Und noch etwas! Im S�den unseres Landes treibt ein Riese sein Unwesen! Wenn Ihr ihn seht, flieht besser in die Stadt zur�ck!"},
		}}


	EndDefinition()
end