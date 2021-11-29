-- P115 ... Dragon





----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "knownP115"},
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "ArbeiterStartP115"},
		QuestSolve{QuestId = 658},
		QuestBegin{QuestId = 659},
		QuestBegin{QuestId = 660},
		QuestBegin{QuestId = 661},
		QuestBegin{QuestId = 662},
		QuestBegin{QuestId = 663},
		QuestBegin{QuestId = 664},
		QuestBegin{QuestId = 665},
		QuestBegin {QuestId = 666},
		QuestBegin {QuestId = 667},
		QuestBegin {QuestId = 668},
		QuestBegin {QuestId = 669},
	}
}

OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "ArbeiterStartP115"},
	},
	Actions =
	{
		
		QuestSolve{QuestId = 658},
		
	}
}
--Initialisierung Drachenliste/Minenliste
OnPlatformOneTimeEvent								
{
	Conditions = 
	{ 
		
		
	},
	Actions = 
	{
		--SetGlobalFlagTrue { Name = "ArynTorOeffnenP115"}, --Test Endkampf!!!!!
		--SetGlobalFlagTrue {Name = "P115_EigthStoneOff" }, --Test Endkampf!!!!!
		--SetGlobalFlagTrue {Name = "P115_NinthStoneOff" }, --Test Endkampf!!!!!
		--SetGlobalFlagTrue {Name = "P115_SeventhStoneOff" }, --Test Endkampf!!!!!
		--Kill {NpcId = 7659},  --Test Endkampf!!!!!
		--Kill {NpcId = 7660},  --Test Endkampf!!!!!
		--Kill {NpcId = 7438},  --Test Endkampf!!!!!
		--Kill {NpcId = 7661},  --Test Endkampf!!!!!
		--Kill {NpcId = 7437},  --Test Endkampf!!!!!
		--Kill {NpcId = 6697},  --Test Endkampf!!!!!
		IncreaseGlobalCounter { Name = "MineArbeiter1P115" , Step = 4},
		ResetGlobalCounter { Name = "MineArbeiter2P115" },
		IncreaseGlobalCounter { Name = "MineArbeiter3P115" , Step = 2},
		IncreaseGlobalCounter { Name = "MineArbeiter4P115" , Step = 3},
		IncreaseGlobalCounter { Name = "MineArbeiter5P115" , Step = 1},
				
	},											
}	

--Murim aufdecken
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "MurimAufdeckenP115"},
	},
	Actions =
	{
		QuestSolve {QuestId = 695},
		QuestBegin {QuestId = 658},
		RevealUnExplored { X = 124 , Y = 162, Range = 15 },
	}
}
	

--DrachenKIStart
OnPlatformOneTimeEvent
{
	Conditions = 
	{
		
	},
	Actions =
	{
		
		SetGlobalFlagTrue { Name = "DrachenstartP115"},
	}
}


--Wenn alle 6 kleinen Drachensteine ausgeschaltet wurden


OnOneTimeEvent								
{
	Conditions = 
	{ 
		
		IsGlobalFlagTrue{ Name = "P115_FirstStoneOff"},
 		IsGlobalFlagTrue{ Name = "P115_SecondStoneOff"},
 		IsGlobalFlagTrue{ Name = "P115_ThirdStoneOff"},
 		IsGlobalFlagTrue{ Name = "P115_FourthStoneOff"},
 		IsGlobalFlagTrue{ Name = "P115_FifthStoneOff"},
 		IsGlobalFlagTrue{ Name = "P115_SixthStoneOff"},
 
	},
	Actions = 
	{
		QuestSolve{QuestId = 659},
		QuestSolve{QuestId = 658},
		
		SetGlobalFlagTrue{Name = "AngriffOberdrachenP115"},
		SetGlobalTimeStamp{ Name = "NaechsterAngriffStartP115"},
		
		
	},											
}		

--Wenn die alle 3 Oberdrachensteine ausgeschaltet wurden
OnOneTimeEvent								
{
	Conditions = 
	{ 

 		IsGlobalFlagTrue{ Name = "P115_SeventhStoneOff"},
 		IsGlobalFlagTrue{ Name = "P115_EigthStoneOff"},
 		IsGlobalFlagTrue{ Name = "P115_NinthStoneOff"},

	},
	Actions = 
	{
		
		--SetGlobalFlagTrue { Name = "ArynTorOeffnenP115"},
		QuestSolve{QuestId = 666},
		
		
				 

		
	},											
}	

