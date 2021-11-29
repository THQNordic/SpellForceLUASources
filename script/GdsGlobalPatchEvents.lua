-- Globale patch events werden auf jeder plattform geladen & geprüft 
-- (aber natürlich trotzdem nur einmal angewendet).

function RegisterGlobalPatchEvents()
	print("Registering Global Patch Events...")
	
-- WICHTIG: existierende Patch events NIEMALS (!!!) verändern 
-- 			(zumindest dann nicht mehr wenn der patch gemastered wurde)
-- WICHTIG: neue Patch events immer GANZ UNTEN ANFÜGEN !!!



-----------------------------------------------------------------------------------------------------------------------------
------------- PATCH from v1.00 to v1.02 BEGINS HERE -------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------

-- ________________________________________________________________________________________________________________________

--Whisper Restart Problem ist aufgetreten, Zustand 1, Items noch nicht an Uthar übergeben (Blocker)
	OnPersistentPatchEvent
	{
		Bugzilla = 0,
		Changelist = 42589,
		Description = "WhisperRestartProblem_Zustand1",
		ApplyOnlyWhenSavegameVersion = 100,
        Conditions =
        {
            ODER(PlayerHasItem {ItemId = 3245 },
           	ODER(PlayerHasItem{ItemId = 3246}, 
           		CGdsDbVariable:new("nfGriffonFreed_Npc3605_P16", NpcVariable, TRUE, IsEqual, 1) )),
           		CGdsDbVariable:new("nfGetIsmail_Npc3602_P16", NpcVariable, FALSE, IsEqual, 1),
        		CGdsDbVariable:new("grFluesterndeStadt4Endkampf", GlobalVariable, FALSE, IsEqual, 1),
                 IsGlobalFlagFalse {Name = "AlreadyBeenThere2"},
            ODER(QuestState{QuestId = 247 , State = StateActive}, QuestState{QuestId = 243 , State = StateActive})
        },
        Actions =
        {                       
        SetGlobalFlagTrue{Name = "PATCH211103Q242RestartOccuredWithItems"},
        QuestSolve{QuestId = 247},
        QuestSolve{QuestId = 243},
        QuestBegin{QuestId = 490},
        }
}


--Whisper Restart Problem ist aufgetreten, Zustand 2, Uthar unterwegs zu Ismail
	OnPersistentPatchEvent
	{
		Bugzilla = 0,
		Changelist = 42589,
		Description = "WhisperRestartProblem_Zustand2",
		ApplyOnlyWhenSavegameVersion = 100,
        Conditions =
        {
        			CGdsDbVariable:new("nfGetIsmail_Npc3602_P16", NpcVariable, TRUE, IsEqual, 1),
        			CGdsDbVariable:new("grFluesterndeStadt4Endkampf", GlobalVariable, FALSE, IsEqual, 1),
                    IsGlobalFlagFalse {Name = "AlreadyBeenThere2"},
                    ODER(QuestState{QuestId = 247 , State = StateActive}, QuestState{QuestId = 243 , State = StateActive})
        },
        Actions =
        {                       
        SetGlobalFlagTrue{Name = "PATCH211103Q242RestartOccuredKillingIsmail"},
        QuestSolve{QuestId = 247},
        QuestSolve{QuestId = 243},
        QuestBegin{QuestId = 490},
        QuestSolve{QuestId = 491},
        QuestSolve{QuestId = 492},
        QuestSolve{QuestId = 493},
        QuestSolve{QuestId = 494},
        }
}

--Whisper Restart Problem ist aufgetreten, Zustand 3, Hokans Grab suchen
	OnPersistentPatchEvent
	{
		Bugzilla = 0,
		Changelist = 42589,
		Description = "WhisperRestartProblem_Zustand3",
		ApplyOnlyWhenSavegameVersion = 100,
        Conditions =
        {
        			CGdsDbVariable:new("grFluesterndeStadt4Endkampf", GlobalVariable, TRUE, IsEqual, 1),
                    IsGlobalFlagFalse {Name = "AlreadyBeenThere2"},
                    ODER(QuestState{QuestId = 247 , State = StateActive}, QuestState{QuestId = 243 , State = StateActive})
        },
        Actions =
        {                       
        SetGlobalFlagTrue{Name = "PATCH211103Q242RestartOccuredSearchGrave"},
        QuestSolve{QuestId = 247},
        QuestSolve{QuestId = 243},
        QuestBegin{QuestId = 490},
        QuestSolve{QuestId = 491},
        QuestSolve{QuestId = 492},
        QuestSolve{QuestId = 493},
        QuestSolve{QuestId = 494},
        QuestSolve{QuestId = 490},
        QuestBegin{QuestId = 244},
        }
}

--Whisper Restart Problem ist aufgetreten, Zustand 4, Maske suchen, Cutscene gesehen
	OnPersistentPatchEvent
	{
		Bugzilla = 0,
		Changelist = 42589,
		Description = "WhisperRestartProblem_Zustand4",
		ApplyOnlyWhenSavegameVersion = 100,
        Conditions =
        {
                    IsGlobalFlagTrue {Name = "AlreadyBeenThere2"},
                    ODER(QuestState{QuestId = 247 , State = StateActive}, QuestState{QuestId = 243 , State = StateActive})
        },
        Actions =
        {                       
        SetGlobalFlagTrue{Name = "PATCH211103Q242RestartOccuredAfterCutscene"},
        QuestSolve{QuestId = 247},
        QuestSolve{QuestId = 243},
        QuestBegin{QuestId = 490},
        QuestSolve{QuestId = 491},
        QuestSolve{QuestId = 492},
        QuestSolve{QuestId = 493},
        QuestSolve{QuestId = 494},
        QuestSolve{QuestId = 490},
        QuestSolve{QuestId = 244},
        QuestBegin{QuestId = 245},
        }
}

