function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--Phönixstein
SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_nP202_SchattenklingeSpieler"}
	},
	Actions =
	{
		ChangeOwner {}
	}
}

-- Wenn der Spieler die Karte neu betritt soll der Avatar mit an den entsprechenden Bindstone spawnen
Umspawn
{
	X = 0, Y = 0,
	--WaitTime = 60,
	Target = Avatar,
	OnlyOnce = FALSE,
	Conditions =
	{
		-- Die Bindstoneliste ist gecleared also neues betreten
		IsGlobalFlagFalse {Name = "g_P213_BindStoneEins"},
		IsGlobalFlagFalse {Name = "g_P213_BindStoneZwei"},
		IsGlobalFlagFalse {Name = "g_P213_BindStoneDrei"},
		IsGlobalFlagFalse {Name = "g_P213_BindStoneVier"},
		IsGlobalFlagFalse {Name = "g_P213_BindStoneFuenf"},
		IsGlobalFlagFalse {Name = "g_P213_BindStoneSechs"},
		IsGlobalFlagFalse {Name = "g_P213_ZapBlocker"},
		--AvatarInRange {X = 101, Y = 412, Range = 7},
	},
	Actions =
	{
		ChangeOwner {},
		SetGlobalFlagTrue {Name = "g_P213_ZapBlocker"},
		--Outcry {Tag = "oca2shadowwarP213_001", NpcId = 11168, String = "Die Rune bringt mich ins Leben zurück!", Color = ColorWhite},
	}
}


---- Bindstone Eins
--Respawn
--{
--	X = 101, Y = 412,
--	WaitTime = 60,
--	Conditions =
--	{
--		-- Die Bindstoneliste ist gecleared also neues betreten
--		IsGlobalFlagFalse {Name = "g_P213_BindStoneEins"},
--		IsGlobalFlagFalse {Name = "g_P213_BindStoneZwei"},
--		IsGlobalFlagFalse {Name = "g_P213_BindStoneDrei"},
--		IsGlobalFlagFalse {Name = "g_P213_BindStoneVier"},
--		IsGlobalFlagFalse {Name = "g_P213_BindStoneFuenf"},
--		AvatarInRange {X = 101, Y = 412, Range = 7},
--	},
--	Actions =
--	{
--		ChangeOwner {},
--		Outcry {Tag = "oca2phoenixguardP213_001", NpcId = 11168, String = "Die Rune tut ihr Werk! Ich lebe wieder!", Color = ColorWhite},
--	}
--}
--
---- Bindstone Zwei
--Respawn
--{
--	X = 272, Y = 290,
--	WaitTime = 60,
--	Conditions =
--	{
--		-- Die Bindstoneliste ist gecleared also neues betreten
--		IsGlobalFlagFalse {Name = "g_P213_BindStoneEins"},
--		IsGlobalFlagFalse {Name = "g_P213_BindStoneZwei"},
--		IsGlobalFlagFalse {Name = "g_P213_BindStoneDrei"},
--		IsGlobalFlagFalse {Name = "g_P213_BindStoneVier"},
--		IsGlobalFlagFalse {Name = "g_P213_BindStoneFuenf"},
--		AvatarInRange {X = 272, Y = 290, Range = 7},
--	},
--	Actions =
--	{
--		ChangeOwner {},
--		Outcry {Tag = "oca2phoenixguardP213_001", NpcId = 11168, String = "Die Rune tut ihr Werk! Ich lebe wieder!", Color = ColorWhite},
--	}
--}
--
---- Bindstone Drei
--
--Respawn
--{
--	X = 306, Y = 108,
--	WaitTime = 60,
--	Conditions =
--	{
--		-- Die Bindstoneliste ist gecleared also neues betreten
--		IsGlobalFlagFalse {Name = "g_P213_BindStoneEins"},
--		IsGlobalFlagFalse {Name = "g_P213_BindStoneZwei"},
--		IsGlobalFlagFalse {Name = "g_P213_BindStoneDrei"},
--		IsGlobalFlagFalse {Name = "g_P213_BindStoneVier"},
--		IsGlobalFlagFalse {Name = "g_P213_BindStoneFuenf"},
--		AvatarInRange {X = 306, Y = 108, Range = 7},
--	},
--	Actions =
--	{
--		ChangeOwner {},
--		Outcry {Tag = "oca2phoenixguardP213_001", NpcId = 11168, String = "Die Rune tut ihr Werk! Ich lebe wieder!", Color = ColorWhite},
--	}
--}
--
---- Bindstone Vier
--Respawn
--{
--	X = 405, Y = 179,
--	WaitTime = 60,
--	Conditions =
--	{
--		-- Die Bindstoneliste ist gecleared also neues betreten
--		IsGlobalFlagFalse {Name = "g_P213_BindStoneEins"},
--		IsGlobalFlagFalse {Name = "g_P213_BindStoneZwei"},
--		IsGlobalFlagFalse {Name = "g_P213_BindStoneDrei"},
--		IsGlobalFlagFalse {Name = "g_P213_BindStoneVier"},
--		IsGlobalFlagFalse {Name = "g_P213_BindStoneFuenf"},
--		AvatarInRange {X = 405, Y = 179, Range = 7},
--	},
--	Actions =
--	{
--		ChangeOwner {},
--		Outcry {Tag = "oca2phoenixguardP213_001", NpcId = 11168, String = "Die Rune tut ihr Werk! Ich lebe wieder!", Color = ColorWhite},
--	}
--}

