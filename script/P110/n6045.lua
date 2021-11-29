-->INFO: Sternenpriester
--INFO SHIL'ZHAR, Mentalist Sternenstadt

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--Outcries Shil´Zhar

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "EndCutsceneEntryP110" },		
	},
	Actions =
	{
		
		Outcry { NpcId = 6045 , String = "Verrat die Garde ist übergelaufen! Macht sie nieder!" , Tag = "ocShiZhar_P110_001" },
		
	}
}



--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P110\n6045_Sternenpriester.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "sternenpriester110_001", String = "Macht schon, bringt es hinter Euch, Lichtgläubiger!"},
			Answer{Tag = "sternenpriester110_002PC", String = "Tot nützt Ihr mir nichts. Aber vielleicht habt Ihr etwas anzubieten, das mir Euer Leben wert ist?", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sternenpriester110_003", String = "Was wäre, wenn ich Euch sage, dass es geheime Gänge in die anderen Stadtteile gibt?"},
			Answer{Tag = "sternenpriester110_004PC", String = "Sprecht weiter.", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sternenpriester110_005", String = "Die Gänge wurden von Ulkar Kahn angelegt, bevor die Sonnenpriester ihn ermordet haben. Sie führen in die Sonnen- und Mondstadt. Aber sie sind magisch verschlossen."},
			Answer{Tag = "sternenpriester110_006PC", String = "Was nützen sie mir dann?", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sternenpriester110_007", String = "Wartet! Nur die Hand Kahns kann die Tore öffnen! Kahn ist tot, aber seine Hand befindet sich in unserem Besitz!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sternenpriester110_009", String = "Man weiß nie, wann man sie brauchen könnte. Aber nun ist es wohl soweit."},
			Answer{Tag = "sternenpriester110_008PC", String = "Gut, gebt sie mir und Ihr sollt verschont bleiben.", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 2648 , Flag = Give},
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