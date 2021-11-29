-->INFO: Hokan



function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{
 	X = _X, Y = _Y, Clan = 0, UnitId = 0, NoSpawnEffect = FALSE, Target = none,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P202HokanAnfangSpawnInit", UpdateInterval = 1}
	}, 
	Actions = 
	{
		SetGlobalFlagFalse {Name = "g_P202HokanAnfangSpawnInit"},
		ChangeRace {NpcId = self, Race = 152}
	} 
}


--Dialog aus am Anfang
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 10 ,
	Conditions = {},
	Actions = 
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9010"},
	}
}



--Dialog aus, wenn Grabmal offen und Spieler Urne hat
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 10 ,
	Conditions = 
	{
		IsNpcFlagTrue {Name = "P202HokanDialog1Ended", UpdateInterval = 20},
		PlayerHasItem {ItemId = 4633, Amount = 1 , Equipment = EquipmentAll , UpdateInterval = 20},
	},
	Actions = 
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9010"},
	}
}


--nach Dialog Anfang, Hokan zum Tor Nord
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 20 ,
	Conditions = 
	{
		IsNpcFlagTrue{Name = "P202HokanDialog1Ended", UpdateInterval = 20}
	},
	Actions = 
	{
		Goto{X = 317, Y = 379, NpcId = self, Range = 2, WalkMode = Run, GotoMode = GotoContinuous, XRand = 0, YRand = 0},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9010"},
	}
}


--beim Tor Nord, Tor auf und Flag zum Teleport
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 20 ,
	Conditions = 
	{
		FigureInRange {X = 317, Y = 379, NpcId = self, Range = 3}
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_P202HokanAmTorNord"}
	}
}



--Effekt für Despawn
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 20 ,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P202HokanAmTorNord", UpdateInterval = 50}
	},
	Actions = 
	{
		SetGlobalTimeStamp{Name = "g_tP202HokanUmspawn"},
		SetEffect {Effect = "DeMaterialize", Length = 3000 , TargetType = Figure , NpcId = 9010},
	}
}

--Hokan in den Süden teleport
--umspawn, wenn Tor offen
Umspawn
{
	UnitId = 2294, Clan = 0, X = 385, Y = 103, Target = none, NoSpawnEffect = FALSE, OnlyOnce = TRUE, PlayDeathAnim = FALSE,
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "g_tP202HokanUmspawn", Seconds = 2, UpdateInterval = 20},
	}, 
	Actions = 
	{
		SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_9010"},
		ChangeRace {NpcId = self, Race = 152},
		LookAtDirection {Direction = 1, NpcId = 9010}
	},
}


------------------------------------------------------------------
-----------------------------------------------------------------
--Hokan nach letzter Cutscene
	
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 20 ,
	Conditions = 
	{
		--FigureInRange {X = 369, Y = 108, NpcId = 0, Range = 4},
		IsGlobalFlagTrue{Name = "g_sP202CutsceneHokanEndeEnded", UpdateInterval = 10}
	},
	Actions = 
	{
		LookAtFigure {Target = 0, NpcId = 9010}, 
		Outcry {NpcId = 9010, String = "Hier, nehmt diese Rune! Ihr Sklave hat versagt, soll er nun Euch dienen!", Tag = "oca2maskedP202_006", Delay = TRUE, Color = ColorWhite},
		Outcry {NpcId = 9010, String = "Geht durch das Portal! Es bringt Euch in die Nähe von Empyria", Tag = "oca2maskedP202_007", Delay = TRUE, Color = ColorWhite},
		TransferItem {TakeItem = 0, GiveItem = 4783, Amount = 1, Flag = Give},
		-- aus cutscene:
			QuestBegin {QuestId = 831, SubQuestActivate = FALSE}, --Q Die Dryade
			QuestBegin {QuestId = 1085, SubQuestActivate = FALSE},
			QuestSolve {QuestId = 829, ActivateNextQuest = FALSE }, --das Geheimnis der Stadt
			SetRewardFlagTrue {Name = "UrneZuHokan"},
			QuestSolve {QuestId = 832, ActivateNextQuest = FALSE }, --  rückzug
			QuestSolve {QuestId = 826, ActivateNextQuest = FALSE }, -- Hokans Auftrag
			SetGlobalFlagTrue{Name = "g_StoryQuestShadowGotoEmpyria"},
		--SetGlobalFlagTrue {Name = "g_P202PortalEntblockt"},
		SetGlobalTimeStamp {Name = "g_P202FinalDespawnTimer"}
	}
}		