--Einzelne Items

-- Whisper Schwert gemacht, dann restart
	OnPersistentPatchEvent
	{
		Bugzilla = 0,
		Changelist = 42589,
		Description = "WhisperRestartProblem_Schwert",
		ApplyOnlyWhenSavegameVersion = 100,
        Conditions =
        {
                    PlayerHasItem {ItemId = 3245 },
                    IsGlobalFlagTrue{Name = "PATCH211103Q242RestartOccuredWithItems"},
        },
        Actions =
        {                       
                    QuestSolve{QuestId = 491},
        }
}

-- Whisper Rüstung gemacht, dann restart
	OnPersistentPatchEvent
	{
		Bugzilla = 0,
		Changelist = 42589,
		Description = "WhisperRestartProblem_Rüstung",
		ApplyOnlyWhenSavegameVersion = 100,
        Conditions =
        {
                    PlayerHasItem {ItemId = 3246 },
                    IsGlobalFlagTrue{Name = "PATCH211103Q242RestartOccuredWithItems"},
        },
        Actions =
        {                       
                    QuestSolve{QuestId = 492},
        }
}

-- Whisper Greif gemacht, dann restart
	OnPersistentPatchEvent
	{
		Bugzilla = 0,
		Changelist = 42589,
		Description = "WhisperRestartProblem_Greif",
		ApplyOnlyWhenSavegameVersion = 100,
        Conditions =
        {
					CGdsDbVariable:new("nfGriffonFreed_Npc3605_P16", NpcVariable, TRUE, IsEqual, 1),
                    IsGlobalFlagTrue{Name = "PATCH211103Q242RestartOccuredWithItems"},
        },
        Actions =
        {                       
                    QuestSolve{QuestId = 493},
        }
}

--Alles komplett aber noch nicht bei uthar
	OnPersistentPatchEvent
	{
		Bugzilla = 0,
		Changelist = 42589,
		Description = "WhisperRestartProblem_KomplettOhneUthar",
		ApplyOnlyWhenSavegameVersion = 100,
        Conditions =
        {
                    QuestState{QuestId = 491 , State = StateSolved},
                    QuestState{QuestId = 492 , State = StateSolved},
                    QuestState{QuestId = 493 , State = StateSolved},
                    IsGlobalFlagTrue{Name = "PATCH211103Q242RestartOccuredWithItems"},
        },
        Actions =
        {                       
                    QuestBegin{QuestId = 494},
        }
}

-- _____________________________________________________________________

	-- kein reward bei goran in greyfell
	OnPersistentPatchEvent
	{
		Bugzilla = 0,
		Changelist = 42664,
		Description = "GreyfellGoranDoesNotGiveHisReward",
		ApplyOnlyWhenSavegameVersion = 100,
        Conditions =
        {
			IsPlayerFlagTrue{Name = "FlagGoranKnown"},
			PlayerHasItem{ItemId = 2899},
			PlayerHasItem{ItemId = 3043},
        },
        Actions =
        {                       
			TransferItem{TakeItem = 2899 , Flag = Take},
			TransferItem{TakeItem = 3043 , Flag = Take},
			TransferItem{GiveItem = 1878 , Flag = Give},
        }
}

-- ________________________________________________________________________________________________________________________

	-- southern windwalls: "falscher" silas held erhalten (lev 6 statt 13), hiermit wird er ausgetauscht...
	OnPersistentPatchEvent
	{
		Bugzilla = 0,
		Changelist = 42754,
		Description = "SouthernWindwallsUrimHasGivenWrongSilas",
		ApplyOnlyWhenSavegameVersion = 100,
        Conditions =
        {
			CGdsDbVariable:new("nfUrimHasGivenSilas_Npc2179_P10", NpcVariable, TRUE, IsEqual, 1),
			Negated(PlayerHasItem{ItemId = 3576}),
			--PlayerHasItem{ItemId = 753},
        },
        Actions =
        {                       
			TransferItem{TakeItem = 753 , Flag = Take},
			TransferItem{GiveItem = 3576 , Flag = Give},
        }
}

-- ________________________________________________________________________________________________________________________

	--Questfix Blut, Adhiras Dialog freischalten
	OnPersistentPatchEvent
	{
		Bugzilla = 0,
		Changelist = 43090,
		Description = "BlutQuestAdhiraDialogFreischalten",
		ApplyOnlyWhenSavegameVersion = 100,
        Conditions =
        {
           IsPlayerFlagFalse {Name = "Q395AllBlood"},
           QuestState{QuestId = 399 , State = StateSolved},
           QuestState{QuestId = 400 , State = StateSolved},
           QuestState{QuestId = 406 , State = StateSolved},
        },
        Actions =
        {
           SetPlayerFlagTrue {Name = "Q395AllBlood"},
        }
}

-- ________________________________________________________________________________________________________________________

	-- safety für "von breathing forest" gewiped und das portal geblockt durch die bladetürme
	-- hiermit kann man sich wieder den resist black magic spell vom archon holen
	-- die entspr. quest 539 bleibt dann bis spielende active, damit können wir leben...
	OnPersistentPatchEvent
	{
		Bugzilla = 0,
		Changelist = 0,
		Description = "NightwhisperDaleArchonGibtWiederholbarBlackMagicResistBuff",
		ApplyOnlyWhenSavegameVersionBefore = 102,
        Conditions =
        {
           FigureAlive{NpcId = 4201},
           QuestState{QuestId = 539 , State = StateSolved},
        },
        Actions =
        {
        	QuestBegin{QuestId = 539},
        }
}

