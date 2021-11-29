-->INFO: Hoergr
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

REM = [[
--Hoergr geht schlafen oder steht auf
OnToggleEvent
{
OnConditions =	{
				TimeNight(),  
				--IsGlobalFlagTrue{Name = "Q148HoergrAwake"},
				--FigureInRange{X = 281 , Y = 357 , NpcId = 2189 , Range = 4},
				--Negated(PlayerUnitInRange{X = 281 , Y = 357, Range = 5}), -- ist schon über aggro gut abgefangen
				IsGlobalFlagFalse{Name = "Q148HoergrProximityAlert"},
				IsGlobalFlagFalse{Name = "Q148HoergrPoisoned"},
				Negated(FigureHasAggro{NpcId = 2189}),
				},
OnActions =		{
				SetGlobalFlagTrue{Name = "Q148HoergrSleeping"},
				ChangeUnit{Unit = 926 , NpcId = 2189},
				ChangeRace{Race = 152, NpcId = 2189},
				},
OffConditions =	{
				TimeDay(),  
				--IsGlobalFlagTrue{Name = "Q148HoergrSleeping"},
				--FigureInRange{X = 281 , Y = 357 , NpcId = 2189 , Range = 4}, -- über nacht kann er ja nicht weglaufen, oder?
				IsGlobalFlagFalse{Name = "Q148HoergrPoisoned"},
				},
OffActions =	{
				SetGlobalFlagFalse{Name = "Q148HoergrSleeping"},
				ChangeUnit{Unit = 914 , NpcId = 2189},
				ChangeRace{Race = 113, NpcId = 2189},
				}
}
--Sonderfall, jemand ist zu lange zu nahe bei ihm
--Proximity Timer starten, beenden
OnToggleEvent
{
OnConditions =	{
				--Negated(TimeDay()),
				IsGlobalFlagTrue{Name = "Q148HoergrSleeping"},
				--FigureInRange{X = 281 , Y = 357 , NpcId = 2189 , Range = 4},
				PlayerUnitInRange{X = 281 , Y = 357 , Range = 5},
				IsGlobalFlagFalse{Name = "Q148HoergrProximityWarningSet"},
				IsGlobalFlagFalse{Name = "Q148HoergrPoisoned"},
				},
OnActions =		{
				SetGlobalTimeStamp{Name = "Q148HoergerProximityWarning"},
				SetGlobalFlagTrue{Name = "Q148HoergrProximityWarningSet"},
				},
OffConditions =	{
				--FigureInRange{X = 281 , Y = 357 , NpcId = 2189 , Range = 4},
				Negated(PlayerUnitInRange{X = 281 , Y = 357 , Range = 5}),
				IsGlobalFlagTrue{Name = "Q148HoergrProximityWarningSet"},
				IsGlobalTimeElapsed{Name = "Q148HoergerProximityWarning" , Seconds = 30},
				IsGlobalFlagFalse{Name = "Q148HoergrPoisoned"},
				},
OffActions =	{
				SetGlobalFlagFalse{Name = "Q148HoergrProximityWarningSet"},
				},
}
--Timer abgelaufen und Feind noch da = aggro
OnEvent
{
Conditions =	{
				--Negated(TimeDay()),
				IsGlobalFlagTrue{Name = "Q148HoergrSleeping"},
				FigureInRange{X = 281 , Y = 357 , NpcId = 2189 , Range = 4},
				PlayerUnitInRange{X = 281 , Y = 357 ,  Range = 5},
				IsGlobalFlagTrue{Name = "Q148HoergrProximityWarningSet"},
				IsGlobalTimeElapsed{Name = "Q148HoergerProximityWarning" , Seconds = 30},
				IsGlobalFlagFalse{Name = "Q148HoergrProximityAlert"},
				IsGlobalFlagFalse{Name = "Q148HoergrPoisoned"},
				},
Actions =		{
				SetGlobalFlagTrue{Name = "Q148HoergrProximityAlert"},
				SetGlobalFlagFalse{Name = "Q148HoergrSleeping"},
				SetGlobalFlagFalse{Name = "Q148HoergrProximityWarningSet"},
				ChangeUnit{Unit = 914 , NpcId = 2189},
				ChangeRace{Race = 113, NpcId = 2189},
				}
}
--Hoergr wieder schlafen schicken, wenn Kampf vorbei (1min Period)
OnToggleEvent
{
OnConditions =	{
				IsGlobalFlagTrue{Name = "Q148HoergrProximityAlert"},
				Negated(PlayerUnitInRange{X = 281 , Y = 357 , Range = 5}),
				FigureInRange{X = 281 , Y = 357 , NpcId = 2189 , Range = 3},
				IsGlobalFlagFalse{Name = "Q148HoergrPoisoned"},
				},
OnActions =		{
				SetGlobalTimeStamp{Name = "Q148HoergrWaitingToSleepAgain"},
				},
OffConditions =	{
				Negated(TimeDay()),
				IsGlobalTimeElapsed{Name = "Q148HoergrWaitingToSleepAgain" , Seconds = 60},
				Negated(PlayerUnitInRange{X = 281 , Y = 357 , Range = 5}),
				FigureInRange{X = 281 , Y = 357 , NpcId = 2189 , Range = 3},
				IsGlobalFlagFalse{Name = "Q148HoergrPoisoned"},
				},
OffActions =	{
				SetGlobalFlagFalse{Name = "Q148HoergrProximityAlert"},
				SetGlobalFlagTrue{Name = "Q148HoergrSleeping"},
				ChangeUnit{Unit = 926 , NpcId = 2189},
				ChangeRace{Race = 152, NpcId = 2189},
				},
}
--Vergiftung am Morgen endgültig machen
OnOneTimeEvent
{
Conditions =	{
				IsGlobalFlagTrue{Name = "Q148HoergerHasGotPoisonedBeef"},
				TimeDay(),
				},
Actions =		{
				SetGlobalFlagTrue{Name = "Q148HoergrPoisoned"},
				ChangeUnit{Unit = 915 , NpcId = 2189},
				QuestSolve{QuestId = 158},
				QuestBegin{QuestId = 159},
				}
}
]]