--Wenn die alle 9 Drachensteine ausgeschaltet wurden
OnOneTimeEvent								
{
	Conditions = 
	{ 

		IsGlobalFlagTrue{ Name = "P115_FirstStoneOff"},
 		IsGlobalFlagTrue{ Name = "P115_SecondStoneOff"},
 		IsGlobalFlagTrue{ Name = "P115_ThirdStoneOff"},
 		IsGlobalFlagTrue{ Name = "P115_FourthStoneOff"},
 		IsGlobalFlagTrue{ Name = "P115_FifthStoneOff"},
 		IsGlobalFlagTrue{ Name = "P115_SixthStoneOff"},
 		IsGlobalFlagTrue{ Name = "P115_SeventhStoneOff"},
 		IsGlobalFlagTrue{ Name = "P115_EigthStoneOff"},
 		IsGlobalFlagTrue{ Name = "P115_NinthStoneOff"},
 		
	},
	Actions = 
	{
		
		--SetGlobalFlagTrue { Name = "ArynTorOeffnenP115"},
	
		SetGlobalTimeStamp {Name = "StartSpawningFinaleGruppe1P115"},
		SetGlobalTimeStamp {Name = "StartSpawningFinaleGruppe2P115"},
		SetGlobalTimeStamp {Name = "StartSpawningFinaleGruppe3P115"},
		SetGlobalTimeStamp {Name = "StartSpawningFinaleGruppe4P115"},
		SetGlobalTimeStamp {Name = "StartSpawningFinaleGruppe5P115"},
		SetGlobalTimeStamp {Name = "StartSpawningFinaleGruppe6P115"},
		SetGlobalTimeStamp {Name = "StartOutcryMurimP115"},
		SetGlobalTimeStamp {Name = "NachSpawnMonsterP115"},
		QuestBegin {QuestId = 735},	
				 

		
	},											
}	
		

--Wenn dem Finalen Ansturm stand gehalten wurde
OnOneTimeEvent								
{
	Conditions = 
	{ 
		IsGlobalTimeElapsed { Name = "NachSpawnMonsterP115", Seconds = 315},
		FigureDead{ NpcId = 7667},	--Angrifsgruppe 1
		FigureDead{ NpcId = 7668},
		FigureDead{ NpcId = 7669},
		FigureDead{ NpcId = 7670},
		FigureDead{ NpcId = 7671},
		FigureDead{ NpcId = 7672},
		FigureDead{ NpcId = 7673},
		FigureDead{ NpcId = 7674},
		FigureDead{ NpcId = 7675},
		FigureDead{ NpcId = 7676},
		FigureDead{ NpcId = 7677},	--Angrifsgruppe 2
		FigureDead{ NpcId = 7678},
		FigureDead{ NpcId = 7679},
		FigureDead{ NpcId = 7680},
		FigureDead{ NpcId = 7681},
		FigureDead{ NpcId = 7682},
		FigureDead{ NpcId = 7683},
		FigureDead{ NpcId = 7684},
		FigureDead{ NpcId = 7685},
		FigureDead{ NpcId = 7686},
		FigureDead{ NpcId = 7687},	--Angrifsgruppe 3
		FigureDead{ NpcId = 7688},
		FigureDead{ NpcId = 7689},
		FigureDead{ NpcId = 7690},
		FigureDead{ NpcId = 7691},
		FigureDead{ NpcId = 7692},
		FigureDead{ NpcId = 7693},
		FigureDead{ NpcId = 7694},
		FigureDead{ NpcId = 7695},
		FigureDead{ NpcId = 7696},
		FigureDead{ NpcId = 7697},	--Angrifsgruppe 4
		FigureDead{ NpcId = 7698},
		FigureDead{ NpcId = 7699},
		FigureDead{ NpcId = 7700},
		FigureDead{ NpcId = 7701},
		FigureDead{ NpcId = 7702},
		FigureDead{ NpcId = 7703},
		FigureDead{ NpcId = 7704},
		FigureDead{ NpcId = 7705},
		FigureDead{ NpcId = 7706},
		FigureDead{ NpcId = 7707},	--Angrifsgruppe 5
		FigureDead{ NpcId = 7708},
		FigureDead{ NpcId = 7709},
		FigureDead{ NpcId = 7710},
		FigureDead{ NpcId = 7711},
		FigureDead{ NpcId = 7712},
		FigureDead{ NpcId = 7713},
		FigureDead{ NpcId = 7714},
		FigureDead{ NpcId = 7715},
		FigureDead{ NpcId = 7716},
	},
	Actions = 
	{
		QuestSolve {QuestId = 733},	
		QuestBegin {QuestId = 670},
		SetGlobalFlagTrue { Name = "ArynTorOeffnenP115"},	 
	},											
}			




