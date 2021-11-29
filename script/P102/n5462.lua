-->INFO: Setrius
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--- Zu Beginn Setrius mundtot machen (enable erst, wenn Cutscene zuende)
OnOneTimeEvent
{		
 	Actions = 
	{ 
		RemoveDialog {NpcId = self},
	},
}


Umspawn 
{ 
	UnitId = self , Clan = 0 , X = 194 , Y = 354 , Target = none , NoSpawnEffect = TRUE , OnlyOnce = TRUE ,
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "StartFinish" , UpdateInterval = 10}, --	Beginn der ZweikampfCutSzene
	} ,
	Actions = 
	{
		RemoveDialog {NpcId = 5462},
		--LookAtFigure { Target = 5635, NpcId = self},
	}
}

--Setrius geht zurück ins Camp
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 60 ,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "ArenaOver", UpdateInterval = 60},
	},
		
 	Actions = 
	{ 
		Goto { X = 305, Y = 393, NpcId = self , Range = 5 , WalkMode = Walk , GotoMode = GotoContinuous},
	},
}



--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p102\n5462_Setrius.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsPlayerFlagTrue{Name = "Q560_SetriusKnown"},
		},
		Actions = {
			Say{Tag = "setrius102_001", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q560_SetriusKnown"}),
		},
		Actions = {
			Say{Tag = "setrius102_003", String = "Ich kann nicht sagen, dass mich Euer Besuch erfreut, aber nehmt meinen Dank entgegen, dass Ihr Janina sicher hierher gebracht habt."},
			Answer{Tag = "setrius102_004PC", String = "Ihr sagtet, Ihr braucht Hilfe?", AnswerId = 3},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "setrius102_002", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "setrius102_005", String = "Ja. Janina muss Dunhan gegenübertreten, will sie je dem Fluch entkommen, der auf ihr liegt."},
			Answer{Tag = "setrius102_006PC", String = "Wir kamen eigentlich hierher, um Dunhan zu suchen. Der Widerstand braucht ihn!", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "setrius102_007", String = "Mein Bruder ist dem Wahnsinn verfallen! Seine Kitharsöldner plündern das Land und er sinnt nur darauf, mich zu töten! Um den Widerstand schert er sich nicht mehr!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "setrius102_008", String = "Aber es gibt einen Weg, Euch und vielleicht auch Janina zu helfen. Doch dazu müssen wir zuerst die Kithar ausschalten, die ihn bewachen."},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "setrius102_009", String = "Meine Waldläufer sind tapfer, aber gegen die Elite der Kithar sind sie machtlos. Wir müssen die Kithar schwächen!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "setrius102_010", String = "Ein Gift wird uns helfen! Diese Bestien sind hart im Nehmen, aber das Gift der Wildfeuerblume wird sie schwächen und verwirren!"},
			Answer{Tag = "setrius102_011PC", String = "Ihr wollt eine Horde Kitharkrieger vergiften? Wie soll das gehen?", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "setrius102_012", String = "Da kommt Ihr ins Spiel! Ich werde Euch etwas Gift mitgeben und Ihr verseucht damit ihre Wasserquelle!"},
			Answer{Tag = "setrius102_013PC", String = "Das Tor zu ihrem Land ist verschlossen.", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "setrius102_014", String = "Ein Bergpfad führt von hier über die Sturmfelsen. Über den gelangt Ihr ungesehen bis zu ihrer Wasserstelle. Gebt das Gift dort in den Brunnen."},
			Answer{Tag = "setrius102_015PC", String = "Wo finden wir diesen Bergpfad?", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "setrius102_016", String = "Er beginnt westlich von hier in den Bergen. Folgt ihm über die Sturmfelsen, dann könnt Ihr die Wasserstelle nicht verfehlen."},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemGift"},
		},
		Actions = {
			Say{Tag = "setrius102_017", String = "Ihr habt das Gift bereits dabei? Ich weiß zwar nicht, woher Ihr es habt, aber dann brauche ich Euch ja keines mehr zu geben."},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemGift"}),
		},
		Actions = {
			Say{Tag = "setrius102_018", String = "Hier habt Ihr etwas Wildfeuergift. Gebt es in ihren Brunnen."},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 563},
						   QuestBegin{QuestId = 565},
						   SetPlayerFlagTrue{Name = "Q560_SetriusKnown"},
						   RevealUnExplored { X = 58 , Y = 317 , Range = 20 },
						   RemoveDialog{NpcId = 5462},
						   SetPlatformFlagFalse { Name = "JaninaFollow" },
						   SetGlobalFlagTrue{Name = "DialogSetriusEnded"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 563},
						        QuestBegin{QuestId = 565},
						        SetPlayerFlagTrue{Name = "Q560_SetriusKnown"},
						 		TransferItem{GiveItem = 3624 , Flag = Give},
						 		RevealUnExplored { X = 58 , Y = 317 , Range = 20 },
						 		RemoveDialog{NpcId = 5462},
						 		SetPlatformFlagFalse { Name = "JaninaFollow" },
						 		SetGlobalFlagTrue{Name = "DialogSetriusEnded"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end