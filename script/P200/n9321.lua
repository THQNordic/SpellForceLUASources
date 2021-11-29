-->INFO: Cerbo
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OneTimeInitAction (ChangeRace {Race = 152, NpcId = self})

--Outcries Cerbo.
OnPlatformOneTimeEvent
{
	Conditions = 
	{ 
		FigureInRange {X = 72, Y = 128, NpcId = Avatar, Range = 2},
	},
	Actions = 
	{ 
		SetNpcTimeStamp{ Name = "npc_tnP200WillkommenTimeOutcry"},
	}
}
--Outcry für Neuankömmlinge.
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsNpcTimeElapsed {Name = "npc_tnP200WillkommenTimeOutcry", Seconds = 3}, 
    },
	Actions =
	{
	  	Outcry {NpcId = 9321, String = "Willkommen im Colosseum!" , Tag = "oca2zerboP200_001" , Delay = TRUE , Color = ColorWhite},
		PlaySound{Sound = SoundColosseumCheers},
		
	}
}

---_____________________________________________________________________
--I																		I
--I							ROUND 1 ARENA								I
--I_____________________________________________________________________I


--Outcries bei verlorener Runde.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP200Round1Lost"},
		FigureAlive {NpcId = 0}, 
	},
	Actions = 
	{ 
		SetGlobalTimeStamp{ Name = "LostRound1TimeOutcry"},
	}
}


--Outcry für Loser.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "LostRound1TimeOutcry", Seconds = 2}, 
    },
	Actions =
	{
	    Outcry {NpcId = 9321, String = "Ah, Pech! Dieser Runde habt Ihr leider verloren!" , Tag = "oca2zerboP200_003" , Delay = TRUE , Color = ColorWhite},
		PlaySound{Sound = SoundColosseumBoohs},
	}
}

--Outcries bei verlorener Runde.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP200Round1Lost"},
		FigureAlive {NpcId = 0},
		AvatarInRange {X = 75, Y = 131, Range = 5},
	},
	Actions = 
	{ 
		SetGlobalTimeStamp{ Name = "LostRound1TimeOutcry2"},
	}
}


--Outcry für Loser.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "LostRound1TimeOutcry2", Seconds = 2}, 
    },
	Actions =
	{
	    Outcry {NpcId = 9321, String = "Ach! Immer erweckt Eure Rune Euch wieder!" , Tag = "oca2zerboP200_005" , Delay = FALSE , Color = ColorWhite},
		Outcry {NpcId = 9321, String = "Recht unsportlich, findet Ihr nicht?" , Tag = "oca2zerboP200_006" , Delay = FALSE , Color = ColorWhite},
		PlaySound{Sound = SoundColosseumBoohs},
	}
}

---_____________________________________________________________________
--I																		I
--I							ROUND 2 ARENA								I
--I_____________________________________________________________________I



--Outcries bei verlorener Runde.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP200Round2Lost"},
		FigureAlive {NpcId = 0},
	},
	Actions = 
	{ 
		SetGlobalTimeStamp{ Name = "LostRound2TimeOutcry"},
	}
}


--Outcry für Loser.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "LostRound2TimeOutcry", Seconds = 2}, 
    },
	Actions =
	{
	  	Outcry {NpcId = 9321, String = "Ah, Pech! Dieser Runde habt Ihr leider verloren!" , Tag = "oca2zerboP200_003" , Delay = TRUE , Color = ColorWhite},
		PlaySound{Sound = SoundColosseumBoohs},
	}
}


--Outcries bei verlorener Runde.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP200Round2Lost"},
		FigureAlive {NpcId = 0},
		AvatarInRange {X = 75, Y = 131, Range = 5},
	},
	Actions = 
	{ 
		SetGlobalTimeStamp{ Name = "LostRound2TimeOutcry2"},
	}
}


--Outcry für Loser.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "LostRound2TimeOutcry2", Seconds = 2}, 
    },
	Actions =
	{
	    Outcry {NpcId = 9321, String = "Oh! Das war sicher schmerzhaft!" , Tag = "oca2zerboP200_007" , Delay = TRUE , Color = ColorWhite},
		PlaySound{Sound = SoundColosseumBoohs},
	}
}