OnOneTimeEvent								
{
	Conditions = 
	{ 

 		IsGlobalFlagTrue{ Name = "P115_FirstStoneOff"},
 	

	},
	Actions = 
	{
		
		
	
		SetRewardFlagTrue { Name = "Drachenstein1" },
		
	},											
}								

OnOneTimeEvent								
{
	Conditions = 
	{ 

 		IsGlobalFlagTrue{ Name = "P115_SecondStoneOff"},
 	

	},
	Actions = 
	{
		
		
	
		SetRewardFlagTrue { Name = "Drachenstein2" },
		
	},											
}								

OnOneTimeEvent								
{
	Conditions = 
	{ 

 		IsGlobalFlagTrue{ Name = "P115_ThirdStoneOff"},
 	

	},
	Actions = 
	{
		
		
	
		SetRewardFlagTrue { Name = "Drachenstein3" },
		
	},											
}							

OnOneTimeEvent								
{
	Conditions = 
	{ 

 		IsGlobalFlagTrue{ Name = "P115_FourthStoneOff"},
 	

	},
	Actions = 
	{
		
		
	
		SetRewardFlagTrue { Name = "Drachenstein4" },
		
	},											
}			

OnOneTimeEvent								
{
	Conditions = 
	{ 

 		IsGlobalFlagTrue{ Name = "P115_FifthStoneOff"},
 	

	},
	Actions = 
	{
		
		
	
		SetRewardFlagTrue { Name = "Drachenstein5" },
		
	},											
}			

OnOneTimeEvent								
{
	Conditions = 
	{ 

 		IsGlobalFlagTrue{ Name = "P115_SixthStoneOff"},
 	

	},
	Actions = 
	{
		
		
	
		SetRewardFlagTrue { Name = "Drachenstein6" },
		
	},											
}			


OnOneTimeEvent								
{
	Conditions = 
	{ 

 		IsGlobalFlagTrue{ Name = "P115_SeventhStoneOff"},
 		

	},
	Actions = 
	{
		
		
		QuestSolve{QuestId = 667},
		SetRewardFlagTrue { Name = "Drachenstein7" },
	
		
	},											
}												

OnOneTimeEvent								
{
	Conditions = 
	{ 

 		IsGlobalFlagTrue{ Name = "P115_EigthStoneOff"},
 		

	},
	Actions = 
	{
		
		
		QuestSolve{QuestId = 668},
		SetRewardFlagTrue { Name = "Drachenstein8" },
		
	},											
}								

OnOneTimeEvent								
{
	Conditions = 
	{ 

 		IsGlobalFlagTrue{ Name = "P115_NinthStoneOff"},
 	

	},
	Actions = 
	{
		
		
		QuestSolve{QuestId = 669},
		SetRewardFlagTrue { Name = "Drachenstein9" },
		
	},											
}								



--PlayerItem Abfrage ob mehr als 1 Feuerkristall im Inventory

OnEvent
{
	 Conditions = 
	{ 
		PlayerHasItem { ItemId = 4096, Amount = 2 , Equipment = EquipmentAll , UpdateInterval = 10},
		
	 
	},
	Actions = 
	{
		
		TransferItem { TakeItem = 4096, GiveItem = 0, Amount = 1, Flag = Take},
		SetGlobalFlagTrue {Name = "2FeuerkristalleP115"},
		
					
	},											
}



OnOneTimeEvent								
{
	Conditions = 
	{ 

 		IsGlobalFlagTrue{ Name = "2FeuerkristalleP115"},
 	

	},
	Actions = 
	{
		Outcry { NpcId = 6603, String = "Ihr habt bereits einen der Kristalle! Nur einer kann getragen werden, dieser ist verloren!" , Tag = "ocMurim_P115_001" , Color = ColorWhite},
		
	},											
}								



--Überlaufschutz Zähler "Kristalliste"
OnEvent
{
	 Conditions = 
	{ 
		IsGlobalFlagTrue { Name = "ArbeiterStartP115" }, 
		IsGlobalCounter { Name = "KristalllisteP115", Operator = IsGreaterOrEqual, Value = 16, UpdateInterval = 10},
	 
	},
	Actions = 
	{
		ResetGlobalCounter { Name = "KristalllisteP115"},
			
	},											
}															
--Angriffe des Oberdrachen1
OnOneTimeEvent								
{
	Conditions = 
	{ 
		
		IsGlobalFlagTrue{ Name = "P115_FirstStoneOff"},
 	
 		
 	
 		IsGlobalFlagTrue{ Name = "P115_FifthStoneOff"},
 		
 
	},
	Actions = 
	{
	
		SetGlobalFlagTrue{Name = "AngriffOberdrachen1P115"},
		
	},											
}		

