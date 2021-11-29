-->INFO: homunculus_awake
-->INFO: homunculus
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 0 , Conditions = {IsNpcFlagFalse{Name = "Following"}}}
--!EDS ONIDLEGOHOME END
SpawnOnlyWhen
{
X = _X , Y = _Y ,
Conditions = {IsGlobalFlagTrue{Name = "Q183HomunculusAlive"}}
}

OnPlatformOneTimeEvent
{
	Conditions = {
		IsNpcFlagTrue{Name = "HomunculusMustChangeOwner", UpdateInterval = 10},
	},
	Actions = {
		ChangeOwner{Owner = Player , NpcId = Self},
	},
}

--Dialogsteuerung

OnOneTimeEvent
{
Conditions = {},
Actions = {
		SetDialogType{Type = SideQuest}
		}
}

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\Project\main\mission\dialoge\p15\n2480_homunculus_awake.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "FlagHomunculusKnown"},
		},
		Actions = {
			Say{Tag = "homunculusAwake001", String = "Ihr habt hat mich erweckt! Meister, was ist geschehen?"},
			Answer{Tag = "homunculusAwake001PC", String = "Ich bin nicht Euer Meister, Kreatur!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagHomunculusKnown"}),
			IsNpcFlagFalse{Name = "Following"},
		},
		Actions = {
			Say{Tag = "homunculusAwake004", String = "Ah, Meister!"},
			OfferAnswer{Tag = "homunculusAwake004PC", String = "Folgt mir!", AnswerId = 4},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagHomunculusKnown"}),
			Negated(IsNpcFlagFalse{Name = "Following"}),
		},
		Actions = {
			Say{Tag = "homunculusAwake004", String = "Ah, Meister!"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "homunculusAwake002", String = "Nur der Meister kann mich erwecken! Ihr seid der Meister!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "homunculusAwake003", String = "Hier, dies habe ich für Euch aufbewahrt, wie Ihr gesagt habt, Meister. Soll ich nun mit Euch kommen? Soll ich Euch wieder dienen?"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
			IsNpcFlagFalse{Name = "Following"},
		},
		Actions = {
			SetRewardFlagTrue{ Name = "Homunculus"},
			SetNpcFlagTrue{Name = "FlagHomunculusKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "homunculusAwake004PC", String = "Folgt mir!", AnswerId = 4},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Following"}),
		},
		Actions = {
			SetRewardFlagTrue{ Name = "Homunculus"},
			SetNpcFlagTrue{Name = "FlagHomunculusKnown"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "homunculusAwake005", String = "Befehlt Meister! Ich bin Euer Diener!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			  SetNpcFlagTrue{Name = "HomunculusMustChangeOwner"},
					ChangeRace{Race = 175 , NpcId = self} ,
					SetNpcFlagTrue{Name = "Following"}, 
					TransferXP{XP = 150 , Flag = Give} , RemoveDialog{},
			EndDialog(),
		}}


	EndDefinition()
end