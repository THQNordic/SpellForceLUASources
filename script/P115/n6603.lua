-->INFO: Murim
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)



OnPlatformOneTimeEvent								
{
	Conditions = 
	{ 
		
		
	},
	Actions = 
	{
		ChangeRace{ Race = 152, NpcId = self},
		HoldPosition {NpcId = self},
	},											
}		

OnOneTimeEvent								
{
	Conditions = 
	{ 
		IsGlobalTimeElapsed { Name = "StartOutcryMurimP115", Seconds = 285},
	},
	Actions = 
	{
		Outcry { NpcId = 6603, String = "Niethalf, sei mit uns! Das ist das Ende!" , Tag ="ocRodeP008_003" , Color = ColorWhite},
		QuestSolve {QuestId = 735},
		QuestBegin {QuestId = 733},	
	},											
}		


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P115\n6603_Murim.txt


	

	OnBeginDialog{
		Conditions = {
			IsGlobalFlagFalse{Name = "knownP115"},
		},
		Actions = {
			Say{Tag = "murim115_001", String = "Willkommen im Gletscherbruch. Sieht so aus, als hätten wir eine harte Schlacht vor uns!"},
			Answer{Tag = "murim115_002PC", String = "Ihr kommt als Unterstützung von den Zwergen?", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "knownP115"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "murim115_003", String = "Aye. Ich entbiete Euch Grüße von König Ragnar aus Fastholme. Wir kennen dieses Land und stehen zur Hilfe bereit!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "murim115_004", String = "Der Gletscher hier birgt nicht viele Rohstoffe, die Ihr nutzen könntet."},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "murim115_005", String = "Aber tief unter dem Eis liegen alte Minen und Lager der Zwerge. Meine Leute kennen die alten Stollen, sie werden Euch bringen, was sie dort an Nützlichem finden."},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "murim115_006", String = "Ihr müsst dafür sorgen, dass sie sicher zu den Stollen und wieder zurück kommen."},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "murim115_007", String = "Aber nicht nur Stein und Eisen werden wir für Euch suchen. Hier wurden einst Feuerkristalle geschürft! Kristallenes Drachenfeuer, äußerst gefährlich! Die werdet Ihr brauchen!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "murim115_008", String = "Denn Euer erstes Ziel sind die Drachensteine! Sie sind die Manifestationen von Aryns erwachender Macht, und sie ziehen Drachenbrut an, wie Motten das Licht!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "murim115_009", String = "Ihr erkennt die Drachensteine an dem weißen Nebel, der von ihnen aufsteigt. Bringt die Feuerkristalle dorthin, sie werden die Drachensteine schmelzen und die Brut vertreiben!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "murim115_010", String = "Ihr solltet mit den kleineren Drachensteinen anfangen, bevor Ihr Euch den machtvolleren im Norden nähert."},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "murim115_011", String = "Aber wie ich schon sagte, die Feuerkristalle sind gefährlich!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "murim115_012", String = "Kommen sie sich zu nahe, wird ihr Feuer entfacht! Deswegen solltet Ihr niemals zwei zur gleichen Zeit tragen! Denkt daran!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "murim115_013", String = "Ist die Drachenbrut erst vertrieben, könnt Ihr euch Aryns Hort nähern!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "murim115_014", String = "Doch genug geredet, lasst es uns angehen! Ich schicke meine Schürfer zu den Minen, kümmert Ihr Euch um ihren Schutz!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "knownP115"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "murim115_015", String = "Wie kann ich Euch helfen?"},
			OfferAnswer{Tag = "murim115_016PC", String = "Bitte erklärt mir noch einmal, was zu tun ist, Murim.", AnswerId = 2},
			OfferAnswer{Tag = "murim115_017PC", String = "Was sind diese Drachensteine?", AnswerId = 17},
			OfferAnswer{Tag = "murim115_021PC", String = "Was sind das für Kristalle, die Ihr mir bringen wollt?", AnswerId = 20},
			OfferAnswer{Tag = "murim115_025PC", String = "Was werden Eure Leute tun?", AnswerId = 22},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "murim115_018", String = "Sie entstehen durch Aryns erwachende Macht. Sein Zauber formt sie und ihre Kraft ruft die Drachenbrut herbei, aus den Lüften über den Grimwargzacken und aus den Höhlen tief im Eis!"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "murim115_019", String = "Sie sammeln sich um den großen, alten Drachen, der erwacht."},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "murim115_020", String = "Was Ihr bedenken solltet ist Folgendes: Ihr müsst zuerst die schwächeren Drachensteine bannen, danach könnt Ihr Euch an die größeren wagen!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "murim115_022", String = "Diese Kristalle sind das Feuer der alten Drachen, das einst Steine schmolz wie Schnee in der Sonne. Sie sind ein wertvolles Gut und sehr gefährlich."},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "murim115_023", String = "So machtvoll wie Aryns Kälte ist nur das Feuer alter Drachen. Damit sind diese Kristalle das Einzige, was Aryns Macht brechen kann!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "murim115_026", String = "Sie suchen nach Schätzen unter dem Eis und bringen sie zu Euch! Beschützt sie auf ihren Wegen. Ab und an mag einer Glück haben und vielleicht einen Feuerkristall finden."},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "murim115_027", String = "Er wird den Feuerkristall zu Eurem Monument bringen. Dann könnt Ihr ihn verwenden, um einen Drachenstein zu bannen. Wenn Ihr allerdings schon einen Kristall bei Euch tragt, geht der neue verloren."},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}


	EndDefinition()
end