-->INFO: DasTier
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Erst mal den Dialog aus
OnOneTimeEvent
{
	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8446"},
	}
}

-- Nur wenn man den Tipp vom Dorfältesten hat wird das Viech friedlich
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_n_P203_TierFreiLassen"},
	},
	Actions = 
	{
		ChangeRace {Race = 185},
		SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_8446"},
		SetNpcTimeStamp {Name = "nt_P203_TierSicherheitsAbfang"}
	},
}

-- Ist das Viech einmal aktiviert wird es immer wieder kommen und rumroamen
Respawn
{
	X = _X, Y = _Y, NoSpawnEffect = TRUE, WaitTime = 10,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_n_P203_TierFreiLassen"},
		IsGlobalFlagTrue {Name = "g_n_P203TierAngesprochen"},
	},
	Actions =
	{
		ResetGlobalCounter {Name = "g_c_P203TierRumlaufCounter"},
		ChangeRace {Race = 191},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8446"},
	}
}


-- Sollte es sterben, bevor man mit ihm geredet hat, muss es den Dialog behalten
Respawn
{
	X = _X, Y = _Y, NoSpawnEffect = TRUE, WaitTime = 10,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_n_P203_TierFreiLassen"},
		IsGlobalFlagFalse {Name = "g_n_P203TierAngesprochen"},
	},
	Actions =
	{
		ResetGlobalCounter {Name = "g_c_P203TierRumlaufCounter"},
		ChangeRace {Race = 191},
		--SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8446"},
	}
}

--Der Home Point liegt im Weg der Truppen und wird nach dem wiederbeleben wieder angesteuert
-- Außerdem wird ein wenig rumgestreunt, damit das Ganze nicht so statisch ist
OnIdleGoHome
{
	WalkMode = Run, X = 223, Y = 227, Direction = 0,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_n_P203TierAngesprochen"},
		IsGlobalCounter {Name = "g_c_P203TierRumlaufCounter", Value = 0}
	},
	HomeActions =
	{
		IncreaseGlobalCounter {Name = "g_c_P203TierRumlaufCounter"},
	}
}


OnIdleGoHome
{
	WalkMode = Run, X = 255, Y = 173, Direction = 0,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_n_P203TierAngesprochen"},
		IsGlobalCounter {Name = "g_c_P203TierRumlaufCounter", Value = 1}
	},
	HomeActions =
	{
		IncreaseGlobalCounter {Name = "g_c_P203TierRumlaufCounter"},
	}
}


OnIdleGoHome
{
	WalkMode = Run, X = 327, Y = 205, Direction = 0,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_n_P203TierAngesprochen"},
		IsGlobalCounter {Name = "g_c_P203TierRumlaufCounter", Value = 2}
	},
	HomeActions =
	{
		IncreaseGlobalCounter {Name = "g_c_P203TierRumlaufCounter"},
	}
}


OnIdleGoHome
{
	WalkMode = Run, X = 427, Y = 235, Direction = 0,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_n_P203TierAngesprochen"},
		IsGlobalCounter {Name = "g_c_P203TierRumlaufCounter", Value = 3}
	},
	HomeActions =
	{
		ResetGlobalCounter {Name = "g_c_P203TierRumlaufCounter"},
	}
}

OnEvent
{
	Conditions =
	{
		IsNpcTimeElapsed {Name = "nt_P203_TierSicherheitsAbfang", Seconds = 300}
	},
	Actions =
	{
		SetNpcTimeStamp {Name = "nt_P203_TierSicherheitsAbfang"},
		ResetGlobalCounter {Name = "g_c_P203TierRumlaufCounter"},
	}
}
--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p203\n8446_DasTier.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "goraP203_001", String = "(Das Gora sieht müde und ängstlich aus.)"},
			Answer{Tag = "goraP203_002PC", String = "(Ihr gebt dem Tier die Honigwabe, es verschlingt sie gierig!)", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "goraP203_003", String = "(Die Augen des Gora erstrahlen mit neuem Glanz! Schnüffelnd, wie als würde es nach Feinden suchen, richtet es sich auf und macht sich auf den Weg.)"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_n_P203TierAngesprochen"},
			TransferItem{TakeItem = 7438 , Amount = 1 , Flag = Take},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end