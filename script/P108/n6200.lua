-->INFO: Uram
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

Sprengung = {}

tinsert (Sprengung, {X = 238, Y = 211, Object = 846})
tinsert (Sprengung, {X = 239, Y = 211, Object = 846})
tinsert (Sprengung, {X = 239, Y = 210, Object = 846})
tinsert (Sprengung, {X = 240, Y = 210, Object = 845})
tinsert (Sprengung, {X = 240, Y = 209, Object = 846})
tinsert (Sprengung, {X = 241, Y = 209, Object = 839})
tinsert (Sprengung, {X = 241, Y = 208, Object = 846})
tinsert (Sprengung, {X = 242, Y = 208, Object = 846})
tinsert (Sprengung, {X = 242, Y = 207, Object = 846})
tinsert (Sprengung, {X = 243, Y = 207, Object = 846})
tinsert (Sprengung, {X = 243, Y = 206, Object = 846})
tinsert (Sprengung, {X = 244, Y = 206, Object = 840})
tinsert (Sprengung, {X = 244, Y = 206, Object = 840})
tinsert (Sprengung, {X = 244, Y = 206, Object = 840})
tinsert (Sprengung, {X = 238, Y = 210, Object = 845})
tinsert (Sprengung, {X = 239, Y = 209, Object = 846})
tinsert (Sprengung, {X = 240, Y = 208, Object = 839})
tinsert (Sprengung, {X = 241, Y = 207, Object = 846})
tinsert (Sprengung, {X = 242, Y = 206, Object = 846})
tinsert (Sprengung, {X = 241, Y = 206, Object = 840})
tinsert (Sprengung, {X = 244, Y = 206, Object = 840})
tinsert (Sprengung, {X = 236, Y = 210, Object = 840})
tinsert (Sprengung, {X = 237, Y = 210, Object = 845})
tinsert (Sprengung, {X = 237, Y = 209, Object = 846})
tinsert (Sprengung, {X = 238, Y = 209, Object = 846})
tinsert (Sprengung, {X = 238, Y = 208, Object = 846})
tinsert (Sprengung, {X = 239, Y = 208, Object = 846})
tinsert (Sprengung, {X = 239, Y = 206, Object = 845})
tinsert (Sprengung, {X = 240, Y = 207, Object = 845})
tinsert (Sprengung, {X = 240, Y = 206, Object = 845})
tinsert (Sprengung, {X = 240, Y = 205, Object = 845})
tinsert (Sprengung, {X = 239, Y = 205, Object = 846})
tinsert (Sprengung, {X = 241, Y = 205, Object = 839})
tinsert (Sprengung, {X = 240, Y = 204, Object = 846})
tinsert (Sprengung, {X = 238, Y = 205, Object = 846})
tinsert (Sprengung, {X = 237, Y = 206, Object = 845})
tinsert (Sprengung, {X = 239, Y = 207, Object = 846})
tinsert (Sprengung, {X = 238, Y = 206, Object = 846})
tinsert (Sprengung, {X = 238, Y = 208, Object = 846})


SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "SpawnUramP108"},
	},
	Actions = 
	{
	},
}

--!EDS ONIDLEGOHOME BEGIN

OnIdleGoHome
{
	WalkMode = Run, X = _X, Y = _Y, Direction = 0,
	Conditions =
	{
		IsGlobalFlagFalse{Name = "UramSprengungP108"},
	}
}
--!EDS ONIDLEGOHOME END

--Uram läuft zur Sprengung
OnIdleGoHome
{
	X = 229, Y = 231, Direction = 0, WalkMode = Run,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "UramSprengungP108"},
	},
	HomeActions =
	{
		SetGlobalFlagTrue {Name = "UramBeginntSprengung"},
		SetGlobalTimeStamp {Name = "SprengZeit"},
		SetNpcFlagTrue {Name = "P109_UramHome"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		FigureHasHealth {Percent = 10}
	},
	Actions =
	{
		-- Uram fliegt in die Luft
		--Outcry{Tag = "ocUram108_001", NpcId = 6200, String = "Oh mein Gott, mein Sprengwerk wird gleich explodieren", Color = ColorWhite},
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "UramHatsGetan"},
	},
	Actions =
	{
		--SetGlobalFlagFalse {Name = "UramSprengungP108"},
		
		RevealUnExplored {X = 405, Y = 308, Range = 7},
		RevealUnExplored {X = 275, Y = 305, Range = 7},
		RevealUnExplored {X = 231, Y = 290, Range = 7},
		RevealUnExplored {X = 314, Y = 232, Range = 7},
		EnableDialog {},
		QuestSolve {QuestId = 610},
		QuestBegin {QuestId = 611},
		Outcry{Tag = "ocUramP008_002", NpcId = 6200, String = "Da! Der Pass ist versperrt! Jetzt müssen sie durch das heilige Feld!", Color = ColorWhite},
	}
}

