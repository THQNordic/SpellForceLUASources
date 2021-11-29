-- falls man doch mal 2 samen auf einmal abgezogen bekommt irgendwo...

print("Adding Heilige Stätte Workaround for Platform " .. tostring(PlatformId))

OneTimeInitAction( SetGlobalTimeStamp{Name = "HeiligeStaetteWorkaroundTimer"} )

-- onyx
if PlatformId == 203 then
	OnOneTimeEvent
	{
		Conditions =
		{
			IsGlobalTimeElapsed{Name = "HeiligeStaetteWorkaroundTimer", Seconds = 15, UpdateInterval = 100},
			QuestState {QuestId = 1052, State = StateActive, UpdateInterval = 100},
			Negated(PlayerHasItem{ItemId = 7083, UpdateInterval = 100}),
		},
		Actions = 
		{
			TransferItem {TakeItem = 0, GiveItem = 7083, Amount = 1, Flag = Give},
			SetGlobalTimeStamp{Name = "HeiligeStaetteWorkaroundTimer"},
		},
	}
end

-- red wastes
if PlatformId == 206 then
	OnOneTimeEvent
	{
		Conditions =
		{
			IsGlobalTimeElapsed{Name = "HeiligeStaetteWorkaroundTimer", Seconds = 15, UpdateInterval = 100},
			QuestState {QuestId = 1051, State = StateActive, UpdateInterval = 100},
			Negated(PlayerHasItem{ItemId = 7083, UpdateInterval = 100}),
		},
		Actions = 
		{
			TransferItem {TakeItem = 0, GiveItem = 7083, Amount = 1, Flag = Give},
			SetGlobalTimeStamp{Name = "HeiligeStaetteWorkaroundTimer"},
		},
	}
end

-- kathai
if PlatformId == 209 then
	OnOneTimeEvent
	{
		Conditions =
		{
			IsGlobalTimeElapsed{Name = "HeiligeStaetteWorkaroundTimer", Seconds = 15, UpdateInterval = 100},
			QuestState {QuestId = 1054, State = StateActive, UpdateInterval = 100},
			Negated(PlayerHasItem{ItemId = 7083, UpdateInterval = 100}),
		},
		Actions = 
		{
			TransferItem {TakeItem = 0, GiveItem = 7083, Amount = 1, Flag = Give},
			SetGlobalTimeStamp{Name = "HeiligeStaetteWorkaroundTimer"},
		},
	}
end

-- darkwind
if PlatformId == 211 then
	OnOneTimeEvent
	{
		Conditions =
		{
			IsGlobalTimeElapsed{Name = "HeiligeStaetteWorkaroundTimer", Seconds = 15, UpdateInterval = 100},
			QuestState {QuestId = 1053, State = StateActive, UpdateInterval = 100},
			Negated(PlayerHasItem{ItemId = 7083, UpdateInterval = 100}),
		},
		Actions = 
		{
			TransferItem {TakeItem = 0, GiveItem = 7083, Amount = 1, Flag = Give},
			SetGlobalTimeStamp{Name = "HeiligeStaetteWorkaroundTimer"},
		},
	}
end

