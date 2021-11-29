-->INFO: urias
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome
{
	WalkMode = Walk, X = 358, Y = 181, Direction = 4, Conditions =
	{
		IsGlobalFlagTrue {Name = "UriasCraigIdleOn"},
	}	
}
--!EDS ONIDLEGOHOME END


---------------- CUTSCENE --------------------------------------
SpawnOnlyWhen
{
	--X = 341, Y = 191,	Conditions =
	--X = 368, Y = 168,	Conditions =	
	X = 369, Y = 166,	Conditions =		
	{
		IsGlobalFlagTrue {Name = "UriasCraigSpawns", UpdateInterval = 10},
	}
}
----------------------------------------------------------------



--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p25\n3001_urias.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "uriasGodmark001", String = "Sartarius ist tot! Ihr Götter! Wir kommen zu spät!"},
			Answer{Tag = "uriasGodmark001PC", String = "Der Magier hätte Euch genauso vernichtet, wie ihn! Seine Macht ist unbezwingbar! Und unsere letzte Hoffnung... ist dahin!", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uriasGodmark002", String = "Ihr meint... der Phönixstein ist verloren? Und jetzt!?"},
			Answer{Tag = "uriasGodmark002PC", String = "Es war wieder nur ein verfluchter Trick...! Was auch immer ich tue - am Ende stelle ich fest, dass ich wieder nur dem Zirkel als Werkzeug gedient habe!", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "uriasGodmark002PCa", String = "Es wird Zeit, dieses Spiel zu beenden! Hier und jetzt! Genug der Täuschungen! Genug der Intrigen und des Verrats!", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "uriasGodmark002PCb", String = "Ich werde diesen Bastard stellen! Ich werde ihn jagen - und wenn es bis in die Abgründe des Barga Gor ist! Das bin ich Sartarius schuldig!", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uriasGodmark003", String = "Dann also auf ins Nachtflüstertal!"},
			Answer{Tag = "uriasGodmark003PC", String = "Ihr bleibt besser zurück, Urias! Das ist eine Sache zwischen ihm und mir! Ich danke Euch für Eure Hilfe! Aber den Rest des Weges muss ich alleine gehen!", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uriasGodmark004", String = "Wie Ihr wünscht, Freund! Aonirs Segen und alles Glück der Welt für Euch!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			RemoveDialog{},
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