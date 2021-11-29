function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OneTimeInitAction( SetNpcTimeStamp{Name = "WeaponChange"} )

OnEvent
{
	Conditions = {
		IsNpcTimeElapsed{Name = "WeaponChange", Seconds = 10},
	},
	Actions = {
		Kill{},
	},
}

rem = [[
RebirthSpecial
{
	WaitTime = 6,
	X = 5, Y = 5,	-- fallback position when no bindstone is in use
	BindStones = {
		[1] = {X = 10, Y = 50, Actions = { SetNpcFlagTrue{Name = "REBIRTH_1"} } },
		[2] = {X = 51, Y = 67, Actions = { SetNpcFlagTrue{Name = "REBIRTH_2"} } },
		[3] = {X = 40, Y = 40, Actions = { SetNpcFlagTrue{Name = "REBIRTH_3"} } },
		[4] = {X = 11, Y = 17, Actions = { SetNpcFlagTrue{Name = "REBIRTH_4"} } },
	},
	DeathActions = {
		SetEffect{Effect = "BuildingFire", NpcId = Avatar, Length = 6000},
		SetNpcFlagFalse{Name = "DEFAULT_REBIRTH"},
		SetNpcFlagFalse{Name = "REBIRTH_1"},
		SetNpcFlagFalse{Name = "REBIRTH_2"},
		SetNpcFlagFalse{Name = "REBIRTH_3"},
		SetNpcFlagFalse{Name = "REBIRTH_4"},
	},
	Conditions = {
	},
	Actions = {
		SetNpcFlagTrue{Name = "DEFAULT_REBIRTH"},
	},
	NoSpawnEffect = FALSE,
}


OnOneTimeEvent
{
	Conditions = {
		IsNpcTimeElapsed{Name = "WeaponChange", Seconds = 10},
	},
	Actions = {
	},
}

for i = 1, 200, 2 do
OnOneTimeEvent
{
	Conditions = {
		IsNpcTimeElapsed{Name = "WeaponChange", Seconds = i + 10},
	},
	Actions = {
		--ChangeEquipment{Slot = SlotChest, Item = 480}, -- darkelf
		--ChangeEquipment{Slot = SlotLeftHand, Item = 719}, -- crossbow
		--ChangeEquipment{Slot = SlotRightHand, Item = 689}, -- rassel
		--ChangeEquipment{Slot = SlotLeftHand, Item = random(3500)}, -- crossbow
		ChangeEquipment{Slot = SlotRightHand, Item = random(39)+660}, -- rassel
		ChangeEquipment{Slot = SlotChest, Item = random(70)+400}, -- darkelf
		--ChangeEquipment{Slot = SlotHead, Item = random(3500)}, -- rassel
	},
}
end
]]


Umspawn
{
	Target = Avatar, NoSpawnEffect = FALSE, OnlyOnce = FALSE,
	Conditions = {
		IsNpcTimeElapsed{Name = "WeaponChange", Seconds = 18},
	},
	Actions = {
	},
}


--DebugInitAction( SetEffect{Effect = "Materialize", X = _X, Y = _Y, Length = 65530} )
--DebugInitAction( SetEffect{Effect = "Spawnboss", Length = 0} )
REM = [[
DebugInitAction( SetEffect{Effect = "Lightning", X = _X, Y = _Y, Length = 0} )
DebugInitAction( SetEffect{Effect = "GroundWave", X = _X, Y = _Y, Length = 0} )
DebugInitAction( SetEffect{Effect = "PlasmaSmoke", X = _X, Y = _Y, Length = 0} )
DebugInitAction( SetEffect{Effect = "Spawnboss", X = _X, Y = _Y, Length = 0} )

DebugInitAction(	SetGlobalState{Name = "Plot", State = "JourneyOne"} )

OnOneTimeEvent
{
	Conditions = {
		EnemyUnitInRange{X = 70, Y = 66, NpcId = Avatar, Range = 10},
	},
	Actions = {
		SetEffect{Length = 9999, Effect = "Lightning", NpcId = Avatar},
	},
}


OnOneTimeEvent
{
	Conditions = {
		IsGlobalState{Name = "Plot", State = "JourneyOne" , Operator = IsEqual, UpdateInterval = 1},
		FigureInRangeNpc{TargetNpcId = Avatar, Range = 5, UpdateInterval = 1},
	},
	Actions = {
		StopEffect{X = _X, Y = _Y},
		SetEffect{Effect = "Fog", Length = 2000, NpcId = Avatar},
		
		RemoveObject{X = 18, Y = 14, Object = 2161},
		RemoveObject{X = 19, Y = 15, Object = 2161},
		RemoveObject{X = 20, Y = 16, Object = 2161},
		RemoveObject{X = 21, Y = 15, Object = 2161},
		RemoveObject{X = 21, Y = 16, Object = 2161},
		RemoveObject{X = 21, Y = 17, Object = 2161},
		RemoveObject{X = 21, Y = 18, Object = 2161},
		RemoveObject{X = 20, Y = 17, Object = 2161},
		RemoveObject{X = 19, Y = 17, Object = 2161},
		SetGlobalState{Name = "Plot", State = "JourneyTwo"},
	},
}

OnOneTimeEvent
{
	Conditions = {
		IsGlobalState{Name = "Plot", State = "JourneyTwo" , Operator = IsEqual, UpdateInterval = 1},
		FigureInRangeNpc{TargetNpcId = Avatar, Range = 3, UpdateInterval = 1},
	},
	Actions = {
		StopEffect{X = _X, Y = _Y},
		SetEffect{Effect = "AcidCloud", Length = 1000, NpcId = Avatar},
		SetGlobalState{Name = "Plot", State = "JourneyThree"},
	},
}

OnOneTimeEvent
{
	Conditions = {
		IsGlobalState{Name = "Plot", State = "JourneyThree" , Operator = IsEqual, UpdateInterval = 1},
		FigureInRangeNpc{TargetNpcId = Avatar, Range = 1, UpdateInterval = 1},
	},
	Actions = {
		StopEffect{X = _X, Y = _Y},
		SetEffect{Effect = "Fog", Length = 600, NpcId = Avatar},
		SetEffect{Length = 9999, Effect = "Spawnboss", NpcId = Avatar},
		TransferItem{GiveItem = 3178, Flag = Give},
		SetGlobalState{Name = "Plot", State = "JourneyFour"},
	},
}
]]
EndDefinition()
end