--OnIdleGoHome
--{
--	WalkMode = Run, X = 230, Y = 222, Direction = 0,
--	Conditions =
--	{
--		IsGlobalFlagTrue {Name = "UramBeginntSprengung"},
--		IsNpcFlagFalse {Name = "P109_UramHome"},
--	},
--	Actions =
--	{
--	},
--	HomeActions =
--	{
--		
--	}
--}
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "SprengZeit", Seconds = 5},
	},
	Actions = 
	{
		Outcry{Tag = "ocUramP008_001", NpcId = 6200, String = "Gebt acht, gleich rummst es!", Color = ColorWhite},
	}
}
		

OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "SprengZeit", Seconds = 15},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "SprengungP108"},
		SetEffect {TargetType =World, X = 234, Y = 225, Length = 1750, Effect = "DarkMight"},
		SetEffect {TargetType =World, X = 232, Y = 224, Length = 550, Effect = "Explo"},
		SetEffect {TargetType =World, X = 231, Y = 228, Length = 1500, Effect = "Explo"},
		SetEffect {TargetType =World, X = 234, Y = 227, Length = 550, Effect = "Explo"},
		SetEffect {TargetType =World, X = 236, Y = 230, Length = 1500, Effect = "Explo"},
		SetEffect {TargetType =World, X = 239, Y = 227, Length = 550, Effect = "Explo"},
		SetEffect {TargetType =World, X = 239, Y = 224, Length = 1500, Effect = "Explo"},
		SetEffect {TargetType =World, X = 242, Y = 224, Length = 550, Effect = "Explo"},
		SetEffect {TargetType =World, X = 234, Y = 231, Length = 1500, Effect = "Explo"},
		SetEffect {TargetType =World, X = 231, Y = 229, Length = 1500, Effect = "BuildingFire"},
		SetEffect {TargetType =World, X = 233, Y = 228, Length = 1500, Effect = "BuildingFire"},
	}
}



OnOneTimeEvent
{
	UpdateInterval = 1,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "SprengungP108", UpdateInterval = 1},
	},
	Actions =
	{
		SetEffect {TargetType =World, X = 233, Y = 266, Length = 7500, Effect = "Fog"},
		SetEffect {TargetType =World, X = 231, Y = 229, Length = 550, Effect = "Explo"},
		SetEffect {TargetType =World, X = 234, Y = 225, Length = 1000, Effect = "Explo"},
		SetEffect {TargetType =World, X = 242, Y = 227, Length = 550, Effect = "Explo"},
		SetEffect {TargetType =World, X = 239, Y = 224, Length = 1000, Effect = "Explo"},
		SetEffect {TargetType =World, X = 234, Y = 224, Length = 550, Effect = "Explo"},
		SetEffect {TargetType =World, X = 232, Y = 231, Length = 1000, Effect = "Explo"},
		
		RemoveObject {X = 234, Y = 225, Object = 839},
		RemoveObject {X = 238, Y = 224, Object = 845},
		RemoveObject {X = 232, Y = 225, Object = 841},
		RemoveObject {X = 231, Y = 224, Object = 846},
		RemoveObject {X = 240, Y = 225, Object = 841},
		--RemoveObject {X = 87, Y = 266, Object = 844},
		--RemoveObject {X = 88, Y = 267, Object = 844},
		--RemoveObject {X = 88, Y = 266, Object = 844},
		--RemoveObject {X = 89, Y = 267, Object = 844},
		--RemoveObject {X = 89, Y = 266, Object = 844},
		--RemoveObject {X = 82, Y = 264, Object = 839},
		--RemoveObject {X = 84, Y = 261, Object = 839},
		--RemoveObject {X = 84, Y = 263, Object = 842},
		--RemoveObject {X = 85, Y = 265, Object = 845},
		--RemoveObject {X = 84, Y = 264, Object = 842},
		--RemoveObject {X = 86, Y = 264, Object = 843},
		--RemoveObject {X = 86, Y = 265, Object = 846},
		--RemoveObject {X = 88, Y = 264, Object = 844},
		--RemoveObject {X = 86, Y = 267, Object = 844},
		--RemoveObject {X = 86, Y = 267, Object = 844},
		--RemoveObject {X = 86, Y = 263, Object = 844},
		--RemoveObject {X = 88, Y = 264, Object = 844},
		--RemoveObject {X = 84, Y = 266, Object = 839},
		--RemoveObject {X = 86, Y = 264, Object = 839},
		--SetGlobalFlagFalse {Name = "Explosionsschalter"},
		--QuestSolve{QuestId = 291},
		--QuestSolve{QuestId = 279},
		--SetGlobalFlagTrue {Name = "TravelOn"},
		--SetGlobalFlagTrue {Name = "GreyfellFarlornGateOpen"}
		SpecialPlaceObjects {ObjectTable = Sprengung},
		SetGlobalFlagTrue {Name = "UramHatsGetan"},
		SetRewardFlagTrue {Name = "GuramMachtSprengung"},

	}
}

