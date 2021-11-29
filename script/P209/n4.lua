-- _______________________________________
--I                                      I
--I             P209_Kathai              I
--I______________________________________I

--Kaiserliche Truppenangriffe im Dritten Akt
AngriffsZeitNorth = 300
AngriffsZeitEast = 300
AngriffsZeitSouth = 300


--Kaiserliches Lineup
AttackUnit1FormationNorth = 8968
AttackUnit2FormationNorth = 8969
AttackUnit3FormationNorth = 8970
AttackUnit4FormationNorth = 8971
AttackUnit5FormationNorth = 8972
AttackUnit6FormationNorth = 10148
AttackUnit7FormationNorth = 10149
AttackUnit8FormationNorth = 10150
AttackUnit9FormationNorth = 10151
AttackUnit10FormationNorth = 10152

AttackUnit1FormationEast = 8963
AttackUnit2FormationEast = 8964
AttackUnit3FormationEast = 8965
AttackUnit4FormationEast = 8966
AttackUnit5FormationEast = 8967
AttackUnit6FormationEast = 10143
AttackUnit7FormationEast = 10144
AttackUnit8FormationEast = 10145
AttackUnit9FormationEast = 10146
AttackUnit10FormationEast = 10147

AttackUnit1FormationSouth = 8951
AttackUnit2FormationSouth = 8952
AttackUnit3FormationSouth = 8953
AttackUnit4FormationSouth = 8954
AttackUnit5FormationSouth = 8955
AttackUnit6FormationSouth = 10138
AttackUnit7FormationSouth = 10139
AttackUnit8FormationSouth = 10140
AttackUnit9FormationSouth = 10141
AttackUnit10FormationSouth = 10142


----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------


function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

BeginScript
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209XalabarGeschlagen"},
	},
	Actions = 
	{
	
	},
}


-- _______________________________________
--I                                      I
--I              Dritter Akt             I
--I______________________________________I


--Das Kaiserzelt für die Cutszene Bote wird gesetzt.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209CutszeneBoteStart"},
	},
	Actions = 
	{ 
		
		RemoveObject {X = 199, Y = 300, Object = 846},
		RemoveObject {X = 201, Y = 302, Object = 846},
		RemoveObject {X = 204, Y = 302, Object = 846},
		RemoveObject {X = 204, Y = 303, Object = 846},
		RemoveObject {X = 200, Y = 301, Object = 845},
		RemoveObject {X = 202, Y = 301, Object = 845},
		RemoveObject {X = 201, Y = 302, Object = 843},
		RemoveObject {X = 201, Y = 301, Object = 843},
		RemoveObject {X = 203, Y = 301, Object = 843},
		RemoveObject {X = 203, Y = 302, Object = 844},
		RemoveObject {X = 204, Y = 301, Object = 846},
		RemoveObject {X = 201, Y = 300, Object = 846},
		
		
		RemoveObject {X = 224, Y = 315, Object = 846},
		RemoveObject {X = 226, Y = 317, Object = 846},
		RemoveObject {X = 227, Y = 321, Object = 846},
		RemoveObject {X = 227, Y = 322, Object = 846},
		RemoveObject {X = 225, Y = 316, Object = 845},
		RemoveObject {X = 226, Y = 318, Object = 845},
		RemoveObject {X = 226, Y = 320, Object = 845},
		RemoveObject {X = 226, Y = 323, Object = 845},
		RemoveObject {X = 225, Y = 317, Object = 844},
		RemoveObject {X = 226, Y = 319, Object = 844},
		RemoveObject {X = 226, Y = 322, Object = 844},
		RemoveObject {X = 224, Y = 316, Object = 843},
		RemoveObject {X = 225, Y = 318, Object = 843},
		RemoveObject {X = 227, Y = 319, Object = 843},
		RemoveObject {X = 225, Y = 321, Object = 843},
		RemoveObject {X = 226, Y = 321, Object = 843},
		RemoveObject {X = 227, Y = 320, Object = 843},
		SetGlobalFlagTrue {Name = "g_sP209SteineEntfernt"},
	}
}


