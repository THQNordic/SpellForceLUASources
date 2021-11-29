-->INFO: Betrogener
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = 10092},
		SetGlobalFlagTrue {Name = "g_P204_EhemannHomepoint"},		
	}
}


OnIdleGoHome
{
X = _X, Y = _Y, Direction = South, Range = 0 , WalkRange = 1 , WaitTime = 0 , WalkMode = Walk , GotoMode = GotoNormal,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P204_EhemannHomepoint", UpdateInterval = 60},
	},
	Actions = {},
	HomeActions = 
	{
	--HoldPosition {NpcId = self},
	},
}


OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		SetGlobalFlagTrue{Name ="PleaseRemoveDialog_10092"},
	}
}


--- Betrogener Ehemann rennt zur Wache und fängt Streit an ---
OnIdleGoHome
{
	X = 320, Y = 272, WalkMode = Run, Direction = North,

	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P204_EhemannAufgebracht", UpdateInterval = 60},
	},

	HomeActions =
	{
		SetGlobalFlagFalse {Name = "g_P204_EhemannHomepoint"},	
		Outcry { NpcId = 10092, Tag = "oca2boronP204_001", String = "Nasar! Dreckiger Schuft! Du kannst was erleben!"},
		SetGlobalFlagFalse {Name = "g_P204_EhemannAufgebracht"},
		SetGlobalTimeStamp{Name = "c_P204_CounterEhemannStreitA"},
		QuestSolve {QuestId = 940},
	}
}


OnIdleGoHome
{
	X = 330, Y = 274, WalkMode = Run, Direction = West,

	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_EhemannInStellung"},
	},

	HomeActions =
	{
		Outcry { NpcId = 10092, Tag ="oca2boronP204_002", String = "Ich werde dich lehren, meine Sarah zu verführen!"},
		SetGlobalFlagFalse {Name = "g_P204_EhemannInStellung"},
		SetGlobalFlagTrue {Name = "g_P204_WacheEhemannStreit"},	
		SetGlobalFlagTrue{Name = "g_P204_WacheGehtZuEhemann"},
		SetGlobalTimeStamp{Name = "c_P204_CounterEhemannStreitB"},
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_KampfMitEhemann"},
	},

	Actions =
	{
		AttackTarget{Target = 8846, NpcId = self, FriendlyFire = TRUE},
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_KampfMitEhemannZuende"},
	},

	Actions =
	{
		Stop {Target = self},
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_EhemannWarnung"},
	},

	Actions =
	{
		Outcry { NpcId = 10092, Tag ="oca2boronP204_003", String = "Lass von nun an deine Finger von meiner Frau!"},
		SetNoFightFlagFalse{NpcId = 10092},			
		SetGlobalFlagFalse{Name = "g_P204_EhemannWarnung"},
		SetGlobalFlagTrue{Name = "g_P204_EhemannNachHause"},			
	}
}


OnIdleGoHome
{
	X = 305, Y = 181, WalkMode = Run, Direction = East,

	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_EhemannNachHause"},
	},

	HomeActions =
	{
		SetGlobalFlagTrue {Name = "g_P204_EhemannHomepoint"},	
		SetGlobalFlagFalse {Name = "g_P204_EhemannNachHause"},
		SetGlobalFlagTrue {Name = "g_P204_EhemannDespawnt"},	
	}
}


Despawn
{
	PlayDeathAnim = FALSE,

	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_EhemannDespawnt", UpdateInterval = 60},
	}
}
--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n10092_Betrogener.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			QuestState {QuestId = 940, State = StateActive},
		},
		Actions = {
			Say{Tag = "boronP204_001", String = "Ach Sahra, was mach ich nur falsch."},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(QuestState {QuestId = 940, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "boronP204_002PC", String = "Eure Frau betrügt Euch ... und ich weiß auch mit wem!", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "boronP204_003", String = "Bei meiner Treu! Heraus damit, wer ist der Schuft? Ich zerfetze ihn mit blossen Händen!"},
			Answer{Tag = "boronP204_004PC", String = "Es ist eine der Wachen am Osttor des Palastes! Sein Name ist Naras!", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "boronP204_005", String = "Naras? Deswegen lungert der immer bei unserem Haus herum!"},
			Answer{Tag = "boronP204_006PC", String = "Und nun scherzt er mit seinen Kameraden über Euch!", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "boronP204_007", String = "Dieser Hundsfott! Legt Hand an meine Sahra! Ich bringe ihn um! Ich bringe ihn um!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P204_EhemannAufgebracht"},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{7;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "FlagBetrogenerKnown"}),
		},
		Actions = {
			Say{Tag = "boronP204_009", String = "Was ist es nur? Bin ich kein stattlicher Kerl? Bin ich nicht stark wie ein Ochse? Und war ich nicht immer treu und ehrlich?"},
			Answer{Tag = "boronP204_010PC", String = "Das wissen nur die Götter, guter Mann!", AnswerId = 9},
		}}

	OnAnswer{7;
		Conditions = {
			IsPlayerFlagTrue{Name = "FlagBetrogenerKnown"},
		},
		Actions = {
			Say{Tag = "boronP204_008", String = "Ach, Sahra, Sahra, Sahra ..."},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "boronP204_011", String = "Dann mögen die Götter und meine Ahnen es bezeugen, das Boron nie untreu war! Ach, ich wünschte, ich könnte nicht das gleiche von meiner Frau sagen ..."},
			Answer{Tag = "boronP204_012PC", String = "Eure Frau ist untreu?", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "boronP204_013", String = "Ach ich weiß es nicht, das macht mich ja so närrisch! Aber meine Sahra blickt mich kaum noch an ... und abends zieht sie sich immer in ihr Zimmer zum nähen zurück. Manchmal höre ich sie dann lachen, als würde sie mit jemandem scherzen!"},
			Answer{Tag = "boronP204_014PC", String = "Dann stellt sie zur rede, Boron! Soviel müsst Ihr schon wagen!", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBetrogenerKnown"},
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


	EndDefinition()
end