-- dialog zu beginn entfernen
OnOneTimeEvent
{
	Actions = {
		RemoveDialog{},
	},
}

-- DAS HIER GESCHIEHT TAGSÜBER!!!
-- normale events und so, nichts kritisches...

-- zum schlafplatz zurückkehren...
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 4 , 
Conditions =	{
				-- damit ist idlegohome nur ausserhalb des tagesablaufs aktiv
				TimeNight{},
				--Negated(FigureHasAggro{NpcId = 2189}),
				},
HomeActions =	{
				SetGlobalFlagTrue{Name = "Q148HoergrSleeping"},
				},
}

-- tagsüber rumlaufen...
DefineLocationCircle{Name = "Point001", X = 280, Y = 357, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 252, Y = 390, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 249, Y = 397, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 256, Y = 403, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 263, Y = 399, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}

DailyJobParams
{
	Loop = TRUE,
	Conditions = {
		TimeDay{},
		IsGlobalFlagFalse{Name = "Q148HoergrSleeping"},
	},
	EndConditions = {
		TimeNight{},
	},
}


-- UND DAS HIER GEHT NACHTS AB!
-- versch. dinge die eintreffen können ...

AllowGlobalStatesInDialog = TRUE
NoSetDirectionInDialog = TRUE
	
-- hörgr schläft jetzt, kann nun angesprochen und vergiftet werden, oder alarmiert wenn spieler zu lange braucht
NewState{ Name = "HoergrSleeping" }
AddTransition{ From = "_IDLE", To = "HoergrSleeping", RemoveTransitionAfterUse = FALSE,
	Conditions = {
		IsGlobalFlagTrue{Name = "Q148HoergrSleeping", UpdateInterval = 10},
		Negated(FigureHasAggro{NpcId = 2189}),
	},
	Actions = {
		ChangeUnit{Unit = 926 , NpcId = 2189},
		ChangeRace{Race = 152, NpcId = 2189},
		SetFreezeFlagTrue{},
		EnableDialog{},
		SetDialogType{Type = SideQuest},
		--ShowDebugText{String = "Hörgr schlaaaaafen..."},
	},
}