---_____________________________________________________________________
--I																		I
--I							ROUND 3 ARENA								I
--I_____________________________________________________________________I

--Outcries bei verlorener Runde.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP200Round3Lost"},
		FigureAlive {NpcId = 0},
	},
	Actions = 
	{ 
		SetGlobalTimeStamp{ Name = "LostRound3TimeOutcry"},
	}
}


--Outcry für Loser.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "LostRound3TimeOutcry", Seconds = 2}, 
    },
	Actions =
	{
	  	Outcry {NpcId = 9321, String = "Ah, Pech! Dieser Runde habt Ihr leider verloren!" , Tag = "oca2zerboP200_003" , Delay = TRUE , Color = ColorWhite},
		PlaySound{Sound = SoundColosseumBoohs},
	}
}



OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP200Round3Lost"},
		FigureAlive {NpcId = 0},
		AvatarInRange {X = 75, Y = 131, Range = 5},
	},
	Actions = 
	{ 
		SetGlobalTimeStamp{ Name = "LostRound3TimeOutcry2"},
	}
}


--Outcry für Loser.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "LostRound3TimeOutcry2", Seconds = 2}, 
    },
	Actions =
	{
	   	Outcry {NpcId = 9321, String = "Ach! Immer erweckt Eure Rune Euch wieder!" , Tag = "oca2zerboP200_005" , Delay = FALSE , Color = ColorWhite},
		Outcry {NpcId = 9321, String = "Recht unsportlich, findet Ihr nicht?" , Tag = "oca2zerboP200_006" , Delay = FALSE , Color = ColorWhite},
		PlaySound{Sound = SoundColosseumBoohs},
	}
}


---_____________________________________________________________________
--I																		I
--I							ROUND 4 ARENA								I
--I_____________________________________________________________________I


--Outcries bei verlorener Runde.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP200Round4Lost"},
		FigureAlive {NpcId = 0},
		AvatarInRange {X = 75, Y = 131, Range = 5},
	},
	Actions = 
	{ 
		SetGlobalTimeStamp{ Name = "LostRound4TimeOutcry"},
	}
}


--Outcry für Loser.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "LostRound4TimeOutcry", Seconds = 2}, 
    },
	Actions =
	{
	    Outcry {NpcId = 9321, String = "Oh! Das war sicher schmerzhaft!" , Tag = "oca2zerboP200_007" , Delay = TRUE , Color = ColorWhite},
		PlaySound{Sound = SoundColosseumBoohs},
	}
}

--Outcries bei verlorener Runde.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP200Round4Lost"},
		FigureAlive {NpcId = 0},
	},
	Actions = 
	{ 
		SetGlobalTimeStamp{ Name = "LostRound4TimeOutcry2"},
	}
}


--Outcry für Loser.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "LostRound4TimeOutcry2", Seconds = 2}, 
    },
	Actions =
	{
	   	Outcry {NpcId = 9321, String = "Ah, Pech! Dieser Runde habt Ihr leider verloren!" , Tag = "oca2zerboP200_003" , Delay = TRUE , Color = ColorWhite},
		PlaySound{Sound = SoundColosseumBoohs},
	}
}

---_____________________________________________________________________
--I																		I
--I							ROUND 5 ARENA								I
--I_____________________________________________________________________I


--Outcries bei verlorener Runde.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP200Round5Lost"},
		FigureAlive {NpcId = 0},
	},
	Actions = 
	{ 
		SetGlobalTimeStamp{ Name = "LostRound5TimeOutcry"},
	}
}


--Outcry für Loser.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "LostRound5TimeOutcry", Seconds = 2}, 
    },
	Actions =
	{
	   	Outcry {NpcId = 9321, String = "Ah, Pech! Dieser Runde habt Ihr leider verloren!" , Tag = "oca2zerboP200_003" , Delay = TRUE , Color = ColorWhite},
		PlaySound{Sound = SoundColosseumBoohs},
	}
}
--Outcries bei verlorener Runde.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP200Round5Lost"},
		FigureAlive {NpcId = 0},
		AvatarInRange {X = 75, Y = 131, Range = 5},
	},
	Actions = 
	{ 
		SetGlobalTimeStamp{ Name = "LostRound5TimeOutcry2"},
	}
}


