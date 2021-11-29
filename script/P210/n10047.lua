function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

Despawn
{
	PlayDeathAnim = TRUE, 
	Conditions =
	{
		IsGlobalFlagTrue { Name = "g_P210_EyesSet99Solved" },
	}
}

OnOneTimeEvent
{
	Actions =
	{
		SetNpcTimeStamp {Name = "npc_P210_WaitingBetweenActions"},
	},
}


OnEvent
{
	Conditions =
	{
		IsNpcCounter{Name = "npc_P210_GhostActionCycle", Value = 0, Operator = IsEqual},
		IsNpcTimeElapsed {Name = "npc_P210_WaitingBetweenActions", Seconds = 15},
	},
	Actions =
	{
		IncreaseNpcCounter{Name = "npc_P210_GhostActionCycle"},
		RandomizeNpcCounter {Name = "npc_P210_NextSwitchToMove", MaxValue = 4 },
		SetNpcTimeStamp {Name = "npc_P210_WaitingBetweenActions"},
	}
	
}


OnEvent
{
	Conditions =
	{
		IsNpcCounter{Name = "npc_P210_GhostActionCycle", Value = 1, Operator = IsEqual},
		IsNpcCounter{Name = "npc_P210_NextSwitchToMove", Value = 0, Operator = IsEqual},
	},
	Actions =
	{
		Goto{X = 308, Y = 211, NpcId = 10047, Range = 1, WalkMode = Walk}, -- Geist geht zu Hebel 1
		SetNpcTimeStamp {Name = "npc_P210_WaitinTillArrivedAtSwitch"},
		IncreaseNpcCounter{Name = "npc_P210_GhostActionCycle"},
	}
	
}

OnEvent
{
	Conditions =
	{
		IsNpcCounter{Name = "npc_P210_GhostActionCycle", Value = 2, Operator = IsEqual},
		IsNpcCounter{Name = "npc_P210_NextSwitchToMove", Value = 0, Operator = IsEqual},
		IsNpcTimeElapsed {Name = "npc_P210_WaitinTillArrivedAtSwitch", Seconds = 7},
	},
	Actions =
	{
		ResetNpcCounter{Name = "npc_P210_GhostActionCycle"},
		LookAtDirection{Direction = West, NpcId = 10047}, -- schaut Hebel an
		FlipGlobalFlag {Name = "g_P210Room9zSwitch1bOn"},
		FlipGlobalFlag { Name = "g_P210Room9zEye01On"},
		FlipGlobalFlag { Name = "g_P210Room9zEye02On"},
		FlipGlobalFlag { Name = "g_P210Room9zEye04On"},
		FlipGlobalFlag { Name = "g_P210Room9zEye05On"},

	}
	
}


OnEvent
{
	Conditions =
	{
		IsNpcCounter{Name = "npc_P210_GhostActionCycle", Value = 1, Operator = IsEqual},
		IsNpcCounter{Name = "npc_P210_NextSwitchToMove", Value = 1, Operator = IsEqual},
	},
	Actions =
	{
		Goto{X = 308, Y = 207, NpcId = 10047, Range = 1, WalkMode = Walk}, -- Geist geht zu Hebel 7
		SetNpcTimeStamp {Name = "npc_P210_WaitinTillArrivedAtSwitch"},
		IncreaseNpcCounter{Name = "npc_P210_GhostActionCycle"},
	}
	
}

OnEvent
{
	Conditions =
	{
		IsNpcCounter{Name = "npc_P210_GhostActionCycle", Value = 2, Operator = IsEqual},
		IsNpcCounter{Name = "npc_P210_NextSwitchToMove", Value = 1, Operator = IsEqual},
		IsNpcTimeElapsed {Name = "npc_P210_WaitinTillArrivedAtSwitch", Seconds = 7},
	},
	Actions =
	{
		ResetNpcCounter{Name = "npc_P210_GhostActionCycle"},
		LookAtDirection{Direction = West, NpcId = 10047}, -- schaut Hebel an
		FlipGlobalFlag {Name = "g_P210Room9zSwitch7bOn"},
		FlipGlobalFlag { Name = "g_P210Room9zEye04On"},
		FlipGlobalFlag { Name = "g_P210Room9zEye05On"},
		FlipGlobalFlag { Name = "g_P210Room9zEye07On"},
		FlipGlobalFlag { Name = "g_P210Room9zEye08On"},

	}
	
}


