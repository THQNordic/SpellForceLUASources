-->INFO: Mondpriester
--INFO ZHAAL TUOR, Mondpriester

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--Wenn Spieler von der Weapon to Kill zurückkommt und er den Nichtangriffspakt erfüllt hat, ersscheint der Mondpriester im Innenbereich!
Umspawn
{ 
	UnitId = self ,
	Clan = 0 ,
	X = 387 ,
	Y = 266 ,
	Target = none ,
	NoSpawnEffect = FALSE ,
	OnlyOnce = TRUE ,
		Conditions = 
		{
			IsGlobalFlagTrue {Name = "AngebotAngenommenP110" }, 
			IsGlobalFlagFalse {Name = "VertragsBruchP110" },
			IsItemFlagTrue { Name = "PlayerHasItemSchattenschwert" , UpdateInterval = 10},
			
		} ,
		Actions = 
		{
			SetGlobalFlagTrue { Name = "FireCityMoonPriestRules"},
		}
}

OnOneTimeEvent

{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "MoonPriestGroupAggroP110" },		
	},
	Actions =
	{
		
		ChangeRace {Race = 137},
		
	}
}





--Outcries Zhaal Tuor

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "AngebotAngenommenP110" },		
	},
	Actions =
	{
		
		Outcry { NpcId = 6043 , String = "Krieger! Haltet ein!" , Tag = "ocZhaalTuor_P110_001" },
		
	}
}





--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P110\n6043_Mondpriester.txt


	

	OnBeginDialog{
		Conditions = {
			IsGlobalFlagTrue{Name = "FireCityMoonPriestRules"},
		},
		Actions = {
			Say{Tag = "mondpriester110_001", String = "Ah, unser ... Verbündeter!"},
			Answer{Tag = "mondpriester110_002PC", String = "Wo ist Craigh?", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "FireCityMoonPriestRules"}),
		},
		Actions = {
			Say{Tag = "mondpriester110_008", String = "Barbaren! Schänder! Nors Macht möge Euch heimsuchen!"},
			Answer{Tag = "mondpriester110_011PC", String = "Nors Macht hat Euch auch nicht geholfen, Priester, aber Ihr selbst könnt Euer Leben retten.", AnswerId = 6},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "mondpriester110_003", String = "Glaubtet Ihr wirklich, wir würden diesen Verräter am Leben lassen? Er starb langsam und qualvoll, Nor zum Wohlgefallen!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "mondpriester110_004", String = "Er war genauso naiv wie Ihr! Der Schlüssel zum Abgrund ist wohl verwahrt, und mit dem Schattenschwert in unserem Besitz wird unser Herr weitaus ... freigiebiger sein!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "mondpriester110_005", String = "Ihr ahnt es schon, es ist soweit ..."},
			Answer{Tag = "mondpriester110_006PC", String = "Euer Volk wird im Winter des Drachen genauso vergehen!", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			QuestSolve { QuestId = 748},
			       QuestBegin { QuestId = 750},
			       SetGlobalFlagTrue{Name = "MoonPriestGroupAggroP110"},
			       RemoveDialog{ NpcId = self},
			Say{Tag = "mondpriester110_007", String = "Wachen! Tötet sie!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "mondpriester110_012PC", String = "Erschließt mir die Macht, die Ihr gegen die Priester des Feuers geschmiedet habt!", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "mondpriester110_013", String = "Das Elementar des Mondes! Wenn es mein Leben rettet und diese Feuerdiener vernichtet ... dann nehmt es!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "DialogZhaalTuorEnded"},
			RemoveDialog{NpcId = self},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end