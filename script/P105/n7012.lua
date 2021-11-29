-->INFO: Knochenquest_Ashgork
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnToggleEvent
{
	OnConditions = 
	{
		IsGlobalFlagFalse {Name ="P105_AshgorkKannSprechen"},
	 },
	OnActions = 
	{
		 RemoveDialog { NpcId = self} ,
	},
	OffConditions = 
	{
		IsGlobalFlagTrue {Name ="P105_AshgorkKannSprechen"},
	},
	OffActions = 
	{
		EnableDialog { NpcId = self} ,
	},
}

Despawn
{
	Conditions =
	{
	IsGlobalFlagTrue{ Name = "P101_DunkelElfBossKilled"},
	},
}

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P105\n7012_Knochenquest_Ashgork.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse {Name = "P105_AshgorkKnown"},
		},
		Actions = {
			Say{Tag = "knochenquest_ashgork105_001", String = "Kein Streit, Mensch, ich bin nicht hier um zu kämpfen!"},
			Answer{Tag = "knochenquest_ashgork105_002PC", String = "So wie ich. Was treibt Euch hierher, Ork?", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse {Name = "P105_AshgorkKnown"}),
		},
		Actions = {
			Say{Tag = "knochenquest_ashgork105_016", String = "Was nun, Mensch?"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "knochenquest_ashgork105_003", String = "Ich suche Hilfe für Mirraw Thur! Im Austausch biete ich das Wissen der Knochenschmiede, das nie ein Lichtbeter vorher erlangt hat!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "P105_AshgorkKnown"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
			IsNpcCounter{Name = "AshgorkDialog", Value = 0, Operator = IsEqual} ,
			IsNpcCounter{Name = "AshgorkDialog", Value = 1, Operator = IsEqual} ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "knochenquest_ashgork105_004PC", String = "Mirraw Thur? Was habt ihr mit diesem Sumpfloch zu schaffen?", AnswerId = 5},
			OfferAnswer{Tag = "knochenquest_ashgork105_012PC", String = "Was für Waffen?", AnswerId = 13},
		}}

	OnAnswer{4;
		Conditions = {
			IsNpcCounter{Name = "AshgorkDialog", Value = 0, Operator = IsEqual} ,
			Negated(IsNpcCounter{Name = "AshgorkDialog", Value = 1, Operator = IsEqual} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "knochenquest_ashgork105_004PC", String = "Mirraw Thur? Was habt ihr mit diesem Sumpfloch zu schaffen?", AnswerId = 5},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsNpcCounter{Name = "AshgorkDialog", Value = 0, Operator = IsEqual} ),
			IsNpcCounter{Name = "AshgorkDialog", Value = 1, Operator = IsEqual} ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "knochenquest_ashgork105_012PC", String = "Was für Waffen?", AnswerId = 13},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsNpcCounter{Name = "AshgorkDialog", Value = 0, Operator = IsEqual} ),
			Negated(IsNpcCounter{Name = "AshgorkDialog", Value = 1, Operator = IsEqual} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "knochenquest_ashgork105_005", String = "Dieses Sumpfloch ist meine Heimat, Mensch! Nachdem die Truppen der Winterwacht es verwüstet haben, stehen nun die Horden des roten Imperiums in der Stadt!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "knochenquest_ashgork105_006", String = "Wir gewährten dem Dunklen Unterschlupf, einst waren die Fial Darg unsere Herren! Aber nun will mein Volk nur noch heimkehren!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "knochenquest_ashgork105_007", String = "Seid Ihr bereit die Imperialen aus Mirraw Thur zu vertreiben? Ich würde nie die Elfen bitten, Ihr aber steht zwischen Licht und Schatten."},
			Answer{Tag = "knochenquest_ashgork105_008PC", String = "Wenn ich Euch helfe, werden uns Eure Truppen beistehen?", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "knochenquest_ashgork105_009", String = "Ha! Nein! Aber ich werde Euch ein Geheimnis anvertrauen, das Euch zu machtvollen Waffen und Panzern verhelfen wird!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "knochenquest_ashgork105_010", String = "Wenn Ihr den Preis dafür zahlt!"},
			Answer{Tag = "knochenquest_ashgork105_011PC", String = "Also gut. Wir sehen uns in Mirraw Thur, Ork!", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			IncreaseNpcCounter{Name = "AshgorkDialog"},
			QuestSolve{QuestId = 734},
							  					QuestBegin{QuestId = 632},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "knochenquest_ashgork105_013", String = "Ihr glaubt an Eure Bücher und die hohen Schulen der Magie! Aber es gibt alte Kräfte in der Welt, die Ihr längst vergessen habt! Dunkle Kräfte!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "knochenquest_ashgork105_014", String = "Wie die Magie der Knochen. Denn die Knochen eines Wesens sind durchdrungen von seiner Kraft, die noch lange nach dem Tode weiterlebt. Und dort wartet, wieder entfacht zu werden!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "knochenquest_ashgork105_015", String = "Dies werde ich dich lehren Mensch. Aber später davon mehr."},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			RemoveDialog{NpcId = self},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
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