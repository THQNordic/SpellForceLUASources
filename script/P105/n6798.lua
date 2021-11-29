-->INFO: Aedale
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 4}
--!EDS ONIDLEGOHOME END

OnToggleEvent
{
	OnConditions = 
	{
		IsGlobalFlagFalse{Name = "P105_AedaleKannSprechen"},
	},
	OnActions = 
	{ 
		RemoveDialog { NpcId = 6798} ,
	},
	OffConditions = 
	{
		IsGlobalFlagTrue{Name = "P105_AedaleKannSprechen"},
	},
	OffActions = 
	{
		EnableDialog { NpcId = 6798} ,
	},
}


Despawn
{
	Conditions =
	{
		IsGlobalFlagTrue {Name ="MordTeilnehmerSpawnenP105"},
	},
}

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P105\n6798_Aedale.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "Known"},
		},
		Actions = {
			Say{Tag = "aedale105_001", String = "Ihr verunreinigt diesen Ort, Runenknecht! Ich wünschte, Elune hätte Euch nicht hierher gebracht! Wir dulden keine Fremden auf dem Gletscher!"},
			Answer{Tag = "aedale105_002PC", String = "Dennoch habt Ihr Euch von dem Dunklen täuschen lassen.", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			IsNpcFlagFalse{Name = "QuestionRitual"},
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "aedale105_004", String = "Was gibt es, Runenknecht?"},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			IsNpcFlagFalse{Name = "QuestionRitual"},
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "aedale105_004", String = "Was gibt es, Runenknecht?"},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			IsNpcFlagFalse{Name = "QuestionRitual"},
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "aedale105_004", String = "Was gibt es, Runenknecht?"},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			IsNpcFlagFalse{Name = "QuestionRitual"},
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "aedale105_004", String = "Was gibt es, Runenknecht?"},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "aedale105_004", String = "Was gibt es, Runenknecht?"},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "aedale105_004", String = "Was gibt es, Runenknecht?"},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "aedale105_004", String = "Was gibt es, Runenknecht?"},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "aedale105_004", String = "Was gibt es, Runenknecht?"},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			IsNpcFlagFalse{Name = "QuestionRitual"},
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "aedale105_004", String = "Was gibt es, Runenknecht?"},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			IsNpcFlagFalse{Name = "QuestionRitual"},
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "aedale105_004", String = "Was gibt es, Runenknecht?"},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			IsNpcFlagFalse{Name = "QuestionRitual"},
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "aedale105_004", String = "Was gibt es, Runenknecht?"},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			IsNpcFlagFalse{Name = "QuestionRitual"},
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "aedale105_004", String = "Was gibt es, Runenknecht?"},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "aedale105_004", String = "Was gibt es, Runenknecht?"},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "aedale105_004", String = "Was gibt es, Runenknecht?"},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "aedale105_004", String = "Was gibt es, Runenknecht?"},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "aedale105_004", String = "Was gibt es, Runenknecht?"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedale105_003", String = "Tragt Euer Anliegen vor und dann geht! Ich verschwende ungern meine Zeit mit Euch, Kreatur!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			IsNpcFlagFalse{Name = "QuestionRitual"},
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{2;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			IsNpcFlagFalse{Name = "QuestionRitual"},
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
		}}

	OnAnswer{2;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			IsNpcFlagFalse{Name = "QuestionRitual"},
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{2;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			IsNpcFlagFalse{Name = "QuestionRitual"},
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
		}}

	OnAnswer{2;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{2;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
		}}

	OnAnswer{2;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{2;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			IsNpcFlagFalse{Name = "QuestionRitual"},
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			IsNpcFlagFalse{Name = "QuestionRitual"},
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			IsNpcFlagFalse{Name = "QuestionRitual"},
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			IsNpcFlagFalse{Name = "QuestionRitual"},
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedale105_006", String = "Es gibt eine Geschichte über die alten Zwergenschmiede, die an ihren Essen jeder Glut zu widerstehen vermochten."},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedale105_007", String = "Sie nannten diese Magie den Feuerbann. Ein altes Geheimnis, das sie stets wohl gehütet haben."},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedale105_008", String = "Kriege und Zeit haben die meisten der alten Schmiede dahingerafft. Nur von einem wissen wir, dass er noch lebt."},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedale105_009", String = "Sein Name ist Windjalf. Er lebt in Fastholme, der Zwergenstadt in den Grimwargbergen. Um sie zu erreichen, müsst Ihr Euch gen Osten halten."},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedale105_010", String = "Davor liegt allerdings das Wintertal, ein altes Schlachtfeld, das Ihr überqueren müsst. Ein gefährlicher Ort."},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedale105_011", String = "Wenn man Euch das Stadttor geöffnet hat, folgt dem Weg nach Osten. Achtet auf die Trolle, die dort hausen!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "QuestionFireWard"},
			SetGlobalFlagTrue { Name = "P105_EastCityGateOpen" },
					QuestSolve{QuestId = 685},
					QuestBegin{QuestId = 684},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			IsNpcFlagFalse{Name = "QuestionRitual"},
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			IsNpcFlagFalse{Name = "QuestionRitual"},
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			IsNpcFlagFalse{Name = "QuestionRitual"},
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			IsNpcFlagFalse{Name = "QuestionRitual"},
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			IsNpcFlagFalse{Name = "QuestionRitual"},
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			IsNpcFlagFalse{Name = "QuestionRitual"},
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			IsNpcFlagFalse{Name = "QuestionRitual"},
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			IsNpcFlagFalse{Name = "QuestionRitual"},
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedale105_013", String = "Wenn Ihr glaubt, er tut dies, um Aryn freizusetzen und uns allen den Wintertod zu bringen, täuscht Ihr Euch! Der Drache kümmert ihn gar nicht!"},
			Answer{Tag = "aedale105_014PC", String = "Der Frostweber kümmert ihn nicht?", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedale105_015", String = "Nein! Er trachtet einzig und allein nach der Königin Blut, das ist sein Begehr! Das Blut einer Erstgeborenen!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedale105_016", String = "Seht, es gibt magische Rituale, die Wesen oder Naturgewalten beeinflussen ... und es gibt Rituale, welche die Götter selbst bewegen!"},
			Answer{Tag = "aedale105_017PC", String = "Er will die dunklen Götter in die Welt zurückholen!", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedale105_018", String = "Ja. Und nur das Blut eines Gottkindes, eines Erstgeborenen, enthält die Macht, dieses Ritual zu wirken!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedale105_019", String = "Wenn die Sonne am Weidwintertag Aonirs Stern verdeckt, wird er das Ritual durchführen. Gelingt es, öffnet er eine Pforte im Bann der Götter und die Renegaten werden zurückkehren."},
			Answer{Tag = "aedale105_020PC", String = "Dann wandeln Nor und Zarach wieder durch die Welt! Aber durch was für eine. Eine Welt aus Eis, in der ein einsamer Drache vergebens nach seiner toten Königin ruft!", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedale105_021", String = "Ja. Aber Zarach hat die dunklen Völker erschaffen, warum sollte er nicht auch neue Rassen hervorbringen können? Und der Fial Darg wird im Abgrund, am Herzen der Welt, auf seine Herren warten."},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedale105_022", String = "Wir fürchten den Drachen ebenso wie Ihr, denn sein Zorn treibt die Geschöpfe des Winters aus den Bergen und gegen unsere Mauern. Aber unsere wahre Furcht gilt jenem Ritual am Weidwintertag."},
			Answer{Tag = "aedale105_023PC", String = "Wie viel Zeit bleibt uns noch?", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedale105_024", String = "Genug, um etwas zu bewirken. Zu wenig, um lange Reden zu halten!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "QuestionRitual"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			IsNpcFlagFalse{Name = "QuestionRitual"},
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{20;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			IsNpcFlagFalse{Name = "QuestionRitual"},
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			IsNpcFlagFalse{Name = "QuestionRitual"},
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{20;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			IsNpcFlagFalse{Name = "QuestionRitual"},
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
		}}

	OnAnswer{20;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{20;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{20;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			IsNpcFlagFalse{Name = "QuestionRitual"},
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			IsNpcFlagFalse{Name = "QuestionRitual"},
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			IsNpcFlagFalse{Name = "QuestionRitual"},
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			IsNpcFlagFalse{Name = "QuestionRitual"},
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedale105_026", String = "Ihre Anwesenheit ist ein noch größeres Übel als die Eure!"},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedale105_027", String = "Sie kamen vom Wintertal her. Einen alten Götzen der Sharok haben sie aus dem Eis gescharrt und beten ihn jetzt an!"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedale105_028", String = "Sie nennen ihn den großen Mugwa und warten darauf, dass er sich ihnen offenbart. Der Winter möge sie verzehren!"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedale105_029", String = "Wir hätten sie schon längst erschlagen, aber sie verstecken sich vor unseren Bögen und schleudern gewaltige Steinbrocken!"},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "QuestionTrollInfo"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			IsNpcFlagFalse{Name = "QuestionRitual"},
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{26;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			IsNpcFlagFalse{Name = "QuestionRitual"},
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
		}}

	OnAnswer{26;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			IsNpcFlagFalse{Name = "QuestionRitual"},
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{26;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			IsNpcFlagFalse{Name = "QuestionRitual"},
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
		}}

	OnAnswer{26;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{26;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
		}}

	OnAnswer{26;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{26;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			IsNpcFlagFalse{Name = "QuestionRitual"},
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			IsNpcFlagFalse{Name = "QuestionRitual"},
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			IsNpcFlagFalse{Name = "QuestionRitual"},
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			IsNpcFlagFalse{Name = "QuestionRitual"},
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedale105_031", String = "Ihr werdet kaum erwarten, dass ich Euch danke, Runenknecht!"},
			Answer{Tag = "aedale105_032PC", String = "Nein, wie käme ich dazu.", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "aedale105_033", String = "Nun, wenigstens seid Ihr nicht dumm!"},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagFalse{Name = "IceCityTrollsDead"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			IsNpcFlagFalse{Name = "QuestionRitual"},
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{30;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			IsNpcFlagFalse{Name = "QuestionRitual"},
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
		}}

	OnAnswer{30;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			IsNpcFlagFalse{Name = "QuestionRitual"},
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{30;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			IsNpcFlagFalse{Name = "QuestionRitual"},
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
		}}

	OnAnswer{30;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{30;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
		}}

	OnAnswer{30;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{30;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionFireWard"},
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_005PC", String = "Ihr wisst von einem magischen Schutz gegen Feuer?", AnswerId = 3},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			IsNpcFlagFalse{Name = "QuestionRitual"},
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			IsNpcFlagFalse{Name = "QuestionRitual"},
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			IsNpcFlagFalse{Name = "QuestionRitual"},
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			IsNpcFlagFalse{Name = "QuestionRitual"},
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_012PC", String = "Warum entführt der Fial Darg die Königin aus dem Eis?", AnswerId = 11},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			IsNpcFlagFalse{Name = "QuestionTrollInfo"},
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_025PC", String = "Trolle? Auf dem heiligen Berg Aryns?", AnswerId = 21},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			IsGlobalFlagTrue{Name = "IceCityTrollsDead"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "aedale105_030PC", String = "Die Trolle sind nicht mehr, Mugwa schweigt.", AnswerId = 27},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionFireWard"}),
			Negated(IsNpcFlagFalse{Name = "QuestionRitual"}),
			Negated(IsNpcFlagFalse{Name = "QuestionTrollInfo"}),
			Negated(IsGlobalFlagTrue{Name = "IceCityTrollsDead"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end