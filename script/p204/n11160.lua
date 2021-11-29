-->INFO: Craig
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--Wird gespawned sobald der Schattenklingenspieler in der NQ Der letzte Dracon nach Empiria reisen muss.
SpawnOnlyWhen
{
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		ODER(IsGlobalFlagTrue{Name = "g_sP204SpawnCraig"}, IsGlobalFlagTrue{Name = "g_sP204SQBotschafterTot"}),
	}, 
	Actions = 
	{
		ChangeRace {Race = 152, NpcId = self},
		SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_11160"},
		Goto {X = 153, Y = 235, NpcId = self, Range = 2, WalkMode = Walk, GotoMode = GotoContinuous},
	} 
}

--Wenn der Spieler das Siegel Dorkhan gegeben hat und mit Craig geredet hat, dann verschwindet Craig zum nächsten Portal.
OnOneTimeEvent
{
	Conditions =
	{
		IsNpcFlagTrue{Name = "npc_sP204CraigLeave"},
	},
	Actions = 
	{
		Goto {X = 153, Y = 225, NpcId = self, Range = 0, WalkMode = Walk, GotoMode = GotoContinuous},
	},
}




--Wenn Craig den anderen Tempel erreicht hat verschwindet er.
Despawn
{
	PlayDeathAnim = FALSE,
	Conditions = 
	{
		FigureInRange{ X = 153, Y = 225, NpcId = self, Range = 0},
		IsNpcFlagTrue{Name = "npc_sP204CraigLeave"},
		FigureJob {Job = JobIdle , NpcId = self},
	},
	Actions = 
	{
	
	},
}

--Wenn der Spieler das Siegel Craig gegeben hat, wird Craig neuer Botschafter.
OnOneTimeEvent
{
	Conditions =
	{
		IsNpcFlagTrue{Name = "npc_sP204CraigIdleWalk"},
	},
	Actions = 
	{
		Goto {X = 153, Y = 254, NpcId = self, Range = 0, WalkMode = Walk, GotoMode = GotoContinuous},
	},
}

--Wenn der Spieler das Siegel Craig gegeben hat, wird Craig neuer Botschafter.
OnOneTimeEvent
{
	Conditions =
	{
		FigureInRange{ X = 153, Y = 254, NpcId = self, Range = 0},
		IsNpcFlagTrue{Name = "npc_sP204CraigIdleWalk"},
		FigureJob {Job = JobIdle , NpcId = self},
	},
	Actions = 
	{
		LookAtDirection {Direction = South, NpcId = self},
	},
}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n11160_Craig.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			UND(IsGlobalFlagTrue{Name = "g_sP204PlayerHasLostSigil"}, Negated(PlayerHasItem {ItemId = 7368, Amount = 1, Equipment = EquipmentAll})),
		},
		Actions = {
			Say{Tag = "craigP204_001", String = "Narr! Ihr habt dieser Schlange das Siegel gegeben! Ich sagte doch, Ihr solltet es nicht aus der Hand geben!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(IsGlobalFlagTrue{Name = "g_sP204PlayerHasLostSigil"}, Negated(PlayerHasItem {ItemId = 7368, Amount = 1, Equipment = EquipmentAll}))),
		},
		Actions = {
			Say{Tag = "craigP204_005", String = "Ihr wart siegreich, gut! Die üble Saat greift in meinem Volk schneller um sich, als ich dachte!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craigP204_002", String = "Nun haben sie das Zeichen der ultimativen Autorität! Shain ist umsonst gestorben!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craigP204_003", String = "Was ist nur in Euch gefahren? Warum habt Ihr mich dann nicht gleich im Dschungel verenden lassen?"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craigP204_004", String = "Nun, jetzt bleibt mir nichts anderes als in die Verbannung zurückzukehren! Mögen die Götter Euch verzeihen, ich werde es nicht tun!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_11160"}, SetGlobalFlagTrue{Name = "PleaseRemoveDialog_11159"}, SetGlobalFlagTrue{Name = "g_sP204NQDraconUnsolveable"},
			SetNpcFlagTrue{Name = "npc_sP204CraigLeave"},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craigP204_006", String = "Ich nehme nun das Siegel! Es scheint aussderm so, als bräuchte diese Botschaft einen neuen Botschafter! Das wird ein guter Anfang sein, um meine Heimkehr vorzubereiten."},
			Answer{Tag = "craigP204_007PC", String = "Ihr wusstet, das er mich angreifen wurde, nicht wahr?", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craigP204_008", String = "Ich gebe zu, ich habe es erwartet. Geschwächt wie ich bin, wäre das sicherlich mein Ende gewesen, aber ich wusste, Ihr würdet siegen! Ihr habt schon Schlimmeres überstanden, Freund!"},
			Answer{Tag = "craigP204_009PC", String = "Das stimmt wohl, aber das nächste Mal sagt mir vorher Bescheid, wenn eine Horde wilder Norcaine auf mich losgeht! Mir könnt Ihr immer noch vertrauen, Craig.", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craigP204_010", String = "Ihr habt recht, verzeiht Freund. Die Jahre des Exils haben mich misstrauisch gemacht."},
			Answer{Tag = "craigP204_011PC", String = "Ich verstehe.Nun, es ist soweit, das ist dann Lebewohl, Craig! Viel Glück bei Eurer Heimkehr.", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craigP204_012", String = "Lebt wohl, Freund! Ich werde Euch nie vergessen."},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_sP204NQDraconErfolgreich"},
			SetNpcFlagTrue{Name = "npc_sP204CraigIdleWalk"},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end