-- P116 ... Arena Fun Map

Round1Timer = 5
Round2Timer = 5
Round3Timer = 5
Round4Timer = 5
Round5Timer = 5
Round6Timer = 5
Round7Timer = 5
Round8Timer = 5
Round9Timer = 5
Round10Timer = 5

----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)



dofile("script/P116/n0_ItemScript.lua")


---_____________________________________________________________________
--I																		I
--I							ROUND 1 ARENA								I
--I_____________________________________________________________________I


OnOneTimeEvent
{
	Conditions =
	{
				
    },
	Actions =
	{
		RevealUnExplored{ X = 134, Y = 119, Range = 25},
		SetGlobalTimeStamp { Name = "Round1TimerP116"},
		SetGlobalFlagTrue { Name = "Round1P116"},
	}
}





---_____________________________________________________________________
--I																		I
--I							ROUND 2 ARENA								I
--I_____________________________________________________________________I


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "KriegerRound1Bereit"},
		FigureDead {NpcId = 7943},
		FigureDead {NpcId = 7948},
		FigureDead {NpcId = 7949},
		FigureDead {NpcId = 7951},
		
		

		
    },
	Actions =
	{
		SetGlobalTimeStamp { Name = "Round2TimerP116"},
		SetGlobalFlagTrue { Name = "Round2P116"},
	}
}


---_____________________________________________________________________
--I																		I
--I							ROUND 3 ARENA								I
--I_____________________________________________________________________I


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "KriegerRound2Bereit"},
		FigureDead {NpcId = 7975},
		FigureDead {NpcId = 7976},
		FigureDead {NpcId = 7977},
		FigureDead {NpcId = 7978},
		FigureDead {NpcId = 7979},
		FigureDead {NpcId = 7980},
		FigureDead {NpcId = 7981},
		FigureDead {NpcId = 7982},

		
    },
	Actions =
	{
		SetGlobalTimeStamp { Name = "Round3TimerP116"},
		SetGlobalFlagTrue { Name = "Round3P116"},
	}
}



---_____________________________________________________________________
--I																		I
--I							ROUND 4 ARENA								I
--I_____________________________________________________________________I

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "KriegerRound3Bereit"},
		FigureDead {NpcId = 7983},
		FigureDead {NpcId = 7984},
		FigureDead {NpcId = 7985},
		FigureDead {NpcId = 7986},
		
		

		
    },
	Actions =
	{
		SetGlobalTimeStamp { Name = "Round4TimerP116"},
		SetGlobalFlagTrue { Name = "Round4P116"},
	}
}
	

---_____________________________________________________________________
--I																		I
--I							ROUND 5 ARENA								I
--I_____________________________________________________________________I

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "KriegerRound4Bereit"},
		--FigureDead {NpcId = 7987},
		FigureDead {NpcId = 7988},
		FigureDead {NpcId = 7989},
		FigureDead {NpcId = 7990},
		--FigureDead {NpcId = 7991},
		FigureDead {NpcId = 7992},
		FigureDead {NpcId = 7993},
		FigureDead {NpcId = 7994},
		

		
    },
	Actions =
	{
		SetGlobalTimeStamp { Name = "Round5TimerP116"},
		SetGlobalFlagTrue { Name = "Round5P116"},
	}
}
	

---_____________________________________________________________________
--I																		I
--I							ROUND 6 ARENA								I
--I_____________________________________________________________________I

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "KriegerRound5Bereit"},
		FigureDead {NpcId = 7995},
		FigureDead {NpcId = 7996},
		FigureDead {NpcId = 7997},
		FigureDead {NpcId = 7998},
		FigureDead {NpcId = 7999},
		FigureDead {NpcId = 8000},
		FigureDead {NpcId = 8001},
		FigureDead {NpcId = 8002},
		FigureDead {NpcId = 8003},
		FigureDead {NpcId = 8004},
		FigureDead {NpcId = 8005},
		FigureDead {NpcId = 8006},

		
    },
	Actions =
	{
		SetGlobalTimeStamp { Name = "Round6TimerP116"},
		SetGlobalFlagTrue { Name = "Round6P116"},
	}
}
	

