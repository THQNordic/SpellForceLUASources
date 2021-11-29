-->INFO: KalidZhar
--KALID KHAR, Bote des Mondpriester

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnIdleGoHome
{
X = 243,
Y = 454,
Direction = North,
Range = 3 ,
WalkRange = 5 ,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoForced,

	Conditions = 
	{
		
		IsGlobalFlagTrue { Name = "AngebotAbgelehntP110" }, 
		
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		--SetNpcFlagTrue {Name = "BoteAngekommenP110"},
		ChangeRace {Race = 137, NpcId = 6047}, --Bote greift Spieler an
	},

}
Rem = [[
OnOneTimeEvent
{
	Conditions =
	{
		IsNpcFlagTrue {Name = "BoteAngekommenP110"},
	},
	Actions =
	{
		ChangeRace {Race = 137, NpcId = 6047}, --Bote greift Spieler an
	}
}
]]

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P110\n6047_KalidZhar.txt


	

	OnBeginDialog{
		Conditions = {
			IsGlobalFlagTrue{Name = "P110_PlayerKnowsKalidZhar"},
		},
		Actions = {
			Say{Tag = "kalidzhar110_001", String = "Seid Ihr nun zu einer Entscheidung gekommen? Schlüssel oder Krieg, die Wahl kann doch nicht so schwer sein!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "P110_PlayerKnowsKalidZhar"}),
		},
		Actions = {
			Say{Tag = "kalidzhar110_002", String = "Ihr seid recht hochmütig, Lichtgläubiger. Was glaubt Ihr, welche Chance Ihr habt? Allein gegen die Heere des roten Imperiums?"},
			Answer{Tag = "kalidzhar110_003PC", String = "Ihr kommt den ganzen Weg hierher, nur um mich zu verspotten?", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kalidzhar110_004", String = "Um Euch einen Pakt zu unterbreiten!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kalidzhar110_005", String = "Was würdet Ihr sagen, wenn ich Euch den Schlüssel der Mondstadt geben würde? Und nicht nur das, solltet Ihr dem Pakt zustimmen, werden sich die Heere der Mondstadt zurückziehen!"},
			Answer{Tag = "kalidzhar110_006PC", String = "Ist das der Güte Eures Herzens zu verdanken?", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kalidzhar110_007", String = "Ha! Nein! Ihr vernichtet diese elenden Emporkömmlinge, diese Feuerpriester und ihren Statthalter! Dann werden die Diener Nors unser Volk auf den alten Weg zurückführen!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "P110_PlayerKnowsKalidZhar"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kalidzhar110_008PC", String = "Gut, Norcaine! Der Pakt gilt!", AnswerId = 8},
			OfferAnswer{Tag = "kalidzhar110_014PC", String = "Nein, kein Pakt mit der Finsternis!", AnswerId = 13},
			OfferAnswer{Tag = "kalidzhar110_018PC", String = "Ich muss diese Entscheidung überdenken.", AnswerId = 17},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kalidzhar110_009", String = "Eine gute Entscheidung. Hier, nehmt den Schlüssel der Mondstadt."},
			Answer{Tag = "kalidzhar110_010PC", String = "Kann ich Euer Land für meinen Feldzug nutzen?", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kalidzhar110_011", String = "Bei Nors Auge, nein! Unsere Männer dürfen nichts von dem Handel wissen, sie würden Euch sofort angreifen! Sie werden denken, wir bereiten einen großen Schlag vor!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kalidzhar110_012", String = "Also bleibt der Mondstadt fern! Jede Annäherung Eurer Truppen werden wir als Bruch des Paktes ansehen!"},
			Answer{Tag = "kalidzhar110_013PC", String = "Gut, solange Eure Truppen nicht mehr angreifen, soll mir das reichen, Botschafter.", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 3875, Flag = Give},
			   SetGlobalFlagTrue{Name = "AngebotAngenommenP110"},
			   RemoveDialog{NpcId = 6047},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kalidzhar110_015", String = "Narr! Das ist Euer Ende!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kalidzhar110_016", String = "Wir sehen uns auf dem Schlachtfeld ... wenn ich Eurem langsamen, qualvollen Tod beiwohnen werde ..."},
			Answer{Tag = "kalidzhar110_017PC", String = "Schert Euch fort, Schlange!", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "AngebotAbgelehntP110"},
			  RemoveDialog{NpcId = 6047},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kalidzhar110_019", String = "Denkt nicht zu lange nach. Unsere Truppen werden Euch trotz allem angreifen. Eure Zeit ist bald abgelaufen."},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "NachdenkenP110"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end