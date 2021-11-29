-->INFO: Riese_am_Boden
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-------------------------------------------------------------------
-- Object tauschen -> Betrunkener Riese ---------------------------
-- Dialogsymbol über Objekt Schlafender Rieser/Betrunkener Riese --
-------------------------------------------------------------------

OnOneTimeEvent
{
	Conditions =
	{},
	Actions =
	{
		SetEffect {Effect = "DialogRieseSpecial", X = 352, Y = 452, Length = 0, TargetType = World},	
		ChangeObject {X = _X, Y = _Y, Object = 3223},
	},
}

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P207\n10512_Riese_am_Boden.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsGlobalFlagTrue{Name = "p207_BelohnungErhalten"},
		},
		Actions = {
			Say{Tag = "giantP207_001", String = "Mjörn hat Menschling Danke gesagt! Nun Menschling Mjörn wieder in Ruhe lassen!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "p207_BelohnungErhalten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{2;
		Conditions = {
			UND(IsGlobalFlagTrue{Name = "p207_Goblins_Dead"},QuestState{QuestId = 989, State = StateSolved}),
		},
		Actions = {
			Say{Tag = "giantP207_002", String = "Ooh, Menschling hat Goblins weg gemacht! Guter Menschling! Mjörn jetzt schon viel besser! Was Menschling wollen als Dank?"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(UND(IsGlobalFlagTrue{Name = "p207_Goblins_Dead"},QuestState{QuestId = 989, State = StateSolved})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "giantP207_003PC", String = "Ihr habt doch sicher Nützliches in Eurem Schatz ...", AnswerId = 4},
			OfferAnswer{Tag = "giantP207_006PC", String = "Wisst Ihr wie man die Höhlen verschließt? Ich glaube von da droht mir Ärger!", AnswerId = 6},
			OfferAnswer{Tag = "giantP207_010PC", String = "Kämpft an meiner Seite Mjörn!", AnswerId = 9},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "giantP207_004", String = "Mjorn nichts Schatz, böse Goblins immer stehlen alles! Aber Mjörn hat das hier! Du nehmen!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			TransferResource {Resource = GoodFood, Side = SideDark, Amount = 750, Flag = Give}, QuestSolve{QuestId = 991}, QuestSolve{QuestId = 989},
			SetGlobalFlagTrue{Name = "p207_BelohnungErhalten"},
			Say{Tag = "giantP207_005", String = "(Ihr habt 750 Nahrung erhalten)"},
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
			Say{Tag = "giantP207_007", String = "Du machen Stein davor!"},
			Answer{Tag = "giantP207_008PC", String = "Das wäre dann der Teil, wo ich Eure Hilfe bräuchte, Mjörn.", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "giantP207_009", String = "Oh! Das einfach! Mjörn wird für Menschling ein paar Höhlen zu machen! Du sehen!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "p207_Verschliesse_Hoehlen"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "giantP207_011", String = "Hm, schätze Mjörn dir das schuldig! Gut, Mjörn wird Feinde von Menschling zermalmen! Menschling mir nur sagen, wo hingehn!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "p207_Uebergebe_Riese"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{11;
		Conditions = {
			IsGlobalFlagTrue{Name = "p207_AuftrageHilfRieseErhalten"},
		},
		Actions = {
			Say{Tag = "giantP207_012", String = "Ooh! Böse Goblins! Menschling geht und fängt sie! Mjörn hier solange ausruhen ..."},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "p207_AuftrageHilfRieseErhalten"}),
		},
		Actions = {
			Say{Tag = "giantP207_013", String = "Ooh! Kopf! Ooh!"},
			Answer{Tag = "giantP207_014PC", String = "Was habt Ihr?", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "giantP207_015", String = "Ihr nicht so brüllen, Menschling ... Mjörn noch gut hören! Aber Mjörn nicht gut denken ...Ooh!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "giantP207_016", String = "Dummer Mjörn, findet Zwergenschnaps in kaputtem Wagen! Trinkt alles aus ...Ooh, dummer Mjörn!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "giantP207_017", String = "Jetzt Mjörn ganz schwindelig ... Und Goblins stehlen alle von Mjörns Sachen! Mjörn zu schwindelig, kann sie nicht fangen! Ooh!"},
			Answer{Tag = "giantP207_018PC", String = "Vielleicht kann ich ja diese Goblins verteiben?", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "giantP207_019", String = "Ooh! Das nett Menschling! Mjörn nur noch ein Bisschen ausruhen! Du gehen und vertreiben garstige Goblins!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "p207_AuftrageHilfRieseErhalten"},QuestSolve{QuestId = 989}, QuestBegin{QuestId = 990},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end