--Angriffe des Oberdrachen2
OnOneTimeEvent								
{
	Conditions = 
	{ 
		
		
 		IsGlobalFlagTrue{ Name = "P115_SecondStoneOff"},
 		
 		IsGlobalFlagTrue{ Name = "P115_FourthStoneOff"},
 	
 		IsGlobalFlagTrue{ Name = "P115_SixthStoneOff"},
 		
 
	},
	Actions = 
	{
	
		SetGlobalFlagTrue{Name = "AngriffOberdrachen2P115"},
	},											
}		

--Angriffe des Oberdrachen3
OnOneTimeEvent								
{
	Conditions = 
	{ 
		
		
 		
 		IsGlobalFlagTrue{ Name = "P115_SecondStoneOff"},
 		
 		IsGlobalFlagTrue{ Name = "P115_ThirdStoneOff"},
 		
 
	},
	Actions = 
	{
	
		SetGlobalFlagTrue{Name = "AngriffOberdrachen3P115"},
	},											
}	
----------------------------------------------------------------
----- 		 	 Angriffe der ZusatzOberdrachen         --------
----------------------------------------------------------------
OnEvent
{
	Conditions = 
	{ 
		IsGlobalCounter { Name = "EinmalAngriffDrache1P115", Operator = IsEqual, Value = 1},
		FigureDead{NpcId = 7660},
		FigureDead{NpcId = 7436},
		FigureDead{NpcId = 7437},
 		
 	},
	Actions = 
	{
		
		ResetGlobalCounter { Name = "EinmalAngriffDrache1P115"},
		ClearGlobalTimeStamp { Name = "ZeitAngriffOberdrachenP115"},
		SetGlobalTimeStamp{ Name = "NaechsterAngriffStartP115"},
	},											
}	



OnEvent								
{
	Conditions = 
	{ 
		
		IsGlobalFlagTrue { Name = "AngriffOberdrachenP115" }, 
		IsGlobalCounter { Name = "EinmalAngriffDrache1P115", Operator = IsEqual, Value = 0},
		IsGlobalTimeElapsed { Name = "NaechsterAngriffStartP115", Seconds = 300},
		
	},
	Actions = 
	{
		Goto { X = 114 , Y = 158, NpcId = 7660 , Range = 3 , WalkMode = Run , GotoMode = GotoContinous},
		Goto { X = 114 , Y = 158, NpcId = 7436 , Range = 3 , WalkMode = Run , GotoMode = GotoContinous},
		Goto { X = 114 , Y = 158, NpcId = 7437 , Range = 3 , WalkMode = Run , GotoMode = GotoContinous},
	
		IncreaseGlobalCounter {Name = "EinmalAngriffDrache1P115"},
		SetGlobalTimeStamp{ Name = "ZeitAngriffOberdrachenP115"}, --Die Zeit für den Angriff wird genommen
		ClearGlobalTimeStamp{ Name = "NaechsterAngriffStartP115"},
		
	},											
}	

--Wenn die Angriffszeit vorbei ist ziehen sich die Drachen zurück
OnEvent								
{
	Conditions = 
	{ 
	
		IsGlobalTimeElapsed { Name = "ZeitAngriffOberdrachenP115", Seconds = 140, UpdateInterval = 10},  --Wenn die Zeit für den Angriff abgelaufen ist
	 	IsGlobalCounter { Name = "EinmalAngriffDrache1P115", Operator = IsEqual, Value = 1},
	 	
	},
	Actions = 
	{
		Goto { X = 107 , Y = 213, NpcId = 7437 , Range = 3 , WalkMode = Run , GotoMode = GotoContinous},
		Goto { X = 85 , Y = 172, NpcId = 7436 , Range = 3 , WalkMode = Run , GotoMode = GotoContinous},
		Goto { X = 61 , Y = 149, NpcId = 7660 , Range = 3 , WalkMode = Run , GotoMode = GotoContinous},
		ResetGlobalCounter { Name = "EinmalAngriffDrache1P115"},
		ClearGlobalTimeStamp { Name = "ZeitAngriffOberdrachenP115"},
		SetGlobalTimeStamp{ Name = "NaechsterAngriffStartP115"},
	},											
}	


							
-----------------------------------------------------------------------------------------
-----			                    	ENDKAMPF                            		-----
-----------------------------------------------------------------------------------------