--wenn OC rum, despawn mit dem raith
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 20 ,
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "g_P202FinalDespawnTimer", Seconds = 16}
	},
	Actions = 
	{
		
		SetGlobalTimeStamp {Name = "g_P202HokanUndRaithDespawn"},
		SetEffect {Effect = "DeMaterialize", Length = 3000 , TargetType = Figure , NpcId = 9010},
		SetEffect {Effect = "DeMaterialize", Length = 3000 , TargetType = Figure , NpcId = 9106},
	}
}

		
-- nach CS Ende: Despawn Hokan
Despawn
{
	
	PlayDeathAnim = FALSE,
	Conditions = 
	{ 
		IsGlobalTimeElapsed {Name = "g_P202HokanUndRaithDespawn", Seconds = 2, UpdateInterval = 10},
	}, 
	Actions = 
	{
			--SetEffect {Effect = "DeMaterialize", Length = 2000 , TargetType = Figure , NpcId = 9010},
	},

}
--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P202\n9010_Hokan.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsNpcFlagTrue {Name = "P202HokanDialog1Ended", UpdateInterval = 20},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagTrue {Name = "P202HokanDialog1Ended", UpdateInterval = 20}),
		},
		Actions = {
			Say{Tag = "hokanP202_005", String = "Nun, bereit für Eure Aufgabe?"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hokanP202_001", String = "Habt Ihr die Urne?"},
			Answer{Tag = "hokanP202_002PC", String = "Nein, ich...", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hokanP202_003", String = "Wollt Ihr selbst zum Schatten werden? Ist der Schmerz nicht Antrieb genug?"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hokanP202_004", String = "Geht und bringt mir die Urne! Beeilt Euch, um so schneller seid Ihr Eure Schmerzen los!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{5;
		Conditions = {
			IsNpcFlagFalse{Name = "InfoCoSTold"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hokanP202_006PC", String = "Was ist das hier für ein Ort?", AnswerId = 6, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hokanP202_015PC", String = "Also gut, sagt mir, was zu tun ist.", AnswerId = 16},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "InfoCoSTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hokanP202_015PC", String = "Also gut, sagt mir, was zu tun ist.", AnswerId = 16},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hokanP202_007", String = "Dort oben seht Ihr die Stadt der Seelen ... ein Ort von dem man sagt, er ist nur zum Teil von dieser Welt ... und zum Teil von einer Anderen, Fremdartigen!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hokanP202_008", String = "Vor über tausend Jahren hausten hier einst Wesen, die nicht aus der Macht der Götter geboren waren. Sie waren aus dem Abgrund zwischen den Sternen hierher gekommen."},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hokanP202_009", String = "Doch diese Wesen waren grausam und kriegerisch und die Götter duldeten ihre Anwesenheit nicht. So stieg Hirin, Gott der Träume und des Todes, hinab und vernichtete die Fremden!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hokanP202_010", String = "Aber da sie nicht von dieser Welt waren, nahm er ihre Seelen nicht mit zum Mor Duine und gewährte ihnen keinen Einlass ins Totenreich. Also irren die Seelen jener grausamen Kreaturen noch heute durch diese Mauern."},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hokanP202_011", String = "Man sagt, die Fremden hätten große Schätze besessen! Das hat viele Tölpel hierher gelockt ... und keiner ist je zurückgekehrt!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hokanP202_012", String = "Nur einer verstand die Rätsel dieses Ortes ... und dessen Urne sollt Ihr mir jetzt bringen!"},
			Answer{Tag = "hokanP202_013PC", String = "Was habt Ihr damit vor?", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hokanP202_014", String = "Das erfahrt Ihr beizeiten. Lasst uns den Plan besprechen! Oder habt Ihr die Schmerzen schon vergessen ...?"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "InfoCoSTold"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
			IsNpcFlagFalse{Name = "InfoCoSTold"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hokanP202_006PC", String = "Was ist das hier für ein Ort?", AnswerId = 6, Color = ColorDarkOrange},
			OfferAnswer{Tag = "hokanP202_015PC", String = "Also gut, sagt mir, was zu tun ist.", AnswerId = 16},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "InfoCoSTold"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "hokanP202_015PC", String = "Also gut, sagt mir, was zu tun ist.", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hokanP202_016", String = "Ich werde das Tor zur Stadt für Euch öffnen, aber weiter kann ich Euch nicht folgen. Ihr tragt die Schattenklinge, nur Ihr könnt den Fial Darg in der Stadt besiegen!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hokanP202_017", String = "Ihr müsst in der Stadt nach einem Grabmal suchen! Es ist in der Mitte eines sehr großen Pentagrammes zu finden."},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hokanP202_018", String = "Wie alles an diesem Ort ist auch das Grabmal wahrscheinlich von einem Rätsel geschützt. Ich weiß nicht, was es ist, aber ich glaube es hat etwas mit dem Pentagramm zu tun."},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hokanP202_019", String = "Das Pentragamm erschafft Kreaturen ... und ihre Kraft nährt den Fial Darg. Sind genug von ihnen da, wird ein neuer Fial Darg gerufen!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hokanP202_020", String = "Ihr müsst also verhindern, dass das Pentagramm Kreaturen hervorbringt, sonst wird immer wieder ein Fial Darg beschworen!"},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hokanP202_021", String = "Ich vermute Ihr müsst die dunkle Macht des Pentagramms mit Eurer eigenen Lebenskraft oder der Eurer Leute aufheben. Achtet auf das Pentagramm und von woher die Kreaturen kommen! Irgendwo darin liegt der Schlüssel für das Rätsel!"},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hokanP202_022", String = "Ihr werdet Unterstützung brauchen, also nutzt das Monument!"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "hokanP202_023", String = "Ich erwarte Euch dann im Süden, am anderen Ende der Stadt. Kommt zu mir, sobald Ihr die Urne habt. Nun los, das Tor zur Stadt öffnet sich!"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			QuestBegin {QuestId = 828, SubQuestActivate = FALSE},
											QuestBegin {QuestId = 827, SubQuestActivate = FALSE},
											QuestSolve {QuestId = 830, ActivateNextQuest = FALSE },
											 RevealUnExplored {X = 434, Y = 341, Range = 5},
			SetNpcFlagTrue{Name = "P202HokanDialog1Ended"},
			EndDialog(),
		}}


	EndDefinition()
end