--Outcry für Loser.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "LostRound5TimeOutcry2", Seconds = 2}, 
    },
	Actions =
	{
	   	Outcry {NpcId = 9321, String = "Ach! Immer erweckt Eure Rune Euch wieder!" , Tag = "oca2zerboP200_005" , Delay = FALSE , Color = ColorWhite},
		Outcry {NpcId = 9321, String = "Recht unsportlich, findet Ihr nicht?" , Tag = "oca2zerboP200_006" , Delay = FALSE , Color = ColorWhite},
		PlaySound{Sound = SoundColosseumBoohs},
	}
}

---_____________________________________________________________________
--I																		I
--I							ROUND 6 ARENA								I
--I_____________________________________________________________________I

--Outcries bei verlorener Runde.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP200Round6Lost"},
		FigureAlive {NpcId = 0},
	},
	Actions = 
	{ 
		SetGlobalTimeStamp{ Name = "LostRound6TimeOutcry"},
	}
}


--Outcry für Loser.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "LostRound6TimeOutcry", Seconds = 2}, 
    },
	Actions =
	{
	  	Outcry {NpcId = 9321, String = "Ah, Pech! Dieser Runde habt Ihr leider verloren!" , Tag = "oca2zerboP200_003" , Delay = TRUE , Color = ColorWhite},
		PlaySound{Sound = SoundColosseumBoohs},
	}
}


--Outcries bei verlorener Runde.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP200Round6Lost"},
		FigureAlive {NpcId = 0},
		AvatarInRange {X = 75, Y = 131, Range = 5},
	},
	Actions = 
	{ 
		SetGlobalTimeStamp{ Name = "LostRound6TimeOutcry2"},
	}
}


--Outcry für Loser.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "LostRound6TimeOutcry2", Seconds = 2}, 
    },
	Actions =
	{
	   	Outcry {NpcId = 9321, String = "Oh! Das war sicher schmerzhaft!" , Tag = "oca2zerboP200_007" , Delay = TRUE , Color = ColorWhite},
		PlaySound{Sound = SoundColosseumBoohs},
	}
}

---_____________________________________________________________________
--I																		I
--I							ROUND 7 ARENA								I
--I_____________________________________________________________________I


--Outcries bei verlorener Runde.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP200Round7Lost"},
		FigureAlive {NpcId = 0},
	},
	Actions = 
	{ 
		SetGlobalTimeStamp{ Name = "LostRound7TimeOutcry"},
	}
}


--Outcry für Loser.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "LostRound7TimeOutcry", Seconds = 2}, 
    },
	Actions =
	{
	  	Outcry {NpcId = 9321, String = "Ah, Pech! Dieser Runde habt Ihr leider verloren!" , Tag = "oca2zerboP200_003" , Delay = TRUE , Color = ColorWhite},
		PlaySound{Sound = SoundColosseumBoohs},
	}
}

--Outcries bei verlorener Runde.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP200Round7Lost"},
		FigureAlive {NpcId = 0},
		AvatarInRange {X = 75, Y = 131, Range = 5},
	},
	Actions = 
	{ 
		SetGlobalTimeStamp{ Name = "LostRound7TimeOutcry2"},
	}
}


--Outcry für Loser.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "LostRound7TimeOutcry2", Seconds = 2}, 
    },
	Actions =
	{
	 	Outcry {NpcId = 9321, String = "Ach! Immer erweckt Eure Rune Euch wieder!" , Tag = "oca2zerboP200_005" , Delay = FALSE , Color = ColorWhite},
		Outcry {NpcId = 9321, String = "Recht unsportlich, findet Ihr nicht?" , Tag = "oca2zerboP200_006" , Delay = FALSE , Color = ColorWhite},
		PlaySound{Sound = SoundColosseumBoohs},
	}
}