--Drachenangriffe Aryn
OnEvent
{
	 Conditions = 
	{ 
		IsGlobalFlagTrue { Name = "ArynTorOeffnenP115" }, 
		IsGlobalCounter { Name = "SpellCounterP115", Operator = IsEqual, Value = 0, UpdateInterval = 10},
	 	FigureHasAggro { NpcId = 6629 , UpdateInterval = 10},


	},
	Actions = 
	{
		
		SetGlobalTimeStamp { Name = "CastBlizzardArynArea1P115" },
		SetGlobalTimeStamp { Name = "CastBlizzardArynArea2P115" },
		SetGlobalTimeStamp { Name = "CastBlizzardArynArea3P115" },
		SetGlobalTimeStamp { Name = "CastBlizzardArynP115" },
		SetGlobalFlagTrue { Name = "CastDrachenVerstaerkung1P115"},
		SetGlobalFlagTrue { Name = "CastDrachenVerstaerkung2P115"},
		IncreaseGlobalCounter {Name = "SpellCounterP115"},
		CastSpell{ Spell = 1929, Target = 0, TargetType = Area, X = 60, Y = 199, NpcId = 6629},
	
	},											
}					
--Area 1 Blizzard
OnEvent
{
	 Conditions = 
	{ 
		IsGlobalTimeElapsed { Name = "CastBlizzardArynArea1P115", Seconds = 30, UpdateInterval = 10}, 
		IsGlobalCounter { Name = "SpellCounterP115", Operator = IsEqual, Value = 1, UpdateInterval = 10},
	 	


	},
	Actions = 
	{
		ClearGlobalTimeStamp { Name = "CastBlizzardArynArea1P115" },
		CastSpell{ Spell = 1929, Target = 0, TargetType = Area, X = 60, Y = 199, NpcId = 6629},
		ClearGlobalTimeStamp { Name = "CastBlizzardArynP115" },
		IncreaseGlobalCounter {Name = "SpellCounterP115"},
		
	},											
}					
--Area 2 Blizzard
OnEvent
{
	 Conditions = 
	{ 
		IsGlobalTimeElapsed { Name = "CastBlizzardArynArea2P115", Seconds = 60, UpdateInterval = 10}, 
		IsGlobalCounter { Name = "SpellCounterP115", Operator = IsEqual, Value = 2, UpdateInterval = 10},
	 	


	},
	Actions = 
	{
		ClearGlobalTimeStamp { Name = "CastBlizzardArynArea2P115" },
		CastSpell{ Spell = 1929, Target = 0, TargetType = Area, X = 66, Y = 195, NpcId = 6629},
		ClearGlobalTimeStamp { Name = "CastBlizzardArynP115" },
		IncreaseGlobalCounter {Name = "SpellCounterP115"},
		
	},											
}					
--Area 3 Blizzard
OnEvent
{
	 Conditions = 
	{ 
		IsGlobalTimeElapsed { Name = "CastBlizzardArynArea3P115", Seconds = 90, UpdateInterval = 10}, 
		IsGlobalCounter { Name = "SpellCounterP115", Operator = IsEqual, Value = 3, UpdateInterval = 10},
	 	


	},
	Actions = 
	{
		ClearGlobalTimeStamp { Name = "CastBlizzardArynArea3P115" },
		CastSpell{ Spell = 1929, Target = 0, TargetType = Area, X = 69, Y = 204, NpcId = 6629},
		ClearGlobalTimeStamp { Name = "CastBlizzardArynArea3P115" },
		ResetGlobalCounter {Name = "SpellCounterP115"},
		
	},											
}					
	
		
-- Its all over now Baby Blue, der Drache ist fast tot
OnOneTimeEvent
{
 	Conditions = 
	{ 
			
		ODER(
			FigureHasHealth {Percent = 5 , NpcId = 6629, UpdateInterval = 2},
			FigureDead {NpcId = 6629}
			),


	},
	Actions = 
	{
		SetGlobalFlagTrue { Name = "DracheEndP115"},
		SetRewardFlagTrue { Name = "DracheGetoetet" },
		QuestSolve{QuestId = 670},
		QuestSolve{QuestId = 657},
		CGdsEndGame:new(),   -- extro rendering.
	},											
}			
							
EndDefinition()
end


