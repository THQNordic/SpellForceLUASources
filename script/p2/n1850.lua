-->INFO: Sindare
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
Respawn{WaitTime=30}
--!EDS RESPAWN END

OnIdleGoHome{X = 187, Y = 231, Direction = 2}

--Dialogsteuerung
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
-- Source: C:\project\main\mission\dialoge\p2\n1850_Sindare.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "FlagSindareKnown"},
		},
		Actions = {
			Say{Tag = "sindare001", String = "Was führt Euch hierher?"},
			Answer{Tag = "sindare001PC", String = "Ein Auftrag des Ordens! Ist dies die Siedlung der Eloni?", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSindareKnown"}),
			UND(IsGlobalFlagTrue{Name = "EloniSupportRangersAllDead"} , IsNpcFlagFalse{Name = "RangersAsked"}),
		},
		Actions = {
			Say{Tag = "sindare005", String = "Seid gegrüßt!"},
			OfferAnswer{Tag = "sindare005PC", String = "Könnt Ihr mir Krieger zur Seite stellen?", AnswerId = 4},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSindareKnown"}),
			Negated(UND(IsGlobalFlagTrue{Name = "EloniSupportRangersAllDead"} , IsNpcFlagFalse{Name = "RangersAsked"})),
		},
		Actions = {
			Say{Tag = "sindare005", String = "Seid gegrüßt!"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sindare002", String = "Nein, sie liegt auf der anderen Seite des Hügels! Ihr müsst durch das Waldtal, um sie zu erreichen!"},
			Answer{Tag = "sindare002PC", String = "Wie ist Eure Lage hier?", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sindare003", String = "Beinahe hoffnungslos! Noch konzentrieren sich die meisten Angriffe direkt auf die Siedlung! Solange das so bleibt, können wir uns halten! Doch was danach ist, daran wage ich nicht einmal zu denken..."},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
			UND(IsGlobalFlagTrue{Name = "EloniSupportRangersAllDead"} , IsNpcFlagFalse{Name = "RangersAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagSindareKnown"},
			Say{Tag = "sindare004", String = "Wir haben viele Verwundete aus dem Wald geborgen! Ich muss mich um sie kümmern! Ihr entschuldigt mich!"},
			OfferAnswer{Tag = "sindare005PC", String = "Könnt Ihr mir Krieger zur Seite stellen?", AnswerId = 4},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(IsGlobalFlagTrue{Name = "EloniSupportRangersAllDead"} , IsNpcFlagFalse{Name = "RangersAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagSindareKnown"},
			Say{Tag = "sindare004", String = "Wir haben viele Verwundete aus dem Wald geborgen! Ich muss mich um sie kümmern! Ihr entschuldigt mich!"},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "EloniSupportRangersDeadAndTimerOk"}),
		},
		Actions = {
			Say{Tag = "sindare008", String = "Die meisten der Verwundeten sind noch zu schwach, um schon wieder kämpfen zu können!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{4;
		Conditions = {
			IsGlobalFlagTrue{Name = "EloniSupportRangersDeadAndTimerOk"},
		},
		Actions = {
			Say{Tag = "sindare006", String = "Hmm... einige der Verletzten sind wieder soweit genesen, dass sie Euch begleiten könnten."},
			Answer{Tag = "sindare006PC", String = "Gut! Die Bögen Eurer Schwestern werden eine große Hilfe sein!", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "EloniSupportRangersSpawning"},
			SetGlobalTimeStamp{Name = "EloniSupportRangersTimer"}, SetNpcFlagTrue{Name = "RangersAsked"},
			Say{Tag = "sindare007", String = "Hier sind sie! Sie werden Euch folgen - wenn es sein muss bis in den Tod! Hoffen wir, dass es dazu nicht kommt! Viel Glück!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
			UND(IsGlobalFlagTrue{Name = "EloniSupportRangersAllDead"} , IsNpcFlagFalse{Name = "RangersAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sindare005PC", String = "Könnt Ihr mir Krieger zur Seite stellen?", AnswerId = 4},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND(IsGlobalFlagTrue{Name = "EloniSupportRangersAllDead"} , IsNpcFlagFalse{Name = "RangersAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sindare009", String = "Gebt ihnen etwas Zeit, sich auszuruhen und wieder zu Kräften zu kommen!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
			UND(IsGlobalFlagTrue{Name = "EloniSupportRangersAllDead"} , IsNpcFlagFalse{Name = "RangersAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sindare005PC", String = "Könnt Ihr mir Krieger zur Seite stellen?", AnswerId = 4},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND(IsGlobalFlagTrue{Name = "EloniSupportRangersAllDead"} , IsNpcFlagFalse{Name = "RangersAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end