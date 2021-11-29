function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- um die states durchzuzählen, DO NOT MODIFY!
SoundStateNum = 0

-- Init
OneTimeInitAction(SetNpcTimeStamp{Name = "PlaySoundTimer"})

-- erster sound
NewState{ Name = "Sound#" .. SoundStateNum }
AddTransition{From = "_IDLE", To = "Sound#" ..SoundStateNum, RemoveTransitionAfterUse = FALSE, 
Conditions = {IsGlobalFlagTrue{Name = "g_P204_YrmirDespawn"} }, -- erst nach cutscene
Actions = {PlaySound{Sound = SoundEmpyriaBard1}}
}
SoundStateNum = SoundStateNum + 1
NewState{ Name = "Sound#" .. SoundStateNum }
AddTransition
{ 
	From = "Sound#" .. SoundStateNum - 1, To = "Sound#" ..SoundStateNum, RemoveTransitionAfterUse = FALSE,
	Conditions = 
	{
		IsNpcTimeElapsed{Name = "PlaySoundTimer", Seconds = 10, UpdateInterval = 2},
	},
	Actions = 
	{
	PlaySound{Sound = SoundEmpyriaCrowd2},
	SetNpcTimeStamp{Name = "PlaySoundTimer"},
	},
}

-- mittendrin
SoundStateNum = SoundStateNum + 1
NewState{ Name = "Sound#" .. SoundStateNum }
AddTransition
{ 
	From = "Sound#" .. SoundStateNum - 1, To = "Sound#" .. SoundStateNum, RemoveTransitionAfterUse = FALSE,
	Conditions = 
	{
		IsNpcTimeElapsed{Name = "PlaySoundTimer", Seconds = 10, UpdateInterval = 2},
	},
	Actions = 
	{
	PlaySound{Sound = SoundEmpyriaCrowd2},
	SetNpcTimeStamp{Name = "PlaySoundTimer"}
	},
}

-- mittendrin
SoundStateNum = SoundStateNum + 1
NewState{ Name = "Sound#" .. SoundStateNum }
AddTransition
{ 
	From = "Sound#" .. SoundStateNum - 1, To = "Sound#" .. SoundStateNum, RemoveTransitionAfterUse = FALSE,
	Conditions = 
	{
		IsNpcTimeElapsed{Name = "PlaySoundTimer", Seconds = 10, UpdateInterval = 2},
	},
	Actions = 
	{
	PlaySound{Sound = SoundEmpyriaBazaar1},
	SetNpcTimeStamp{Name = "PlaySoundTimer"}
	},
}

-- mittendrin
SoundStateNum = SoundStateNum + 1
NewState{ Name = "Sound#" .. SoundStateNum }
AddTransition
{ 
	From = "Sound#" .. SoundStateNum - 1, To = "Sound#" .. SoundStateNum, RemoveTransitionAfterUse = FALSE,
	Conditions = 
	{
		IsNpcTimeElapsed{Name = "PlaySoundTimer", Seconds = 5.4, UpdateInterval = 2},
	},
	Actions = 
	{
	PlaySound{Sound = SoundEmpyriaBazaar2},
	SetNpcTimeStamp{Name = "PlaySoundTimer"}
	},
}

-- mittendrin
SoundStateNum = SoundStateNum + 1
NewState{ Name = "Sound#" .. SoundStateNum }
AddTransition
{ 
	From = "Sound#" .. SoundStateNum - 1, To = "Sound#" .. SoundStateNum, RemoveTransitionAfterUse = FALSE,
	Conditions = 
	{
		IsNpcTimeElapsed{Name = "PlaySoundTimer", Seconds = 5.8, UpdateInterval = 2},
	},
	Actions = 
	{
	PlaySound{Sound = SoundEmpyriaCrowd1},
	SetNpcTimeStamp{Name = "PlaySoundTimer"}
	},
}

-- mittendrin
SoundStateNum = SoundStateNum + 1
NewState{ Name = "Sound#" .. SoundStateNum }
AddTransition
{ 
	From = "Sound#" .. SoundStateNum - 1, To = "Sound#" .. SoundStateNum, RemoveTransitionAfterUse = FALSE,
	Conditions = 
	{
		IsNpcTimeElapsed{Name = "PlaySoundTimer", Seconds = 9.3, UpdateInterval = 2},
	},
	Actions = 
	{
	PlaySound{Sound = SoundEmpyriaBazaar1},
	SetNpcTimeStamp{Name = "PlaySoundTimer"}
	},
}

-- mittendrin
SoundStateNum = SoundStateNum + 1
NewState{ Name = "Sound#" .. SoundStateNum }
AddTransition
{ 
	From = "Sound#" .. SoundStateNum - 1, To = "Sound#" .. SoundStateNum, RemoveTransitionAfterUse = FALSE,
	Conditions = 
	{
		IsNpcTimeElapsed{Name = "PlaySoundTimer", Seconds = 5.4, UpdateInterval = 2},
	},
	Actions = 
	{
	PlaySound{Sound = SoundEmpyriaCrowd1},
	SetNpcTimeStamp{Name = "PlaySoundTimer"}
	},
}

