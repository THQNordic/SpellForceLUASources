-->INFO: Sentos
-->INFO: Coran
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome
{
	WalkMode = Walk, X = _X, Y = _Y, Direction = 0,
	Conditions = 
	{
		QuestState {QuestId = 385, State = StateUnknown}
	}
}
--!EDS ONIDLEGOHOME END

-- Sentos geht zum Portal
OnOneTimeEvent
{
	Conditions =
	{
		QuestState {QuestId = 385, State = StateActive},
	},
	Actions =
	{
		Goto{X = 470, Y = 340, WalkMode = Run, GotoMode = GotoContinous},
		RevealUnExplored{X = 470, Y = 340 , Range = 5}
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		FigureInRange {X = 470, Y = 340, Range = 3},
		QuestState {QuestId = 385, State = StateActive},
	},
	Actions =
	{
		Vanish {},
	},
}

REM = [[

OnOneTimeEvent
{
Conditions = {
		IsGlobalFlagTrue{Name = "PreviewVersion"}
			},
Actions = {
		RemoveDialog{}
		}
}
]]
	

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p63\n2897_Sentos.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagSentosKnown"},
		},
		Actions = {
			Say{Tag = "sentos001", String = "Ah, ein Abenteurer! Ich hoffe, Ihr macht keine langen Finger! Sonst sind sie ganz schnell ab, hört Ihr!"},
			Answer{Tag = "sentos001PC", String = "Welche Waren bietet Ihr feil?", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSentosKnown"}),
			QuestState {QuestId = 384, State = StateActive},
		},
		Actions = {
			Say{Tag = "sentos003", String = "Was wollt Ihr noch?"},
			OfferAnswer{Tag = "sentos003PC", String = "Ich glaube, ich bin einigen Eurer Leute begegnet...!", AnswerId = 2},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSentosKnown"}),
			Negated(QuestState {QuestId = 384, State = StateActive}),
		},
		Actions = {
			Say{Tag = "sentos003", String = "Was wollt Ihr noch?"},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState {QuestId = 384, State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSentosKnown"},
			Say{Tag = "sentos002", String = "Ich handle mit Dingen die wohl Euer Vorstellungsvermögen übersteigen dürften! Ganz zu schweigen von Eurem Geldbeutel! Also geht besser weiter!"},
			OfferAnswer{Tag = "sentos003PC", String = "Ich glaube, ich bin einigen Eurer Leute begegnet...!", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState {QuestId = 384, State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSentosKnown"},
			Say{Tag = "sentos002", String = "Ich handle mit Dingen die wohl Euer Vorstellungsvermögen übersteigen dürften! Ganz zu schweigen von Eurem Geldbeutel! Also geht besser weiter!"},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sentos004", String = "Leute? Wovon sprecht Ihr?"},
			Answer{Tag = "sentos004PC", String = "Ich spreche von dem Abschaum, der die Ruinen des Hauses Muir durchwühlt hat! Sie trugen dieses Schreiben bei sich!", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sentos005", String = "Ich... ähm... Ihr... Ihr müsst entschuldigen! Gute Leute sind nur schwer zu bekommen! Ich werde sie selbstverständlich bestrafen!"},
			Answer{Tag = "sentos005PC", String = "Das hat sich bereits erledigt! Sie haben einen Fehler begangen, den sie nicht noch einmal begehen werden...", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sentos006", String = "Nun, dann ist der Gerechtigkeit ja genüge getan! Sie haben sowieso nichts getaugt! Ihr entschuldigt mich jetzt, ich muss..."},
			Answer{Tag = "sentos006PC", String = "Nicht so hastig, mein Freund! Was haben Eure Leute gesucht? Immerhin waren sie in Eurem Auftrag dort!", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sentos007", String = "Ach, das ist nichts... eine alte Geschichte..."},
			Answer{Tag = "sentos007PC", String = "Ihr sucht nach der Rüstung Amras, nicht wahr?", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sentos008", String = "Ihr wisst von der Rüstung? Nun... ich..."},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			QuestSolve {QuestId = 384}, QuestBegin {QuestId = 385},
							TransferItem{TakeItem = 3047, Amount = 1, Flag = Exchange}, 
							SetRewardFlagTrue{ Name = "AmraUndLea3Sentos"}
							,
			Say{Tag = "sentos009", String = "Schön! Lasst uns reden... aber nicht hier! Die Stadt hat zu viele Ohren! Trefft mich am Wildland Pass! Ich habe Amras Spur bis dorthin verfolgt!"},
			Answer{Tag = "sentos009PC", String = "Gut! Ich werde da sein!", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState {QuestId = 384, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sentos003PC", String = "Ich glaube, ich bin einigen Eurer Leute begegnet...!", AnswerId = 2},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState {QuestId = 384, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end