---_____________________________________________________________________
--I																		I
--I							ROUND 8 ARENA								I
--I_____________________________________________________________________I

--Outcries bei verlorener Runde.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP200Round8Lost"},
		FigureAlive {NpcId = 0},
	},
	Actions = 
	{ 
		SetGlobalTimeStamp{ Name = "LostRound8TimeOutcry"},
	}
}


--Outcry für Loser.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "LostRound8TimeOutcry", Seconds = 2}, 
    },
	Actions =
	{
	  	Outcry {NpcId = 9321, String = "Ah, Pech! Dieser Runde habt Ihr leider verloren!" , Tag = "oca2zerboP200_003" , Delay = TRUE , Color = ColorWhite},
		PlaySound{Sound = SoundColosseumBoohs},
	}
}
--Outcries bei verlorener Runde.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP200Round8Lost"},
		FigureAlive {NpcId = 0},
		AvatarInRange {X = 75, Y = 131, Range = 5},
	},
	Actions = 
	{ 
		SetGlobalTimeStamp{ Name = "LostRound8TimeOutcry2"},
	}
}


--Outcry für Loser.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "LostRound8TimeOutcry2", Seconds = 2}, 
    },
	Actions =
	{
	   	Outcry {NpcId = 9321, String = "Oh! Das war sicher schmerzhaft!" , Tag = "oca2zerboP200_007" , Delay = TRUE , Color = ColorWhite},
		PlaySound{Sound = SoundColosseumBoohs},
	}
}

---_____________________________________________________________________
--I																		I
--I							ROUND 9 ARENA								I
--I_____________________________________________________________________I


--Outcries bei verlorener Runde.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP200Round9Lost"},
		FigureAlive {NpcId = 0},
		AvatarInRange {X = 75, Y = 131, Range = 5},
	},
	Actions = 
	{ 
		SetGlobalTimeStamp{ Name = "LostRound9TimeOutcry"},
	}
}


--Outcry für Loser.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "LostRound9TimeOutcry", Seconds = 2}, 
    },
	Actions =
	{
	 	Outcry {NpcId = 9321, String = "Ach! Immer erweckt Eure Rune Euch wieder!" , Tag = "oca2zerboP200_005" , Delay = FALSE , Color = ColorWhite},
		Outcry {NpcId = 9321, String = "Recht unsportlich, findet Ihr nicht?" , Tag = "oca2zerboP200_006" , Delay = FALSE , Color = ColorWhite},
		PlaySound{Sound = SoundColosseumBoohs},
	}
}
--Outcries bei verlorener Runde.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP200Round9Lost"},
		FigureAlive {NpcId = 0},
	},
	Actions = 
	{ 
		SetGlobalTimeStamp{ Name = "LostRound9TimeOutcry2"},
	}
}


--Outcry für Loser.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "LostRound9TimeOutcry2", Seconds = 2}, 
    },
	Actions =
	{
	  	Outcry {NpcId = 9321, String = "Ah, Pech! Dieser Runde habt Ihr leider verloren!" , Tag = "oca2zerboP200_003" , Delay = TRUE , Color = ColorWhite},
		PlaySound{Sound = SoundColosseumBoohs},
	}
}

---_____________________________________________________________________
--I																		I
--I							ROUND 10 ARENA								I
--I_____________________________________________________________________I

--Outcries bei verlorener Runde.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP200Round10Lost"},
		FigureAlive {NpcId = 0},
		AvatarInRange {X = 75, Y = 131, Range = 5},
	},
	Actions = 
	{ 
		SetGlobalTimeStamp{ Name = "LostRound10TimeOutcry"},
	}
}


--Outcry für Loser.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "LostRound10TimeOutcry", Seconds = 2}, 
    },
	Actions =
	{
	 	Outcry {NpcId = 9321, String = "Oh! Das war sicher schmerzhaft!" , Tag = "oca2zerboP200_007" , Delay = TRUE , Color = ColorWhite},
		PlaySound{Sound = SoundColosseumBoohs},
	}
}