--Das Kaiserzelt für die Cutszene Bote wird gesetzt.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209SteineEntfernt"},
	},
	Actions = 
	{ 
		ChangeObject {X = 205, Y = 319, Object = 2536},
		
	}
}

OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209UriasKill", UpdateInterval = 10},
		FigureAlive {NpcId = 10137},
		IsGlobalFlagTrue {Name = "g_sP209UriasKillableGesetzt", UpdateInterval = 10},
	},
	Actions = 
	{ 
		Kill {NpcId = 10137},
	}
}

--Abfrage ob Avatar stirbt in Boten-Cutszene
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209CutszeneBote"},
		IsGlobalFlagTrue {Name = "g_sP209Helebardier"},
		IsGlobalFlagFalse {Name = "g_sP209CutszeneBoteEnded"},
		FigureHasHealth {Percent = 15, NpcId = 0, UpdateInterval = 10},
	},
	Actions = 
	{ 
		Kill {NpcId = 8663},
	}
}

--Urias stirbt.
OnOneTimeEvent
{
	Conditions = 
	{ 
		FigureDead {NpcId = 10137 },
		IsGlobalFlagTrue {Name = "g_sP209UriasKillableGesetzt"},
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "g_sP209UriasStirbt"},	
			
	}
}
--Sobald der Spieler das Zwergenmonument claimed werden die neutralen Zwergengebäude dem Spieler übergeben.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsMonumentInUse {X = 360, Y = 421, Range = 5 , UpdateInterval = 60},
	},
	Actions = 
	{ 
		ChangeBuildingOwner {X = 335, Y = 419},
		ChangeBuildingOwner {X = 331, Y = 432},
		ChangeBuildingOwner {X = 333, Y = 442},
		ChangeBuildingOwner {X = 343, Y = 432},
		ChangeBuildingOwner {X = 354, Y = 432},
		ChangeBuildingOwner {X = 353, Y = 422},
		ChangeBuildingOwner {X = 363, Y = 430},
		ChangeBuildingOwner {X = 350, Y = 450},
		ChangeBuildingOwner {X = 362, Y = 450},
		ChangeBuildingOwner {X = 395, Y = 433},
		ChangeBuildingOwner {X = 406, Y = 435},
		ChangeBuildingOwner {X = 407, Y = 427},
		ChangeBuildingOwner {X = 393, Y = 394},
		ChangeBuildingOwner {X = 390, Y = 384},
		ChangeBuildingOwner {X = 418, Y = 377},
		ChangeBuildingOwner {X = 426, Y = 421},
						
		RevealUnExplored { X = 365, Y = 432, Range = 20},
		RevealUnExplored { X = 407, Y = 415, Range = 25},
	}
}




--Angriffe der Kaiserlichen Truppen am NordTor.

OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		IsGlobalTimeElapsed { Name = "g_tnP209AngriffsTimerNorth", Seconds = AngriffsZeitNorth, UpdateInterval = 60}, --Wenn nach dem TimeStmap, 2 Stunden vergangen sind wird die Bedingung ein.
		IsGlobalCounter { Name = "g_inP209AngriffsCounterNorth", Operator = IsEqual, Value = 0, UpdateInterval = 60}, --Wenn der Zähler auf 0 steht wird angegriffen 
		IsGlobalFlagTrue {Name = "g_sP209CutszeneBoteEnded"},
	},
	Actions =	
	{
		ClearGlobalTimeStamp{ Name = "g_tnP209AngriffsTimerNorth"},
		Goto { X = 351, Y = 384, NpcId = AttackUnit1FormationNorth, Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, --SouthUnits greifen an
		Goto { X = 351, Y = 384, NpcId = AttackUnit2FormationNorth, Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 351, Y = 384, NpcId = AttackUnit3FormationNorth, Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 351, Y = 384, NpcId = AttackUnit4FormationNorth, Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 351, Y = 384, NpcId = AttackUnit5FormationNorth, Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 351, Y = 384, NpcId = AttackUnit6FormationNorth, Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 351, Y = 384, NpcId = AttackUnit7FormationNorth, Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 351, Y = 384, NpcId = AttackUnit8FormationNorth, Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 351, Y = 384, NpcId = AttackUnit9FormationNorth, Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 351, Y = 384, NpcId = AttackUnit10FormationNorth, Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
				
		IncreaseGlobalCounter {Name = "g_inP209AngriffsCounterNorth"},
		
	}
	
}

OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		IsGlobalCounter { Name = "g_inP209AngriffsCounterNorth", Operator = IsEqual, Value = 1, UpdateInterval = 60}, -- Wenn der Zähler auf 1 steht
	},
	Actions =	
	{
		SetGlobalTimeStamp{Name = "g_tnP209AngriffsTimerNorth"},
		ResetGlobalCounter { Name = "g_inP209AngriffsCounterNorth" }, --Der Angriffszähler wird auf 0 zurückgesetzt, damit nur 1 mal ein Angriff innerhalb des Delays gestartet wird. 
	}
	
}