-- ________________________________________________________________________________________________________________________

	
-----------------------------------------------------------------------------------------------------------------------------
------------- PATCH from v1.00 to v1.02 ENDS HERE ---------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------------
------------- PATCH from v1.x to v1.03 BEGINS HERE ---------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
-- Sprengung wird ausgeführt, auch ohne dass der Zwerg dorthin läuft
-- behebt ein Problem mit gleichzeitgem Goto und IdleGoHome 
	OnPersistentPatchEvent
	{
		Bugzilla = 0,
		Changelist = 0,
		Description = "FarlornsHopeDwarfDetonationFix",
		ApplyOnlyWhenSavegameVersionBefore = 103,
     Conditions =
	{
		FigureInRange {X = 92, Y = 274, NpcId = 2798 , Range = 2},
		IsGlobalFlagTrue{Name = "Q279DetonationCutsceneStart"},
--		IsGlobalFlagFalse {Name = "Explosionsschalter"},
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "BorkSprengung"},
		SetGlobalFlagTrue{Name = "BorkSprengung"},
	}
}
-- Fehlender Ariaschrein bei einigen Usern, ab 1.03 bei Mark Shamir
	OnPersistentPatchEvent
	{
		Bugzilla = 0,
		Changelist = 0,
		Description = "GiveAriaShrine",
		ApplyOnlyWhenSavegameVersionBefore = 103,
     Conditions =     {
                      Negated(QuestState{QuestId = 26 , State = StateUnknown})
                      },
Actions =             {
					TransferItem{GiveItem = 267 , Amount = 1 , Flag = Give}
                      }
}
-- Fehlender CattleBreeding und GrainFarm, ab 1.03 bei Mark Shamir
	OnPersistentPatchEvent
	{
		Bugzilla = 0,
		Changelist = 0,
		Description = "GiveCattleBreedingGrainFarm",
		ApplyOnlyWhenSavegameVersionBefore = 103,
     Conditions =     {
                      Negated(QuestState{QuestId = 18 , State = StateUnknown})
                      },
Actions =             {
					TransferItem{GiveItem = 170 , Amount = 1 , Flag = Give},
                    TransferItem{GiveItem = 247 , Amount = 1 , Flag = Give}
                      }
}


-- Tor nach Eloni nicht auf, weil die 5 jungs gestorben sind ganz zum schluss...
	OnPersistentPatchEvent
	{
		Bugzilla = 0,
		Changelist = 0,
		Description = "WegNachEloniQuestBlockiertWeilDiePortaltruppeTotIstNachdemSieAmPortalWaren",
		ApplyOnlyWhenSavegameVersionBefore = 103,
     Conditions =     {
			IsGlobalCounter{Name = "NumTroopsDead", Operator = IsGreaterOrEqual, Value = 5},
			QuestState{QuestId = 17, State = StateActive},
			QuestState{QuestId = 262, State = StateUnknown},
                      },
	Actions =         {
		QuestSolve{QuestId = 17},
		QuestBegin{QuestId = 262}, 
		SetPlayerFlagTrue{Name = "QuestGetToEloniSolved"},
                      }
}


-- Tor nach Eloni auf Liannon, vereinfachung ...
OnPersistentPatchEvent
{
		Bugzilla = 0,
		Changelist = 0,
		Description = "TorNachEloniVereinfachungUndBugfix",
		ApplyOnlyWhenSavegameVersionBefore = 103,
	Conditions = {
		IsGlobalFlagTrue{Name = "Q16PortalGoblinsDead" },
		FigureInRange{X = 68, Y = 202, NpcId = Avatar, Range = 4},
		QuestState{QuestId = 262, State = StateUnknown},
	},
	Actions = {
		QuestSolve{QuestId = 15},
		QuestSolve{QuestId = 16},
		QuestSolve{QuestId = 17},
		QuestBegin{QuestId = 262}, 
		SetPlayerFlagTrue{Name = "QuestGetToEloniSolved"},
		ResetGlobalCounter{Name = "NumTroopsSpawned"},
		ResetGlobalCounter{Name = "NumTroopsDead"} ,
		SetPlayerFlagFalse{Name = "Q16AttemptFailed"},
	},
}

-----------------------------------------------------------------------------------------------------------------------------
------------- PATCH from v1.x to v1.03 ENDS HERE ---------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------------
------------- PATCH from v1.x to v1.05 BEGINS HERE -------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------

-- reward item austauschen beim trickster
OnPersistentPatchEvent
{
		Bugzilla = 0,
		Changelist = 43858,
		Description = "ManbekommtfürsLösenderTrickster-QuesteinanderesItem",
		ApplyOnlyWhenSavegameVersionBefore = 105,
	Conditions = {
		IsRewardFlagTrue{Name = "TricksterReturn"},
		PlayerHasItem{ItemId = 649},
	},
	Actions = {
		TransferItem{TakeItem = 649, Flag = Take},
		TransferItem{GiveItem = 3621, Flag = Give},
	},
}

-- Farlorns Hope: Halicos Alternativer Start Fix
OnPersistentPatchEvent
{
		Bugzilla = 0,
		Changelist = 43865,
		Description = "HalicosAlternativerStartFix",
		ApplyOnlyWhenSavegameVersionBefore = 105,
	Conditions = {
		QuestState{QuestId = 272 , State = StateSolved},
		QuestState{QuestId = 274 , State = StateUnknown},
	},
	Actions = {
		QuestBegin{QuestId = 272},
	},
}