--Outcries bei verlorener Runde.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP200Round10Lost"},
		FigureAlive {NpcId = 0},
	},
	Actions = 
	{ 
		SetGlobalTimeStamp{ Name = "LostRound10TimeOutcry2"},
	}
}


--Outcry für Loser.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "LostRound10TimeOutcry2", Seconds = 2}, 
    },
	Actions =
	{
	  	Outcry {NpcId = 9321, String = "Ah, Pech! Dieser Runde habt Ihr leider verloren!" , Tag = "oca2zerboP200_003" , Delay = TRUE , Color = ColorWhite},
		PlaySound{Sound = SoundColosseumBoohs},
	}
}


---_____________________________________________________________________
--I																		I
--I							ROUNDBEGIN 1-10								I
--I_____________________________________________________________________I




--Outcries zum Rundenbeginn Runde2.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart"},
		IsGlobalFlagTrue {Name = "g_sP200AvatarInArena"},
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 1, Operator = IsEqual},
	},
	Actions = 
	{ 
		Outcry {NpcId = 9321, String = "Gladiatoren! Lasst den Kampf beginnen!" , Tag = "oca2zerboP200_004" , Delay = TRUE , Color = ColorWhite},
		PlaySound{Sound = SoundAttackSignalTroops},
		PlaySound{Sound = SoundColosseumApplause},
	}
}
--Outcries zum Rundenbeginn Runde3.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart"},
		IsGlobalFlagTrue {Name = "g_sP200AvatarInArena"},
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 2, Operator = IsEqual},
	},
	Actions = 
	{ 
		Outcry {NpcId = 9321, String = "Gladiatoren! Lasst den Kampf beginnen!" , Tag = "oca2zerboP200_004" , Delay = TRUE , Color = ColorWhite},
		PlaySound{Sound = SoundAttackSignalTroops},
		PlaySound{Sound = SoundColosseumApplause},
	}
}
--Outcries zum Rundenbeginn Runde4.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart"},
		IsGlobalFlagTrue {Name = "g_sP200AvatarInArena"},
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 3, Operator = IsEqual},
	},
	Actions = 
	{ 
		Outcry {NpcId = 9321, String = "Gladiatoren! Lasst den Kampf beginnen!" , Tag = "oca2zerboP200_004" , Delay = TRUE , Color = ColorWhite},
		PlaySound{Sound = SoundAttackSignalTroops},
		PlaySound{Sound = SoundColosseumApplause},
	}
}
--Outcries zum Rundenbeginn Runde5.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart"},
		IsGlobalFlagTrue {Name = "g_sP200AvatarInArena"},
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 4, Operator = IsEqual},
	},
	Actions = 
	{ 
		Outcry {NpcId = 9321, String = "Gladiatoren! Lasst den Kampf beginnen!" , Tag = "oca2zerboP200_004" , Delay = TRUE , Color = ColorWhite},
		PlaySound{Sound = SoundAttackSignalTroops},
		PlaySound{Sound = SoundColosseumApplause},
	}
}
--Outcries zum Rundenbeginn Runde6.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart"},
		IsGlobalFlagTrue {Name = "g_sP200AvatarInArena"},
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 5, Operator = IsEqual},
	},
	Actions = 
	{ 
		Outcry {NpcId = 9321, String = "Gladiatoren! Lasst den Kampf beginnen!" , Tag = "oca2zerboP200_004" , Delay = TRUE , Color = ColorWhite},
		PlaySound{Sound = SoundAttackSignalTroops},
		PlaySound{Sound = SoundColosseumApplause},
	}
}
--Outcries zum Rundenbeginn Runde7.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart"},
		IsGlobalFlagTrue {Name = "g_sP200AvatarInArena"},
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 6, Operator = IsEqual},
	},
	Actions = 
	{ 
		Outcry {NpcId = 9321, String = "Gladiatoren! Lasst den Kampf beginnen!" , Tag = "oca2zerboP200_004" , Delay = TRUE , Color = ColorWhite},
		PlaySound{Sound = SoundAttackSignalTroops},
		PlaySound{Sound = SoundColosseumApplause},
	}
}
--Outcries zum Rundenbeginn Runde8.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart"},
		IsGlobalFlagTrue {Name = "g_sP200AvatarInArena"},
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 7, Operator = IsEqual},
	},
	Actions = 
	{ 
		Outcry {NpcId = 9321, String = "Gladiatoren! Lasst den Kampf beginnen!" , Tag = "oca2zerboP200_004" , Delay = TRUE , Color = ColorWhite},
		PlaySound{Sound = SoundAttackSignalTroops},
		PlaySound{Sound = SoundColosseumApplause},
	}
}
--Outcries zum Rundenbeginn Runde9.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart"},
		IsGlobalFlagTrue {Name = "g_sP200AvatarInArena"},
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 8, Operator = IsEqual},
	},
	Actions = 
	{ 
		Outcry {NpcId = 9321, String = "Gladiatoren! Lasst den Kampf beginnen!" , Tag = "oca2zerboP200_004" , Delay = TRUE , Color = ColorWhite},
		PlaySound{Sound = SoundAttackSignalTroops},
		PlaySound{Sound = SoundColosseumApplause},
	}
}
--Outcries zum Rundenbeginn Runde10.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart"},
		IsGlobalFlagTrue {Name = "g_sP200AvatarInArena"},
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 9, Operator = IsEqual},
	},
	Actions = 
	{ 
		Outcry {NpcId = 9321, String = "Gladiatoren! Lasst den Kampf beginnen!" , Tag = "oca2zerboP200_004" , Delay = TRUE , Color = ColorWhite},
		PlaySound{Sound = SoundAttackSignalTroops},
		PlaySound{Sound = SoundColosseumApplause},
	}
}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P200\n9321_Cerbo.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsNpcFlagTrue{Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "known"}),
		},
		Actions = {
			Say{Tag = "zerboP200_003", String = "Ah! Willkommen! Hereinspaziert, Hereinspaziert!"},
			Answer{Tag = "", String = "", AnswerId = 8},
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
			Negated(IsGlobalFlagTrue {Name = "g_sP200BelohnungAnfordern"}),
		},
		Actions = {
			Say{Tag = "zerboP200_001", String = "Na habt ihr Euch entschieden? Wagt ihr einen Kampf in der Arena? Oder schleicht Ihr euch feige von dannen?"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{2;
		Conditions = {
			IsGlobalFlagTrue {Name = "g_sP200BelohnungAnfordern"},
		},
		Actions = {
			Say{Tag = "zerboP200_009", String = "Wie steht's? Wollt Ihr ein wenig Spaß haben?"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP200_002", String = "Aber zuerst gibt es Eure Belohnung wie versprochen, hier ist sie!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name="g_sP200Belohnungauszahlen"},
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
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zerboP200_018PC", String = "Der Kampf soll beginnen!", AnswerId = 22},
			OfferAnswer{Tag = "zerboP200_020PC", String = "Wie lauten die Regeln?", AnswerId = 24},
			OfferAnswer{Tag = "zerboP200_027PC", String = "Werden auch Wetten entgegen genommen?", AnswerId = 33},
			OfferAnswer{Tag = "zerboP200_031PC", String = "Ich habe einen ernsthaften Auftrag, Gott der Diebe. Heute keine Spiele!", AnswerId = 39},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP200_004", String = "Dies, mein Freund, ist das Colloseum, die Arena der Götter! Früher fochten hier erwählte Sterbliche Zweikämpfe um unsere Gunst! Und Streitigkeiten unter den Göttern wurden hier entschieden!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP200_005", String = "Aber nun man hat beschlossen, dass dies gegen die Regeln Aonirs verstösst! Schrecklich engstirnig, meine Wächtergefährten müsst Ihr wissen, immer bedacht auf Zurückhaltung."},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP200_006", String = "Nun nutze ich diesen Ort hin und wieder für ein paar kleine Spiele zu meiner Erheiterung! Ihr kommt also gerade recht!"},
			Answer{Tag = "zerboP200_007PC", String = "Und Ihr seid?", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP200_008", String = "Ich bin Zerbo, man nennt mich auch den Gott der Diebe, Täuscher und Lebenskünstler! Aber lassen wir die Titel beiseite ..."},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP200_009", String = "Wie steht's? Wollt Ihr ein wenig Spaß haben?"},
			Answer{Tag = "zerboP200_010PC", String = "Was habt Ihr im Sinn?", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP200_011", String = "Schaut Euch um! Dies ist eine Arena! Und was, glaubt Ihr, tut man in einer Arena?"},
			Answer{Tag = "zerboP200_012PC", String = "Man kämpft?", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP200_013", String = "Richtig! Bravo! Genauer gesagt, nicht man kämpft ...Ihr kämpft!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name="known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zerboP200_014PC", String = "Was habe ich hier für Möglichkeiten?", AnswerId = 16},
			OfferAnswer{Tag = "zerboP200_035PC", String = "Erzählt mir mehr über Euch.", AnswerId = 47, Color = ColorDarkOrange},
			OfferAnswer{Tag = "zerboP200_044PC", String = "Ich möchte mich erst einmal umsehen.", AnswerId = 53},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP200_015", String = "Nun, zu aller erst natürlich die große Herausforderung! Den Kampf der Champions in der Arena!"},
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
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zerboP200_016PC", String = "Ich nehme an! Wann beginnt der nächste Kampf?", AnswerId = 20},
			OfferAnswer{Tag = "zerboP200_033PC", String = "Heute nicht, Zerbo, vielleicht ein andermal.", AnswerId = 43},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP200_017", String = "Sofort wenn ihr bereit dazu seid!"},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zerboP200_018PC", String = "Der Kampf soll beginnen!", AnswerId = 22},
			OfferAnswer{Tag = "zerboP200_020PC", String = "Wie lauten die Regeln?", AnswerId = 24},
			OfferAnswer{Tag = "zerboP200_027PC", String = "Werden auch Wetten entgegen genommen?", AnswerId = 33},
			OfferAnswer{Tag = "zerboP200_031PC", String = "Ich habe einen ernsthaften Auftrag, Gott der Diebe. Heute keine Spiele!", AnswerId = 39},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP200_019", String = "Sehr gut, durchschreitet das Portal! Viel Glück!"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_sP200ArenaKampfStart"},
				  IncreaseGlobalCounter {Name = "g_cnP200ArenaRoundCounter"},
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
			Say{Tag = "zerboP200_021", String = "Die Regeln sind einfach! Der Kampf findet in Runden statt!"},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP200_022", String = "Damit eine Runde beginnen kann müsst Ihr mir sagen, dass Ihr bereit seid und danach hier über das Portal die Arena betreten."},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP200_023", String = "Habt ihr dann Arena betreten gibt es kein Zurück mehr! Die Runde beginnt und es wird auf Leben oder Tod gekämpft!"},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP200_024", String = "Solltet Ihr durch das Portal fliehen, bevor alle Gegner bezwungen sind, gilt diesw Runde für Euch als verloren!"},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP200_025", String = "Gewonnen habt Ihr, wenn alle Eure Gegner geschlagen sind!"},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP200_026", String = "Habt Ihr das vollbracht, kommt zu mir und Ihr sollt entlohnt werden!"},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zerboP200_018PC", String = "Der Kampf soll beginnen!", AnswerId = 22},
			OfferAnswer{Tag = "zerboP200_020PC", String = "Wie lauten die Regeln?", AnswerId = 24},
			OfferAnswer{Tag = "zerboP200_027PC", String = "Werden auch Wetten entgegen genommen?", AnswerId = 33},
			OfferAnswer{Tag = "zerboP200_031PC", String = "Ich habe einen ernsthaften Auftrag, Gott der Diebe. Heute keine Spiele!", AnswerId = 39},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP200_028", String = "Aber natürlich! Eine gute Wette ist doch das Salz in der Suppe!!"},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP200_029", String = "Allerdings könnt Ihr nicht auf Eure eigenen Kämpfe wetten. Aber Ihr könntet zum Beispiel beim Goblinrennen ein paar Goldstücke zuverdienen!"},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP200_030", String = "Schaut Euch nach dem Rennmeister um! Bei ihm könnt Ihr Wetten auf das Rennen abschließen!"},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 38},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zerboP200_018PC", String = "Der Kampf soll beginnen!", AnswerId = 22},
			OfferAnswer{Tag = "zerboP200_020PC", String = "Wie lauten die Regeln?", AnswerId = 24},
			OfferAnswer{Tag = "zerboP200_027PC", String = "Werden auch Wetten entgegen genommen?", AnswerId = 33},
			OfferAnswer{Tag = "zerboP200_031PC", String = "Ich habe einen ernsthaften Auftrag, Gott der Diebe. Heute keine Spiele!", AnswerId = 39},
		}}

	OnAnswer{39;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP200_032", String = "Ernsthaft? Oho! Nun gut mein Freund, ich will Euch ja nicht ... die Zeit stehlen."},
			Answer{Tag = "", String = "", AnswerId = 40},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 41},
		}}

	OnAnswer{41;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 42},
		}}

	OnAnswer{42;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zerboP200_018PC", String = "Der Kampf soll beginnen!", AnswerId = 22},
			OfferAnswer{Tag = "zerboP200_020PC", String = "Wie lauten die Regeln?", AnswerId = 24},
			OfferAnswer{Tag = "zerboP200_027PC", String = "Werden auch Wetten entgegen genommen?", AnswerId = 33},
			OfferAnswer{Tag = "zerboP200_031PC", String = "Ich habe einen ernsthaften Auftrag, Gott der Diebe. Heute keine Spiele!", AnswerId = 39},
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP200_034", String = "Nun gut, aber ich hoffe Ihr kommt wieder!"},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{44;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 45},
		}}

	OnAnswer{45;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 46},
		}}

	OnAnswer{46;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zerboP200_014PC", String = "Was habe ich hier für Möglichkeiten?", AnswerId = 16},
			OfferAnswer{Tag = "zerboP200_035PC", String = "Erzählt mir mehr über Euch.", AnswerId = 47, Color = ColorDarkOrange},
			OfferAnswer{Tag = "zerboP200_044PC", String = "Ich möchte mich erst einmal umsehen.", AnswerId = 53},
		}}

	OnAnswer{47;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP200_036", String = "Ihr wundert Euch sicher, dass ein Gott hier mit Euch Schabernack treibt! Aber ich bin des Wächterdaseins überdrüssig!"},
			Answer{Tag = "zerboP200_037PC", String = "Was?", AnswerId = 48},
		}}

	OnAnswer{48;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP200_038", String = "Ein Wächter zu sein, heisst den Regeln Aonirs zu folgen! Und diese Regeln sind sehr, sehr alt! Und Aonir ist weit weg!"},
			Answer{Tag = "", String = "", AnswerId = 49},
		}}

	OnAnswer{49;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP200_041", String = "Also schaffe ich mir hier ein wenig Ablenkung, damit ich für ein paar Augenblicke einmal nicht an die Regeln denken muss!"},
			Answer{Tag = "", String = "", AnswerId = 50},
		}}

	OnAnswer{50;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 51},
		}}

	OnAnswer{51;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 52},
		}}

	OnAnswer{52;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zerboP200_014PC", String = "Was habe ich hier für Möglichkeiten?", AnswerId = 16},
			OfferAnswer{Tag = "zerboP200_035PC", String = "Erzählt mir mehr über Euch.", AnswerId = 47, Color = ColorDarkOrange},
			OfferAnswer{Tag = "zerboP200_044PC", String = "Ich möchte mich erst einmal umsehen.", AnswerId = 53},
		}}

	OnAnswer{53;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerboP200_045", String = "Wie Ihr wollt, ich warte hier auf Euch."},
			Answer{Tag = "", String = "", AnswerId = 54},
		}}

	OnAnswer{54;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{54;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end