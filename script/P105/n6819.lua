-->INFO: Cenwen
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 1}
--!EDS ONIDLEGOHOME END

SpawnOnlyWhen
{
	X = _X, Y = _Y, NoSpawnEffect = TRUE,
	Conditions =
	{
		QuestState{QuestId = 694 , State = StateActive},
	},
}




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P105\n6819_Cenwen.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "Known"},
		},
		Actions = {
			Say{Tag = "cenwen105_001", String = "Ihr habt Recht, viel Zeit ist vergangen ... diese Welt hat sich verändert, wenn man sie überhaupt noch so nennen will ..."},
			Answer{Tag = "cenwen105_002PC", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
		},
		Actions = {
			Say{Tag = "cenwen105_006", String = "Freund?"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "cenwen105_003", String = "Ich habe mein Opfer für eine andere Welt gebracht. Eine Welt ohne ... Portale, oder Wesen wie Ihr eines seid ..."},
			Answer{Tag = "cenwen105_004PC", String = "Wahnsinnige Magier haben diese Welt und mich zu dem gemacht, was wir sind. Für uns gibt es kein Zurück.", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "cenwen105_005", String = "Für mich auch nicht. Mein Platz ist an der Seite Aryns. Bis zum Ende der Zeit."},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			QuestSolve {QuestId = 694},
						  QuestSolve {QuestId = 719},
						  QuestSolve {QuestId = 627},
						  QuestBegin {QuestId = 657},
						  QuestBegin {QuestId = 695},
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
			IsNpcFlagFalse{Name = "GoNorth"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "cenwen105_007PC", String = "Lasst uns zu Aryn aufbrechen!", AnswerId = 6},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "GoNorth"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "cenwen105_008", String = "Ja, das werden wir. Aber der Frostweber wird uns nicht anhören. Er wird mich nicht einmal erkennen!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "cenwen105_009", String = "Der Dunkle hat einen Bann um Aryn gewoben und ihm seine Sinne geraubt. Nur so war es dem Dunklen möglich, mich zu verschleppen."},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "cenwen105_010", String = "Dieser Bann muss gebrochen werden. Aryn muss aus seinem Zorneswahn aufwachen, aber dafür müsst Ihr ihn schwächen!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "cenwen105_011", String = "Es wird nicht einfach, aber Ihr werdet gegen den Frostweber kämpfen müssen. Nur wenn er schwach ist, kann ich den Bann brechen und er wird mich erkennen."},
			Answer{Tag = "cenwen105_012PC", String = "Gegen den Frostweber ... kämpfen?", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "cenwen105_013", String = "Es gibt keinen anderen Weg. Aber noch liegt der Gletscher mit seinen Gefahren vor uns! Meinen Schwestern verbietet der Glaube, gegen Aryn zu kämpfen, aber ich hörte, die Zwerge haben bereits Hilfe geschickt."},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "cenwen105_014", String = "Man wird Euch die heiligen Tore öffnen. Geht nach Norden in den Gletscherbruch, wir treffen uns dort."},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "GoNorth"},
					SetGlobalFlagTrue { Name = "P105_NorthDragonGateOpen"},
			RemoveDialog {NpcId = self},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end