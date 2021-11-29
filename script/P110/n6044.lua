-->INFO: Sonnenpriester
--INFO GUL ZALDURE, Sonnenpriester

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P110\n6044_Sonnenpriester.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "sonnenpriester110_001", String = "Das ... das kann nicht sein! Nichts besiegt die Allmacht des Feuers ..."},
			Answer{Tag = "sonnenpriester110_002PC", String = "Erspart mir Eurer Gefasel, Priester! Wenn Ihr leben wollt, hört mir zu!", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "sonnenpriester110_003PC", String = "Ich kenne Euer Bestreben, die Mondstadt zu vernichten ... Ihr habt eine Macht erforscht, die der Schwarzen Magie widersteht?", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sonnenpriester110_004", String = "Das Elementar der Sonne!"},
			Answer{Tag = "sonnenpriester110_005PC", String = "Ruft es! Unterstellt es meinem Befehl! Oder tretet Eurem Gott gegenüber!", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sonnenpriester110_006", String = "Bei den Flammen des Barga Gor! Dann nehmt es, Menschenhund!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sonnenpriester110_005", String = "Das rote Imperium wird nie untergehen! Ich werde Euch noch brennen sehen, Runenknecht!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "DialogGulZaldureEnded"},
			RemoveDialog{NpcId = self},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end