OnEvent
{
	Conditions =
	{
		IsNpcCounter{Name = "npc_P210_GhostActionCycle", Value = 1, Operator = IsEqual},
		IsNpcCounter{Name = "npc_P210_NextSwitchToMove", Value = 2, Operator = IsEqual},
	},
	Actions =
	{
		Goto{X = 310, Y = 207, NpcId = 10047, Range = 1, WalkMode = Walk}, -- Geist geht zu Hebel 8
		SetNpcTimeStamp {Name = "npc_P210_WaitinTillArrivedAtSwitch"},
		IncreaseNpcCounter{Name = "npc_P210_GhostActionCycle"},
	}
	
}

OnEvent
{
	Conditions =
	{
		IsNpcCounter{Name = "npc_P210_GhostActionCycle", Value = 2, Operator = IsEqual},
		IsNpcCounter{Name = "npc_P210_NextSwitchToMove", Value = 2, Operator = IsEqual},
		IsNpcTimeElapsed {Name = "npc_P210_WaitinTillArrivedAtSwitch", Seconds = 7},
	},
	Actions =
	{
		ResetNpcCounter{Name = "npc_P210_GhostActionCycle"},
		LookAtDirection{Direction = West, NpcId = 10047}, -- schaut Hebel an
		FlipGlobalFlag {Name = "g_P210Room9zSwitch8bOn"},
		FlipGlobalFlag { Name = "g_P210Room9zEye07On"},
		FlipGlobalFlag { Name = "g_P210Room9zEye08On"},
		FlipGlobalFlag { Name = "g_P210Room9zEye09On"},

	}
	
}


OnEvent
{
	Conditions =
	{
		IsNpcCounter{Name = "npc_P210_GhostActionCycle", Value = 1, Operator = IsEqual},
		IsNpcCounter{Name = "npc_P210_NextSwitchToMove", Value = 3, Operator = IsEqual},
	},
	Actions =
	{
		Goto{X = 310, Y = 211, NpcId = 10047, Range = 1, WalkMode = Walk}, -- Geist geht zu Hebel 2
		SetNpcTimeStamp {Name = "npc_P210_WaitinTillArrivedAtSwitch"},
		IncreaseNpcCounter{Name = "npc_P210_GhostActionCycle"},
	}
	
}

OnEvent
{
	Conditions =
	{
		IsNpcCounter{Name = "npc_P210_GhostActionCycle", Value = 2, Operator = IsEqual},
		IsNpcCounter{Name = "npc_P210_NextSwitchToMove", Value = 3, Operator = IsEqual},
		IsNpcTimeElapsed {Name = "npc_P210_WaitinTillArrivedAtSwitch", Seconds = 7},
	},
	Actions =
	{
		ResetNpcCounter{Name = "npc_P210_GhostActionCycle"},
		LookAtDirection{Direction = West, NpcId = 10047}, -- schaut Hebel an
		FlipGlobalFlag {Name = "g_P210Room9zSwitch2bOn"},
		FlipGlobalFlag { Name = "g_P210Room9zEye01On"},
		FlipGlobalFlag { Name = "g_P210Room9zEye02On"},
		FlipGlobalFlag { Name = "g_P210Room9zEye03On"},

	}
	
}


OnEvent
{
	Conditions =
	{
		IsNpcCounter{Name = "npc_P210_GhostActionCycle", Value = 1, Operator = IsEqual},
		IsNpcCounter{Name = "npc_P210_NextSwitchToMove", Value = 4, Operator = IsEqual},
	},
	Actions =
	{
		Goto{X = 310, Y = 209, NpcId = 10047, Range = 1, WalkMode = Walk}, -- Geist geht zu Hebel 6
		SetNpcTimeStamp {Name = "npc_P210_WaitinTillArrivedAtSwitch"},
		IncreaseNpcCounter{Name = "npc_P210_GhostActionCycle"},
	}
	
}

OnEvent
{
	Conditions =
	{
		IsNpcCounter{Name = "npc_P210_GhostActionCycle", Value = 2, Operator = IsEqual},
		IsNpcCounter{Name = "npc_P210_NextSwitchToMove", Value = 4, Operator = IsEqual},
		IsNpcTimeElapsed {Name = "npc_P210_WaitinTillArrivedAtSwitch", Seconds = 7},
	},
	Actions =
	{
		ResetNpcCounter{Name = "npc_P210_GhostActionCycle"},
		LookAtDirection{Direction = East, NpcId = 10047}, -- schaut Hebel an
		FlipGlobalFlag {Name = "g_P210Room9zSwitch6bOn"},
		FlipGlobalFlag { Name = "g_P210Room9zEye03On"},
		FlipGlobalFlag { Name = "g_P210Room9zEye06On"},
		FlipGlobalFlag { Name = "g_P210Room9zEye09On"},

	}
	
}
EndDefinition()

end