-----------------------------------------------------------------------------------------------------------------------------
------------- PATCH from v1.x to v1.05 ENDS HERE ---------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------------------------------------
------------- PATCH from v1.x to v1.10 BEGINS HERE -------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
-- Beenden der Wolfszeichenqueste bei Beginn Reise 4
OnPersistentPatchEvent
{
		Bugzilla = 0,
		Changelist = 45583,
		Description = "BeendenWolfszeichen",
		ApplyOnlyWhenSavegameVersionBefore = 110,
	Conditions = {
		QuestState{QuestId = 267 , State = StateActive},
		Negated(QuestState{QuestId = 555 , State = StateUnknown}),
	},
	Actions = {
		QuestSolve{QuestId = 267},
		QuestSolve{QuestId = 266},
	},
} 
-- BindStones für den Patch nachreichen
-- Graufurt
if PlatformID == 63 then
	OnPersistentPatchEvent
	{
		Bugzilla = PlatformID, Changelist = PlatformID, Description = "AddBindStoneGreyfell", ApplyOnlyWhenSavegameVersionBefore = 110,
		Conditions = {},
		Actions = 
		{
			CGdsAddBindPoint:new(188, 291),
		},
	}

-- Elonie
elseif PlatformID == 2 then
	OnPersistentPatchEvent
	{
		Bugzilla = PlatformID, Changelist = PlatformID, Description = "AddBindStoneEloni", ApplyOnlyWhenSavegameVersionBefore = 110,
		Conditions = {},
		Actions = 
		{
			CGdsAddBindPoint:new(161, 158),
			CGdsAddBindPoint:new(449, 420),
		},
	}

-- Leafshade 
elseif PlatformID == 4 then
	OnPersistentPatchEvent
	{
		Bugzilla = PlatformID, Changelist = PlatformID, Description = "AddBindStoneLeafshade", ApplyOnlyWhenSavegameVersionBefore = 110,
		Conditions = {},
		Actions = 
		{
			CGdsAddBindPoint:new(326, 172),
		},
	}


-- Shiel
elseif PlatformID == 5 then
	OnPersistentPatchEvent
	{
		Bugzilla = PlatformID, Changelist = PlatformID, Description = "AddBindStoneShiel", ApplyOnlyWhenSavegameVersionBefore = 110,
		Conditions = {},
		Actions = 
		{
			CGdsAddBindPoint:new(423, 339),
		},
	}

-- Wildlandpass
elseif PlatformID == 6 then
	OnPersistentPatchEvent
	{
		Bugzilla = PlatformID, Changelist = PlatformID, Description = "AddBindStoneWildlandpass", ApplyOnlyWhenSavegameVersionBefore = 110,
		Conditions = {},
		Actions = 
		{
			CGdsAddBindPoint:new(285, 297),
			CGdsAddBindPoint:new(397, 341),
		},
	}
	
-- Icegate Marsh
elseif PlatformID == 7 then
	OnPersistentPatchEvent
	{
		Bugzilla = PlatformID, Changelist = PlatformID, Description = "AddBindStoneIcegateMarsh", ApplyOnlyWhenSavegameVersionBefore = 110,
		Conditions = {},
		Actions = 
		{
			CGdsAddBindPoint:new(390, 453),
			CGdsAddBindPoint:new(336, 330),
		},
	}

-- Northern Windwalls
elseif PlatformID == 9 then
	OnPersistentPatchEvent
	{
		Bugzilla = PlatformID, Changelist = PlatformID, Description = "AddBindStoneNorthernWindwalls", ApplyOnlyWhenSavegameVersionBefore = 110,
		Conditions = {},
		Actions = 
		{
			CGdsAddBindPoint:new(145, 234),
		},
	}

-- Southern Windwalls
elseif PlatformID == 10 then
	OnPersistentPatchEvent
	{
		Bugzilla = PlatformID, Changelist = PlatformID, Description = "AddBindStoneSouthernWindwalls", ApplyOnlyWhenSavegameVersionBefore = 110,
		Conditions = {},
		Actions = 
		{
			CGdsAddBindPoint:new(314, 487),
			CGdsAddBindPoint:new(254, 402),
			CGdsAddBindPoint:new(723, 467),
			CGdsAddBindPoint:new(772, 452),
		},
	}

--Stoneblade Mountain
elseif PlatformID == 11 then
	OnPersistentPatchEvent
	{
		Bugzilla = PlatformID, Changelist = PlatformID, Description = "AddBindStoneStonebladeMountain", ApplyOnlyWhenSavegameVersionBefore = 110,
		Conditions = {},
		Actions = 
		{
			CGdsAddBindPoint:new(123, 108),
			CGdsAddBindPoint:new(319, 399),
		},
	}

-- Greydusk Vale
elseif PlatformID == 12 then
	OnPersistentPatchEvent
	{
		Bugzilla = PlatformID, Changelist = PlatformID, Description = "AddBindStoneGreyduskVale", ApplyOnlyWhenSavegameVersionBefore = 110,
		Conditions = {},
		Actions = 
		{
			CGdsAddBindPoint:new(432, 329),
		},
	}

--Howling Mounds
elseif PlatformID == 15 then
	OnPersistentPatchEvent
	{
		Bugzilla = PlatformID, Changelist = PlatformID, Description = "AddBindStoneHowlingMounds", ApplyOnlyWhenSavegameVersionBefore = 110,
		Conditions = {},
		Actions = 
		{
			CGdsAddBindPoint:new(283, 201),
		},
	}

-- Whisper
elseif PlatformID == 16 then
	OnPersistentPatchEvent
	{
		Bugzilla = PlatformID, Changelist = PlatformID, Description = "AddBindStoneWhisper", ApplyOnlyWhenSavegameVersionBefore = 110,
		Conditions = {},
		Actions = 
		{
			CGdsAddBindPoint:new(376, 440),
		},
	}

--Godwall
elseif PlatformID == 17 then
	OnPersistentPatchEvent
	{
		Bugzilla = PlatformID, Changelist = PlatformID, Description = "AddBindStoneGodwall", ApplyOnlyWhenSavegameVersionBefore = 110,
		Conditions = {},
		Actions = 
		{
			CGdsAddBindPoint:new(100, 328),
			CGdsAddBindPoint:new(317, 412),
		},
	}

