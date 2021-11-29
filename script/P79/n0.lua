function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--doscript("hadeko.lua")

OnOneTimeEvent
{
	Conditions =
	{
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "Transfer"},
		TransferItem{GiveItem = 7076, Flag = Give},
	}
}

--- ABFRAGE FÜR TESTING
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed{Name = "Transfer", Seconds = 8},
	},
	Actions =
	{
		TransferItem{GiveItem = 7076, Flag = Give},
		PlaySound{Sound = SoundEmpyriaCrowd1},
		PlaySound{Sound = SoundColosseumBoohs},
		SetEffect{Effect = "AreaHit", NpcId = Avatar, Length = 6666},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed{Name = "Transfer", Seconds = 1},
		Negated(PlayerHasItem{ItemId = 7076}),
	},
	Actions =
	{
		SetEffect{Effect = "Spawnboss", NpcId = Avatar, Length = 0},
	}
}

---- Held
--OnEvent
--{
--	Conditions =
--	{
--		QuestState{QuestId = 993, State = StateActive },
--		Negated(QuestState{QuestId = 995, State = StateSolved}),
--		PlayerHasItem{ItemId = 7076},
--	},
--	Actions =
--	{
--		QuestSolve{QuestId = 995 },
--		SetGlobalFlagTrue{Name = "'Spieler hat item' abfrage wurde wahr"},
--		SetEffect{Effect = "Lightning", NpcId = Avatar, Length = 1111},
--	}
--}
--
--OnEvent
--{
--	Conditions =
--	{
--		QuestState{QuestId = 993, State = StateActive },
--		QuestState{QuestId = 995, State = StateSolved },
--		Negated(PlayerHasItem{ItemId = 7076}),
--	},
--	Actions =
--	{
--		QuestBegin{QuestId = 994},
--		QuestBegin{QuestId = 995 },
--		SetGlobalFlagTrue{Name = "'Spieler hat item nicht' abfrage wurde wahr"},
--		SetEffect{Effect = "Spawnboss", NpcId = Avatar, Length = 1111},
--	}
--}
--
--
--
--OnOneTimeEvent
--{
--	Conditions = {
--		PlayerHasItem{ItemId = 3764, Equipment = EquipmentAvatar},
--	},
--	Actions = {
--		SetEffect{NpcId = Avatar, Effect = "AreaHit", Length = 15000},
--		--SetEffect{NpcId = Avatar, Effect = "OccludeWhite", Length = 15000},
--		SetGlobalFlagTrue{Name = "AVATAR"},
--	},
--}
--OnOneTimeEvent
--{
--	Conditions = {
--		PlayerHasItem{ItemId = 3764, Equipment = EquipmentHero},
--	},
--	Actions = {
--		--SetEffect{NpcId = Avatar, Effect = "AreaHit", Length = 15000},
--		SetEffect{NpcId = Avatar, Effect = "OccludeBlack", Length = 15000},
--		SetGlobalFlagTrue{Name = "HERO"},
--	},
--}
--
--
--OnOneTimeEvent
--{
--	Conditions = {
--		Negated(EnemyUnitInRange{X = 230, Y = 300, NpcId = Avatar, Range = 20, UnitId = 0, UpdateInterval = 10}),
--	},
--	Actions = {
--		SetEffect{NpcId = Avatar, Effect = "PlasmaSmoke", Length = 15000},
--		SetEffect{NpcId = Avatar, Effect = "AreaHit", Length = 5000},
--		TeleportAvatar{X = 230, Y = 300},
--	},
--}
--
--
--OneTimeInitAction( SetNpcTimeStamp{Name = "lorelei"} )
--rem = [[
--OnEvent
--{
--	Conditions = {
--		IsNpcTimeElapsed{Name = "lorelei", Seconds = 12},
--	},
--	Actions = {
--		SetNpcTimeStamp{Name = "lorelei"},
--		Outcry{ Tag = "outcryBloodashBF002"      , NpcId = 4034, String = "Ah! Mein Kleinod!"                                                                           , Color = ColorWhite },
--
--		TransferItem{GiveItem = 3643, Flag = Give, Amount = 1},
--	},
--}
--]]
--
--OnEvent
--{
--	Conditions = {
--		IsNpcTimeElapsed{Name = "lorelei", Seconds = 7},
--	},
--	Actions = {
--		SetNpcTimeStamp{Name = "lorelei"},
--		--Outcry{ Tag = "outcryBloodashBF002"      , NpcId = 4034, String = "Ah! Mein Kleinod!"                                                                           , Color = ColorWhite },
--		SetEffect{NpcId = Avatar, Effect = "BuildingFire", Length = 2000},
--		--TransferItem{GiveItem = 3643, Flag = Give, Amount = 1},
--
--		CGdsDbVariableModify:new("TOGGLE_0/1", GlobalVariable, 1, 0),
--		CGdsDbVariableModify:new("RANDOM_0-99", GlobalVariable, 2, 100),
--		
--		TeleportAvatar{X = 187, Y = 258},
--	},
--}
--
--OneTimeInitAction( SetNpcTimeStamp{Name = "oderwas"} )
--OnEvent
--{
--	Conditions = {
--		ODER9
--		{
--			IsGlobalFlagTrue{Name = "c1", UpdateInterval = 1},
--			IsGlobalFlagTrue{Name = "c2", UpdateInterval = 1},
--			IsGlobalFlagTrue{Name = "c3", UpdateInterval = 1},
--			UND9
--			{
--				IsGlobalFlagTrue{Name = "c4", UpdateInterval = 1},
--				IsGlobalFlagTrue{Name = "c5", UpdateInterval = 1},
--				IsGlobalFlagTrue{Name = "c6", UpdateInterval = 1},
--				ODER9
--				{
--					IsGlobalFlagTrue{Name = "c7", UpdateInterval = 1},
--					IsGlobalFlagTrue{Name = "c8", UpdateInterval = 1},
--					IsGlobalFlagTrue{Name = "c9", UpdateInterval = 1},
--				},
--			},
--		},
--		IsNpcTimeElapsed{Name = "oderwas", Seconds = 7, UpdateInterval = 1},
--	},
--	Actions = {
--		SetNpcTimeStamp{Name = "oderwas"},
--		SetEffect{NpcId = Avatar, Effect = "Lightning", Length = 5000},
--		SetEffect{NpcId = Avatar, Effect = "Spawnboss", Length = 5000},
--		TeleportAvatar{X = 260, Y = 260},
--	},
--}


EndDefinition()

end
