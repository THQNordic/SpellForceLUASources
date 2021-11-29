-->INFO: Mordquest_Lithere

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--MordQuest wird erst aktiv, wenn der Spieler den Auftrag von Aileen erhalten hat!

OnOneTimeEvent
{
	Conditions = 
	{
		
		
	},
	Actions = 
	{
		
		RemoveDialog{NpcId = self},
		
	},
}











OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "StartMordquestP105"},
		
	},
	Actions = 
	{
		
		SetDialogType{ NpcId = self, Type = SideQuest},
		
	},
}
Despawn
{
	Conditions = 
	{
		IsGlobalFlagTrue{ Name = "LithereDespawnP105"},	
	} , 
	Actions = 
	{
	}
}








--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P105\n8122_Mordquest_Lithere.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "known"},
		},
		Actions = {
			Say{Tag = "lithere105_001", String = "Was wollt Ihr, Mensch?"},
			Answer{Tag = "lithere105_002PC", String = "Euch einige Fragen stellen.", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "known"}),
		},
		Actions = {
			Say{Tag = "lithere105_004", String = "Was wollt Ihr wissen?"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lithere105_003", String = "Dann schickt Euch Aileen? Ich habe die Mörderin doch bereits genannt, was soll das alles?"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lithere105_005PC", String = "Erzählt mir, was sich zugetragen hat.", AnswerId = 4},
			OfferAnswer{Tag = "lithere105_013PC", String = "Erzählt mir etwas über Fennair.", AnswerId = 11},
			OfferAnswer{Tag = "lithere105_015PC", String = "Erzählt mir etwas über Baetha.", AnswerId = 13},
			OfferAnswer{Tag = "lithere105_017PC", String = "Erzählt mir etwas über Euch.", AnswerId = 15},
			OfferAnswer{Tag = "lithere105_021PC", String = "Danke. Lebt wohl.", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lithere105_005PC", String = "Erzählt mir, was sich zugetragen hat.", AnswerId = 4},
			OfferAnswer{Tag = "lithere105_013PC", String = "Erzählt mir etwas über Fennair.", AnswerId = 11},
			OfferAnswer{Tag = "lithere105_015PC", String = "Erzählt mir etwas über Baetha.", AnswerId = 13},
			OfferAnswer{Tag = "lithere105_017PC", String = "Erzählt mir etwas über Euch.", AnswerId = 15},
			OfferAnswer{Tag = "lithere105_021PC", String = "Danke. Lebt wohl.", AnswerId = 19},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lithere105_006", String = "Närrisches Spiel! Nun gut, Aedale ging mit uns zum Ostberg, um das Ritual der Reinigung durchzuführen, da die meisten Bestien jetzt vertrieben sind."},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lithere105_007", String = "Es waren Aedale, ich, die Novizin Baetha und dieser grobschlächtige Fennair, der uns schützen sollte. Als wir diesen Felskamm erreicht hatten, trennten wir uns."},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lithere105_008", String = "Die ungeschickte Novizin hatte den Elenkelch vergessen und wurde in die Stadt zurückgeschickt. Fennair ging irgendeinem Geräusch nach."},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lithere105_009", String = "Ich brach auf, um Schneeblüten für das Ritual zu suchen. Eine geraume Zeit war ich wohl weg."},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lithere105_010", String = "Als ich wiederkam, stand Novizin Baetha allein an der Klippe und die Hohe Priesterin Aedale lag tot im Tal! Fennair kam erst in diesem Augenblick wieder zurück. Ich entsandte ihn sofort in die Stadt, um die Wachen zu holen."},
			Answer{Tag = "lithere105_011PC", String = "Woher wollt Ihr dann wissen, dass Baetha sie ins Tal gestoßen hat?", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lithere105_012", String = "Die Hohe Priesterin konnte hart sein wie Eis und Baetha hat nicht selten Tränen vergossen. Sie hasste Aedale, das kann ich Euch sagen."},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lithere105_005PC", String = "Erzählt mir, was sich zugetragen hat.", AnswerId = 4},
			OfferAnswer{Tag = "lithere105_013PC", String = "Erzählt mir etwas über Fennair.", AnswerId = 11},
			OfferAnswer{Tag = "lithere105_015PC", String = "Erzählt mir etwas über Baetha.", AnswerId = 13},
			OfferAnswer{Tag = "lithere105_017PC", String = "Erzählt mir etwas über Euch.", AnswerId = 15},
			OfferAnswer{Tag = "lithere105_021PC", String = "Danke. Lebt wohl.", AnswerId = 19},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lithere105_014", String = "Was gibt es über ihn zu sagen? Er ist ein Mensch. Aber ich denke, als Wache ist er durchaus nützlich."},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lithere105_005PC", String = "Erzählt mir, was sich zugetragen hat.", AnswerId = 4},
			OfferAnswer{Tag = "lithere105_013PC", String = "Erzählt mir etwas über Fennair.", AnswerId = 11},
			OfferAnswer{Tag = "lithere105_015PC", String = "Erzählt mir etwas über Baetha.", AnswerId = 13},
			OfferAnswer{Tag = "lithere105_017PC", String = "Erzählt mir etwas über Euch.", AnswerId = 15},
			OfferAnswer{Tag = "lithere105_021PC", String = "Danke. Lebt wohl.", AnswerId = 19},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lithere105_016", String = "Ein unscheinbares Licht. Sie könnte vielleicht schon Priesterin sein, wäre sie nicht so gefangen in ihren Gefühlen."},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lithere105_005PC", String = "Erzählt mir, was sich zugetragen hat.", AnswerId = 4},
			OfferAnswer{Tag = "lithere105_013PC", String = "Erzählt mir etwas über Fennair.", AnswerId = 11},
			OfferAnswer{Tag = "lithere105_015PC", String = "Erzählt mir etwas über Baetha.", AnswerId = 13},
			OfferAnswer{Tag = "lithere105_017PC", String = "Erzählt mir etwas über Euch.", AnswerId = 15},
			OfferAnswer{Tag = "lithere105_021PC", String = "Danke. Lebt wohl.", AnswerId = 19},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lithere105_018", String = "So langsam werde ich ungeduldig! Aber gut ..."},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lithere105_019", String = "Ich bin eine Priesterin Aryns, Bewahrerin dieser Stätte und des heiligen Bundes mit dem Frostweber."},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lithere105_020", String = "Ich stehe ganz im Dienste der Gemeinschaft, wie alle anderen hier."},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lithere105_005PC", String = "Erzählt mir, was sich zugetragen hat.", AnswerId = 4},
			OfferAnswer{Tag = "lithere105_013PC", String = "Erzählt mir etwas über Fennair.", AnswerId = 11},
			OfferAnswer{Tag = "lithere105_015PC", String = "Erzählt mir etwas über Baetha.", AnswerId = 13},
			OfferAnswer{Tag = "lithere105_017PC", String = "Erzählt mir etwas über Euch.", AnswerId = 15},
			OfferAnswer{Tag = "lithere105_021PC", String = "Danke. Lebt wohl.", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end