-- Mulandir
elseif PlatformID == 19 then
	OnPersistentPatchEvent
	{
		Bugzilla = PlatformID, Changelist = PlatformID, Description = "AddBindStoneMulandir", ApplyOnlyWhenSavegameVersionBefore = 110,
		Conditions = {},
		Actions = 
		{
			CGdsAddBindPoint:new(402, 339),
			CGdsAddBindPoint:new( 71, 258),
			CGdsAddBindPoint:new(418, 410),
		},
	}

-- Farlorns Hope
elseif PlatformID == 21 then
	OnPersistentPatchEvent
	{
		Bugzilla = PlatformID, Changelist = PlatformID, Description = "AddBindStoneFarlorns", ApplyOnlyWhenSavegameVersionBefore = 110,
		Conditions = {},
		Actions = 
		{
			CGdsAddBindPoint:new(419, 199),
			CGdsAddBindPoint:new( 72, 340),
			CGdsAddBindPoint:new(216,  69),
		},
	}

-- Southern Godmark
elseif PlatformID == 25 then
	OnPersistentPatchEvent
	{
		Bugzilla = PlatformID, Changelist = PlatformID, Description = "AddBindStoneSouthernGodmark", ApplyOnlyWhenSavegameVersionBefore = 110,
		Conditions = {},
		Actions = 
		{
			CGdsAddBindPoint:new(454, 468),
			CGdsAddBindPoint:new( 53, 353),
		},
	}

-- NightWisperDale
elseif PlatformID == 27 then
	OnPersistentPatchEvent
	{
		Bugzilla = PlatformID, Changelist = PlatformID, Description = "AddBindStoneNightWisperDale", ApplyOnlyWhenSavegameVersionBefore = 110,
		Conditions = {},
		Actions = 
		{
			CGdsAddBindPoint:new(127,  94),
			CGdsAddBindPoint:new(434,  99),
		},
	}

-- Breathing Forrest
elseif PlatformID == 30 then
	OnPersistentPatchEvent
	{
		Bugzilla = PlatformID, Changelist = PlatformID, Description = "AddBindStoneBreathingForrest", ApplyOnlyWhenSavegameVersionBefore = 110,
		Conditions = {},
		Actions = 
		{
			CGdsAddBindPoint:new(460,  399),
		},
	}

-- Sharrowdale
elseif PlatformID == 32 then
	OnPersistentPatchEvent
	{
		Bugzilla = PlatformID, Changelist = PlatformID, Description = "AddBindStoneSharrowdale", ApplyOnlyWhenSavegameVersionBefore = 110,
		Conditions = {},
		Actions = 
		{
			CGdsAddBindPoint:new( 73, 154),
			CGdsAddBindPoint:new(287, 374),
		},
	}

end
-----------------------------------------------------------------------------------------------------------------------------
------------- PATCH from v1.x to v1.10 ENDS HERE ---------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------

end





-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
-- ADD-ON 1 PATCHES ...
-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------


function RegisterAddon1PatchEvents()
	print("Registering Addon1 Patch Events...")
-----------------------------------------------------------------------------------------------------------------------------
------------- PATCH from v1.30 to v1.31 BEGINS HERE -------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------


-- Stormcleaver P102, Janina folgt nicht mehr...
---------------------------------------------------------------------------------------
if PlatformId == 102 then
---------------------------------------------------------------------------------------
	OnRepeatingPatchEvent
	{
		Bugzilla = 0,
		Changelist = 52968,
		Description = "Stormcleaver_JaninaFolgtNichtMehr",
	    Conditions =
	    {
	    	FigureAlive {NpcId = 5461},
	    	FigureJob{NpcId = 5461},
	    	FigureAlive {NpcId = Avatar},
			IsGlobalFlagFalse {Name = "SetriusDialogEndedP102"}, 
			IsGlobalFlagTrue {Name = "DialogJaninaEnded"}, 
			IsPlatformFlagTrue {Name = "JaninaFollow"},
	
	    	Negated(FigureInRangeNpc{TargetNpcId = Avatar, NpcId = 5461, Range = 8}),
	    },
	    Actions =
	    {
	    	Follow{NpcId = 5461, Target = Avatar},
	    }
	}
end

