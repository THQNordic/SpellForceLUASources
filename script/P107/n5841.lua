-->INFO: WundbrandElf
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
--Kranke Elfe SideQuest


OneTimeInitAction (SetHealth { NpcId = 5841, HitPoints = 1 })
OneTimeInitAction (LookAtFigure{ Target =  5671, NpcId = 5841})
OneTimeInitAction (ChangeRace { Race = 185, NpcId = self})  

--NpcId behält die Position bei auch bei Kämpfen
OnPlatformOneTimeEvent
{
	
	Conditions = 
	{
		
	},
	Actions =	
	{
		HoldPosition{ NpcId = self},
		SetFreezeFlagTrue{ NpcId = self},
	}
	
}


---Dialog aus/an
OnToggleEvent
{
OnConditions =	{
		IsGlobalFlagFalse{Name = "Q598ElfCanSpeak"},
		},
OnActions =	{
		RemoveDialog{NpcId = self},
		},
OffConditions =	{
		IsGlobalFlagTrue{Name = "Q598ElfCanSpeak"},
		},
OffActions =	{
		EnableDialog{NpcId = self},
		},
}


--Fragt ab ob sich die Hitpoints durch Regeneration auf 10% des Ausgangswertes erhöht haben, wenn ja werden sie wieder auf 1 zurück gesetzt

OnEvent
{
	Conditions =
	{
		Negated(FigureHasHealth { Percent = 10 , NpcId = 5841, UpdateInterval = 10}),
		IsGlobalFlagFalse { Name = "TrankUebergabeZwerg"},
		IsGlobalFlagFalse { Name = "TrankUebergabeElfe"},
		
		
	},
	Actions =
	{
		
		--ShowDebugText { String = "Über 25 Prozent" , Color = ColorRed},
		--Outcry{ Tag = "", NpcId = 5670, String = "Elfe:Er ist erschienen! Ihr habt versagt! Flieht, oder Ihr werdet vernichtet!", Color = ColorWhite },
		SetHealth { NpcId = 5841, HitPoints = 1},
	}
}
		
--Wenn der Wundtrank der Elfe übergeben wird steigen ihre Hitpoints auf 100%
			


OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "TrankUebergabeElfe"},
	},
	Actions =
	{
		SetHealth { NpcId = self, HitPoints = 41 },
		ChangeUnit{ Unit = 461, NpcId = self , ChangeLevel = FALSE},
		SetFreezeFlagFalse{ NpcId = self},
		--Kill {NpcId = 5840},     --Zwerg stirbt
		SetGlobalFlagTrue { Name = "ZwergStirbtP107"},
	}
}

OnEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "ZwergStirbtP107"},
	},
	Actions =
	{
		SetHealth { NpcId = 5840, HitPoints = 0},
		
	}
		
}




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p107\n5841_WundbrandElf.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "wundbrandelf107_001", String = "Das Leben fließt in mich zurück. Danke, dass Ihr mich gerettet habt!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "wundbrandelf107_002", String = "Nehmt diese Brosche, sie ist weder Waffe noch Panzer, aber sie mag Euch nutzen zur rechten Zeit."},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "wundbrandelf107_003", String = "Sollte Euch eine meiner Schwestern je mit Verachtung strafen, zeigt Ihr diese Brosche. Sie wird es verstehen."},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagFalse{Name = "Q598ElfCanSpeak"},
			TransferItem{GiveItem = 3839, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end