-- uaaaaah, gäääähn! Ein neuer morgen ist herangebrochen...
AddTransition{ From = "HoergrSleeping", To = "_IDLE", RemoveTransitionAfterUse = FALSE,
	Conditions = {
		TimeDay{},
		IsGlobalFlagFalse{Name = "Q148HoergrPoisoned"},
	},
	Actions = {
		SetGlobalFlagFalse{Name = "Q148HoergrSleeping"},
		ChangeUnit{Unit = 914 , NpcId = 2189},
		ChangeRace{Race = 113, NpcId = 2189},
		SetFreezeFlagFalse{},
		RemoveDialog{},
		--ShowDebugText{String = "Hörgr aufwacheeeeeen..."},
	},
}

-- <schädeldröhn> OOOooooh, ist mir übel!! Hörgr spawned fortan als "poisoned", also pussy-unit...
AddTransition{ From = "HoergrSleeping", To = "_IDLE", RemoveTransitionAfterUse = FALSE,
	Conditions = {
		TimeDay{},
		IsGlobalFlagTrue{Name = "Q148HoergrPoisoned"},
	},
	Actions = {
		SetGlobalFlagFalse{Name = "Q148HoergrSleeping"},
		ChangeUnit{Unit = 915 , NpcId = 2189},
		ChangeRace{Race = 113, NpcId = 2189},
		SetFreezeFlagFalse{},
		RemoveDialog{},
		StopEffect{},
		SetEffect{Effect = "Poison"},
		--ShowDebugText{String = "Hörgr aufwacheeeeeen mit Migräääääääne..."},
	},
}

-- au wei, der spieler ist in hörgr's nähe, gleich könnte er aufwachen!
NewState{ Name = "HoergrSleepingPlayerNearby" }
AddTransition{ From = "HoergrSleeping", To = "HoergrSleepingPlayerNearby", RemoveTransitionAfterUse = FALSE,
	Conditions = {
		PlayerUnitInRange{X = 281 , Y = 357, Range = 8, UpdateInterval = 10},
	},
	Actions = {
		SetGlobalTimeStamp{Name = "Q148HoergerProximityWarning"},
		--ShowDebugText{String = "Hörgr schlafen, aber hören etwas, hmmmm..."},
	},
}

-- der spieler ist weg, hörgr kann wieder friedlich weiterpennen...
AddTransition{ From = "HoergrSleepingPlayerNearby", To = "HoergrSleeping", RemoveTransitionAfterUse = FALSE,
	Conditions = {
		Negated(PlayerUnitInRange{X = 281 , Y = 357, Range = 8, UpdateInterval = 10}),
	},
	Actions = {
		--ShowDebugText{String = "Hörgr schlafen, tief und fest..."},
	},
}

-- hörgr wurde durch den spieler aufgeschreckt, weil dieser zu lange gebraucht hat!
-- jetzt gibts einen uffe umme!
AddTransition{ From = "HoergrSleepingPlayerNearby", To = "_IDLE", RemoveTransitionAfterUse = FALSE,
	Conditions = {
		IsGlobalTimeElapsed{Name = "Q148HoergerProximityWarning", Seconds = 60},
		IsGlobalFlagFalse{Name = "Q148HoergrPoisoned"},
	},
	Actions = {
		SetGlobalFlagFalse{Name = "Q148HoergrSleeping"},
		ChangeUnit{Unit = 914 , NpcId = 2189},
		ChangeRace{Race = 113, NpcId = 2189},
		SetFreezeFlagFalse{},
		RemoveDialog{},
		--ShowDebugText{String = "Hörgr riechen Menschenfleisch, grrrrr..."},
	},
}