-- Der Avatar testes welcher Bindstone noch aktiv ist und spawnt an diesem
-- Erster Bindstone Am Portal
Respawn
{
	X = 101, Y = 412,
	WaitTime = 60,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P213_BindStoneEins"},
		IsGlobalFlagFalse {Name = "g_P213_BindStoneZwei"},
		IsGlobalFlagFalse {Name = "g_P213_BindStoneDrei"},
		IsGlobalFlagFalse {Name = "g_P213_BindStoneVier"},
		IsGlobalFlagFalse {Name = "g_P213_BindStoneFuenf"},
		IsGlobalFlagFalse {Name = "g_P213_BindStoneSechs"},
	},
	Actions =
	{
		ChangeOwner {},
		Outcry {Tag = "oca2phoenixguardP213_001", NpcId = 11168, String = "Die Rune tut ihr Werk! Ich lebe wieder!", Color = ColorWhite},
	}
}


-- Zweiter Bindstone am zweiten Aufbau
Respawn
{
	X = 272, Y = 290,
	WaitTime = 60,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P213_BindStoneZwei"},
		IsGlobalFlagFalse {Name = "g_P213_BindStoneDrei"},
		IsGlobalFlagFalse {Name = "g_P213_BindStoneVier"},
		IsGlobalFlagFalse {Name = "g_P213_BindStoneFuenf"},
		IsGlobalFlagFalse {Name = "g_P213_BindStoneSechs"},
	},
	Actions =
	{
		ChangeOwner {},
		Outcry {Tag = "oca2phoenixguardP213_001", NpcId = 11168, String = "Die Rune tut ihr Werk! Ich lebe wieder!", Color = ColorWhite},
	}
}

-- Dritter Bindstone erster Bonetemple
Respawn
{
	X = 275, Y = 289,
	WaitTime = 60,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P213_BindStoneDrei"},
		IsGlobalFlagFalse {Name = "g_P213_BindStoneVier"},
		IsGlobalFlagFalse {Name = "g_P213_BindStoneFuenf"},
		IsGlobalFlagFalse {Name = "g_P213_BindStoneSechs"},
	},
	Actions =
	{
		ChangeOwner {},
		Outcry {Tag = "oca2phoenixguardP213_001", NpcId = 11168, String = "Die Rune tut ihr Werk! Ich lebe wieder!", Color = ColorWhite},
	}
}

-- Vierter Bindstone Zweiter Bonetemple
Respawn
{
	X = 21, Y = 84,
	WaitTime = 60,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P213_BindStoneVier"},
		IsGlobalFlagFalse {Name = "g_P213_BindStoneFuenf"},
		IsGlobalFlagFalse {Name = "g_P213_BindStoneSechs"},
	},
	Actions =
	{
		ChangeOwner {},
		Outcry {Tag = "oca2phoenixguardP213_001", NpcId = 11168, String = "Die Rune tut ihr Werk! Ich lebe wieder!", Color = ColorWhite},
	}
}

-- Fuenfter Bindstone Zweiter Bonetemple
Respawn
{
	X = 304, Y = 107,
	WaitTime = 60,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P213_BindStoneFuenf"},
		IsGlobalFlagFalse {Name = "g_P213_BindStoneSechs"},
	},
	Actions =
	{
		ChangeOwner {},
		Outcry {Tag = "oca2phoenixguardP213_001", NpcId = 11168, String = "Die Rune tut ihr Werk! Ich lebe wieder!", Color = ColorWhite},
	}
}

-- Sechster Bindstone Zweiter Bonetemple
Respawn
{
	X = 407, Y = 180,
	WaitTime = 60,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P213_BindStoneSechs"},
	},
	Actions =
	{
		ChangeOwner {},
		Outcry {Tag = "oca2phoenixguardP213_001", NpcId = 11168, String = "Die Rune tut ihr Werk! Ich lebe wieder!", Color = ColorWhite},
	}
}

Umspawn
{
	X = 300, Y = 100,
	OnlyOnce = FALSE,
	Conditions =
	{
		--FigureInRange {X = 235, Y = 97, Range = 3},
		IsGlobalFlagTrue {Name = "g_P213_SpielerInEndfestung"},
		IsGlobalFlagFalse {Name = "g_P213_SpielerWarInEndfestung"},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_P213_SpielerWarInEndfestung"},
		ChangeOwner {},
	}
}

Umspawn
{
	X = 235, Y = 97,
	OnlyOnce = FALSE,
	Conditions =
	{
		--FigureInRange {X = 300, Y = 100, Range = 3},
		IsGlobalFlagFalse {Name = "g_P213_SpielerInEndfestung"},
		IsGlobalFlagTrue {Name = "g_P213_SpielerWarInEndfestung"},
	},
	Actions =
	{
		SetGlobalFlagFalse {Name = "g_P213_SpielerWarInEndfestung"},
		ChangeOwner {},
	}
}

Umspawn 
{
	X = 458, Y = 240,
	NoSpawnEffect = TRUE,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "UmspawnExtroBone", UpdateInterval = 2},
	},
	Actions =
	{
		SetNoFightFlagTrue {NpcId = self},
	}
}

EndDefinition()

end