--Angriffe der Kaiserlichen Truppen am WestTor.

OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		IsGlobalTimeElapsed { Name = "g_tnP209AngriffsTimerEast", Seconds = AngriffsZeitEast, UpdateInterval = 60}, --Wenn nach dem TimeStmap, 2 Stunden vergangen sind wird die Bedingung ein.
		IsGlobalCounter { Name = "g_inP209AngriffsCounterEast", Operator = IsEqual, Value = 0, UpdateInterval = 60}, --Wenn der Zähler auf 0 steht wird angegriffen 
		IsGlobalFlagTrue {Name = "g_sP209CutszeneBoteEnded"},
	},
	Actions =	
	{
		ClearGlobalTimeStamp{ Name = "g_tnP209AngriffsTimerEast"},
		Goto { X = 303, Y = 263, NpcId = AttackUnit1FormationEast , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, --SouthUnits greifen an
		Goto { X = 303, Y = 263, NpcId = AttackUnit2FormationEast , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 303, Y = 263, NpcId = AttackUnit3FormationEast , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 303, Y = 263, NpcId = AttackUnit4FormationEast , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 303, Y = 263, NpcId = AttackUnit5FormationEast , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 303, Y = 263, NpcId = AttackUnit6FormationEast , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 303, Y = 263, NpcId = AttackUnit7FormationEast , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 303, Y = 263, NpcId = AttackUnit8FormationEast , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 303, Y = 263, NpcId = AttackUnit9FormationEast , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 303, Y = 263, NpcId = AttackUnit10FormationEast , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
				
		IncreaseGlobalCounter {Name = "g_inP209AngriffsCounterEast"},
		
	}
	
}


OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		IsGlobalCounter { Name = "g_inP209AngriffsCounterEast", Operator = IsEqual, Value = 1, UpdateInterval = 60}, -- Wenn der Zähler auf 1 steht
	},
	Actions =	
	{
		SetGlobalTimeStamp{Name = "g_tnP209AngriffsTimerEast"},
		ResetGlobalCounter { Name = "g_inP209AngriffsCounterEast" }, --Der Angriffszähler wird auf 0 zurückgesetzt, damit nur 1 mal ein Angriff innerhalb des Delays gestartet wird. 
	}
	
}



--Angriffe der Kaiserlichen Truppen am SüdTor.

OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		IsGlobalTimeElapsed { Name = "g_tnP209AngriffsTimerSouth", Seconds = AngriffsZeitSouth, UpdateInterval = 60}, --Wenn nach dem TimeStmap, 2 Stunden vergangen sind wird die Bedingung ein.
		IsGlobalCounter { Name = "g_inP209AngriffsCounterSouth", Operator = IsEqual, Value = 0, UpdateInterval = 60}, --Wenn der Zähler auf 0 steht wird angegriffen 
		IsGlobalFlagTrue {Name = "g_sP209CutszeneBoteEnded"},
	},
	Actions =	
	{
		ClearGlobalTimeStamp{ Name = "g_tnP209AngriffsTimerSouth"},
		Goto { X = 288, Y = 121, NpcId = AttackUnit1FormationSouth , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, --SouthUnits greifen an
		Goto { X = 288, Y = 121, NpcId = AttackUnit2FormationSouth , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 288, Y = 121, NpcId = AttackUnit3FormationSouth , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 288, Y = 121, NpcId = AttackUnit4FormationSouth , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 288, Y = 121, NpcId = AttackUnit5FormationSouth , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 288, Y = 121, NpcId = AttackUnit6FormationSouth , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 288, Y = 121, NpcId = AttackUnit7FormationSouth , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 288, Y = 121, NpcId = AttackUnit8FormationSouth , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 288, Y = 121, NpcId = AttackUnit9FormationSouth , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 288, Y = 121, NpcId = AttackUnit10FormationSouth , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		
		IncreaseGlobalCounter {Name = "g_inP209AngriffsCounterSouth"},
		
	}
}


OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		IsGlobalCounter { Name = "g_inP209AngriffsCounterSouth", Operator = IsEqual, Value = 1, UpdateInterval = 60}, -- Wenn der Zähler auf 1 steht
	},
	Actions =	
	{
		SetGlobalTimeStamp{Name = "g_tnP209AngriffsTimerSouth"},
		ResetGlobalCounter { Name = "g_inP209AngriffsCounterSouth" }, --Der Angriffszähler wird auf 0 zurückgesetzt, damit nur 1 mal ein Angriff innerhalb des Delays gestartet wird. 
	}
}

--Angriffszeit für die NordArmee wird gesetzt, sobald die Einheiten in Stellung sind
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209CutszeneBoteEnded"},
		FigureInRange {X = 270, Y = 380, NpcId = 8659, Range = 15},
		
	},
	Actions = 
	{ 
		SetGlobalTimeStamp{Name = "g_tnP209AngriffsTimerNorth"},
	}
}

--Angriffszeit für die OstArmee wird gesetzt, sobald die Einheiten in Stellung sind
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209CutszeneBoteEnded"},
		FigureInRange {X = 225, Y = 281, NpcId = 8665, Range = 15},
		
	},
	Actions = 
	{ 
		SetGlobalTimeStamp{Name = "g_tnP209AngriffsTimerEast"},
	}
}

--Angriffszeit für die SüdArmee wird gesetzt, sobald die Einheiten in Stellung sind
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209CutszeneBoteEnded"},
		FigureInRange {X = 225, Y = 106, NpcId = 8664, Range = 15},
		
	},
	Actions = 
	{ 
		SetGlobalTimeStamp{Name = "g_tnP209AngriffsTimerSouth"},
	}
}

--Wenn der Anführer der Kaiserlichen Armee im Süden stirbt.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209AnfuehrerSuedgesetzt"},
		FigureDead {NpcId = 8664},
		
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "g_sP209ChiefSouthDead"},
	}
}

--Wenn der Anführer der Kaiserlichen Armee im Westen stirbt.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209AnfuehrerEastgesetzt"},
		FigureDead {NpcId = 8665},
		
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "g_sP209ChiefEastDead"},
	}
}

--Wenn der Anführer der Kaiserlichen Armee im Norden stirbt.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209AnfuehrerNordgesetzt"},
		FigureDead {NpcId = 8659},
		
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "g_sP209ChiefNorthDead"},
	}
}

--Wenn der Bronzeriese stirbt.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209Bronzeriesengesetzt"},
		FigureDead {NpcId = 8662},
		
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "g_sP209BronzerieseDead"},
	}
}
--Wenn alle Anführer der Kaiserlichen Armee getötet wurde.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209ChiefNorthDead"},
		IsGlobalFlagTrue {Name = "g_sP209ChiefEastDead"},
		IsGlobalFlagTrue {Name = "g_sP209ChiefSouthDead"},
		IsGlobalFlagTrue {Name = "g_sP209BronzerieseDead"},
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "g_sP209CutszeneKaiserStart"},
	}
}


EndDefinition()
end
