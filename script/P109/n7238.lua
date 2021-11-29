-->INFO: Nebenquest_kerze
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "Richtiges_ItemKerzeP109"},		
	},
	Actions = 
	{
		--Outcry { NpcId = 7238, String = "Die Quest mit der Kerze wurde erfolgreich abgeschlossen" , Tag = "" , Color = ColorWhite}, --Dummy nur für Testzwecke!
		--SetEffect { Effect = , X = , Y = , Length = 5000 , NpcId = self},

	}
}



--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P109\n7238_Nebenquest_kerze.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "kerze109_001", String = "(Dieser Ort erscheint stumpf und farblos. Es ist kalt und der Wind heult mit dem Gesang der Einsamkeit.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemSanduhr"},
			IsItemFlagTrue{Name = "PlayerHasItemBlutphiole"},
			IsItemFlagTrue{Name = "PlayerHasItemKerze"},
		},
		Actions = {
			Say{Tag = "kerze109_002", String = "(Einst wuchsen wohl Blumen um den Altar, doch sie sind fahl und grau geworden. Schatten kriechen wie Lebewesen an den Rändern des Altares entlang.)"},
			OfferAnswer{Tag = "kerze109_003PC", String = "(Die Sanduhr auf den Altar stellen.)", AnswerId = 2},
			OfferAnswer{Tag = "kerze109_005PC", String = "(Die Phiole auf den Altar stellen.)", AnswerId = 4},
			OfferAnswer{Tag = "kerze109_007PC", String = "(Die Kerze auf den Altar stellen.)", AnswerId = 6},
			OfferAnswer{Tag = "kerze109_0010PC", String = "(Den Ort unverändert verlassen.)", AnswerId = 9},
		}}

	OnAnswer{1;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemSanduhr"},
			IsItemFlagTrue{Name = "PlayerHasItemBlutphiole"},
			Negated(IsItemFlagTrue{Name = "PlayerHasItemKerze"}),
		},
		Actions = {
			Say{Tag = "kerze109_002", String = "(Einst wuchsen wohl Blumen um den Altar, doch sie sind fahl und grau geworden. Schatten kriechen wie Lebewesen an den Rändern des Altares entlang.)"},
			OfferAnswer{Tag = "kerze109_003PC", String = "(Die Sanduhr auf den Altar stellen.)", AnswerId = 2},
			OfferAnswer{Tag = "kerze109_005PC", String = "(Die Phiole auf den Altar stellen.)", AnswerId = 4},
			OfferAnswer{Tag = "kerze109_0010PC", String = "(Den Ort unverändert verlassen.)", AnswerId = 9},
		}}

	OnAnswer{1;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemSanduhr"},
			Negated(IsItemFlagTrue{Name = "PlayerHasItemBlutphiole"}),
			IsItemFlagTrue{Name = "PlayerHasItemKerze"},
		},
		Actions = {
			Say{Tag = "kerze109_002", String = "(Einst wuchsen wohl Blumen um den Altar, doch sie sind fahl und grau geworden. Schatten kriechen wie Lebewesen an den Rändern des Altares entlang.)"},
			OfferAnswer{Tag = "kerze109_003PC", String = "(Die Sanduhr auf den Altar stellen.)", AnswerId = 2},
			OfferAnswer{Tag = "kerze109_007PC", String = "(Die Kerze auf den Altar stellen.)", AnswerId = 6},
			OfferAnswer{Tag = "kerze109_0010PC", String = "(Den Ort unverändert verlassen.)", AnswerId = 9},
		}}

	OnAnswer{1;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemSanduhr"},
			Negated(IsItemFlagTrue{Name = "PlayerHasItemBlutphiole"}),
			Negated(IsItemFlagTrue{Name = "PlayerHasItemKerze"}),
		},
		Actions = {
			Say{Tag = "kerze109_002", String = "(Einst wuchsen wohl Blumen um den Altar, doch sie sind fahl und grau geworden. Schatten kriechen wie Lebewesen an den Rändern des Altares entlang.)"},
			OfferAnswer{Tag = "kerze109_003PC", String = "(Die Sanduhr auf den Altar stellen.)", AnswerId = 2},
			OfferAnswer{Tag = "kerze109_0010PC", String = "(Den Ort unverändert verlassen.)", AnswerId = 9},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemSanduhr"}),
			IsItemFlagTrue{Name = "PlayerHasItemBlutphiole"},
			IsItemFlagTrue{Name = "PlayerHasItemKerze"},
		},
		Actions = {
			Say{Tag = "kerze109_002", String = "(Einst wuchsen wohl Blumen um den Altar, doch sie sind fahl und grau geworden. Schatten kriechen wie Lebewesen an den Rändern des Altares entlang.)"},
			OfferAnswer{Tag = "kerze109_005PC", String = "(Die Phiole auf den Altar stellen.)", AnswerId = 4},
			OfferAnswer{Tag = "kerze109_007PC", String = "(Die Kerze auf den Altar stellen.)", AnswerId = 6},
			OfferAnswer{Tag = "kerze109_0010PC", String = "(Den Ort unverändert verlassen.)", AnswerId = 9},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemSanduhr"}),
			IsItemFlagTrue{Name = "PlayerHasItemBlutphiole"},
			Negated(IsItemFlagTrue{Name = "PlayerHasItemKerze"}),
		},
		Actions = {
			Say{Tag = "kerze109_002", String = "(Einst wuchsen wohl Blumen um den Altar, doch sie sind fahl und grau geworden. Schatten kriechen wie Lebewesen an den Rändern des Altares entlang.)"},
			OfferAnswer{Tag = "kerze109_005PC", String = "(Die Phiole auf den Altar stellen.)", AnswerId = 4},
			OfferAnswer{Tag = "kerze109_0010PC", String = "(Den Ort unverändert verlassen.)", AnswerId = 9},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemSanduhr"}),
			Negated(IsItemFlagTrue{Name = "PlayerHasItemBlutphiole"}),
			IsItemFlagTrue{Name = "PlayerHasItemKerze"},
		},
		Actions = {
			Say{Tag = "kerze109_002", String = "(Einst wuchsen wohl Blumen um den Altar, doch sie sind fahl und grau geworden. Schatten kriechen wie Lebewesen an den Rändern des Altares entlang.)"},
			OfferAnswer{Tag = "kerze109_007PC", String = "(Die Kerze auf den Altar stellen.)", AnswerId = 6},
			OfferAnswer{Tag = "kerze109_0010PC", String = "(Den Ort unverändert verlassen.)", AnswerId = 9},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemSanduhr"}),
			Negated(IsItemFlagTrue{Name = "PlayerHasItemBlutphiole"}),
			Negated(IsItemFlagTrue{Name = "PlayerHasItemKerze"}),
		},
		Actions = {
			Say{Tag = "kerze109_002", String = "(Einst wuchsen wohl Blumen um den Altar, doch sie sind fahl und grau geworden. Schatten kriechen wie Lebewesen an den Rändern des Altares entlang.)"},
			OfferAnswer{Tag = "kerze109_0010PC", String = "(Den Ort unverändert verlassen.)", AnswerId = 9},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kerze109_004", String = "(Die Schatten ziehen sich um den Altar zusammen. Der Wind wird stärker. Eure Hand wird eisig kalt, so dass Ihr sie zurück ziehen müsst.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Kerze_nicht_geschafftP109"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kerze109_006", String = "(Die Schatten ziehen sich um den Altar zusammen. Der Wind wird stärker. Eure Hand wird eisig kalt, so dass Ihr sie zurück ziehen müsst.)"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Kerze_nicht_geschafftP109"},
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
			Say{Tag = "kerze109_008", String = "(Die Schatten ziehen sich um den Altar zusammen. Der Wind wird stärker. Zuerst scheint er das Feuer der Kerze zum Verlöschen zu bringen, doch dann flammt diese neu auf.)"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kerze109_009", String = "(Die Schatten fliehen in die Spalten des Altars, die Blumen erkräften und richten sich im Schein der Kerze mit farbfrohen Blüten auf. Der Wind verstummt, der Zorn dieses Ortes ist verraucht.)"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Richtiges_ItemKerzeP109"},
			       QuestSolve{QuestId = 655},
			       SetItemFlagFalse{Name = "PlayerHasItemKerze"},
			       SetRewardFlagTrue{Name = "WerwolfTempel3"},
			       RemoveDialog{NpcId = 7238},
 			       SetEffect{Effect = "CastAirSilent" , X = 281, Y = 189, Length = 0},
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