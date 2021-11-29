-->INFO: Dorkhan
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

KillOnDominate{NpcId = self}

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = South}
--!EDS ONIDLEGOHOME END


OnOneTimeEvent
{
	Conditions =
	{
		
		
	},
	Actions = 
	{
		SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_11159"},
	},
}


OnOneTimeEvent
{
	Conditions =
	{
		
		
	},
	Actions = 
	{
		ChangeRace {Race = 152, NpcId = self},
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_sP204DorkharAggroAndAssassinsSpawn", UpdateInterval = 20},
	},
	Actions = 
	{
		ChangeRace {Race = 137, NpcId = self},
	},
}


OnOneTimeEvent
{
	Conditions =
	{
		IsNpcFlagTrue{Name = "npc_sP204ChangeUnitDorkhanMitLoot"},
		
	},
	Actions = 
	{
		ChangeUnit {Unit = 2767, NpcId = self, ChangeLevel = FALSE},
		ChangeRace {Race = 152, NpcId = self},
	},
}





--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n11159_Dorkhan.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsNpcFlagTrue{Name = "Known"},
		},
		Actions = {
			Say{Tag = "ambassador_dorkhanP204_001", String = "Was ist es nun, Mensch?"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "Known"}),
		},
		Actions = {
			Say{Tag = "ambassador_dorkhanP204_002", String = "Seid Ihr gekommen, um zu Nor und Zarach zu beten? Nein ... So seht Ihr nicht aus, Menschlein!"},
			Answer{Tag = "ambassador_dorkhanP204_003PC", String = "Was treibt Ihr hier in Empyria, Dunkelelf?", AnswerId = 4},
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
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
			IsGlobalFlagTrue{Name = "g_sP204PlayerHasSigil"},
			UND( IsNpcFlagTrue{Name = "npc_sP204DorkhanHasSigil"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[24]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ambassador_dorkhanP204_008PC", String = "Ich komme zu Euch mit dem Siegel der Norcaine.", AnswerId = 7},
			OfferAnswer{Tag = "ambassador_dorkhanP204_021PC", String = "Bastard, gebt mir das Siegel zurück!", AnswerId = 24},
		}}

	OnAnswer{3;
		Conditions = {
			IsGlobalFlagTrue{Name = "g_sP204PlayerHasSigil"},
			Negated(UND( IsNpcFlagTrue{Name = "npc_sP204DorkhanHasSigil"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[24]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ambassador_dorkhanP204_008PC", String = "Ich komme zu Euch mit dem Siegel der Norcaine.", AnswerId = 7},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_sP204PlayerHasSigil"}),
			UND( IsNpcFlagTrue{Name = "npc_sP204DorkhanHasSigil"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[24]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ambassador_dorkhanP204_021PC", String = "Bastard, gebt mir das Siegel zurück!", AnswerId = 24},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_sP204PlayerHasSigil"}),
			Negated(UND( IsNpcFlagTrue{Name = "npc_sP204DorkhanHasSigil"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[24]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ambassador_dorkhanP204_004", String = "Ich bin Dorkhan, Botschafter des glorreichen Volkes der Norcaine in diesem dreckigen Loch, welches Ihr eine Stadt nennt!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ambassador_dorkhanP204_005", String = "Und der Kaiser hat mich in seiner Gnade hier ins Tempelviertel verbannt! Wahrscheinlich hält er sich seinen feisten Bauch, wenn er daran denkt, wie ich zwischen all diesen Lichtbetern schmore!"},
			Answer{Tag = "ambassador_dorkhanP204_006PC", String = "Hm. Ihr seid sicher ein hervorragender Diplomat.", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
			IsGlobalFlagTrue{Name = "g_sP204PlayerHasSigil"},
			UND( IsNpcFlagTrue{Name = "npc_sP204DorkhanHasSigil"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[24]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "ambassador_dorkhanP204_007", String = "Spottet nicht, Lichtkriecher! Der Tag wird kommen, an dem sich die Norcaine dieses Land zurückholen! So wie es bestimmt war!"},
			OfferAnswer{Tag = "ambassador_dorkhanP204_008PC", String = "Ich komme zu Euch mit dem Siegel der Norcaine.", AnswerId = 7},
			OfferAnswer{Tag = "ambassador_dorkhanP204_021PC", String = "Bastard, gebt mir das Siegel zurück!", AnswerId = 24},
		}}

	OnAnswer{6;
		Conditions = {
			IsGlobalFlagTrue{Name = "g_sP204PlayerHasSigil"},
			Negated(UND( IsNpcFlagTrue{Name = "npc_sP204DorkhanHasSigil"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[24]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "ambassador_dorkhanP204_007", String = "Spottet nicht, Lichtkriecher! Der Tag wird kommen, an dem sich die Norcaine dieses Land zurückholen! So wie es bestimmt war!"},
			OfferAnswer{Tag = "ambassador_dorkhanP204_008PC", String = "Ich komme zu Euch mit dem Siegel der Norcaine.", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_sP204PlayerHasSigil"}),
			UND( IsNpcFlagTrue{Name = "npc_sP204DorkhanHasSigil"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[24]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "ambassador_dorkhanP204_007", String = "Spottet nicht, Lichtkriecher! Der Tag wird kommen, an dem sich die Norcaine dieses Land zurückholen! So wie es bestimmt war!"},
			OfferAnswer{Tag = "ambassador_dorkhanP204_021PC", String = "Bastard, gebt mir das Siegel zurück!", AnswerId = 24},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_sP204PlayerHasSigil"}),
			Negated(UND( IsNpcFlagTrue{Name = "npc_sP204DorkhanHasSigil"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[24]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "ambassador_dorkhanP204_007", String = "Spottet nicht, Lichtkriecher! Der Tag wird kommen, an dem sich die Norcaine dieses Land zurückholen! So wie es bestimmt war!"},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ambassador_dorkhanP204_009", String = "Das Siegel! Wie kommt Ihr dazu?"},
			Answer{Tag = "ambassador_dorkhanP204_010PC", String = "Craig Un'Shallach schickt mich zu Euch! Er wird in Kürze hier eintreffen und Ihr sollt alles für sien Ankunft und seine Rückkehr in die Heimat vorbereiten ... als rechtmäßiger Herrscher der Nrocaine.", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ambassador_dorkhanP204_011", String = "Oh, natürlich, ich werde seine Ankunft vorbereiten! Mit großer Freude!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ambassador_dorkhanP204_012", String = "Gut, Ihr habt Eure Schuldigkeit getan Bote, gebt mir jetzt das Siegel!"},
			OfferAnswer{Tag = "ambassador_dorkhanP204_013PC", String = "Hier, nehmt es.", AnswerId = 10},
			OfferAnswer{Tag = "ambassador_dorkhanP204_017PC", String = "Nein! Craig sagte ich sollte es Euch nicht geben!", AnswerId = 20},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ambassador_dorkhanP204_014", String = "Ha, ha! Ihr armer Narr! Euer Dracon wird tot sein, sobald er seinen Fuss auf heimischen Boden setzt!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ambassador_dorkhanP204_015", String = "Geht nur und warnt ihn! Soll er sich doch verstecken! Er ist unwichtig! Jetzt, wo ich das SIegel habe!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ambassador_dorkhanP204_016", String = "Ihr habt meinem Volk einen großen Dienst erwiesen! Hier, nehmt dieses Kupferstück für Eure Dienste! Ha, ha!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			TransferMoney{Copper = 1 , Flag = Give}, SetGlobalFlagTrue{Name = "g_sP204PlayerHasLostSigil"}, 
					SetGlobalFlagTrue{Name = "g_sP204SpawnCraig"}, SetGlobalFlagFalse{Name = "g_sP204PlayerHasSigil"},
			SetNpcFlagTrue{Name = "npc_sP204ChangeUnitDorkhanMitLoot"}, SetNpcFlagTrue{Name = "npc_sP204DorkhanHasSigil"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			IsGlobalFlagTrue{Name = "g_sP204PlayerHasSigil"},
			UND( IsNpcFlagTrue{Name = "npc_sP204DorkhanHasSigil"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[24]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ambassador_dorkhanP204_008PC", String = "Ich komme zu Euch mit dem Siegel der Norcaine.", AnswerId = 7},
			OfferAnswer{Tag = "ambassador_dorkhanP204_021PC", String = "Bastard, gebt mir das Siegel zurück!", AnswerId = 24},
		}}

	OnAnswer{19;
		Conditions = {
			IsGlobalFlagTrue{Name = "g_sP204PlayerHasSigil"},
			Negated(UND( IsNpcFlagTrue{Name = "npc_sP204DorkhanHasSigil"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[24]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ambassador_dorkhanP204_008PC", String = "Ich komme zu Euch mit dem Siegel der Norcaine.", AnswerId = 7},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_sP204PlayerHasSigil"}),
			UND( IsNpcFlagTrue{Name = "npc_sP204DorkhanHasSigil"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[24]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "ambassador_dorkhanP204_021PC", String = "Bastard, gebt mir das Siegel zurück!", AnswerId = 24},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_sP204PlayerHasSigil"}),
			Negated(UND( IsNpcFlagTrue{Name = "npc_sP204DorkhanHasSigil"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[24]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ambassador_dorkhanP204_018", String = "Schlau, schlau, wie ungewöhnlich für einen Dracon ... aber auch wieder nicht, wenn man sieht was für einen erbärmlichen Boten er da mit dem Siegel schickt ..."},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ambassador_dorkhanP204_019", String = "Ich kann Euch leider nicht damit gehen lassen, Menschlein. Ich fürchte ich werde es wohl aus Euren kalten, toten Fingern nehmen müssen ..."},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_sP204DorkharAggroAndAssassinsSpawn"},
			Say{Tag = "ambassador_dorkhanP204_020", String = "Greift ihn! Bringt mir das Siegel!"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ambassador_dorkhanP204_022", String = "Ha! Seht nur, wie dem Menschlein der Kamm schwillt! Nun, mein Held, Ihr habt versagt, seht es ein! Und nun trollt Euch!"},
			OfferAnswer{Tag = "ambassador_dorkhanP204_023PC", String = "Dafür sterbt Ihr!", AnswerId = 25},
			OfferAnswer{Tag = "ambassador_dorkhanP204_025PC", String = "Gut, ich gehe.", AnswerId = 27},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ambassador_dorkhanP204_024", String = "Das glaube ich kaum! Krieger! Greift an!"},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_sP204DorkharAggroAndAssassinsSpawn"},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "ambassador_dorkhanP204_026", String = "Ja, husch, husch kleines Hündchen! Lauf zurück zu deinem Dracon! Lauf, lauf!"},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end