---------------------------------------------------------------------------------------
if PlatformId == 109 then
---------------------------------------------------------------------------------------
	-- Nevershade Frontier P109, SQ Siegel der Bestie
	OnPersistentPatchEvent
	{
		Bugzilla = 0,
		Changelist = 0,
		Description = "SQ Siegel der Bestie / Sanduhr",
		ApplyOnlyWhenSavegameVersion = 130,
	    Conditions =
	    {
			QuestState{QuestId = 653, State = StateActive},
			IsItemFlagTrue {Name = "PlayerHasLostItemSanduhr"},
	    },
	    Actions =
	    {
	    	QuestSolve {QuestId = 653},
	    }
	}
	
	-- Nevershade Frontier P109, SQ Siegel der Bestie
	OnPersistentPatchEvent
	{
		Bugzilla = 0,
		Changelist = 0,
		Description = "SQ Siegel der Bestie / Blutphiole",
		ApplyOnlyWhenSavegameVersion = 130,
	    Conditions =
	    {
			QuestState{QuestId = 654, State = StateActive},
			IsItemFlagTrue {Name = "PlayerHasLostItemBlutphiole"},
	    },
	    Actions =
	    {
	    	QuestSolve {QuestId = 654},
	    }
	}
	
	-- Nevershade Frontier P109, SQ Siegel der Bestie
	OnPersistentPatchEvent
	{
		Bugzilla = 0,
		Changelist = 0,
		Description = "SQ Siegel der Bestie / Kerze",
		ApplyOnlyWhenSavegameVersion = 130,
	    Conditions =
	    {
			QuestState{QuestId = 655, State = StateActive},
			IsItemFlagTrue {Name = "PlayerHasLostItemKerze"},
	    },
	    Actions =
	    {
	    	QuestSolve {QuestId = 655},
	    }
	}

	-- flinks zelle öffnen
	OnPersistentPatchEvent
	{
		Bugzilla = 0, Changelist = 0,
		Description = "Tirganach_FlinksZelleOeffnen",
		ApplyOnlyWhenSavegameVersion = 130,
	    Conditions =
	    {
	    	IsItemFlagTrue{Name = "PlayerHasLostItemFlinksCellKey"},
			IsGlobalFlagTrue {Name = "SQP105_FlinksZelleOeffnen"},
	    },
	    Actions =
	    {
	    	SetItemFlagTrue {Name = "PlayerHasItemFlinksCellKey"},
	    }
	}



	-- zwergen change owner
	OnRepeatingPatchEvent
	{
		Bugzilla = 0, Changelist = 0,
		Description = "Nevershade_ZwergeDoChangeOwner",
		--ApplyOnlyWhenSavegameVersion = 130,
	    Conditions =
	    {
	    	IsGlobalFlagFalse{Name = "Nevershade_ZwergenChangeOwnerDurchgefuehrt_PATCH"},
			IsGlobalFlagTrue {Name = "ZwergeBefreitP108"},
			IsGlobalFlagFalse {Name = "P109_DunkelElfenTorZerstört"},
	    },
	    Actions =
	    {
	    	SetGlobalFlagTrue{Name = "Nevershade_ZwergenChangeOwnerDurchgefuehrt_PATCH"},
			ChangeFigureOwner {		NpcId =  6396},
			ChangeRace {Race = 135, NpcId =  6396},
			ChangeFigureOwner {		NpcId =  6397},
			ChangeRace {Race = 135, NpcId =  6397},
			ChangeFigureOwner {		NpcId =  6398},
			ChangeRace {Race = 135, NpcId =  6398},
			ChangeFigureOwner {		NpcId =  6399},
			ChangeRace {Race = 135, NpcId =  6399},
			ChangeFigureOwner {		NpcId =  6400},
			ChangeRace {Race = 135, NpcId =  6400},
	    }
	}
end
---------------------------------------------------------------------------------------
------------ ZURÜCKSETZEN VON NEVERSHADE PLATFORM ONETIME FLAGS !!! ---------------------------------------------------------------------------
---------------------------------------------------------------------------------------
if PlatformId ~= 109 then
	OnRepeatingPatchEvent
	{
		Bugzilla = 0, Changelist = 0, Description = "RESET_Nevershade_ZwergenChangeOwner",
	    Conditions = 
	    {
 	 	  	IsGlobalFlagTrue{Name = "Nevershade_ZwergenChangeOwnerDurchgefuehrt_PATCH"},
	    },
	    Actions =
	    {
 	 	  	SetGlobalFlagFalse{Name = "Nevershade_ZwergenChangeOwnerDurchgefuehrt_PATCH"},
	    }
	}
end

---------------------------------------------------------------------------------------
if PlatformId == 110 then
---------------------------------------------------------------------------------------
	-- mond elementar change owner
	OnRepeatingPatchEvent
	{
		Bugzilla = 0, Changelist = 0,
		Description = "Shaldun_MondElementarDoChangeOwner",
	    Conditions =
	    {
 	 	  	IsGlobalFlagFalse{Name = "Shaldun_MondElementarChangeOwnerDurchgefuehrt_PATCH"},
	    	IsGlobalFlagTrue {Name = "DialogZhaalTuorEnded"},
			FigureAlive{NpcId = 6198},
	    },
	    Actions =
	    {
 		 	 SetGlobalFlagTrue{Name = "Shaldun_MondElementarChangeOwnerDurchgefuehrt_PATCH"},
			 ChangeFigureOwner {NpcId = 6198},
			 ChangeRace { Race = 0, NpcId = 6198},
	    }
	}
	-- sonnen elementar change owner
	OnRepeatingPatchEvent
	{
		Bugzilla = 0, Changelist = 0,
		Description = "Shaldun_SonnenElementarDoChangeOwner",
	    Conditions =
	    {
 	 	  	IsGlobalFlagFalse{Name = "Shaldun_SonnenElementarChangeOwnerDurchgefuehrt_PATCH"},
	    	IsGlobalFlagTrue {Name = "DialogGulZaldureEnded"},
			FigureAlive{NpcId = 6199},
	    },
	    Actions =
	    {
 	 	  	 SetGlobalFlagTrue{Name = "Shaldun_SonnenElementarChangeOwnerDurchgefuehrt_PATCH"},
			 ChangeFigureOwner {NpcId = 6199},
			 ChangeRace { Race = 0, NpcId = 6199},
	    }
	}
end
---------------------------------------------------------------------------------------
------------ ZURÜCKSETZEN VON SHALDUN PLATFORM ONETIME FLAGS !!! ---------------------------------------------------------------------------
---------------------------------------------------------------------------------------
if PlatformId ~= 110 then
	OnRepeatingPatchEvent
	{
		Bugzilla = 0, Changelist = 0, Description = "RESET_Shaldun_ElementarChangeOwner",
	    Conditions = 
	    {
 	 	  	ODER(
 	 	  		IsGlobalFlagTrue{Name = "Shaldun_MondElementarChangeOwnerDurchgefuehrt_PATCH"},
 	 	  		IsGlobalFlagTrue{Name = "Shaldun_SonnenElementarChangeOwnerDurchgefuehrt_PATCH"}
 	 	  		),
	    },
	    Actions =
	    {
 	 	  	SetGlobalFlagFalse{Name = "Shaldun_MondElementarChangeOwnerDurchgefuehrt_PATCH"},
 	 	  	SetGlobalFlagFalse{Name = "Shaldun_SonnenElementarChangeOwnerDurchgefuehrt_PATCH"},
	    }
	}