-- hörgr wurde durch den spieler aufgeschreckt, weil dieser zu lange gebraucht hat!
-- aber hörgr ist durch das gift stark geschwächt!!
AddTransition{ From = "HoergrSleepingPlayerNearby", To = "_IDLE", RemoveTransitionAfterUse = FALSE,
	Conditions = {
		IsGlobalTimeElapsed{Name = "Q148HoergerProximityWarning", Seconds = 60},
		IsGlobalFlagTrue{Name = "Q148HoergrPoisoned"},
	},
	Actions = {
		SetGlobalFlagFalse{Name = "Q148HoergrSleeping"},
		ChangeUnit{Unit = 915 , NpcId = 2189},
		ChangeRace{Race = 113, NpcId = 2189},
		SetFreezeFlagFalse{},
		RemoveDialog{},
		StopEffect{},
		SetEffect{Effect = "Poison"},
		--ShowDebugText{String = "Hörgr riechen Menschenfleisch, grrrrr... aber sein Schwindelig...."},
	},
}

-- hörgr wurde vergiftet !!!!! quest solven....
AddTransition
{ 
	From = "HoergrSleepingPlayerNearby", To = "HoergrSleepingPlayerNearby",
	RemoveTransitionAfterUse = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "Q148HoergerHasGotPoisonedBeef", UpdateInterval = 5},
	},
	Actions = 
	{
		SetGlobalFlagTrue{Name = "Q148HoergrPoisoned"},
		QuestSolve{QuestId = 158},
		QuestBegin{QuestId = 159},
		StopEffect{},
		SetEffect{Effect = "Poison"},
		Outcry{ Tag = "outcryHoergrSWindwalls001", NpcId = 2189, String = "Arr! Schmerzen! Hörgr schwach! Arr!", Color = ColorWhite },
	},
}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p10\n2189_Hoergr.txt


	

	OnBeginDialog{
		Conditions = {
			IsGlobalFlagFalse{Name = "Q148HoergrSleeping"},
			QuestState{QuestId = 157 , State = StateActive},
		},
		Actions = {
			Say{Tag = "hoergr001", String = "(Dieser Kreatur zieht den Kampf einem Gespräch vor.)"},
			OfferAnswer{Tag = "hoergr002PC", String = "(Das Fleisch an seinem Gürtel mit dem vergifteten Stück austauschen.)", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			IsGlobalFlagFalse{Name = "Q148HoergrSleeping"},
			Negated(QuestState{QuestId = 157 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "hoergr001", String = "(Dieser Kreatur zieht den Kampf einem Gespräch vor.)"},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q148HoergrSleeping"}),
			QuestState{QuestId = 157 , State = StateActive},
		},
		Actions = {
			Say{Tag = "hoergr002", String = "(Hörgr schläft. Er beginnt sich jedoch zu regen. Bald wird er aufwachen.)"},
			OfferAnswer{Tag = "hoergr002PC", String = "(Das Fleisch an seinem Gürtel mit dem vergifteten Stück austauschen.)", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q148HoergrSleeping"}),
			Negated(QuestState{QuestId = 157 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "hoergr002", String = "(Hörgr schläft. Er beginnt sich jedoch zu regen. Bald wird er aufwachen.)"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 2485 , Amount = 1 , Flag = Take} , 
			QuestSolve{QuestId = 157} , QuestBegin{QuestId = 158} , 
			SetGlobalFlagTrue{Name = "Q148HoergerHasGotPoisonedBeef"},
			SetRewardFlagTrue{ Name = "JeGroesser2"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 157 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hoergr002PC", String = "(Das Fleisch an seinem Gürtel mit dem vergifteten Stück austauschen.)", AnswerId = 1},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 157 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end