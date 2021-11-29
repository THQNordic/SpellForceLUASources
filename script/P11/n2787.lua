-->INFO: Steintafel1
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p11\n2787_Steintafel1.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "steintafelEins001", String = "Eine Inschrift auf der Tafel besagt: Um das Tor zur Unterwelt zu öffnen, müssen am großen Menhir in der Mitte des Feldes der Steine die heiligen Symbole in der richtigen Reihenfolge berührt werden."},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end