---_____________________________________________________________________
--I																		I
--I							ROUND 7 ARENA								I
--I_____________________________________________________________________I

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "KriegerRound6Bereit"},
		FigureDead {NpcId = 8007},
		FigureDead {NpcId = 8008},
		FigureDead {NpcId = 8009},
		FigureDead {NpcId = 8010},
		FigureDead {NpcId = 8011},
		FigureDead {NpcId = 8012},
		FigureDead {NpcId = 8013},
		FigureDead {NpcId = 8014},
		FigureDead {NpcId = 8015},
		FigureDead {NpcId = 8016},
		FigureDead {NpcId = 8017},
		FigureDead {NpcId = 8018},
		

		
    },
	Actions =
	{
		SetGlobalTimeStamp { Name = "Round7TimerP116"},
		SetGlobalFlagTrue { Name = "Round7P116"},
	}
}
		

---_____________________________________________________________________
--I																		I
--I							ROUND 8 ARENA								I
--I_____________________________________________________________________I

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "KriegerRound7Bereit"},
		FigureDead {NpcId = 8019},
		FigureDead {NpcId = 8020},
		FigureDead {NpcId = 8021},
		FigureDead {NpcId = 8022},
		FigureDead {NpcId = 8023},
		FigureDead {NpcId = 8024},
		FigureDead {NpcId = 8025},
		FigureDead {NpcId = 8026},
		
		

		
    },
	Actions =
	{
		SetGlobalTimeStamp { Name = "Round8TimerP116"},
		SetGlobalFlagTrue { Name = "Round8P116"},
	}
}


---_____________________________________________________________________
--I																		I
--I							ROUND 9 ARENA								I
--I_____________________________________________________________________I

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "KriegerRound8Bereit"},
		FigureDead {NpcId = 8027},
		FigureDead {NpcId = 8028},
		FigureDead {NpcId = 8029},
		FigureDead {NpcId = 8030},
		FigureDead {NpcId = 8031},
		FigureDead {NpcId = 8032},
		FigureDead {NpcId = 8033},
		FigureDead {NpcId = 8034},
		FigureDead {NpcId = 8035},
		FigureDead {NpcId = 8036},
		FigureDead {NpcId = 8037},
		FigureDead {NpcId = 8038},
		

		
    },
	Actions =
	{
		SetGlobalTimeStamp { Name = "Round9TimerP116"},
		SetGlobalFlagTrue { Name = "Round9P116"},
	}
}


---_____________________________________________________________________
--I																		I
--I							ROUND 10 ARENA								I
--I_____________________________________________________________________I

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "KriegerRound9Bereit"},
		FigureDead {NpcId = 8039},
		FigureDead {NpcId = 8040},
		FigureDead {NpcId = 8041},
		FigureDead {NpcId = 8042},
		
		

		
    },
	Actions =
	{
		SetGlobalTimeStamp { Name = "Round10TimerP116"},
		SetGlobalFlagTrue { Name = "Round10P116"},
	}
}			


---_____________________________________________________________________
--I																		I
--I							ROUND 11 ARENA								I
--I_____________________________________________________________________I

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "KriegerRound10Bereit"},
		FigureDead {NpcId = 8043},
		FigureDead {NpcId = 8044},
		FigureDead {NpcId = 8045},
		FigureDead {NpcId = 8046},
		FigureDead {NpcId = 8047},
		FigureDead {NpcId = 8048},
		FigureDead {NpcId = 8049},
		FigureDead {NpcId = 8050},
		FigureDead {NpcId = 8051},
		FigureDead {NpcId = 8052},
		FigureDead {NpcId = 8053},
		FigureDead {NpcId = 8054},

		
    },
	Actions =
	{
		
	}
}		

---_____________________________________________________________________
--I																		I
--I							Heilung Avatar								I
--I_____________________________________________________________________I

OnEvent
{
	Conditions =
	{
		PlayerHasItem{ ItemId = 4282, Amount = 1 , Equipment = EquipmentAll , UpdateInterval = 10},
		
    },
	Actions =
	{
		SetHealth{ HitPoints = 330, NpcId = Avatar, Decrease = FALSE},
		TransferItem{ TakeItem = 4282, GiveItem = 0, Amount = 1, Flag = Take},
		
	}
}		


							
EndDefinition()
end


