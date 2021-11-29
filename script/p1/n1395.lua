-->INFO: Bart
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnIdleGoHome{X = _X, Y = _Y, Direction = 5}

-- ? setzen:
OnOneTimeEvent
{
	Actions = {
		SetDialogType{Type = SideQuest},
	},
}




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p1\n1395_Bart.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagBartKnown"},
		},
		Actions = {
			Say{Tag = "bart001", String = "Ah, ein neues Gesicht! Willkommen in Liannon, dem verdammt besten Fleckchen nördlich der Windwallberge, wenn Ihr mich fragt!"},
			Answer{Tag = "bart001PC", String = "Ihr seid hier der Stadtvorsteher?", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBartKnown"}),
			IsNpcFlagFalse{Name = "DariusAsked"},
			IsNpcFlagFalse{Name = "OrtahAsked"},
			IsNpcFlagFalse{Name = "ShanAsked"},
		},
		Actions = {
			Say{Tag = "bart003", String = "Ah, Ihr seid´s! Aonirs Licht!"},
			OfferAnswer{Tag = "bart003PC", String = "Kennt Ihr Darius?", AnswerId = 2},
			OfferAnswer{Tag = "bart007PC", String = "Es gibt draußen vor der Stadt diesen Händler... Ortah?", AnswerId = 8},
			OfferAnswer{Tag = "bart009PC", String = "Gibt es einen Heiler hier?", AnswerId = 12},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBartKnown"}),
			IsNpcFlagFalse{Name = "DariusAsked"},
			IsNpcFlagFalse{Name = "OrtahAsked"},
			Negated(IsNpcFlagFalse{Name = "ShanAsked"}),
		},
		Actions = {
			Say{Tag = "bart003", String = "Ah, Ihr seid´s! Aonirs Licht!"},
			OfferAnswer{Tag = "bart003PC", String = "Kennt Ihr Darius?", AnswerId = 2},
			OfferAnswer{Tag = "bart007PC", String = "Es gibt draußen vor der Stadt diesen Händler... Ortah?", AnswerId = 8},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBartKnown"}),
			IsNpcFlagFalse{Name = "DariusAsked"},
			Negated(IsNpcFlagFalse{Name = "OrtahAsked"}),
			IsNpcFlagFalse{Name = "ShanAsked"},
		},
		Actions = {
			Say{Tag = "bart003", String = "Ah, Ihr seid´s! Aonirs Licht!"},
			OfferAnswer{Tag = "bart003PC", String = "Kennt Ihr Darius?", AnswerId = 2},
			OfferAnswer{Tag = "bart009PC", String = "Gibt es einen Heiler hier?", AnswerId = 12},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBartKnown"}),
			IsNpcFlagFalse{Name = "DariusAsked"},
			Negated(IsNpcFlagFalse{Name = "OrtahAsked"}),
			Negated(IsNpcFlagFalse{Name = "ShanAsked"}),
		},
		Actions = {
			Say{Tag = "bart003", String = "Ah, Ihr seid´s! Aonirs Licht!"},
			OfferAnswer{Tag = "bart003PC", String = "Kennt Ihr Darius?", AnswerId = 2},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBartKnown"}),
			Negated(IsNpcFlagFalse{Name = "DariusAsked"}),
			IsNpcFlagFalse{Name = "OrtahAsked"},
			IsNpcFlagFalse{Name = "ShanAsked"},
		},
		Actions = {
			Say{Tag = "bart003", String = "Ah, Ihr seid´s! Aonirs Licht!"},
			OfferAnswer{Tag = "bart007PC", String = "Es gibt draußen vor der Stadt diesen Händler... Ortah?", AnswerId = 8},
			OfferAnswer{Tag = "bart009PC", String = "Gibt es einen Heiler hier?", AnswerId = 12},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBartKnown"}),
			Negated(IsNpcFlagFalse{Name = "DariusAsked"}),
			IsNpcFlagFalse{Name = "OrtahAsked"},
			Negated(IsNpcFlagFalse{Name = "ShanAsked"}),
		},
		Actions = {
			Say{Tag = "bart003", String = "Ah, Ihr seid´s! Aonirs Licht!"},
			OfferAnswer{Tag = "bart007PC", String = "Es gibt draußen vor der Stadt diesen Händler... Ortah?", AnswerId = 8},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBartKnown"}),
			Negated(IsNpcFlagFalse{Name = "DariusAsked"}),
			Negated(IsNpcFlagFalse{Name = "OrtahAsked"}),
			IsNpcFlagFalse{Name = "ShanAsked"},
		},
		Actions = {
			Say{Tag = "bart003", String = "Ah, Ihr seid´s! Aonirs Licht!"},
			OfferAnswer{Tag = "bart009PC", String = "Gibt es einen Heiler hier?", AnswerId = 12},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBartKnown"}),
			Negated(IsNpcFlagFalse{Name = "DariusAsked"}),
			Negated(IsNpcFlagFalse{Name = "OrtahAsked"}),
			Negated(IsNpcFlagFalse{Name = "ShanAsked"}),
		},
		Actions = {
			Say{Tag = "bart003", String = "Ah, Ihr seid´s! Aonirs Licht!"},
		}}

	OnAnswer{1;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusAsked"},
			IsNpcFlagFalse{Name = "OrtahAsked"},
			IsNpcFlagFalse{Name = "ShanAsked"},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBartKnown"},
			Say{Tag = "bart002", String = "Was, ich? Oh nein, behüte! Ich bin nur der Schankwirt hier! Bart Boggelsen mein Name! Biete übrigens hin und wieder auch ein paar Waren feil! Wenn Ihr etwas braucht, sprecht einfach mit Will, meinem Sohn!"},
			OfferAnswer{Tag = "bart003PC", String = "Kennt Ihr Darius?", AnswerId = 2},
			OfferAnswer{Tag = "bart007PC", String = "Es gibt draußen vor der Stadt diesen Händler... Ortah?", AnswerId = 8},
			OfferAnswer{Tag = "bart009PC", String = "Gibt es einen Heiler hier?", AnswerId = 12},
		}}

	OnAnswer{1;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusAsked"},
			IsNpcFlagFalse{Name = "OrtahAsked"},
			Negated(IsNpcFlagFalse{Name = "ShanAsked"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBartKnown"},
			Say{Tag = "bart002", String = "Was, ich? Oh nein, behüte! Ich bin nur der Schankwirt hier! Bart Boggelsen mein Name! Biete übrigens hin und wieder auch ein paar Waren feil! Wenn Ihr etwas braucht, sprecht einfach mit Will, meinem Sohn!"},
			OfferAnswer{Tag = "bart003PC", String = "Kennt Ihr Darius?", AnswerId = 2},
			OfferAnswer{Tag = "bart007PC", String = "Es gibt draußen vor der Stadt diesen Händler... Ortah?", AnswerId = 8},
		}}

	OnAnswer{1;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusAsked"},
			Negated(IsNpcFlagFalse{Name = "OrtahAsked"}),
			IsNpcFlagFalse{Name = "ShanAsked"},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBartKnown"},
			Say{Tag = "bart002", String = "Was, ich? Oh nein, behüte! Ich bin nur der Schankwirt hier! Bart Boggelsen mein Name! Biete übrigens hin und wieder auch ein paar Waren feil! Wenn Ihr etwas braucht, sprecht einfach mit Will, meinem Sohn!"},
			OfferAnswer{Tag = "bart003PC", String = "Kennt Ihr Darius?", AnswerId = 2},
			OfferAnswer{Tag = "bart009PC", String = "Gibt es einen Heiler hier?", AnswerId = 12},
		}}

	OnAnswer{1;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusAsked"},
			Negated(IsNpcFlagFalse{Name = "OrtahAsked"}),
			Negated(IsNpcFlagFalse{Name = "ShanAsked"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBartKnown"},
			Say{Tag = "bart002", String = "Was, ich? Oh nein, behüte! Ich bin nur der Schankwirt hier! Bart Boggelsen mein Name! Biete übrigens hin und wieder auch ein paar Waren feil! Wenn Ihr etwas braucht, sprecht einfach mit Will, meinem Sohn!"},
			OfferAnswer{Tag = "bart003PC", String = "Kennt Ihr Darius?", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusAsked"}),
			IsNpcFlagFalse{Name = "OrtahAsked"},
			IsNpcFlagFalse{Name = "ShanAsked"},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBartKnown"},
			Say{Tag = "bart002", String = "Was, ich? Oh nein, behüte! Ich bin nur der Schankwirt hier! Bart Boggelsen mein Name! Biete übrigens hin und wieder auch ein paar Waren feil! Wenn Ihr etwas braucht, sprecht einfach mit Will, meinem Sohn!"},
			OfferAnswer{Tag = "bart007PC", String = "Es gibt draußen vor der Stadt diesen Händler... Ortah?", AnswerId = 8},
			OfferAnswer{Tag = "bart009PC", String = "Gibt es einen Heiler hier?", AnswerId = 12},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusAsked"}),
			IsNpcFlagFalse{Name = "OrtahAsked"},
			Negated(IsNpcFlagFalse{Name = "ShanAsked"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBartKnown"},
			Say{Tag = "bart002", String = "Was, ich? Oh nein, behüte! Ich bin nur der Schankwirt hier! Bart Boggelsen mein Name! Biete übrigens hin und wieder auch ein paar Waren feil! Wenn Ihr etwas braucht, sprecht einfach mit Will, meinem Sohn!"},
			OfferAnswer{Tag = "bart007PC", String = "Es gibt draußen vor der Stadt diesen Händler... Ortah?", AnswerId = 8},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusAsked"}),
			Negated(IsNpcFlagFalse{Name = "OrtahAsked"}),
			IsNpcFlagFalse{Name = "ShanAsked"},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBartKnown"},
			Say{Tag = "bart002", String = "Was, ich? Oh nein, behüte! Ich bin nur der Schankwirt hier! Bart Boggelsen mein Name! Biete übrigens hin und wieder auch ein paar Waren feil! Wenn Ihr etwas braucht, sprecht einfach mit Will, meinem Sohn!"},
			OfferAnswer{Tag = "bart009PC", String = "Gibt es einen Heiler hier?", AnswerId = 12},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusAsked"}),
			Negated(IsNpcFlagFalse{Name = "OrtahAsked"}),
			Negated(IsNpcFlagFalse{Name = "ShanAsked"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBartKnown"},
			Say{Tag = "bart002", String = "Was, ich? Oh nein, behüte! Ich bin nur der Schankwirt hier! Bart Boggelsen mein Name! Biete übrigens hin und wieder auch ein paar Waren feil! Wenn Ihr etwas braucht, sprecht einfach mit Will, meinem Sohn!"},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bart004", String = "Natürlich! Merkwürdiger Zeitgenosse, wenn Ihr micht fragt! Vergräbt sich Tag und Nacht in seinen törichten Büchern, als ob es nichts Wichtigeres im Leben gäbe, was? He, he, he..."},
			Answer{Tag = "bart004PC", String = "Er scheint in dieser Gegend recht bekannt zu sein?", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bart005", String = "Fürwahr, fürwahr! Hat einen Haufen Bekannte und Freunde überall in Nortander! Kennt sogar Rohen, den Zirkelmagier, wisst Ihr?"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bart006", String = "Man erzählt sich, er schreibt ein Buch über uns!"},
			Answer{Tag = "bart006PC", String = "Ein Buch?", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bart007", String = "Ja! Genau! Ein Buch! Oder ein Atlas oder dergleichen! Über die Inseln, die neuen Reiche und das alles!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "DariusAsked"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusAsked"},
			IsNpcFlagFalse{Name = "OrtahAsked"},
			IsNpcFlagFalse{Name = "ShanAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bart003PC", String = "Kennt Ihr Darius?", AnswerId = 2},
			OfferAnswer{Tag = "bart007PC", String = "Es gibt draußen vor der Stadt diesen Händler... Ortah?", AnswerId = 8},
			OfferAnswer{Tag = "bart009PC", String = "Gibt es einen Heiler hier?", AnswerId = 12},
		}}

	OnAnswer{7;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusAsked"},
			IsNpcFlagFalse{Name = "OrtahAsked"},
			Negated(IsNpcFlagFalse{Name = "ShanAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bart003PC", String = "Kennt Ihr Darius?", AnswerId = 2},
			OfferAnswer{Tag = "bart007PC", String = "Es gibt draußen vor der Stadt diesen Händler... Ortah?", AnswerId = 8},
		}}

	OnAnswer{7;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusAsked"},
			Negated(IsNpcFlagFalse{Name = "OrtahAsked"}),
			IsNpcFlagFalse{Name = "ShanAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bart003PC", String = "Kennt Ihr Darius?", AnswerId = 2},
			OfferAnswer{Tag = "bart009PC", String = "Gibt es einen Heiler hier?", AnswerId = 12},
		}}

	OnAnswer{7;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusAsked"},
			Negated(IsNpcFlagFalse{Name = "OrtahAsked"}),
			Negated(IsNpcFlagFalse{Name = "ShanAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bart003PC", String = "Kennt Ihr Darius?", AnswerId = 2},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusAsked"}),
			IsNpcFlagFalse{Name = "OrtahAsked"},
			IsNpcFlagFalse{Name = "ShanAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bart007PC", String = "Es gibt draußen vor der Stadt diesen Händler... Ortah?", AnswerId = 8},
			OfferAnswer{Tag = "bart009PC", String = "Gibt es einen Heiler hier?", AnswerId = 12},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusAsked"}),
			IsNpcFlagFalse{Name = "OrtahAsked"},
			Negated(IsNpcFlagFalse{Name = "ShanAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bart007PC", String = "Es gibt draußen vor der Stadt diesen Händler... Ortah?", AnswerId = 8},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusAsked"}),
			Negated(IsNpcFlagFalse{Name = "OrtahAsked"}),
			IsNpcFlagFalse{Name = "ShanAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bart009PC", String = "Gibt es einen Heiler hier?", AnswerId = 12},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusAsked"}),
			Negated(IsNpcFlagFalse{Name = "OrtahAsked"}),
			Negated(IsNpcFlagFalse{Name = "ShanAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bart008", String = "Ortah Gelbbarth? Allerdings! Ist ein alter Soldat aus dem Konvokationskrieg! Hat sich hier niedergelassen und handelt mit allerlei Kram!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bart009", String = "Er hat wohl auch einiges an Zeug aus dem Krieg! Alter Plunder, wenn Ihr mich fragt! Wir sind doch froh, dass wir das hinter uns haben, was? He, he, he..."},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "OrtahAsked"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusAsked"},
			IsNpcFlagFalse{Name = "OrtahAsked"},
			IsNpcFlagFalse{Name = "ShanAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bart003PC", String = "Kennt Ihr Darius?", AnswerId = 2},
			OfferAnswer{Tag = "bart007PC", String = "Es gibt draußen vor der Stadt diesen Händler... Ortah?", AnswerId = 8},
			OfferAnswer{Tag = "bart009PC", String = "Gibt es einen Heiler hier?", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusAsked"},
			IsNpcFlagFalse{Name = "OrtahAsked"},
			Negated(IsNpcFlagFalse{Name = "ShanAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bart003PC", String = "Kennt Ihr Darius?", AnswerId = 2},
			OfferAnswer{Tag = "bart007PC", String = "Es gibt draußen vor der Stadt diesen Händler... Ortah?", AnswerId = 8},
		}}

	OnAnswer{11;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusAsked"},
			Negated(IsNpcFlagFalse{Name = "OrtahAsked"}),
			IsNpcFlagFalse{Name = "ShanAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bart003PC", String = "Kennt Ihr Darius?", AnswerId = 2},
			OfferAnswer{Tag = "bart009PC", String = "Gibt es einen Heiler hier?", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusAsked"},
			Negated(IsNpcFlagFalse{Name = "OrtahAsked"}),
			Negated(IsNpcFlagFalse{Name = "ShanAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bart003PC", String = "Kennt Ihr Darius?", AnswerId = 2},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusAsked"}),
			IsNpcFlagFalse{Name = "OrtahAsked"},
			IsNpcFlagFalse{Name = "ShanAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bart007PC", String = "Es gibt draußen vor der Stadt diesen Händler... Ortah?", AnswerId = 8},
			OfferAnswer{Tag = "bart009PC", String = "Gibt es einen Heiler hier?", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusAsked"}),
			IsNpcFlagFalse{Name = "OrtahAsked"},
			Negated(IsNpcFlagFalse{Name = "ShanAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bart007PC", String = "Es gibt draußen vor der Stadt diesen Händler... Ortah?", AnswerId = 8},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusAsked"}),
			Negated(IsNpcFlagFalse{Name = "OrtahAsked"}),
			IsNpcFlagFalse{Name = "ShanAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bart009PC", String = "Gibt es einen Heiler hier?", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusAsked"}),
			Negated(IsNpcFlagFalse{Name = "OrtahAsked"}),
			Negated(IsNpcFlagFalse{Name = "ShanAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bart010", String = "Heiler? Ja, Shan Muir ist eine Heilerin der weißen Schule! Wenn Ihr Heilung braucht, wendet Euch an sie!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "ShanAsked"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusAsked"},
			IsNpcFlagFalse{Name = "OrtahAsked"},
			IsNpcFlagFalse{Name = "ShanAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bart003PC", String = "Kennt Ihr Darius?", AnswerId = 2},
			OfferAnswer{Tag = "bart007PC", String = "Es gibt draußen vor der Stadt diesen Händler... Ortah?", AnswerId = 8},
			OfferAnswer{Tag = "bart009PC", String = "Gibt es einen Heiler hier?", AnswerId = 12},
		}}

	OnAnswer{14;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusAsked"},
			IsNpcFlagFalse{Name = "OrtahAsked"},
			Negated(IsNpcFlagFalse{Name = "ShanAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bart003PC", String = "Kennt Ihr Darius?", AnswerId = 2},
			OfferAnswer{Tag = "bart007PC", String = "Es gibt draußen vor der Stadt diesen Händler... Ortah?", AnswerId = 8},
		}}

	OnAnswer{14;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusAsked"},
			Negated(IsNpcFlagFalse{Name = "OrtahAsked"}),
			IsNpcFlagFalse{Name = "ShanAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bart003PC", String = "Kennt Ihr Darius?", AnswerId = 2},
			OfferAnswer{Tag = "bart009PC", String = "Gibt es einen Heiler hier?", AnswerId = 12},
		}}

	OnAnswer{14;
		Conditions = {
			IsNpcFlagFalse{Name = "DariusAsked"},
			Negated(IsNpcFlagFalse{Name = "OrtahAsked"}),
			Negated(IsNpcFlagFalse{Name = "ShanAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bart003PC", String = "Kennt Ihr Darius?", AnswerId = 2},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusAsked"}),
			IsNpcFlagFalse{Name = "OrtahAsked"},
			IsNpcFlagFalse{Name = "ShanAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bart007PC", String = "Es gibt draußen vor der Stadt diesen Händler... Ortah?", AnswerId = 8},
			OfferAnswer{Tag = "bart009PC", String = "Gibt es einen Heiler hier?", AnswerId = 12},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusAsked"}),
			IsNpcFlagFalse{Name = "OrtahAsked"},
			Negated(IsNpcFlagFalse{Name = "ShanAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bart007PC", String = "Es gibt draußen vor der Stadt diesen Händler... Ortah?", AnswerId = 8},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusAsked"}),
			Negated(IsNpcFlagFalse{Name = "OrtahAsked"}),
			IsNpcFlagFalse{Name = "ShanAsked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bart009PC", String = "Gibt es einen Heiler hier?", AnswerId = 12},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "DariusAsked"}),
			Negated(IsNpcFlagFalse{Name = "OrtahAsked"}),
			Negated(IsNpcFlagFalse{Name = "ShanAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end