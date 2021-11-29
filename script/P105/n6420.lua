-->INFO: _Knochenquest_Eiselfe
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P105\n6420__Knochenquest_Eiselfe.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "eiselfe105_001", String = "Die Finsternis war schon immer ein Feind des Lebens ... Aber nie war sie bereit, alles auszulöschen! Das ergibt doch keinen Sinn!"},
			Answer{Tag = "eiselfe105_002PC", String = "Die Imperialen folgen nur den Befehlen des Fial Darg. Wenn sie wüssten, was er wirklich plant, wer weiß, ob sie ihm noch folgen würden.", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "eiselfe105_003", String = "Ja. Es gibt auch Diener der Finsternis, die für das Leben ihres Volkes kämpfen und nicht für alte Schwüre."},
			Answer{Tag = "eiselfe105_004PC", String = "Wen meint Ihr?", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "eiselfe105_005", String = "Ein Ork ist gekommen, er steht oben am Tor nach Frostfall! Er wagt sich nicht in die Stadt, aber ich habe gehört, dass er Hilfe sucht gegen die Imperialen."},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "eiselfe105_006", String = "Geht doch einmal zu ihm! Die Weisheit des Ork-Schamanen mag uns nützen. Allerdings wird noch viel Schnee von den Bergen herabkommen, bis eine Elfe einem Ork vertraut."},
			Answer{Tag = "eiselfe105_007PC", String = "Ich werde sehen, was ich tun kann.", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 631},
							  QuestBegin{QuestId = 734},
							  SetGlobalFlagTrue {Name ="P105_AshgorkKannSprechen"},
							  RemoveDialog{NpcId = self},
			Say{Tag = "", String = ""},
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


	EndDefinition()
end