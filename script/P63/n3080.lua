-->INFO: Wache_Liannon
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--Dialogsteuerung
OnOneTimeEvent
{
Conditions = {},
Actions = {
		RemoveDialog{}
		}
}

OnOneTimeEvent
{
Conditions = {QuestState{QuestId = 446, State = StateActive},
				},
Actions = {
		EnableDialog{}
		}
}

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p63\n3080_Wache_Liannon.txt


	

	OnBeginDialog{
		Conditions = {
			PlayerHasItem{ItemId = 3198},
		},
		Actions = {
			Say{Tag = "wacheLiannon001", String = "Liannon ist Kriegsgebiet! Kein Durchgang ohne Passierschein!"},
			OfferAnswer{Tag = "wacheLiannon001PC", String = "Ich habe ein Schreiben des Ordens!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(PlayerHasItem{ItemId = 3198}),
		},
		Actions = {
			Say{Tag = "wacheLiannon001", String = "Liannon ist Kriegsgebiet! Kein Durchgang ohne Passierschein!"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "wacheLiannon002", String = "Zeigt her! In Ordnung! Der Orden ist im Land der Leonidar immer gerne gesehen! Öffnet das Tor!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 447} , QuestSolve{QuestId = 446} , 
					TransferItem{TakeItem = 3198 , Amount = 1 , Flag = Take} , 
					TransferXP{XP = 5} , RemoveDialog{NpcId = 3080},
					SetGlobalFlagTrue{Name = "GreyfellLiannonGateOpen"},
			EndDialog(),
		}}


	EndDefinition()
end