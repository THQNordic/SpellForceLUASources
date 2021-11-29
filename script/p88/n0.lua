function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--		},
--		Actions =
--		{
--			SetGlobalFlagTrue {Name = "g_p88_dont_hold_spot_01"},
--			RandomizeGlobalCounter {Name = "g_p88_GlobalRandomizer", MaxValue = 10},
--			RandomizeNpcCounter {Name = "n_p88_NpcRandomizer", MaxValue = 10},
--		},
--	}

OnToggleEvent
{
	OnConditions =
	{
		IsGlobalFlagTrue {Name = "g_p88_dont_hold_spot_01"},
		ODER
		(
			PlayerUnitInRange {X = 27, Y = 65, Range = 6, FigureType = FigureAvatar},
			PlayerUnitInRange {X = 27, Y = 65, Range = 6, FigureType = FigureHero}
		),
	},
	OnActions =
	{		
		SetGlobalFlagTrue {Name = "g_p88_hold_spot_01"},
		SetGlobalFlagFalse {Name = "g_p88_dont_hold_spot_01"},
	},
	OffConditions =
	{
	},
	OffActions =
	{
	},
}

--		OnOneTimeEvent
--		{
--			Conditions =
--			{
--				IsGlobalFlagTrue {Name = "g_p88_dont_hold_spot_01"},
--				ODER
--				(
--					PlayerUnitInRange {X = 27, Y = 65, Range = 6, FigureType = FigureAvatar},
--					PlayerUnitInRange {X = 27, Y = 65, Range = 6, FigureType = FigureHero}
--				),
--			},
--			Actions =
--			{		
--				SetGlobalFlagTrue {Name = "g_p88_hold_spot_01"},
--				SetGlobalFlagFalse {Name = "g_p88_dont_hold_spot_01"},
--				--SetGlobalTimeStamp {Name = "t_p88_hold_spot_01"},
--			},
--		}

OnToggleEvent
{
	OnConditions =
	{
		IsGlobalFlagTrue {Name = "g_p88_hold_spot_01"},
	},
	OnActions =
	{
		TransferResource {Resource = GoodBoard, Side = SideLight, Amount = 25, Flag = Give},
	},
	OffConditions =
	{
	},
	OffActions =
	{
	},
}

--		OnOneTimeEvent
--		{
--			Conditions =
--			{
--				IsGlobalFlagTrue {Name = "g_p88_hold_spot_01"},
--				--IsGlobalTimeElapsed {Name = "t_p88_hold_spot_01", Seconds = 10},
--			},
--			Actions =
--			{
--				TransferResource {Resource = GoodBoard, Side = SideLight, Amount = 25, Flag = Give},
--				--ClearGlobalTimeStamp {Name = "t_p88_hold_spot_01"},
--			},
--		}
	
OnToggleEvent
{
	OnConditions =
	{
		ODER
		(	
			IsGlobalFlagTrue {Name = "g_p88_hold_spot_01"},
			ODER
			(
				Negated(PlayerUnitInRange {X = 27, Y = 65, Range = 6, FigureType = FigureAvatar}),
				Negated(PlayerUnitInRange {X = 27, Y = 65, Range = 6, FigureType = FigureHero})
			),
			IsGlobalFlagTrue {Name = "g_p88_hold_spot_01"},
			UND
			(
				Negated(PlayerUnitInRange {X = 27, Y = 65, Range = 6, FigureType = FigureAvatar}),
				Negated(PlayerUnitInRange {X = 27, Y = 65, Range = 6, FigureType = FigureHero})
			)
		),
	},
	OnActions =
	{
		SetGlobalFlagTrue {Name = "g_p88_dont_hold_spot_01"},
		SetGlobalFlagFalse {Name = "g_p88_hold_spot_01"},
	},
	OffConditions =
	{
	},
	OffActions =
	{
	},
}

--		OnOneTimeEvent
--		{
--			Conditions =
--			{
--				ODER
--				(	
--					IsGlobalFlagTrue {Name = "g_p88_hold_spot_01"},
--					ODER
--					(
--						Negated(PlayerUnitInRange {X = 27, Y = 65, Range = 6, FigureType = FigureAvatar}),
--						Negated(PlayerUnitInRange {X = 27, Y = 65, Range = 6, FigureType = FigureHero})
--					),
--					IsGlobalFlagTrue {Name = "g_p88_hold_spot_01"},
--					UND
--					(
--						Negated(PlayerUnitInRange {X = 27, Y = 65, Range = 6, FigureType = FigureAvatar}),
--						Negated(PlayerUnitInRange {X = 27, Y = 65, Range = 6, FigureType = FigureHero})
--					)
--				),
--			},
--			Actions =
--			{
--				SetGlobalFlagTrue {Name = "g_p88_dont_hold_spot_01"},
--				SetGlobalFlagFalse {Name = "g_p88_hold_spot_01"},
--				--ClearGlobalTimeStamp {Name = "t_p88_hold_spot_01"},
--			},
--		}

-----------------------------------------------------------------------
-----------------------------------------------------------------------
-----------------------------------------------------------------------

OnOneTimeEvent
{
	Conditions =
	{
		PlayerUnitExists {UnitId = 0, Amount = 2, NoWorkers = TRUE},
		IsGlobalFlagTrue {Name = "Hail_To_The_King"},		
	},
	Actions =
	{
		SetEffect {Effect = "Spawnboss", Length = 0, NpcId = Avatar},
	},
}



EndDefinition()
end