-->INFO: Nebenquest_Phiole
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "Richtiges_ItemPhioleP109"},	
	},
	Actions = 
	{
		--Outcry { NpcId = 7237, String = "Die Quest mit der Phiole wurde erfolgreich abgeschlossen" , Tag = "" , Color = ColorWhite}, --Dummy nur für Testzwecke!
		--SetEffect { Effect = , X = , Y = , Length = 5000 , NpcId = self},

	}
}



--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P109\n7237_Nebenquest_Phiole.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "phiole109_001", String = "(Dieser Ort riecht schwer nach Rost und Blut. Dunkle Flecken bedecken Altar und Boden. Ferne Schmerzensschreie scheinen überall aus dem Boden zu dringen.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemSanduhr"},
			IsItemFlagTrue{Name = "PlayerHasItemBlutphiole"},
			IsItemFlagTrue{Name = "PlayerHasItemKerze"},
		},
		Actions = {
			Say{Tag = "phiole109_002", String = "(Die Oberfläche des Altars brodelt, als wäre sie eine Flüssigkeit. Dieser Ort scheint dunkler zu sein, als die Welt um ihn..)"},
			OfferAnswer{Tag = "phiole109_003PC", String = "(Die Sanduhr auf den Altar stellen.)", AnswerId = 2},
			OfferAnswer{Tag = "phiole109_005PC", String = "(Die Phiole auf den Altar stellen.)", AnswerId = 4},
			OfferAnswer{Tag = "phiole109_007PC", String = "(Die Kerze auf den Altar stellen.)", AnswerId = 6},
			OfferAnswer{Tag = "phiole109_009NPC", String = "(Den Ort unverändert verlassen.)", AnswerId = 8},
		}}

	OnAnswer{1;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemSanduhr"},
			IsItemFlagTrue{Name = "PlayerHasItemBlutphiole"},
			Negated(IsItemFlagTrue{Name = "PlayerHasItemKerze"}),
		},
		Actions = {
			Say{Tag = "phiole109_002", String = "(Die Oberfläche des Altars brodelt, als wäre sie eine Flüssigkeit. Dieser Ort scheint dunkler zu sein, als die Welt um ihn..)"},
			OfferAnswer{Tag = "phiole109_003PC", String = "(Die Sanduhr auf den Altar stellen.)", AnswerId = 2},
			OfferAnswer{Tag = "phiole109_005PC", String = "(Die Phiole auf den Altar stellen.)", AnswerId = 4},
			OfferAnswer{Tag = "phiole109_009NPC", String = "(Den Ort unverändert verlassen.)", AnswerId = 8},
		}}

	OnAnswer{1;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemSanduhr"},
			Negated(IsItemFlagTrue{Name = "PlayerHasItemBlutphiole"}),
			IsItemFlagTrue{Name = "PlayerHasItemKerze"},
		},
		Actions = {
			Say{Tag = "phiole109_002", String = "(Die Oberfläche des Altars brodelt, als wäre sie eine Flüssigkeit. Dieser Ort scheint dunkler zu sein, als die Welt um ihn..)"},
			OfferAnswer{Tag = "phiole109_003PC", String = "(Die Sanduhr auf den Altar stellen.)", AnswerId = 2},
			OfferAnswer{Tag = "phiole109_007PC", String = "(Die Kerze auf den Altar stellen.)", AnswerId = 6},
			OfferAnswer{Tag = "phiole109_009NPC", String = "(Den Ort unverändert verlassen.)", AnswerId = 8},
		}}

	OnAnswer{1;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemSanduhr"},
			Negated(IsItemFlagTrue{Name = "PlayerHasItemBlutphiole"}),
			Negated(IsItemFlagTrue{Name = "PlayerHasItemKerze"}),
		},
		Actions = {
			Say{Tag = "phiole109_002", String = "(Die Oberfläche des Altars brodelt, als wäre sie eine Flüssigkeit. Dieser Ort scheint dunkler zu sein, als die Welt um ihn..)"},
			OfferAnswer{Tag = "phiole109_003PC", String = "(Die Sanduhr auf den Altar stellen.)", AnswerId = 2},
			OfferAnswer{Tag = "phiole109_009NPC", String = "(Den Ort unverändert verlassen.)", AnswerId = 8},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemSanduhr"}),
			IsItemFlagTrue{Name = "PlayerHasItemBlutphiole"},
			IsItemFlagTrue{Name = "PlayerHasItemKerze"},
		},
		Actions = {
			Say{Tag = "phiole109_002", String = "(Die Oberfläche des Altars brodelt, als wäre sie eine Flüssigkeit. Dieser Ort scheint dunkler zu sein, als die Welt um ihn..)"},
			OfferAnswer{Tag = "phiole109_005PC", String = "(Die Phiole auf den Altar stellen.)", AnswerId = 4},
			OfferAnswer{Tag = "phiole109_007PC", String = "(Die Kerze auf den Altar stellen.)", AnswerId = 6},
			OfferAnswer{Tag = "phiole109_009NPC", String = "(Den Ort unverändert verlassen.)", AnswerId = 8},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemSanduhr"}),
			IsItemFlagTrue{Name = "PlayerHasItemBlutphiole"},
			Negated(IsItemFlagTrue{Name = "PlayerHasItemKerze"}),
		},
		Actions = {
			Say{Tag = "phiole109_002", String = "(Die Oberfläche des Altars brodelt, als wäre sie eine Flüssigkeit. Dieser Ort scheint dunkler zu sein, als die Welt um ihn..)"},
			OfferAnswer{Tag = "phiole109_005PC", String = "(Die Phiole auf den Altar stellen.)", AnswerId = 4},
			OfferAnswer{Tag = "phiole109_009NPC", String = "(Den Ort unverändert verlassen.)", AnswerId = 8},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemSanduhr"}),
			Negated(IsItemFlagTrue{Name = "PlayerHasItemBlutphiole"}),
			IsItemFlagTrue{Name = "PlayerHasItemKerze"},
		},
		Actions = {
			Say{Tag = "phiole109_002", String = "(Die Oberfläche des Altars brodelt, als wäre sie eine Flüssigkeit. Dieser Ort scheint dunkler zu sein, als die Welt um ihn..)"},
			OfferAnswer{Tag = "phiole109_007PC", String = "(Die Kerze auf den Altar stellen.)", AnswerId = 6},
			OfferAnswer{Tag = "phiole109_009NPC", String = "(Den Ort unverändert verlassen.)", AnswerId = 8},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemSanduhr"}),
			Negated(IsItemFlagTrue{Name = "PlayerHasItemBlutphiole"}),
			Negated(IsItemFlagTrue{Name = "PlayerHasItemKerze"}),
		},
		Actions = {
			Say{Tag = "phiole109_002", String = "(Die Oberfläche des Altars brodelt, als wäre sie eine Flüssigkeit. Dieser Ort scheint dunkler zu sein, als die Welt um ihn..)"},
			OfferAnswer{Tag = "phiole109_009NPC", String = "(Den Ort unverändert verlassen.)", AnswerId = 8},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "phiole109_004", String = "(Die Schreie werden lauter, der Altar scheint zu kochen, irgend etwas scheint sich in ihm zu bewegen.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Phiole_nicht_geschafftP109"},
			EndDialog(),
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "phiole109_006", String = "(Flüssigkeit scheint vom Altar in die Phiole zu wandern. Dort brodelt sie leuchtend rot wie frisches Blut. Der Zorn dieses Ortes verraucht.)"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Richtiges_ItemPhioleP109"},
			       QuestSolve{QuestId = 654},
			       SetItemFlagFalse{Name = "PlayerHasItemBlutphiole"},
			       SetRewardFlagTrue{Name = "WerwolfTempel2"},
			       RemoveDialog{NpcId = 7237},
 			       SetEffect{Effect = "CastAirSilent" , X = 176, Y = 340, Length = 0},
			EndDialog(),
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "phiole109_008", String = "(Die Schreie werden lauter, der Altar scheint zu kochen, irgend etwas scheint sich in ihm zu bewegen.)"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Phiole_nicht_geschafftP109"},
			EndDialog(),
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end