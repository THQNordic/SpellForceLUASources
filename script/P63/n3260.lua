-->INFO: Captain
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 6}
--!EDS ONIDLEGOHOME END

--!EDS RESPAWN BEGIN
Respawn{WaitTime=30}
--!EDS RESPAWN END







--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p63\n3260_Captain.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagCaptainKnown"},
		},
		Actions = {
			Say{Tag = "captain001", String = "Aonirs Licht, seid willkommen in den Nordreichen!"},
			Answer{Tag = "captain001PC", String = "Was ist das hier für ein Ort?", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagCaptainKnown"}),
			IsNpcFlagFalse{Name = "QuestionGreyfellasked"},
		},
		Actions = {
			Say{Tag = "captain003", String = "Ihr seid zurück?"},
			OfferAnswer{Tag = "captain003PC", String = "Wie gelange ich nach Graufurt?", AnswerId = 4},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagCaptainKnown"}),
			Negated(IsNpcFlagFalse{Name = "QuestionGreyfellasked"}),
		},
		Actions = {
			Say{Tag = "captain003", String = "Ihr seid zurück?"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "captain002", String = "Dies ist der Schattenpass! Er führt durch die Berge zu unserer Hauptstadt Graufurt, dem Sitz des Hauses Wulfgar."},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagCaptainKnown"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionGreyfellasked"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captain003PC", String = "Wie gelange ich nach Graufurt?", AnswerId = 4},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionGreyfellasked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "captain004", String = "Folgt einfach diesem Weg! Ihr könnt sie nicht verfehlen!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "captain005", String = "Aber haltet die Augen offen! Dieses Land wird nicht umsonst der Schattenpass genannt!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "captain006", String = "Solltet Ihr in Schwierigkeiten geraten, dann flüchtet Euch hierher! Euer Leben werden wir zu verteidigen wissen!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "QuestionGreyfellasked"},
			RemoveDialog{},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
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