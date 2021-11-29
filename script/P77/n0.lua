function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

dofile("script/p77/CutsceneTest.lua")	
dofile("script/p77/CutsceneTest02.lua")	
dofile("script/p77/CutsceneTest03.lua")	

OneTimeInitAction ( SetGlobalTimeStamp{Name = "bla"} )
for i = 0, 12 do
OnOneTimeEvent
{
	Conditions = {
		IsGlobalTimeElapsed{Name = "bla", Seconds = 18, UpdateInterval = 1}
	},
	Actions = {
		SetGlobalTimeStamp{Name = "bla"},
		SetMinimapAlert{X = 15 + (i*10), Y = 15 + (i*10), Type = i},
		 ShowDebugText{String = "Alert: " .. i, Color = ColorRed},
	},
}
end

rem = [[
OnOneTimeEvent
{
	Conditions = {
		EnemyUnitInRange{X = 70, Y = 66, NpcId = Avatar, Range = 10},
	},
	Actions = {
		SetEffect{Length = 3333, Effect = "BuildingFire", NpcId = Avatar},
		SetEffect{Length = 9999, Effect = "SimpleInvis", NpcId = Avatar},
	},
}

OnOneTimeEvent
{
	Conditions = {
		Negated(EnemyUnitInRange{X = 70, Y = 66, NpcId = 3352, Range = 10}),
	},
	Actions = {
		SetEffect{Length = 59999, Effect = "Loot", NpcId = Avatar},
	},
}

OnOneTimeEvent
{
	Conditions = {
		CGdsConditionLogicalOr:new(FigureDead{NpcId = 3072}, FigureInRange{NpcId=0, X=10, Y=30, Range=8})
	},
	Actions = {
		SetEffect{Length = 6666, Effect = "Materialize", NpcId = Avatar},
		--TransferItem{GiveItem = 3178, Flag = Give},
	},
}

OnOneTimeEvent
{
	Conditions = {
		FigureInRange{NpcId = Avatar, X = 72, Y = 68, Range = 8},
	},
	Actions = {
		SetEffect{Length = 16666, Effect = "Materialize", NpcId = Avatar},
		--ChangeBuildingOwner{X = 83, Y = 71},
		--ChangeBuildingOwner{X = 75, Y = 80},
		--ChangeBuildingOwner{X = 74, Y = 79},
		--ChangeBuildingOwner{X = 63, Y = 78},
		--
		--ChangeBuildingOwner{X = 65, Y = 83},
	},
}
]]
--Level 23
OnOneTimeEvent
{
	Conditions = 
	{
		PlayerUnitInRange {X = 195, Y = 18, Range = 2}
	},
	Actions =
	{
		TransferXP {XP = 16000}
	
	}
}
--Level 24
OnOneTimeEvent
{
	Conditions = 
	{
		PlayerUnitInRange {X = 201 , Y = 18, Range = 2}
	},
	Actions =
	{
		TransferXP {XP = 17000}
	}
}

--Level 25
OnOneTimeEvent
{
	Conditions = 
	{
		PlayerUnitInRange {X = 210, Y = 18, Range = 2}
	},
	Actions =
	{
		TransferXP {XP = 19000}
	}
}

--Level 26
OnOneTimeEvent
{
	Conditions = 
	{
		PlayerUnitInRange {X = 219, Y = 18, Range = 2}
	},
	Actions =
	{
		TransferXP {XP = 25000}
	}
}


OnOneTimeEvent
{
	Conditions = 
	{
		PlayerUnitInRange {X = 228, Y = 18, Range = 2}
	},
	Actions =
	{
		TransferXP {XP = 30000}
	}
}

OnOneTimeEvent
{
	Conditions = 
	{
		PlayerUnitInRange {X = 236, Y = 18, Range = 2}
	},
	Actions =
	{
		TransferXP {XP = 35000}
	}
}

OnOneTimeEvent
{
	Conditions = 
	{
		PlayerUnitInRange {X = 242, Y = 18, Range = 5}
	},
	Actions =
	{
		TransferXP {XP = 40000}
	}
}

OnOneTimeEvent
{
	Conditions = 
	{
		PlayerUnitInRange {X = 249, Y = 19, Range = 5}
	},
	Actions =
	{
		TransferXP {XP = 45000}
	}
}

EndDefinition()

end