-- P107 ... Cross/Eichbaum







----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

dofile("script/p107/n0_ItemScript.lua")
dofile("script/FahrendeHaendler.lua")


---- MAINQUEST-Giver

OnOneTimeEvent
{
	
	Conditions = 
	{	
	},
	Actions =	
	{
		QuestSolve {QuestId = 684},
		QuestBegin {QuestId = 597},
		QuestBegin {QuestId = 752},
		SetRewardFlagTrue { Name = "P107KarteErreicht" },
	},
}

--Tor öffnet sich wenn die Geistercamps zerstört wurden
OnOneTimeEvent
{
	
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "StopRespawnGeisterP107" , UpdateInterval = 10},
		IsGlobalFlagTrue { Name = "StopRespawnGeister2P107" , UpdateInterval = 10},
		IsGlobalFlagTrue { Name = "StopRespawnGeister3P107" , UpdateInterval = 10},
		
	},
	Actions =	
	{
		SetGlobalFlagTrue { Name = "TorOeffnetSichP107" },
	},
}


-----------------	
OnOneTimeEvent
{
	
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "StopRespawnGeisterP107"},	
	},
	Actions =	
	{
		
		SetRewardFlagTrue { Name = "GeistercampBesiegt" },
	},
}

OnOneTimeEvent
{
	
	Conditions = 
	{
		FigureDead{ NpcId = 5668},
		FigureDead{ NpcId = 5669},

	},
	Actions =	
	{
		
		SetRewardFlagTrue { Name = "AnfuehrerBesiegt" },
	},
}

--GeisterAngriffe in der Nacht
--2 Angriffe pro Nacht

OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		--TimeNight(),	--Prüft ob es vor Mitternacht oder nach Mitternacht ist, es kommen 2 Wellen pro Nacht
		
		ODER(TimeNightAfterMidnight(), TimeNightBeforeMidnight()),    
		IsGlobalFlagTrue { Name ="ZwergenMonumentGeclaimedP107"},--Wenn Monument geclaimed wurde
		IsGlobalCounter { Name = "GeisterAngriffP107", Operator = IsEqual, Value = 0, UpdateInterval = 60} --Wenn der Zähler auf 0 steht 
	},
	Actions =	
	{
		--AttackWave {SourceRace = 158, TargetRace = 139, Percent = 30,}, --30% der Geisterzwerge greifen an
		--AttackWave {SourceRace = 163, TargetRace = 139, Percent = 30,}, --30% der Geisterelfen greifen an
		--Outcry{ Tag = "", NpcId = 5670, String = "Er ist erschienen! Ihr habt versagt! Flieht, oder Ihr werdet vernichtet!", Color = ColorWhite },
		--ClanAttack {Number = 4, SourceClan = 27 , TargetX = 155, TargetY = 144, WalkMode = Run},
		Goto { X = 155 , Y = 148 , NpcId = 6739 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, --Geister greifen an
		Goto { X = 155 , Y = 148 , NpcId = 6740 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 155 , Y = 148 , NpcId = 6741 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 155 , Y = 148 , NpcId = 6742 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		
		IncreaseGlobalCounter { Name = "GeisterAngriffP107" }, --Der GeisterAngriffszähler wird auf 1 gesetzt, damit nur 1 mal in der Nacht ein Angriff gestartet wird 
	},
	
}

OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		ODER(TimeOfDay  {Hour = 1, Minute = 0, TimeFrame = 1, UpdateInterval  = 10}, TimeDay()),    
		IsGlobalFlagTrue { Name ="ZwergenMonumentGeclaimedP107"}, --Wenn Monument geclaimed wurde
		IsGlobalCounter { Name = "GeisterAngriffP107", Operator = IsEqual, Value = 1, UpdateInterval = 60} -- Wenn der Zähler auf 1 steht
	},
	Actions =	
	{
		ResetGlobalCounter { Name = "GeisterAngriffP107" }, --Der GeisterAngriffszähler wird auf 0 zurückgesetzt, damit nur 1 mal in der Nacht ein Angriff gestartet wird 
	}
	
}

--Sicherheitsabfrage Falls Spieler Monument verliert werden die Angreifer zurückgepfiffen!!!

OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		IsGlobalFlagTrue { Name ="ZwergenMonumentGeclaimedP107"}, --Wenn Monument geclaimed wurde
		Negated(IsMonumentInUse {X = 156, Y = 152, Range = 3, UpdateInterval = 10}),
		
	},
	Actions =	
	{
		Goto { X = 115 , Y = 110 , NpcId = 6739 , Range = 5 , WalkMode = Run , GotoMode = GotoForced}, --Geister go Home
		Goto { X = 115 , Y = 110 , NpcId = 6740 , Range = 5 , WalkMode = Run , GotoMode = GotoForced},
		Goto { X = 115 , Y = 110 , NpcId = 6741 , Range = 5 , WalkMode = Run , GotoMode = GotoForced},
		Goto { X = 115 , Y = 110 , NpcId = 6742 , Range = 5 , WalkMode = Run , GotoMode = GotoForced},
		ResetGlobalCounter { Name = "GeisterAngriffP107" }, 
	},
	
}



--Zwergenlager wird nach dem Dialog aufgedeckt

OnOneTimeEvent
{
	
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "DialogDevusEnded" },		
	},
	Actions =	
	{
		RevealUnExplored { X = 209, Y = 121, Range = 10 },
	},
	
}

--Sobald der Avatar in die Nähe der Verletzten kommt wird ihre Hitpoints herabgesetzt
OnOneTimeEvent
{
	
	Conditions = 
	{
		FigureInRange { X = 105, Y = 142 , NpcId = Avatar , Range = 10},		
	},
	Actions =	
	{
		SetHealth { NpcId = 5834, HitPoints = 8 },
		SetHealth { NpcId = 5835, HitPoints = 10 },
		SetHealth { NpcId = 5836, HitPoints = 5 },
		SetHealth { NpcId = 5837, HitPoints = 5 },
		SetHealth { NpcId = 5838, HitPoints = 7 },
		SetHealth { NpcId = 5839, HitPoints = 8 },
		
	}
	
}





EndDefinition()
end


