-->INFO: Bren
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X , Y = _Y ,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "Aussenhof"},
	},
	Actions =
	{
		SetGlobalTimeStamp {Name = "BrenBraunblatt"}
	}
}

OnIdleGoHome{WalkMode = Run, X = 132, Y = 102, Direction = 0}

--Dialogsteuerung
--Umschalter
OnToggleEvent
{
OnConditions = {
			IsNpcFlagTrue{Name = "HasMainquest"},
			},
OnActions = {
		SetDialogType{Type = MainQuest}
		},
OffConditions = {
			IsNpcFlagFalse{Name = "HasMainquest"},
			},
OffActions = {
		SetDialogType{Type = SideQuest}
		},
}
--initial
OnOneTimeEvent
{
Conditions = {},
Actions = {
		SetNpcFlagTrue{Name = "HasMainquest"},
		}
}

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p17\n2615_Bren.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagBrenKnown"},
		},
		Actions = {
			Say{Tag = "bren001", String = "Vielen Dank für Eure Hilfe, Fremdling! Dieses Pack war schon dabei, alles wegzuschleppen! Ich bin Bren, Geschichtenerzähler und nebenbei Vorarbeiter der Außenhöfe!"},
			Answer{Tag = "bren001PC", String = "Aonirs Licht, Bren! Haben Euch die Söldner viel gestohlen?", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrenKnown"}),
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "bren004", String = "Ah, unser Retter! Willkommen zurück!"},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrenKnown"}),
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "bren004", String = "Ah, unser Retter! Willkommen zurück!"},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrenKnown"}),
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "bren004", String = "Ah, unser Retter! Willkommen zurück!"},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrenKnown"}),
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "bren004", String = "Ah, unser Retter! Willkommen zurück!"},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrenKnown"}),
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "bren004", String = "Ah, unser Retter! Willkommen zurück!"},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrenKnown"}),
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "bren004", String = "Ah, unser Retter! Willkommen zurück!"},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrenKnown"}),
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "bren004", String = "Ah, unser Retter! Willkommen zurück!"},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrenKnown"}),
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "bren004", String = "Ah, unser Retter! Willkommen zurück!"},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrenKnown"}),
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "bren004", String = "Ah, unser Retter! Willkommen zurück!"},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrenKnown"}),
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "bren004", String = "Ah, unser Retter! Willkommen zurück!"},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrenKnown"}),
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "bren004", String = "Ah, unser Retter! Willkommen zurück!"},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrenKnown"}),
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "bren004", String = "Ah, unser Retter! Willkommen zurück!"},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrenKnown"}),
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "bren004", String = "Ah, unser Retter! Willkommen zurück!"},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrenKnown"}),
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "bren004", String = "Ah, unser Retter! Willkommen zurück!"},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrenKnown"}),
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "bren004", String = "Ah, unser Retter! Willkommen zurück!"},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrenKnown"}),
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "bren004", String = "Ah, unser Retter! Willkommen zurück!"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			SetRewardFlagTrue{ Name = "AufDemWall1Village1"},
			Say{Tag = "bren002", String = "Nun, unser Besitzt ist eher praktisch als wertvoll! Da ist nicht viel zu holen. Außer Wasser, Holz und etwas Korn und Fleisch haben wir nichts!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrenKnown"},
			Say{Tag = "bren003", String = "Von daher weiß ich auch gar nicht, wie ich Euch entlohnen soll!"},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{2;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrenKnown"},
			Say{Tag = "bren003", String = "Von daher weiß ich auch gar nicht, wie ich Euch entlohnen soll!"},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnAnswer{2;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrenKnown"},
			Say{Tag = "bren003", String = "Von daher weiß ich auch gar nicht, wie ich Euch entlohnen soll!"},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{2;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrenKnown"},
			Say{Tag = "bren003", String = "Von daher weiß ich auch gar nicht, wie ich Euch entlohnen soll!"},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
		}}

	OnAnswer{2;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrenKnown"},
			Say{Tag = "bren003", String = "Von daher weiß ich auch gar nicht, wie ich Euch entlohnen soll!"},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{2;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrenKnown"},
			Say{Tag = "bren003", String = "Von daher weiß ich auch gar nicht, wie ich Euch entlohnen soll!"},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnAnswer{2;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrenKnown"},
			Say{Tag = "bren003", String = "Von daher weiß ich auch gar nicht, wie ich Euch entlohnen soll!"},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{2;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrenKnown"},
			Say{Tag = "bren003", String = "Von daher weiß ich auch gar nicht, wie ich Euch entlohnen soll!"},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrenKnown"},
			Say{Tag = "bren003", String = "Von daher weiß ich auch gar nicht, wie ich Euch entlohnen soll!"},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrenKnown"},
			Say{Tag = "bren003", String = "Von daher weiß ich auch gar nicht, wie ich Euch entlohnen soll!"},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrenKnown"},
			Say{Tag = "bren003", String = "Von daher weiß ich auch gar nicht, wie ich Euch entlohnen soll!"},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrenKnown"},
			Say{Tag = "bren003", String = "Von daher weiß ich auch gar nicht, wie ich Euch entlohnen soll!"},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrenKnown"},
			Say{Tag = "bren003", String = "Von daher weiß ich auch gar nicht, wie ich Euch entlohnen soll!"},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrenKnown"},
			Say{Tag = "bren003", String = "Von daher weiß ich auch gar nicht, wie ich Euch entlohnen soll!"},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrenKnown"},
			Say{Tag = "bren003", String = "Von daher weiß ich auch gar nicht, wie ich Euch entlohnen soll!"},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrenKnown"},
			Say{Tag = "bren003", String = "Von daher weiß ich auch gar nicht, wie ich Euch entlohnen soll!"},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bren005", String = "Davon besitzen wir zumindest mehr als Gold und Edelsteine!"},
			Answer{Tag = "bren005PC", String = "Nun, das wäre eine nicht minder wertvolle Entlohnung für mich!", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bren006", String = "Aye, so soll es sein! Ich sage den anderen Bescheid! Sie werden es in Euer Lager bringen!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			TransferResource{Resource = GoodBoard , Side = SideLight, Amount = 450, Flag = Give} ,
					TransferResource{Resource = GoodFood , Side = SideLight, Amount = 350, Flag = Give} , 
					SetPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}, SetGlobalFlagFalse{Name = "Q248AHNewRessourcesReady"},
					SetGlobalTimeStamp{Name = "Q248ResourcesAHTimer"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{6;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnAnswer{6;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{6;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{6;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnAnswer{6;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{6;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q248AHNewRessourcesReady"}),
		},
		Actions = {
			Say{Tag = "bren008", String = "Ich muss erst einmal nachsehen, wie viel diese Söldner sich genommen haben! Kommt später noch einmal wieder!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{7;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q248AHNewRessourcesReady"},
		},
		Actions = {
			Say{Tag = "bren007", String = "Ich denke schon! Ihr könnt noch einmal die gleiche Menge erhalten!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			TransferResource{Resource = GoodBoard , Side = SideLight, Amount = 450, Flag = Give} ,
					TransferResource{Resource = GoodFood , Side = SideLight, Amount = 350, Flag = Give} , 
					SetPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}, SetGlobalFlagFalse{Name = "Q248AHNewRessourcesReady"},
					SetGlobalTimeStamp{Name = "Q248ResourcesAHTimer"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{9;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnAnswer{9;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{9;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
		}}

	OnAnswer{9;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{9;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnAnswer{9;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{9;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{10;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{10;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{10;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
		}}

	OnAnswer{10;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{10;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{10;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bren009", String = "Ja, so ist es! Ihr müsst wissen, das sind alles einfache Leute hier. Sie besitzen nicht viel. Und es dringt wenig an ihr Ohr, was in der Welt so passiert! Deshalb lauschen sie gerne meinen Erzählungen!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bren010", String = "Wenn Ihr also etwas wissen wollt, dann fragt danach! Vielleicht kenne ich eine Geschichte darüber!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "StoryTellerAsked"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnAnswer{14;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
		}}

	OnAnswer{14;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnAnswer{14;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{15;
		Conditions = {
			IsPlayerFlagTrue{Name = "UramToyInfoGiven"},
			QuestState{QuestId = 249 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "bren011", String = "Gern, was wollt Ihr wissen?"},
			OfferAnswer{Tag = "bren011PC", String = "Warum heißt dieses Land Gottwall?", AnswerId = 16},
			OfferAnswer{Tag = "bren017PC", String = "Was wisst Ihr über Mulandir?", AnswerId = 23},
			OfferAnswer{Tag = "bren020PC", String = "Wer ist Uram?", AnswerId = 27},
			OfferAnswer{Tag = "bren025PC", String = "Wer ist Mechlan?", AnswerId = 32},
		}}

	OnAnswer{15;
		Conditions = {
			IsPlayerFlagTrue{Name = "UramToyInfoGiven"},
			Negated(QuestState{QuestId = 249 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "bren011", String = "Gern, was wollt Ihr wissen?"},
			OfferAnswer{Tag = "bren011PC", String = "Warum heißt dieses Land Gottwall?", AnswerId = 16},
			OfferAnswer{Tag = "bren017PC", String = "Was wisst Ihr über Mulandir?", AnswerId = 23},
			OfferAnswer{Tag = "bren020PC", String = "Wer ist Uram?", AnswerId = 27},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "UramToyInfoGiven"}),
			QuestState{QuestId = 249 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "bren011", String = "Gern, was wollt Ihr wissen?"},
			OfferAnswer{Tag = "bren011PC", String = "Warum heißt dieses Land Gottwall?", AnswerId = 16},
			OfferAnswer{Tag = "bren017PC", String = "Was wisst Ihr über Mulandir?", AnswerId = 23},
			OfferAnswer{Tag = "bren025PC", String = "Wer ist Mechlan?", AnswerId = 32},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "UramToyInfoGiven"}),
			Negated(QuestState{QuestId = 249 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "bren011", String = "Gern, was wollt Ihr wissen?"},
			OfferAnswer{Tag = "bren011PC", String = "Warum heißt dieses Land Gottwall?", AnswerId = 16},
			OfferAnswer{Tag = "bren017PC", String = "Was wisst Ihr über Mulandir?", AnswerId = 23},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bren012", String = "Nun, einst kämpften hier die Wächtergötter gegen die Fial Darg, die Prinzen der Finsternis, im Krieg der sechs Völker!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bren013", String = "Als die große Armee der Dunklen vom Süden her aufmarschiert kam, zerrissen die Wächter das Land. Sie hoben den Wall empor - eine schier unüberwindbare Mauer aus Fels!"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bren014", String = "Doch die Fial Darg trieben ihre Horden unermüdlich gegen den Fels, während die Wächter und die Armeen des Lichts den Tod auf sie regnen ließen!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bren015", String = "Schließlich gelang es den Dunklen, den Wall zu erstürmen. Es kam zum Kampf zwischen Wächtern und Fial Darg!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bren016", String = "Die Fial Darg wurden besiegt, doch der Wall der Götter blieb bestehen. Die Winde der Zeit haben ihn abgetragen, haben Stufen und Spalten in sein Antlitz gemeißelt..."},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bren017", String = "Im Konvokationskrieg war dies dann die Grenze zwischen den Landen Hokans und Urams. Beide lagen in erbitterter Feindschaft. Heute ist es eine der wenigen Stellen in dieser Gegend, an denen noch zumindest etwas Ackerbau möglich ist!"},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{22;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnAnswer{22;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{22;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
		}}

	OnAnswer{22;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{22;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnAnswer{22;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{22;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bren018", String = "Mulandir war einst die prachtvollste Stadt, die dieses Land jemals gesehen hat! Sie war die Stadt der Magier und Sitz des Zirkels. Sie wurde über der Schlucht gebaut, die entstanden war, nachdem die Götter den Berg Barga Gor zerschmettert haben!"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bren019", String = "Die mächtigsten Magier lebten dort und wachten über den Schlund der Dämonen. Als der Zirkel herrschte, war sie die größte Stadt des Nordens und von unglaublichem Prunk. Aber der Krieg hat alles zerstört!"},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bren020", String = "Was davon nicht in den Fluten der Elemente versank, ist eine schwarze Wüstenei aus Feuer und Asche. Zwischen den Ruinen lauern nun die herrenlosen Dämonen Urams!"},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{26;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnAnswer{26;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{26;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
		}}

	OnAnswer{26;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{26;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnAnswer{26;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{26;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bren021", String = "Uram der Rote war ein Mitglied des Zirkels! So wie Hokan Ashir der mächtigste Nekromant des Zirkels war, war Uram der Meister der Dämonenbeschwörung!"},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bren022", String = "Ich habe einst, wie die meisten anderen hier auch, unter seinem Banner gekämpft! Glaubt mir, ich bin nicht fähig zu beschreiben, welch grässliche Monster er damals aus dem Schoß der Erde heraufbeschwor!"},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bren023", String = "Viele von uns verfielen allein von ihrem Anblick in Wahnsinn und Raserei! Und über allem thronte Urams mächtigster Diener, Ulather! Einer der großen Dämonen des Abgrunds!"},
			Answer{Tag = "bren023PC", String = "Ein Dämon unter der Gewalt eines Menschen?", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bren024", String = "Ja, Uram war der einzige, der dies vollbracht hat! Doch jetzt ist sein einstiger Diener frei! Wehe uns, wenn er je durch den Spalt zu uns vordringen sollte!"},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "bren025", String = "Ulathers Horden sind es auch, die nun als Plage dieses Land heimsuchen! Wenn uns also nicht die Wölfe fressen, irgendwann wird es die rote Horde tun..."},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{31;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "bren025", String = "Ulathers Horden sind es auch, die nun als Plage dieses Land heimsuchen! Wenn uns also nicht die Wölfe fressen, irgendwann wird es die rote Horde tun..."},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnAnswer{31;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "bren025", String = "Ulathers Horden sind es auch, die nun als Plage dieses Land heimsuchen! Wenn uns also nicht die Wölfe fressen, irgendwann wird es die rote Horde tun..."},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{31;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "bren025", String = "Ulathers Horden sind es auch, die nun als Plage dieses Land heimsuchen! Wenn uns also nicht die Wölfe fressen, irgendwann wird es die rote Horde tun..."},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
		}}

	OnAnswer{31;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "bren025", String = "Ulathers Horden sind es auch, die nun als Plage dieses Land heimsuchen! Wenn uns also nicht die Wölfe fressen, irgendwann wird es die rote Horde tun..."},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{31;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "bren025", String = "Ulathers Horden sind es auch, die nun als Plage dieses Land heimsuchen! Wenn uns also nicht die Wölfe fressen, irgendwann wird es die rote Horde tun..."},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnAnswer{31;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "bren025", String = "Ulathers Horden sind es auch, die nun als Plage dieses Land heimsuchen! Wenn uns also nicht die Wölfe fressen, irgendwann wird es die rote Horde tun..."},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{31;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "bren025", String = "Ulathers Horden sind es auch, die nun als Plage dieses Land heimsuchen! Wenn uns also nicht die Wölfe fressen, irgendwann wird es die rote Horde tun..."},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "bren025", String = "Ulathers Horden sind es auch, die nun als Plage dieses Land heimsuchen! Wenn uns also nicht die Wölfe fressen, irgendwann wird es die rote Horde tun..."},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "bren025", String = "Ulathers Horden sind es auch, die nun als Plage dieses Land heimsuchen! Wenn uns also nicht die Wölfe fressen, irgendwann wird es die rote Horde tun..."},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "bren025", String = "Ulathers Horden sind es auch, die nun als Plage dieses Land heimsuchen! Wenn uns also nicht die Wölfe fressen, irgendwann wird es die rote Horde tun..."},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "bren025", String = "Ulathers Horden sind es auch, die nun als Plage dieses Land heimsuchen! Wenn uns also nicht die Wölfe fressen, irgendwann wird es die rote Horde tun..."},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "bren025", String = "Ulathers Horden sind es auch, die nun als Plage dieses Land heimsuchen! Wenn uns also nicht die Wölfe fressen, irgendwann wird es die rote Horde tun..."},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "bren025", String = "Ulathers Horden sind es auch, die nun als Plage dieses Land heimsuchen! Wenn uns also nicht die Wölfe fressen, irgendwann wird es die rote Horde tun..."},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "bren025", String = "Ulathers Horden sind es auch, die nun als Plage dieses Land heimsuchen! Wenn uns also nicht die Wölfe fressen, irgendwann wird es die rote Horde tun..."},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "bren025", String = "Ulathers Horden sind es auch, die nun als Plage dieses Land heimsuchen! Wenn uns also nicht die Wölfe fressen, irgendwann wird es die rote Horde tun..."},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bren026", String = "Mechlan ist ein Illusionist, ein einstiger Diener des Zirkels!"},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bren027", String = "Soweit ich weiß, sucht er nach dem Glaskunstwerk der Former, das einst im Archiv des Zirkels lagerte. Es ist ein Abbild von solcher Perfektion, das jeder, der es betrachtet, in Glückseligkeit ertrinkt!"},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bren028", String = "Man sagt, er habe einmal einen Blick darauf erhaschen können! Seitdem ist er besessen davon, es in seine Finger zu bekommen!"},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{35;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "bren029", String = "Das Kunstwerk wurde während des Kriegs zerbrochen! Nun sucht Mechlan nach den Bruchstücken. Er würde sogar töten, um eins davon zu bekommen!"},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{35;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "bren029", String = "Das Kunstwerk wurde während des Kriegs zerbrochen! Nun sucht Mechlan nach den Bruchstücken. Er würde sogar töten, um eins davon zu bekommen!"},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnAnswer{35;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "bren029", String = "Das Kunstwerk wurde während des Kriegs zerbrochen! Nun sucht Mechlan nach den Bruchstücken. Er würde sogar töten, um eins davon zu bekommen!"},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{35;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "bren029", String = "Das Kunstwerk wurde während des Kriegs zerbrochen! Nun sucht Mechlan nach den Bruchstücken. Er würde sogar töten, um eins davon zu bekommen!"},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
		}}

	OnAnswer{35;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "bren029", String = "Das Kunstwerk wurde während des Kriegs zerbrochen! Nun sucht Mechlan nach den Bruchstücken. Er würde sogar töten, um eins davon zu bekommen!"},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{35;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "bren029", String = "Das Kunstwerk wurde während des Kriegs zerbrochen! Nun sucht Mechlan nach den Bruchstücken. Er würde sogar töten, um eins davon zu bekommen!"},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnAnswer{35;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "bren029", String = "Das Kunstwerk wurde während des Kriegs zerbrochen! Nun sucht Mechlan nach den Bruchstücken. Er würde sogar töten, um eins davon zu bekommen!"},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{35;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "bren029", String = "Das Kunstwerk wurde während des Kriegs zerbrochen! Nun sucht Mechlan nach den Bruchstücken. Er würde sogar töten, um eins davon zu bekommen!"},
			OfferAnswer{Tag = "bren004PC", String = "Holz und Nahrung sagt Ihr?", AnswerId = 3},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "bren029", String = "Das Kunstwerk wurde während des Kriegs zerbrochen! Nun sucht Mechlan nach den Bruchstücken. Er würde sogar töten, um eins davon zu bekommen!"},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "bren029", String = "Das Kunstwerk wurde während des Kriegs zerbrochen! Nun sucht Mechlan nach den Bruchstücken. Er würde sogar töten, um eins davon zu bekommen!"},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "bren029", String = "Das Kunstwerk wurde während des Kriegs zerbrochen! Nun sucht Mechlan nach den Bruchstücken. Er würde sogar töten, um eins davon zu bekommen!"},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "bren029", String = "Das Kunstwerk wurde während des Kriegs zerbrochen! Nun sucht Mechlan nach den Bruchstücken. Er würde sogar töten, um eins davon zu bekommen!"},
			OfferAnswer{Tag = "bren006PC", String = "Könnt Ihr noch Güter entbehren?", AnswerId = 7},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "bren029", String = "Das Kunstwerk wurde während des Kriegs zerbrochen! Nun sucht Mechlan nach den Bruchstücken. Er würde sogar töten, um eins davon zu bekommen!"},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			IsNpcFlagFalse{Name = "StoryTellerAsked"},
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "bren029", String = "Das Kunstwerk wurde während des Kriegs zerbrochen! Nun sucht Mechlan nach den Bruchstücken. Er würde sogar töten, um eins davon zu bekommen!"},
			OfferAnswer{Tag = "bren008PC", String = "Ihr seid ein Geschichtenerzähler?", AnswerId = 11},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			IsNpcFlagTrue{Name = "StoryTellerAsked"},
		},
		Actions = {
			Say{Tag = "bren029", String = "Das Kunstwerk wurde während des Kriegs zerbrochen! Nun sucht Mechlan nach den Bruchstücken. Er würde sogar töten, um eins davon zu bekommen!"},
			OfferAnswer{Tag = "bren010PC", String = "Erzählt mir etwas, Bren!", AnswerId = 15},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"}),
			Negated(IsNpcFlagFalse{Name = "StoryTellerAsked"}),
			Negated(IsNpcFlagTrue{Name = "StoryTellerAsked"}),
		},
		Actions = {
			Say{Tag = "bren029", String = "Das Kunstwerk wurde während des Kriegs zerbrochen! Nun sucht Mechlan nach den Bruchstücken. Er würde sogar töten, um eins davon zu bekommen!"},
		}}


	EndDefinition()
end