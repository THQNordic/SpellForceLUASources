-->INFO: Zarim
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

REM = [[

OnOneTimeEvent
{
Conditions = {
		IsGlobalFlagTrue{Name = "PreviewVersion"}
			},
Actions = {
		RemoveDialog{}
		}
}
]]


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p63\n3044_Zarim.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagTrue{Name = "FlagZarimKnown"},
		},
		Actions = {
			Say{Tag = "zarim001", String = "Aonirs Licht! Wie Ihr seht, habe ich meine Armbrust noch immer nicht vollendet!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "FlagZarimKnown"}),
		},
		Actions = {
			Say{Tag = "zarim002", String = "Seid gegrüßt, Fremder!"},
			Answer{Tag = "zarim002PC", String = "Aonirs Licht, Ordensritter! Was tragt Ihr da in der Hand?", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			PlayerHasItem{ItemId = 2002},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zarim005PC", String = "Ist dieser gebrochene Bogen aus dem Holz der Schwarzeibe?", AnswerId = 6},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2002}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zarim003", String = "Das hier? Das sollte einmal eine ganz besondere Armbrust werden! Aber ich habe die Hoffnung fast aufgegeben, sie noch fertig stellen zu können..."},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zarim004", String = "Ich wollte sie aus dem edlen Holz der Schwarzeibe fertigen. Doch dieser Baum ist inzwischen sehr selten geworden!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zarim005", String = "Früher, in den alten Zeiten, waren die Wälder noch reich an diesem Holz! Man hat viele, gute Bögen daraus geschnitzt! Aber seit der Herrschaft des Zirklels findet man die Schwarzeibe kaum noch..."},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
			PlayerHasItem{ItemId = 2002},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagZarimKnown"},
			QuestBegin{QuestId = 414},
				   QuestBegin{QuestId = 415},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zarim005PC", String = "Ist dieser gebrochene Bogen aus dem Holz der Schwarzeibe?", AnswerId = 6},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2002}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagZarimKnown"},
			QuestBegin{QuestId = 414},
				   QuestBegin{QuestId = 415},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zarim006", String = "Tatsächlich! Perfekte talindische Handarbeit! Ein hervorragendes Werkstück!"},
			Answer{Tag = "zarim006PC", String = "Nehmt ihn, damit könnt Ihr vielleicht die Arbeit an Eurer Armbrust vollenden!", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zarim007", String = "Seid bedankt, Fremder! Das ist ein überaus großzügiges Geschenk!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 415},
					QuestSolve{QuestId = 416},
					QuestSolve{QuestId = 414},
					TransferItem{TakeItem = 2002 , GiveItem = 0 , Flag = Take},
					SetRewardFlagTrue{ Name = "Schwarzeibe"},
					RemoveDialogFromNpc{NpcId = 3044},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end