function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
if _NpcId == 5771 then
	GeheX = 436
	GeheY = 332
elseif _NpcId == 5770 then
	GeheX = 437
	GeheY = 333
elseif _NpcId == 5769 then
	GeheX = 437
	GeheY = 332
elseif _NpcId == 5768 then
	GeheX = 436
	GeheY = 333
elseif _NpcId == 5767 then
	GeheX = 435
	GeheY = 333
elseif _NpcId == 5766 then 
	GeheX = 434
	GeheY = 333
end

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnIdleGoHome{WalkMode = Walk, X = GeheX, Y = GeheY, Direction = 2}

--!EDS ONIDLEGOHOME END

--SpawnOnlyWhen
--{
--	X = _X, Y = _Y,
--	NoSpawnEffect = TRUE,
--	Conditions = 
--	{
--		IsGlobalFlagTrue {Name = "DunkelElfenAttacken"},
--		IsGlobalTimeElapsed {Name = "DETimer", Seconds = 120}
--	},
--	Actions = 
--	{
--	},
--}


Respawn
{
	X = _X,
	Y = _Y,
	NoSpawnEffect = TRUE,
	WaitTime = 223,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "DunkelElfenAttacken"},
		IsGlobalTimeElapsed {Name = "DETimer", Seconds = 120},
		Negated (QuestState {QuestId = 615, State = StateSolved})
	}
}

SpawnOnlyWhen
{
	X = _X,
	Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "Uebergeben"},
		IsNpcFlagFalse {Name = "NurEinmal"}
	},
	Actions =
	{
		SetNpcFlagTrue {Name = "NurEinmal"},
	}
	
}

EndDefinition()

end