end

---------------------------------------------------------------------------------------
if PlatformId == 111 then
---------------------------------------------------------------------------------------
	-- Firefangs P111, Leuchtfeuer Problem wg. PlatformEvent
	OnPersistentPatchEvent
	{
		Bugzilla = 0,
		Changelist = 52852,
		Description = "Firefangs_LeuchtfeuerCounter1ZuHoch",
		ApplyOnlyWhenSavegameVersion = 130,
	    Conditions =
	    {
			IsGlobalCounter { Name = "ObeliskenZaehler1P111", Operator = IsGreaterOrEqual, Value = 2},
	    },
	    Actions =
	    {
	    	-- counter wieder auf 1 setzen ...
	    	ResetGlobalCounter { Name = "ObeliskenZaehler1P111"},
	    	IncreaseGlobalCounter { Name = "ObeliskenZaehler1P111"},
	    }
	}
	
	-- Firefangs P111, Leuchtfeuer Problem wg. PlatformEvent
	OnPersistentPatchEvent
	{
		Bugzilla = 0,
		Changelist = 52852,
		Description = "Firefangs_LeuchtfeuerCounter2ZuHoch",
		ApplyOnlyWhenSavegameVersion = 130,
	    Conditions =
	    {
			IsGlobalCounter { Name = "ObeliskenZaehler2P111", Operator = IsGreaterOrEqual, Value = 2},
	    },
	    Actions =
	    {
	    	-- counter wieder auf 1 setzen ...
	    	ResetGlobalCounter { Name = "ObeliskenZaehler2P111"},
	    	IncreaseGlobalCounter { Name = "ObeliskenZaehler2P111"},
	    }
	}
	
	-- Firefangs P111, Leuchtfeuer Problem wg. PlatformEvent
	OnPersistentPatchEvent
	{
		Bugzilla = 0,
		Changelist = 52852,
		Description = "Firefangs_LeuchtfeuerCounter3ZuHoch",
		ApplyOnlyWhenSavegameVersion = 130,
	    Conditions =
	    {
			IsGlobalCounter { Name = "ObeliskenZaehler3P111", Operator = IsGreaterOrEqual, Value = 2},
	    },
	    Actions =
	    {
	    	-- counter wieder auf 1 setzen ...
	    	ResetGlobalCounter { Name = "ObeliskenZaehler3P111"},
	    	IncreaseGlobalCounter { Name = "ObeliskenZaehler3P111"},
	    }
	}
	
	-- Firefangs P111, Leuchtfeuer Problem wg. PlatformEvent
	OnPersistentPatchEvent
	{
		Bugzilla = 0,
		Changelist = 52852,
		Description = "Firefangs_LeuchtfeuerCounter4ZuHoch",
		ApplyOnlyWhenSavegameVersion = 130,
	    Conditions =
	    {
			IsGlobalCounter { Name = "ObeliskenZaehler4P111", Operator = IsGreaterOrEqual, Value = 2},
	    },
	    Actions =
	    {
	    	-- counter wieder auf 1 setzen ...
	    	ResetGlobalCounter { Name = "ObeliskenZaehler4P111"},
	    	IncreaseGlobalCounter { Name = "ObeliskenZaehler4P111"},
	    }
	}



	-- Glutfänge P111, Einsiedler will immer zurücklaufen...
	-- festes goto zu punkt 3
	OnRepeatingPatchEvent	-- sicherheitshalber repeating ...
	{
		Bugzilla = 0, Changelist = 0,
		Description = "Glutfaenge_EinsiedlerAntiPsychoPatch",
		ApplyOnlyWhenSavegameVersion = 130,
	    Conditions =
	    {
	    	IsGlobalFlagFalse{Name = "P111_HermitOpenChest"},
	    	FigureAlive {NpcId = 6663},
	    	FigureJob{NpcId = 6663},
	    	ODER(
	    		IsGlobalFlagTrue { Name = "P111_HermitGoCamp"},
	    		IsGlobalFlagTrue { Name = "P111_HermitGoCamp_PATCH"}
	    		),
			Negated( FigureInRange { X = 380, Y = 232, NpcId = 6663 , Range = 2} ),
	    },
	    Actions =
	    {
	    	SetGlobalFlagFalse { Name = "P111_HermitGoCamp"},
	    	SetGlobalFlagTrue { Name = "P111_HermitGoCamp_PATCH"},
	    	CGdsDbVariableSet:new("nfStation1Angekommen_Npc6663_P111", NpcVariable, FALSE),
	    	CGdsDbVariableSet:new("nfStation2Angekommen_Npc6663_P111", NpcVariable, FALSE),
	    	Goto{X = 380, Y = 232, GotoMode = GotoContinuous, WalkMode = Run, NpcId = 6663},
	    }
	}

	-- ziel erreicht
	OnPersistentPatchEvent
	{
		Bugzilla = 0, Changelist = 0,
		Description = "Glutfaenge_EinsiedlerAntiPsychoPatchZielErreicht",
		ApplyOnlyWhenSavegameVersion = 130,
	    Conditions =
	    {
			IsGlobalFlagFalse{Name = "P111_HermitOpenChest"},
	    	FigureAlive {NpcId = 6663},
	    	FigureJob{NpcId = 6663},
			FigureInRange { X = 380, Y = 232, NpcId = 6663 , Range = 2},
	    },
	    Actions =
	    {
	    	SetGlobalFlagFalse { Name = "P111_HermitGoCamp"},
	    	SetGlobalFlagFalse { Name = "P111_HermitGoCamp_PATCH"},
	    	CGdsDbVariableSet:new("nfStation1Angekommen_Npc6663_P111", NpcVariable, FALSE),
	    	SetGlobalFlagFalse { Name = "Station1Angekommen_PATCH"},
	    	CGdsDbVariableSet:new("nfStation2Angekommen_Npc6663_P111", NpcVariable, FALSE),
	    	SetGlobalFlagFalse { Name = "Station2Angekommen_PATCH"},

	    	SetGlobalFlagTrue { Name = "EinsiedlerAmZielAngekommen_PATCH"},
	    	EnableDialog {NpcId = 6663},
	    	LookAtDirection{NpcId = 6663, Direction = North},
	    }
	}



	-- elementar change owner
	OnRepeatingPatchEvent
	{
		Bugzilla = 0, Changelist = 0,
		Description = "Glutfaenge_ElementarDoChangeOwner",
	    Conditions =
	    {
 	 	    IsGlobalFlagFalse{Name = "Glutfaenge_ElementarChangeOwnerDurchgefuehrt_PATCH"},
			FigureAlive{NpcId = 6948},
	    },
	    Actions =
	    {
 	 	  	SetGlobalFlagTrue{Name = "Glutfaenge_ElementarChangeOwnerDurchgefuehrt_PATCH"},
			ChangeFigureOwner { NpcId = 6948},
	    }
	}
	
	
	-- schattenangriffe nur bei monument claim
