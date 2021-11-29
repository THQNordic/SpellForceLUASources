-->INFO: WundbrandZwerg
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
--Kranker Zwerg SideQuest

OneTimeInitAction (SetHealth { NpcId = 5840, HitPoints = 1 })   
OneTimeInitAction (LookAtFigure{ Target =  5671, NpcId = 5840}) 
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
		IsGlobalFlagFalse{Name = "Q598DwarfCanSpeak"},
		},
OnActions =	{
		RemoveDialog{NpcId = self},
		},
OffConditions =	{
		IsGlobalFlagTrue{Name = "Q598DwarfCanSpeak"},
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
		Negated(FigureHasHealth { Percent = 10 , NpcId = 5840, UpdateInterval = 10}),
		IsGlobalFlagFalse { Name = "TrankUebergabeZwerg"},
		IsGlobalFlagFalse { Name = "TrankUebergabeElfe"},
	},
	Actions =
	{
		
		--ShowDebugText { String = "Über 25 Prozent" , Color = ColorRed},
		--Outcry{ Tag = "", NpcId = 5670, String = "Zwerg:Er ist erschienen! Ihr habt versagt! Flieht, oder Ihr werdet vernichtet!", Color = ColorWhite },
		SetHealth { NpcId = 5840, HitPoints = 1},
	}
}


--Wenn der Wundtrank dem Zwerg übergeben wird steigen seine Hitpoints auf 100%

OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "TrankUebergabeZwerg"},
	},
	Actions =
	{
		SetHealth { NpcId = self, HitPoints = 31 },
		ChangeUnit{ Unit = 396, NpcId = self , ChangeLevel = FALSE},
		SetFreezeFlagFalse{ NpcId = self},
		SetHealth { NpcId = 5841, HitPoints = 0},
		--Kill {NpcId = 5841},     --Elfe stirbt
		SetGlobalFlagTrue{Name = "ElfeStirbtP107"},
	}
}

OnEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "ElfeStirbtP107"},
	},
	Actions =
	{
		SetHealth { NpcId = 5841, HitPoints = 0},
		
	}
}







--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p107\n5840_WundbrandZwerg.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "wundbrandzwerg107_001", String = "Mir geht es bereits viel besser! Ich danke Euch."},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "wundbrandzwerg107_002", String = "Nehmt diese Axt als Belohnung für mein Leben! Niethalfs Stärke sei mit Euch, Mensch."},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagFalse{Name = "Q598DwarfCanSpeak"},
			TransferItem{GiveItem = 4423, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end