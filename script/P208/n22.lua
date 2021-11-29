function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- um die states durchzuz�hlen, DO NOT MODIFY!
SoundStateNum = 0

-- Init
OneTimeInitAction(SetNpcTimeStamp{Name = "PlaySoundTimer"})

-- erster sound
NewState{ Name = "Sound#" .. SoundStateNum }
AddTransition{From = "_IDLE", To = "Sound#" ..SoundStateNum, RemoveTransitionAfterUse = FALSE, 
Conditions = {},
Actions = {PlaySound{Sound = SoundHowlingHeads}}
}
SoundStateNum = SoundStateNum + 1
NewState{ Name = "Sound#" .. SoundStateNum }
AddTransition
{ 
	From = "Sound#" .. SoundStateNum - 1, To = "Sound#" ..SoundStateNum, RemoveTransitionAfterUse = FALSE,
	Conditions = 
	{
		IsNpcTimeElapsed{Name = "PlaySoundTimer", Seconds = 8.4, UpdateInterval = 2},
	},
	Actions = 
	{
	PlaySound{Sound = SoundHowlingHeads},
	SetNpcTimeStamp{Name = "PlaySoundTimer"},
	},
}


-- zur�ck zum ersten:
--SoundStateNum = SoundStateNum + 1
--NewState{ Name = "Sound#" .. SoundStateNum }
AddTransition
{ 
	From = "Sound#" .. SoundStateNum, To = "Sound#0", RemoveTransitionAfterUse = FALSE,
	Conditions = 
	{
		IsNpcTimeElapsed{Name = "PlaySoundTimer", Seconds = 8.4, UpdateInterval = 2},
	},
	Actions = 
	{
	PlaySound{Sound = SoundHowlingHeads},
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