-- mittendrin
SoundStateNum = SoundStateNum + 1
NewState{ Name = "Sound#" .. SoundStateNum }
AddTransition
{ 
	From = "Sound#" .. SoundStateNum - 1, To = "Sound#" .. SoundStateNum, RemoveTransitionAfterUse = FALSE,
	Conditions = 
	{
		IsNpcTimeElapsed{Name = "PlaySoundTimer", Seconds = 9.3, UpdateInterval = 2},
	},
	Actions = 
	{
	PlaySound{Sound = SoundEmpyriaBazaar1},
	SetNpcTimeStamp{Name = "PlaySoundTimer"}
	},
}

-- mittendrin
SoundStateNum = SoundStateNum + 1
NewState{ Name = "Sound#" .. SoundStateNum }
AddTransition
{ 
	From = "Sound#" .. SoundStateNum - 1, To = "Sound#" .. SoundStateNum, RemoveTransitionAfterUse = FALSE,
	Conditions = 
	{
		IsNpcTimeElapsed{Name = "PlaySoundTimer", Seconds = 5.4, UpdateInterval = 2},
	},
	Actions = 
	{
	PlaySound{Sound = SoundEmpyriaCrowd2},
	SetNpcTimeStamp{Name = "PlaySoundTimer"}
	},
}

-- mittendrin
SoundStateNum = SoundStateNum + 1
NewState{ Name = "Sound#" .. SoundStateNum }
AddTransition
{ 
	From = "Sound#" .. SoundStateNum - 1, To = "Sound#" .. SoundStateNum, RemoveTransitionAfterUse = FALSE,
	Conditions = 
	{
		IsNpcTimeElapsed{Name = "PlaySoundTimer", Seconds = 10, UpdateInterval = 2},
	},
	Actions = 
	{
	PlaySound{Sound = SoundEmpyriaBazaar2},
	SetNpcTimeStamp{Name = "PlaySoundTimer"}
	},
}

SoundStateNum = SoundStateNum + 1
NewState{ Name = "Sound#" .. SoundStateNum }
AddTransition
{ 
	From = "Sound#" .. SoundStateNum - 1, To = "Sound#" .. SoundStateNum, RemoveTransitionAfterUse = FALSE,
	Conditions = 
	{
		IsNpcTimeElapsed{Name = "PlaySoundTimer", Seconds = 5.8, UpdateInterval = 2},
	},
	Actions = 
	{
	PlaySound{Sound = SoundEmpyriaCrowd1},
	SetNpcTimeStamp{Name = "PlaySoundTimer"}
	},
}

-- mittendrin
SoundStateNum = SoundStateNum + 1
NewState{ Name = "Sound#" .. SoundStateNum }
AddTransition
{ 
	From = "Sound#" .. SoundStateNum - 1, To = "Sound#" .. SoundStateNum, RemoveTransitionAfterUse = FALSE,
	Conditions = 
	{
		IsNpcTimeElapsed{Name = "PlaySoundTimer", Seconds = 9.3, UpdateInterval = 2},
	},
	Actions = 
	{
	PlaySound{Sound = SoundEmpyriaBazaar2},
	SetNpcTimeStamp{Name = "PlaySoundTimer"}
	},
}


-- zurück zum ersten:
--SoundStateNum = SoundStateNum + 1
--NewState{ Name = "Sound#" .. SoundStateNum }
AddTransition
{ 
	From = "Sound#" .. SoundStateNum, To = "Sound#0", RemoveTransitionAfterUse = FALSE,
	Conditions = 
	{
		IsNpcTimeElapsed{Name = "PlaySoundTimer", Seconds = 5.8, UpdateInterval = 2},
	},
	Actions = 
	{
	PlaySound{Sound = SoundEmpyriaCrowd2},
	SetNpcTimeStamp{Name = "PlaySoundTimer"}
	},
}


-- von jedem state in pause state
NewState{ Name = "SoundPaused" }

local i = 0
for i = 0, SoundStateNum do
	AddTransition
	{ 
		From = "Sound#" .. i, To = "SoundPaused", RemoveTransitionAfterUse = FALSE,
		Conditions = 
		{
			IsGlobalFlagTrue{Name = "PlaySoundScriptOff"},
		},
		Actions = 
		{
		},
	}
end

-- vom pause wieder in idle
AddTransition
{ 
	From = "SoundPaused", To = "_IDLE", RemoveTransitionAfterUse = FALSE,
	Conditions = 
	{
		IsGlobalFlagFalse{Name = "PlaySoundScriptOff"},
	},
	Actions = 
	{
	},
}


EndDefinition()
end