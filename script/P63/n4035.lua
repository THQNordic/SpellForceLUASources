-->INFO: Wache_Hallit
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

OnIdleGoHome
{
	WalkMode = Walk, X = _X, Y = _Y, Direction = South,
	Conditions =
	{
	},
}


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
Conditions = {QuestState{QuestId = 123, State = StateActive},
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
-- Source: C:\project\main\mission\dialoge\p63\n4035_Wache_Hallit.txt


	

	OnBeginDialog{
		Conditions = {
			PlayerHasItem{ItemId = 3199},
		},
		Actions = {
			Say{Tag = "wacheHallitGrey001", String = "Das Haus Hallit hat seine Grenzen geschlossen! Kein Durchgang für einfaches Volk!"},
			OfferAnswer{Tag = "wacheHallitGrey001PC", String = "Hier, ein Schreiben des Ordens! Ich bin in wichtiger Mission unterwegs!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(PlayerHasItem{ItemId = 3199}),
		},
		Actions = {
			Say{Tag = "wacheHallitGrey001", String = "Das Haus Hallit hat seine Grenzen geschlossen! Kein Durchgang für einfaches Volk!"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "wacheHallitGrey002", String = "Lasst sehen! Hm...! Gut, Ihr dürft passieren! Öffnet das Tor!"},
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
			TransferItem{TakeItem = 3199 , Amount = 1 , Flag = Take} , 
					TransferXP{XP = 200} , RemoveDialog{NpcId = 4035},
					SetGlobalFlagTrue{Name = "GreyfellNWindwallsGateOpen"},
			EndDialog(),
		}}


	EndDefinition()
end