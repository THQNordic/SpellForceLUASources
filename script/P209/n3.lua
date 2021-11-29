-- _______________________________________
--I                                      I
--I             P209_Kathai              I
--I______________________________________I




----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------


function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

BeginScript
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209ArtefaktAuftragErhalten"},
	},
	Actions = 
	{
	
	},
}


KillScript
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209CutszeneBote"},
	},
	Actions = 
	{
	
	},
}


-- _______________________________________
--I                                      I
--I              Zweiter Akt             I
--I______________________________________I


--Die Kathaioberen und Händler begeben sich zu ihren Residenzen und Marktständen.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209ArtefaktAuftragErhalten"},
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "g_sP209KathaiMove"},
	}
}

--Wenn der Spieler Artefakt 1 als erstes beschafft.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsItemFlagTrue {Name = "PlayerHasItemHeiligesArtefaktKathai1"},
		FigureDead {NpcId = 8797}, 
		IsGlobalCounter {Name = "g_cnP209ArtefaktAnzahl", Value = 0, Operator = IsEqual},
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "g_sP209UmspawnXalabar3"},
		IncreaseGlobalCounter {Name = "g_cnP209ArtefaktAnzahl"},
	}
}

--Wenn der Spieler Artefakt 2 als erstes beschafft.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsItemFlagTrue {Name = "PlayerHasItemHeiligesArtefaktKathai2"},
		FigureDead {NpcId = 8798},
		IsGlobalCounter {Name = "g_cnP209ArtefaktAnzahl", Value = 0, Operator = IsEqual},
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "g_sP209UmspawnXalabar1"},
		IncreaseGlobalCounter {Name = "g_cnP209ArtefaktAnzahl"},
	}
}

--Wenn der Spieler Artefakt 3 als erstes beschafft.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsItemFlagTrue {Name = "PlayerHasItemHeiligesArtefaktKathai3"},
		FigureDead {NpcId = 8799},
		IsGlobalCounter {Name = "g_cnP209ArtefaktAnzahl", Value = 0, Operator = IsEqual},
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "g_sP209UmspawnXalabar1"},
		IncreaseGlobalCounter {Name = "g_cnP209ArtefaktAnzahl"},
	}
}

--Wenn der Spieler mindestens 1 Artefakt gefunden hat, wird der Dialog mit Uru freigeschaltet.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalCounter {Name = "g_cnP209ArtefaktAnzahl", Value = 1, Operator = IsGreaterOrEqual},
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "g_sP209UruArtefaktDialogStart"},
		
	}
}

--Skelette sterben beim Tempel3 wenn Xalabar auftaucht.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209XalabarErscheintTempel3", UpdateInterval = 10},
	},
	Actions = 
	{ 
		Kill {NpcId = 10287},
		Kill {NpcId = 10288},
		Kill {NpcId = 10289},
		Kill {NpcId = 10290},
		
	}
}

--Skelette sterben beium Tempel1 wenn Xalabar auftaucht.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209XalabarErscheintTempel1", UpdateInterval = 10},
	},
	Actions = 
	{ 
		Kill {NpcId = 10295},
		Kill {NpcId = 10296},
		Kill {NpcId = 10297},
		Kill {NpcId = 10298},
		
	}
}


--Abfrage wie viele Artefakte der Spieler besitzt.
OnOneTimeEvent
{
	Conditions = 
	{ 
		ODER9
		{ 
			UND(IsItemFlagTrue {Name = "PlayerHasItemHeiligesArtefaktKathai1"},IsItemFlagTrue {Name = "PlayerHasItemHeiligesArtefaktKathai2"}),
			UND(IsItemFlagTrue {Name = "PlayerHasItemHeiligesArtefaktKathai2"},IsItemFlagTrue {Name = "PlayerHasItemHeiligesArtefaktKathai3"}),
			UND(IsItemFlagTrue {Name = "PlayerHasItemHeiligesArtefaktKathai1"},IsItemFlagTrue {Name = "PlayerHasItemHeiligesArtefaktKathai3"}),
		}
	},
	Actions = 
	{ 
		IncreaseGlobalCounter {Name = "g_cnP209ArtefaktAnzahl"},
		
	}
}

--Abfrage ob der Spieler versucht unerlaubte Einheiten mit in die Arena zu nehmen. Erlaubt sind nur Avatar und Mitstreiter falls 2 Artefakte gesichert wurden.

OnToggleEvent
{
	OnConditions =
	{
		IsGlobalFlagFalse {Name = "g_sP209XalabarGeschlagen", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP209ArenaStart", UpdateInterval = 10},
		PlayerUnitInRange {X = 351, Y = 184, Range = 15, FigureType = FigureAvatar , UpdateInterval = 10},
	},
	OnActions = 
	{
		SetGlobalFlagTrue {Name = "g_sP209DerKampfKannBeginnen"},
			
	},
	OffConditions =
	{
		IsGlobalFlagFalse {Name = "g_sP209XalabarGeschlagen", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_sP209ArenaStart", UpdateInterval = 10},
		Negated(PlayerUnitInRange {X = 351, Y = 184, Range = 15, FigureType = FigureAvatar , UpdateInterval = 10}),
	},
	OffActions = 
	{
		SetGlobalFlagFalse {Name = "g_sP209DerKampfKannBeginnen"},
	},
}



EndDefinition()
end