rem = [[
	OnRepeatingPatchEvent
	{
		Bugzilla = 0, Changelist = 0,
		Description = "Glutfaenge_Schattenangriffe#1",
		ApplyOnlyWhenSavegameVersion = 130,
	    Conditions =
	    {
	    	IsItemFlagTrue { Name = "PlayerHasItemSchattenring"},
	    	IsGlobalFlagTrue {Name = "MenschenMonumentGeclaimedP111"}, 
	    	Negated(IsMonumentInUse {X = 231, Y = 295, Range = 3}),
	    	IsGlobalFlagFalse{Name = "MenschenMonumentVerloren_PATCH"},
	    },
	    Actions =
	    {
	    	SetGlobalFlagTrue{Name = "MenschenMonumentVerloren_PATCH"},
	    	ClearGlobalTimeStamp{Name = "SchattenErneutAngreifenDelay_PATCH"},
	    	
			SetGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
			ClearGlobalTimeStamp {Name = "SchwierigkeitsGradMittelP111"},
			ClearGlobalTimeStamp {Name = "SchwierigkeitsGradSchwerP111"},

			-- darkelves heimschicken kann nicht schaden, oder?
			SetGlobalFlagTrue {Name = "DarkElvesIdleGoHomeP111"},
			ResetGlobalCounter { Name = "CounterGoHomeP111"},
	    }
	}
	OnRepeatingPatchEvent
	{
		Bugzilla = 0, Changelist = 0,
		Description = "Glutfaenge_Schattenangriffe#2",
		ApplyOnlyWhenSavegameVersion = 130,
	    Conditions =
	    {
	    	IsItemFlagTrue { Name = "PlayerHasItemSchattenring"},
	    	IsGlobalFlagTrue {Name = "MenschenMonumentGeclaimedP111"}, 
	    	IsMonumentInUse {X = 231, Y = 295, Range = 3},
	    	IsGlobalFlagTrue{Name = "MenschenMonumentVerloren_PATCH"},
	    },
	    Actions =
	    {
	    	SetGlobalFlagFalse{Name = "MenschenMonumentVerloren_PATCH"},
	    	SetGlobalTimeStamp{Name = "SchattenErneutAngreifenDelay_PATCH"},
	    }
	}
	OnRepeatingPatchEvent
	{
		Bugzilla = 0, Changelist = 0,
		Description = "Glutfaenge_Schattenangriffe#3",
		ApplyOnlyWhenSavegameVersion = 130,
	    Conditions =
	    {
	    	IsGlobalTimeElapsed{Name = "SchattenErneutAngreifenDelay_PATCH", Seconds = 900},
	    	IsMonumentInUse {X = 231, Y = 295, Range = 3},
	    },
	    Actions =
	    {
	    	ClearGlobalTimeStamp{Name = "SchattenErneutAngreifenDelay_PATCH"},
	    	
			SetGlobalFlagTrue { Name = "StartAngriffeSchattenP111"},
			SetGlobalTimeStamp {Name = "SchwierigkeitsGradMittelP111"},
			SetGlobalTimeStamp {Name = "SchwierigkeitsGradSchwerP111"},
	    }
	}
]]
end
---------------------------------------------------------------------------------------
------------ ZURÜCKSETZEN VON FIREFANGS PLATFORM ONETIME FLAGS !!! ---------------------------------------------------------------------------
---------------------------------------------------------------------------------------
if PlatformId ~= 111 then
	OnRepeatingPatchEvent
	{
		Bugzilla = 0, Changelist = 0, Description = "RESET_Glutfaenge_ElementarChangeOwner",
	    Conditions = 
	    {
 	 	  	IsGlobalFlagTrue{Name = "Glutfaenge_ElementarChangeOwnerDurchgefuehrt_PATCH"},
	    },
	    Actions =
	    {
 	 	  	SetGlobalFlagFalse{Name = "Glutfaenge_ElementarChangeOwnerDurchgefuehrt_PATCH"},
	    }
	}
end



-----------------------------------------------------------------------------------------------------------------------------
------------- PATCH from v1.30 to v1.31 ENDS HERE ---------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
end


-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
-- ADD-ON 2 PATCH EVENTS ...
-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------

function RegisterAddon2PatchEvents()
	print("Registering Addon2 Patch Events...")
end
