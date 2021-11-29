-->INFO: Nebenquest_Sanduhr
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "Richtiges_ItemSanduhrP109"},		
	},
	Actions = 
	{
		--Outcry { NpcId = 7236, String = "Die Quest mit der Sanduhr wurde erfolgreich abgeschlossen" , Tag = "" , Color = ColorWhite}, --Dummy nur für Testzwecke!
		--SetEffect { Effect = , X = , Y = , Length = 5000 , NpcId = self},

	}
}





--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P109\n7236_Nebenquest_Sanduhr.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "sanduhr109_001", String = "(Ein seltsames Gefühl überkommt Euch an diesem Ort. Wind rauscht, die Schatten wandern schnell, obwohl sich die Sonne nicht bewegt.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemSanduhr"},
			IsItemFlagTrue{Name = "PlayerHasItemBlutphiole"},
			IsItemFlagTrue{Name = "PlayerHasItemKerze"},
		},
		Actions = {
			Say{Tag = "sanduhr109_002", String = "(Herbstblätter und Sommerblüten wehen im unwirklichen Rauschen des Windes. Euer Herz schlägt schneller, überall ist ein Raunen wie von tausend Flüsterstimmen.)"},
			OfferAnswer{Tag = "sanduhr109_003PC", String = "(Die Sanduhr auf den Altar stellen.)", AnswerId = 2},
			OfferAnswer{Tag = "sanduhr109_006PC", String = "(Die Phiole auf den Altar stellen.)", AnswerId = 5},
			OfferAnswer{Tag = "sanduhr109_008PC", String = "(Die Kerze auf den Altar stellen.)", AnswerId = 7},
			OfferAnswer{Tag = "sanduhr109_010PC", String = "(Den Ort unverändert verlassen.)", AnswerId = 9},
		}}

	OnAnswer{1;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemSanduhr"},
			IsItemFlagTrue{Name = "PlayerHasItemBlutphiole"},
			Negated(IsItemFlagTrue{Name = "PlayerHasItemKerze"}),
		},
		Actions = {
			Say{Tag = "sanduhr109_002", String = "(Herbstblätter und Sommerblüten wehen im unwirklichen Rauschen des Windes. Euer Herz schlägt schneller, überall ist ein Raunen wie von tausend Flüsterstimmen.)"},
			OfferAnswer{Tag = "sanduhr109_003PC", String = "(Die Sanduhr auf den Altar stellen.)", AnswerId = 2},
			OfferAnswer{Tag = "sanduhr109_006PC", String = "(Die Phiole auf den Altar stellen.)", AnswerId = 5},
			OfferAnswer{Tag = "sanduhr109_010PC", String = "(Den Ort unverändert verlassen.)", AnswerId = 9},
		}}

	OnAnswer{1;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemSanduhr"},
			Negated(IsItemFlagTrue{Name = "PlayerHasItemBlutphiole"}),
			IsItemFlagTrue{Name = "PlayerHasItemKerze"},
		},
		Actions = {
			Say{Tag = "sanduhr109_002", String = "(Herbstblätter und Sommerblüten wehen im unwirklichen Rauschen des Windes. Euer Herz schlägt schneller, überall ist ein Raunen wie von tausend Flüsterstimmen.)"},
			OfferAnswer{Tag = "sanduhr109_003PC", String = "(Die Sanduhr auf den Altar stellen.)", AnswerId = 2},
			OfferAnswer{Tag = "sanduhr109_008PC", String = "(Die Kerze auf den Altar stellen.)", AnswerId = 7},
			OfferAnswer{Tag = "sanduhr109_010PC", String = "(Den Ort unverändert verlassen.)", AnswerId = 9},
		}}

	OnAnswer{1;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemSanduhr"},
			Negated(IsItemFlagTrue{Name = "PlayerHasItemBlutphiole"}),
			Negated(IsItemFlagTrue{Name = "PlayerHasItemKerze"}),
		},
		Actions = {
			Say{Tag = "sanduhr109_002", String = "(Herbstblätter und Sommerblüten wehen im unwirklichen Rauschen des Windes. Euer Herz schlägt schneller, überall ist ein Raunen wie von tausend Flüsterstimmen.)"},
			OfferAnswer{Tag = "sanduhr109_003PC", String = "(Die Sanduhr auf den Altar stellen.)", AnswerId = 2},
			OfferAnswer{Tag = "sanduhr109_010PC", String = "(Den Ort unverändert verlassen.)", AnswerId = 9},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemSanduhr"}),
			IsItemFlagTrue{Name = "PlayerHasItemBlutphiole"},
			IsItemFlagTrue{Name = "PlayerHasItemKerze"},
		},
		Actions = {
			Say{Tag = "sanduhr109_002", String = "(Herbstblätter und Sommerblüten wehen im unwirklichen Rauschen des Windes. Euer Herz schlägt schneller, überall ist ein Raunen wie von tausend Flüsterstimmen.)"},
			OfferAnswer{Tag = "sanduhr109_006PC", String = "(Die Phiole auf den Altar stellen.)", AnswerId = 5},
			OfferAnswer{Tag = "sanduhr109_008PC", String = "(Die Kerze auf den Altar stellen.)", AnswerId = 7},
			OfferAnswer{Tag = "sanduhr109_010PC", String = "(Den Ort unverändert verlassen.)", AnswerId = 9},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemSanduhr"}),
			IsItemFlagTrue{Name = "PlayerHasItemBlutphiole"},
			Negated(IsItemFlagTrue{Name = "PlayerHasItemKerze"}),
		},
		Actions = {
			Say{Tag = "sanduhr109_002", String = "(Herbstblätter und Sommerblüten wehen im unwirklichen Rauschen des Windes. Euer Herz schlägt schneller, überall ist ein Raunen wie von tausend Flüsterstimmen.)"},
			OfferAnswer{Tag = "sanduhr109_006PC", String = "(Die Phiole auf den Altar stellen.)", AnswerId = 5},
			OfferAnswer{Tag = "sanduhr109_010PC", String = "(Den Ort unverändert verlassen.)", AnswerId = 9},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemSanduhr"}),
			Negated(IsItemFlagTrue{Name = "PlayerHasItemBlutphiole"}),
			IsItemFlagTrue{Name = "PlayerHasItemKerze"},
		},
		Actions = {
			Say{Tag = "sanduhr109_002", String = "(Herbstblätter und Sommerblüten wehen im unwirklichen Rauschen des Windes. Euer Herz schlägt schneller, überall ist ein Raunen wie von tausend Flüsterstimmen.)"},
			OfferAnswer{Tag = "sanduhr109_008PC", String = "(Die Kerze auf den Altar stellen.)", AnswerId = 7},
			OfferAnswer{Tag = "sanduhr109_010PC", String = "(Den Ort unverändert verlassen.)", AnswerId = 9},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemSanduhr"}),
			Negated(IsItemFlagTrue{Name = "PlayerHasItemBlutphiole"}),
			Negated(IsItemFlagTrue{Name = "PlayerHasItemKerze"}),
		},
		Actions = {
			Say{Tag = "sanduhr109_002", String = "(Herbstblätter und Sommerblüten wehen im unwirklichen Rauschen des Windes. Euer Herz schlägt schneller, überall ist ein Raunen wie von tausend Flüsterstimmen.)"},
			OfferAnswer{Tag = "sanduhr109_010PC", String = "(Den Ort unverändert verlassen.)", AnswerId = 9},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sanduhr109_004", String = "(Das seltsame Rauschen und Raunen verstummt, die Schatten ziehen langsamer. Der Ort wirkt nicht mehr bedrohlich.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sanduhr109_005", String = "(Sand beginnt von unten nach oben durch die Sanduhr zu laufen. Der Zorn dieses Ortes ist verflogen.)"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Richtiges_ItemSanduhrP109"},
			       QuestSolve{QuestId = 653},
			       SetItemFlagFalse{Name = "PlayerHasItemSanduhr"},
			       SetRewardFlagTrue{Name = "WerwolfTempel1"},
			       RemoveDialog{NpcId = 7236},
			       SetEffect{Effect = "CastAirSilent" , X = 125, Y = 186, Length = 0},
			EndDialog(),
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sanduhr109_007", String = "(Das Rauschen nimmt zu, die Schattenflecken ziehen schneller. Alles beginnt zu zittern.)"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Sanduhrnicht_geschafftP109"},
			EndDialog(),
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sanduhr109_009", String = "(Das Rauschen nimmt zu, die Schattenflecken ziehen schneller. Alles beginnt zu zittern.)"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Sanduhrnicht_geschafftP109"},
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