OnDeath
{
	Actions =
	{
		SetGlobalFlagTrue {Name = "P108_UramTot"},
	}
}
--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P108\n6200_Uram.txt


	

	OnBeginDialog{
		Conditions = {
			IsGlobalFlagFalse {Name = "UramHatteStart"},
			IsGlobalFlagTrue {Name = "UramBeginntSprengung"},
		},
		Actions = {
			Say{Tag = "uram108_001", String = "Was gibt es, Mensch?"},
			OfferAnswer{Tag = "uram108_002PC", String = "Der König schickt mich! Ihr werdet angewiesen, den Südpass zu sprengen!", AnswerId = 1},
			OfferAnswer{Tag = "uram108_008PC", String = "Vielen Dank, Uram.", AnswerId = 6},
		}}

	OnBeginDialog{
		Conditions = {
			IsGlobalFlagFalse {Name = "UramHatteStart"},
			Negated(IsGlobalFlagTrue {Name = "UramBeginntSprengung"}),
		},
		Actions = {
			Say{Tag = "uram108_001", String = "Was gibt es, Mensch?"},
			OfferAnswer{Tag = "uram108_002PC", String = "Der König schickt mich! Ihr werdet angewiesen, den Südpass zu sprengen!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagFalse {Name = "UramHatteStart"}),
			IsGlobalFlagTrue {Name = "UramBeginntSprengung"},
		},
		Actions = {
			Say{Tag = "uram108_001", String = "Was gibt es, Mensch?"},
			OfferAnswer{Tag = "uram108_008PC", String = "Vielen Dank, Uram.", AnswerId = 6},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagFalse {Name = "UramHatteStart"}),
			Negated(IsGlobalFlagTrue {Name = "UramBeginntSprengung"}),
		},
		Actions = {
			Say{Tag = "uram108_001", String = "Was gibt es, Mensch?"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uram108_003", String = "Na, den Südpass selbst wohl kaum, Menschlein! Aber ich kann mir ausmalen, was Ihr und der alte Ragnar bezweckt! Soll mir ein Vergnügen sein!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uram108_004", String = "Ich muss nur kurz ein paar Sachen zusammensuchen. Ihr macht Euch schon einmal Gedanken, wie wir lebend dort hinkommen!"},
			Answer{Tag = "uram108_005PC", String = "Tut Ihr nur Euer Handwerk und lasst das Überleben meine Sorge sein.", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uram108_006", String = "Har, Har! Aber wenn es brenzlig wird, verschwinde ich, das sag ich Euch gleich. Mit Kämpfen habe ich nicht viel am Hut!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uram108_007", String = "So, fertig! Auf geht's, Menschlein, schön Schritt halten!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "UramSprengungP108"}, SetGlobalFlagTrue {Name = "UramHatteStart"},
			RemoveDialog {},
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
			Say{Tag = "uram108_009", String = "Har Har, hat ordentlich geknallt, was will man mehr! Jetzt geht und macht diesem unheiligen Gewürm den Garaus, Freund!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uram108_010", String = "Dumm, wie sie sind, werden sie nun geradewegs durch das heilige Feld trampeln! Das wird ihnen nicht bekommen, Har Har!"},
			Answer{Tag = "uram108_011PC", String = "Ragnar glaubt, dass die Magie der Grabmäler die Untoten schwächen wird.", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uram108_012", String = "Schwächen ist gut! Die Geister unserer Ahnen werden jeden Untoten, der den Statuen zu nahe kommt, postwendend in die Unterwelt zurückbefördern!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uram108_013", String = "Und da waren es nur noch neun! Har, Har!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uram108_014", String = "So, genug geredet! Nutzt die Gunst der Stunde und greift an!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			RemoveDialog {}, SetGlobalFlagFalse {Name = "UramSprengungP108"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end